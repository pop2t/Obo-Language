// Mock GPU runtime for testing handle type
#include <stdlib.h>
#include <stdint.h>

// Mock device — just a struct with an ID
typedef struct { int id; } MockDevice;
typedef struct { int id; int size; } MockBuffer;

static int next_device_id = 1;
static int next_buffer_id = 100;

void* mock_create_device(void) {
    MockDevice* dev = (MockDevice*)malloc(sizeof(MockDevice));
    dev->id = next_device_id++;
    return dev;
}

int64_t mock_destroy_device(void* dev_ptr) {
    free(dev_ptr);
    return 0;
}

void* mock_create_buffer(void* dev_ptr, int64_t size) {
    (void)dev_ptr; // would normally use the device
    MockBuffer* buf = (MockBuffer*)malloc(sizeof(MockBuffer));
    buf->id = next_buffer_id++;
    buf->size = (int)size;
    return buf;
}

int64_t mock_destroy_buffer(void* buf_ptr) {
    free(buf_ptr);
    return 0;
}
