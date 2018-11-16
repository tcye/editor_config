import os
import argparse
from collections import defaultdict


TARGETS = {}


ROOT = None
DIR = None
PROCESSED_DIR = set()

def cc_library(*args, **kwargs):
    name = kwargs['name']
    name = DIR + ':' + name

    srcs = kwargs.get('srcs', [])
    srcs = [os.path.join(DIR, src) for src in srcs if type(src) is str]

    incs = kwargs.get('export_incs', [])
    incs = [os.path.join(DIR, inc) for inc in incs if type(inc) is str]

    if 'mmcomm' in kwargs.get('target_bases', []):
        incs.append(DIR)

    deps = kwargs.get('deps', [])
    tmp = []
    for dep in deps:
        if type(dep) is not str:
            continue
        if dep.startswith(':'):
            dep = DIR+dep
        elif dep.startswith('//'):
            dep = os.path.join(ROOT, dep[2:])
        else:
            continue
        tmp.append(dep)
    deps = tmp

    TARGETS[name] = {
        'srcs': [os.path.realpath(src) for src in srcs],
        'incs': [os.path.realpath(inc) for inc in incs],
        'deps': deps,
    }


cc_binary = cc_library
proto_library = cc_library


def find_blade_root(hint):
    hint = os.path.realpath(hint)
    if 'BLADE_ROOT' in os.listdir(hint):
        return hint
    else:
        hint_parent = os.path.dirname(hint)
        if hint_parent == hint:
            return hint
        return find_blade_root(hint_parent)


class Swallow(object):
    def __init__(self, *args, **kwargs):
        pass
    def __call__(self, *args, **kwargs):
        return self
    def __add__(self, other):
        return self
    def __sub__(self, other):
        return self
    def __getattr__(self, item):
        return self
    def __iter__(self):
        return self
    def __next__(self):
        raise StopIteration


def build_target_map(start_dir, depth=0):
    if depth > 5:
        return

    PROCESSED_DIR.add(start_dir)

    build_files = ['BUILD_OF_BLADE', 'BUILD']
    build_files = [os.path.join(start_dir, file) for file in build_files]

    for file in build_files:
        if os.path.exists(file):
            build_file = file
            break
    else:
        return

    global DIR
    DIR = start_dir

    with open(build_file) as f:
        try:
            lines = [line for line in f.readlines() if 'import ' not in line]
        except:
            return

        try:
            gl = defaultdict(lambda : Swallow())
            gl.update(globals())
            exec(''.join(lines), gl)
        except:
            pass

    for name, attrs in list(TARGETS.items()):
        deps = attrs['deps']
        for dep in deps:
            directoy, target = dep.split(':')

            if directoy not in PROCESSED_DIR:
                build_target_map(directoy, depth+1)


SRCS = set()
INCS = set()

def update_src_inc(target):
    if target not in TARGETS:
        return

    attrs = TARGETS[target]

    SRCS.update(attrs['srcs'])
    INCS.update(attrs['incs'])

    for dep in attrs['deps']:
        update_src_inc(dep)


CMAKE_TEMPLATE = '''
cmake_minimum_required(VERSION 3.0)
project(%s)
set(CMAKE_CXX_STANDARD 11)

include_directories(
%s
)
add_executable(fake_target 
%s
)
'''


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--target-dir', default='/home/tiancaiye/QQMail/antispam/mmspamimg/mmspamimgcomm')
    args = parser.parse_args()

    target_dir = os.path.realpath(args.target_dir)
    ROOT = find_blade_root(target_dir)
    build_target_map(target_dir)

    for name, attrs in TARGETS.items():
        if not name.startswith(target_dir+':'):
            continue
        update_src_inc(name)

    SRCS = [src for src in SRCS if src.startswith(target_dir)]
    with open(os.path.join(target_dir, 'CMakeLists.txt'), 'w') as f:
        f.write(CMAKE_TEMPLATE % (os.path.split(target_dir)[1], '\n'.join(sorted(INCS)), '\n'.join(sorted(SRCS))))



