/*
 * helperOLED.c
 *
 *  Created on: Jun 17, 2022
 *      Author: neima
 */

#include "helperOLED.h"

/*********************** DISPLAY-RELATED FUNCTIONS ***********************************/

/****************************************************************************/
/**
 * Converts an integer to ASCII characters
 *
 * algorithm borrowed from ReactOS system libraries
 *
 * Converts an integer to ASCII in the specified base.  Assumes string[] is
 * long enough to hold the result plus the terminating null
 *
 * @param 	value is the integer to convert
 * @param 	*string is a pointer to a buffer large enough to hold the converted number plus
 *  			the terminating null
 * @param	radix is the base to use in conversion,
 *
 * @return  *NONE*
 *
 * @note
 * No size check is done on the return string size.  Make sure you leave room
 * for the full string plus the terminating null in string
 *****************************************************************************/
void PMDIO_itoa(int32_t value, char *string, int32_t radix) {
	char tmp[33];
	char *tp = tmp;
	int32_t i;
	uint32_t v;
	int32_t sign;
	char *sp;

	if (radix > 36 || radix <= 1) {
		return;
	}

	sign = ((10 == radix) && (value < 0));
	if (sign) {
		v = -value;
	} else {
		v = (uint32_t) value;
	}

	while (v || tp == tmp) {
		i = v % radix;
		v = v / radix;
		if (i < 10) {
			*tp++ = i + '0';
		} else {
			*tp++ = i + 'a' - 10;
		}
	}
	sp = string;

	if (sign)
		*sp++ = '-';

	while (tp > tmp)
		*sp++ = *--tp;
	*sp = 0;

	return;
}

/****************************************************************************/
/**
 * Write a 32-bit unsigned hex number to PmodOLEDrgb in Hex
 *
 * Writes  32-bit unsigned number to the pmodOLEDrgb display starting at the current
 * cursor position.
 *
 * @param num is the number to display as a hex value
 *
 * @return  *NONE*
 *
 * @note
 * No size checking is done to make sure the string will fit into a single line,
 * or the entire display, for that matter.  Watch your string sizes.
 *****************************************************************************/
void PMDIO_puthex(PmodOLEDrgb* InstancePtr, uint32_t num) {
	char buf[9];
	int32_t cnt;
	char *ptr;
	int32_t digit;

	ptr = buf;
	for (cnt = 7; cnt >= 0; cnt--) {
		digit = (num >> (cnt * 4)) & 0xF;

		if (digit <= 9) {
			*ptr++ = (char) ('0' + digit);
		} else {
			*ptr++ = (char) ('a' - 10 + digit);
		}
	}

	*ptr = (char) 0;
	OLEDrgb_PutString(InstancePtr, buf);

	return;
}

/****************************************************************************/
/**
 * Write a 32-bit number in Radix "radix" to LCD display
 *
 * Writes a 32-bit number to the LCD display starting at the current
 * cursor position. "radix" is the base to output the number in.
 *
 * @param num is the number to display
 *
 * @param radix is the radix to display number in
 *
 * @return *NONE*
 *
 * @note
 * No size checking is done to make sure the string will fit into a single line,
 * or the entire display, for that matter.  Watch your string sizes.
 *****************************************************************************/
void PMDIO_putnum(PmodOLEDrgb* InstancePtr, int32_t num, int32_t radix) {
	char buf[16];

	PMDIO_itoa(num, buf, radix);
	OLEDrgb_PutString(InstancePtr, buf);

	return;
}

