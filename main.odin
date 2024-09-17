package binding_to_c_test

import "base:runtime"
import "core:fmt"

import "my_lib"

custom_context: runtime.Context

my_callback :: proc "c" (ts: my_lib.TestStruct) {
	// You can also do `context = runtime.default_context()` if you do not need
	// any special context.
	context = custom_context

	fmt.println("In the callback")
	fmt.println(ts)
}

main :: proc() {
	// Setup context however you want with tracking allocators etc, then save it
	// to custom_context so you can use it in the callback above.

	custom_context = context

	my_lib.set_callback(my_callback)

	ts := my_lib.TestStruct {
		num = 7,
		flt_num = 23.12,
	}

	my_lib.do_stuff(ts)
}