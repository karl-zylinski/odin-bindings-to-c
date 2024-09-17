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

	// If messages come in the wrong order,
	// the this will force flush the console buffer.
	fflush(stdout);
	
	if (callback != NULL) {
		callback(ts);
	}
}