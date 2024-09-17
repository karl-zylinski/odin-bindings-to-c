package binding_to_c_test

import "base:runtime"
import "core:fmt"

import "my_lib"

my_callback :: proc "c" (ts: my_lib.TestStruct) {
	context = runtime.default_context()

	fmt.println("In the callback")
	fmt.println(ts)
}

main :: proc() {
	my_lib.set_callback(my_callback)

	ts := my_lib.TestStruct {
		num = 7,
		flt_num = 23.12,
	}

	my_lib.do_stuff(ts)
}