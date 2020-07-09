
(deftemplate cell
    (slot x)
    (slot y)
    (slot status (allowed-symbols free occupied unoccupiable ) (default free))
)


(deffacts init-board
    (size 8)
    (cell (x 1) (y 1))
    (cell (x 1) (y 2))
    (cell (x 1) (y 3))
    (cell (x 1) (y 4))
    (cell (x 1) (y 5))
    (cell (x 1) (y 6))
    (cell (x 1) (y 7))
    (cell (x 1) (y 8))

    (cell (x 2) (y 1))
    (cell (x 2) (y 2))
    (cell (x 2) (y 3))
    (cell (x 2) (y 4))
    (cell (x 2) (y 5))
    (cell (x 2) (y 6))
    (cell (x 2) (y 7))
    (cell (x 2) (y 8))
    
    (cell (x 3) (y 1))
    (cell (x 3) (y 2))
    (cell (x 3) (y 3))
    (cell (x 3) (y 4))
    (cell (x 3) (y 5))
    (cell (x 3) (y 6))
    (cell (x 3) (y 7))
    (cell (x 3) (y 8))
    
    (cell (x 4) (y 1))
    (cell (x 4) (y 2))
    (cell (x 4) (y 3))
    (cell (x 4) (y 4))
    (cell (x 4) (y 5))
    (cell (x 4) (y 6))
    (cell (x 4) (y 7))
    (cell (x 4) (y 8))
    
    (cell (x 5) (y 1))
    (cell (x 5) (y 2))
    (cell (x 5) (y 3))
    (cell (x 5) (y 4))
    (cell (x 5) (y 5))
    (cell (x 5) (y 6))
    (cell (x 5) (y 7))
    (cell (x 5) (y 8))
    
    (cell (x 6) (y 1))
    (cell (x 6) (y 2))
    (cell (x 6) (y 3))
    (cell (x 6) (y 4))
    (cell (x 6) (y 5))
    (cell (x 6) (y 6))
    (cell (x 6) (y 7))
    (cell (x 6) (y 8))
    
    (cell (x 7) (y 1))
    (cell (x 7) (y 2))
    (cell (x 7) (y 3))
    (cell (x 7) (y 4))
    (cell (x 7) (y 5))
    (cell (x 7) (y 6))
    (cell (x 7) (y 7))
    (cell (x 7) (y 8))
    
    (cell (x 8) (y 1))
    (cell (x 8) (y 2))
    (cell (x 8) (y 3))
    (cell (x 8) (y 4))
    (cell (x 8) (y 5))
    (cell (x 8) (y 6))
    (cell (x 8) (y 7))
    (cell (x 8) (y 8))
)
 