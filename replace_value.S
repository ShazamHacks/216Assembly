
	.global replace_value

;;; void replace_value(uint8_t *a, uint8_t curr_pos, unit8_t to_replace_idx)
;;; method replaces value at a[to_replace_index] with 99
;;; challenge: modify method to handle 2 byte integers
replace_value:
	movw r26, r24		; load a into X pointer

	ldi r19, 0		; need a zero register
	add r26, r22		; move X to a + curr_pos
	adc r27, r19
	
	ld r18, X		; load *X into r18
	cpi r18, 0		; see if *X is 0, which is end of array
	breq 2f

	cp r22, r20		; see if curr_pos = to_replace_idx
	breq 1f

	ldi r18, 1		; increment curr_pos
	add r22, r18
	call replace_value	; recursively call replace_value
1:
	ldi r18, 99
	st X, r18
	ret
2:
	ret
	
	
