import sys
import os
from cx_Freeze import setup, Executable

include_files = ['app.ico']

target = Executable(
    script="main.py",
    base="Win32GUI",
    icon="app.ico"
)

setup(
    name="Discord",
    version="1.0",
    description="Discord With Python",
    author="Wanderson M. Pimenta",
    options = {'build_exe' : {'include_files' : include_files}},
    executables=[target]
)
