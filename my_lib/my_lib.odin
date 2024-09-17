package my_lib

import "core:fmt"
import "core:c"

when ODIN_OS == .Windows {
	foreign import my_lib {
		"windows/my_lib.lib",
	}
}

Callback :: proc "c"(TestStruct)

@(default_calling_convention="c")
foreign my_lib {
	set_callback :: proc(c: Callback) ---
	do_stuff :: proc(ts: TestStruct) ---
}

TestStruct :: struct {
	num: c.int,
	flt_num: c.float,
}
