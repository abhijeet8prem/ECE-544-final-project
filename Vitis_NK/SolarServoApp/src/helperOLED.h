/*
 * helperOLED.h
 *
 *  Created on: Jun 17, 2022
 *      Author: neima
 */

#ifndef SRC_HELPEROLED_H_
#define SRC_HELPEROLED_H_
#include "PmodOLEDrgb.h"
void PMDIO_itoa(int32_t value, char *string, int32_t radix);
void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num);
void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix);

#endif /* SRC_HELPEROLED_H_ */
