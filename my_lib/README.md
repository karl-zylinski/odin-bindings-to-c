# Windows build instructions

## Static library
```
cl my_lib.c /c
lib my_lib.obj
```

## Shared library (DLL)
```
cl my_lib.c /LD
```
The `__declspec(dllexport)` in front off the functions in `my_lib.c` are only needed if you are going to compile as dynamic library:
```
__declspec(dllexport) void set_callback(Callback c) { ...
```
