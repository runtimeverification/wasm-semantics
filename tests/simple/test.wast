(module)

(type $a-cool-type (func ( param i32 ) ( param $k i32 ) ( result i32 )))

(func $add (type $a-cool-type) (param $j i32) (param i32 ) ( result i32 )
    (local.get 0)
    (local.get 1)
    (i32.add)
    (return)
)

(func $mystrey (param $l i32) (param i32 ) (param $n i32) ( result i32 )
    (local.get 0)
    (local.get 1)
    (local.get 2)
    (i32.add)
    (i32.add)
    (return)
)

#clearConfig
