(deftemplate memory
    (slot size)
    (slot available)
    (multislot usage)
)

(deftemplate application
    (slot name)
    (slot mem-req)
)

(deftemplate allocate
    (slot name)
)

(deftemplate deallocate
    (slot name)
)

(defrule allocation-ok
    (phase allocation)
    (application (name ?x) (mem-req ?y))
    ?f1 <- (allocate (name ?x))
    ?f <- (memory (available ?z&:(> ?z ?y)) (usage $?u))
=>
    (bind ?m (- ?z ?y))   
    (modify ?f (available ?m) (usage ?x ?u))
    (retract ?f1) 
)

(defrule deallocation-ok
    (phase deallocation)
    (application (name ?x)(mem-req ?y))
    ?f1 <- (deallocate (name ?x))
    ?f <- (memory (available ?z) (usage $?prima ?x $?dopo)) 
=>
    (bind ?m (+ ?y ?z))
    (modify ?f (available ?m) (usage $?prima $?dopo))
    (retract ?f1)
)


(defrule accept-request
    (phase accept-request)
=>
    (halt)
)


;; CONTROL KNOWLEDGE 
(defrule change-phase
    (declare (salience -10))
    ?phase <- (phase ?current-phase)
    (phase-after ?current-phase ?next-phase)
=>
    (retract ?phase)
    (assert (phase ?next-phase))
)


(deffacts control-flow
    (phase accept-request)
    (phase-after accept-request deallocation)
    (phase-after deallocation allocation)
    (phase-after allocation accept-request )
)

(deffacts facts-domain-knowledge
    (memory (size 15) (available 15) (usage))
)

(deffacts initial-state
	(phase accept-request)
	(application (name word) (mem-req 2))
	(application (name word2) (mem-req 7))
	(application (name word3) (mem-req 6))
	(application (name gnumeric) (mem-req 5))
	(application (name gnumeric2) (mem-req 5))
)

