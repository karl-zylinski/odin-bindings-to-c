#include <stdio.h>

typedef struct TestStruct {
	int num;
	float flt_num;
} TestStruct;

typedef void (*Callback)(TestStruct);

Callback callback = NULL;

__declspec(dllexport) 
void set_callback(Callback c) {
	printf("Setting callback\n");
	callback = c;
}

__declspec(dllexport) 
void do_stuff(TestStruct ts) {
	printf("Doing stuff\n");
	ts.num += 1;
	ts.flt_num -= 1;

	// This is is not important, but:
	// This will force flush the console buffer,
	// avoiding C and Odin prints to be out of order.
	// This is not a good solution for this, instead
	// you should probably redirect the C library's
	// stdout to Odin's stdout.
	fflush(stdout);
	
	if (callback != NULL) {
		callback(ts);
	}
}
