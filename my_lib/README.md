# Windows build instructions

## Static library
```
cl my_lib.c /c
mkdir windows
lib my_lib.obj /out:windows\my_lib.lib
```

## Shared library (DLL)
```
mkdir windows
cl my_lib.c /LD /o windows\my_lib.lib
```
The `__declspec(dllexport)` in front off the functions in `my_lib.c` are only needed if you are going to compile as dynamic library:
```
__declspec(dllexport)
void set_callback(Callback c) { ...
```

# Linux / macOS build instructions

## Static library
```
clang -c my_lib.c
mkdir -p linux  
llvm-ar rc linux/my_lib.a my_lib.o
```
You'll have to remove the `__declspec(dllexport)` lines in `my_lib.c` to make this compile.
