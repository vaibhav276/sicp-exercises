; Exercise 2.11

; Possible cases for signs
; --------------------------------------------
; 1. All negative
;   - min = (* (upper-bound x) (upper-bound y))
;   - max = (* (lower-bound x) (lower-bound y))
; 2. All positive
;   - min = (* (lower-bound x) (lower-bound y))
;   - max = (* (upper-bound x) (upper-bound y))
; 3. x negative, y positive
;   - min = (* (lower-bound x) (upper-bound y))
;   - max = (* (upper-bound x) (lower-bound y))
; 4. x positive, y negative
;   - min = (* (lower-bound y) (upper-bound x))
;   - max = (* (upper-bound y) (lower-bound x))
; 5. x mixed, y positive
;   - min = (* (lower-bound x) (upper-bound y))
;   - max = (* (upper-bound x) (upper-bound y))
; 6. x mixed, y negative
;   - min = (* (upper-bound x) (lower-bound y))
;   - max = (* (lower-bound x) (lower-bound y))
; 7. x positive, y mixed
;   - min = (* (upper-bound x) (lower-bound y))
;   - max = (* (upper-bound x) (upper-bound y))
; 8. x negative, y mixed
;   - min = (* (lower-bound x) (upper-bound y))
;   - max = (* (lower-bound x) (lower-bound y))
; 9. Both mixed
;   - min = (min (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))
;   - max = (min (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))


