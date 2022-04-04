import sys
from cx_Freeze import setup, Executable

build_exe_options = {"packages": ["torch", "srsly.msgpack.util", "cymem", "blis", "spacy", "transformers"], "excludes": ["tkinter"]}

#"spacy.tokens._dict_proxies", "spacy.lang.norm_exceptions", 
# base="Win32GUI" should be used only for Windows GUI app
base = None
if sys.platform == "win32":
    base = "Win32GUI"

setup(
    name="guifoo",
    version="0.1",
    description="NewsSentiment",
    options={"build_exe": build_exe_options},
    executables=[Executable("install.py", base=base)],
)