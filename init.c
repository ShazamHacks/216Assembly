#include <stdio.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>
#include "serial.h"

/* extern int test_assembly(int input); */
/* extern void replace_value(uint8_t *a, uint8_t curr_pos, uint8_t to_replace_idx); */
extern void replace_value(uint16_t *a, uint16_t curr_pos, uint16_t to_replace_idx);

int main() {

  int i;
  uint8_t data1[] = { 1, 4, 5, 20, 12, 2, 63, 3, 90, 25, 84, 51, 0 };
  uint16_t data2[] = { 100, 506, 1234, 124, 908, 123, 404, 505, 607, 8, 10, 0 };

  init_serial_stdio();

  /* put stuff here */

  /* printf("10 + 5 = %d\n", test_assembly(10)); */

  /*
  replace_value(data1, 0, 4);
  replace_value(data1, 0, 5);
  replace_value(data1, 0, 6);
  for (i = 0; i < sizeof(data1); i++) {
    printf("%u\n", data1[i]);
  }
  */

  replace_value(data2, 0, 4);
  for (i = 0; i < sizeof(data2) / sizeof(data2[0]); i++) {
    printf("%u\n", data2[i]);
  }
  
  cli();
  sleep_cpu();
  
}
