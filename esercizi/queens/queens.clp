; (defmoule MAIN (export ?ALL))

( defrule occupy-cell
    (declare (salience 10))
    ?cell <- (cell (x ?x) (y ?y) (status free))
=>
    (modify ?cell (status occupied))
    ; (printout t "occupy-cell " ?x "-" ?y  crlf)
)

( defrule unoccupiable-row
    (declare (salience 20))
    (cell (x ?x) (y ?y) (status occupied))
    ?cell <- (cell (x ?x) (status free))
=>
    (modify ?cell (status unoccupiable))
    ; (printout t "unoccupiable-row " ?x crlf)
)

( defrule unoccupiable-column
    (declare (salience 20))
    (cell (x ?x) (y ?y) (status occupied))
    ?cell <- (cell (y ?y) (status free))
=>
    (modify ?cell (status unoccupiable))
    ; (printout t "unoccupiable-column " ?y crlf)
)

( defrule unoccupiable-diagonal-1
    (declare (salience 15))
    (number ?i)
    ?occupied <-(cell (x ?x) (y ?y) (status occupied))
    ?cell <- (cell 
                (x ?nx&:(= ?nx (+ ?x $?i)))  
                (y ?ny&:(= ?ny (+ ?y $?i))) 
                (status free))
=> 
    (modify ?cell (status unoccupiable))
    (printout t "current "  ?x "-" ?y "(" $?i ")" crlf)
    (printout t "diag-column "  ?nx "-" ?ny crlf)
)

( defrule unoccupiable-diagonal-2
    (declare (salience 15))
    (number ?i)
    ?occupied <-(cell (x ?x) (y ?y) (status occupied))
    ?cell <- (cell 
                (x ?nx&:(= ?nx (+ ?x $?i)))  
                (y ?ny&:(= ?ny (- ?y $?i))) 
                (status free))
=> 
    (modify ?cell (status unoccupiable))
    (printout t "current "  ?x "-" ?y "(" $?i ")" crlf)
    (printout t "diag-column "  ?nx "-" ?ny crlf)
)









;     1   2   3   4
; 1 | x | x | x |   | 
; 2 | x | Q | x | x | 
; 3 | x | x | x |   | 
; 4 |   | x |   | x | 


; x+1
;     y+1
;     y-1

; Occupare i={-(n-1)..n-1} -> (X+i Y+i), (X+i Y-i)
