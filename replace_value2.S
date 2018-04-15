
	.global replace_value

replace_value:

	;; make Z point to a[curr_pos]
	movw r30, r24
	movw r26, r22
	lsl r26				; multiply curr_pos by 2 because working with 16 bit integers 
	rol r27
	add r30, r26			; make X point to low byte of a[curr_pos]
	adc r31, r27

	;; if a[curr_pos] == 0
	ld r18, Z
	ldd r19, Z+1
	clr r1
	cpi r18, 0
	cpc r19, r1
	breq 2f

	;; if curr_pos == to_replace_idx
	cp r22, r20
	cpc r23, r21
	breq 1f

	;; increment curr_pos
	ldi r18, 1
	add r22, r18
	adc r23, r1
	
	call replace_value
	ret
	
1:
	ldi r18, lo8(999)
	ldi r19, hi8(999)
	st Z+, r18
	st Z, r19
	ret

2:
	ret
