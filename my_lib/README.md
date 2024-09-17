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
In that case you also need to add
```
__declspec(dllexport) 
```
in front off the functions in `my_lib.c`, i.e:
```
__declspec(dllexport) void set_callback(Callback c)
```
