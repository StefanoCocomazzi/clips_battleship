(defmoule MAIN (export ?ALL))

(deftemplate cell
    (slot x)
    (slot y)
    (slot occupied (type BOOLEAN) (default FALSE))
)

