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
    ?ph <- (phase allocation)
    (application (name ?x) (mem-req ?y))
    ?f1 <- (allocate (name ?x))
    ?f <- (memory (available ?z&:(> ?z ?y)) (usage $?u))
=>
    (bind ?m (- ?z ?y))   
    (modify ?f (available ?m) (usage ?x ?u))
    (retract ?f1 ?ph) 
    (assert (phase acept-request))    
)

(defrule move-to-accept-request
    ?ph <- (phase allocation)
=>
    (retract ?ph)
    (assert (phase accept-request))
)

(defrule deallocation-ok
    ?ph <- (phase deallocation)
    (application (name ?x)(mem-req ?y))
    ?f1 <- (deallocate (name ?x))
    ?f <- (memory (available ?z) (usage $?prima ?x $?dopo)) 
=>
    (bind ?m (+ ?x ?z))
    (modify ?f (available ?m) (usage $?prima $?dopo))
    (retract ?f1 ?ph)
    (assert (phase allocation))
)

(defrule move-to-allocation
    ?ph <- (phase deallocation)
    (not (deallocate (name ?)))
=>
    (retract ?ph)
    (assert (phase allocation))
)

(defrule accept-request
    (phase accept-request)
=>
    (halt)
)

(defrule move-to-deallocation
    ?ph <- (phase accept-request)
=>
    (retract ?ph)
    (assert (phase deallocation))
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