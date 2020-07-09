; (defmoule MAIN (export ?ALL))

( defrule occupy
    ?cell <- (cell (x ?x) (y ?y) (status free))
    
=>
    modify( ?cell (status occupied))
)
( defrule unoccupiable  
    (cell (x ?x) (y ?y) (status occupied)
    ?cell <- (x ?x) (status free)
    =>
)

