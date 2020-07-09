; Far sedere N persone ad un tavolo in modo tale che
; • Ogni persona abbia accanto una persona del sesso opposto
(defrule sesso-opposto
    g1 <- (guest   (name ?)(sex ) (multislot hobbies))

)


; • Ogni persona condivida almeno un hobby con i suoi vicini

(deftemplate guest
    (slot name)
    (slot sex)
    (multislot hobbies))

(deftemplate path 
    (slot id) ; accomuna i fatti appartenenti allo stesso stato
    (slot name)
    (slot seat))

(deftemplate seating
    (slot seat1) (slot name1)
    (slot seat2) (slot name2)
    (slot id) (slot pid) (slot path_done)
)


; FACTS
(guest (name n1) (sex m) (hobby h2 h3))
(guest (name n2) (sex m) (hobby h2 h3))
(guest (name n3) (sex m) (hobby h1 h2))
(guest (name n4) (sex f) (hobby h2 h3))
(guest (name n5) (sex f) (hobby h1 h2 h3))
(guest (name n6) (sex f) (hobby h1 h2 h3))
(guest (name n7) (sex f) (hobby h2 h3))
(guest (name n8) (sex m) (hobby h1 h3))
