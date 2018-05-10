;; tests of function identifier names

func $oeauth :: [ i32 i32 ] -> [ i32 ]
    [ ] {
    get_local 0
    get_local 1
    i32.add
    return
}

#assertFunction $oeauth [ i32 i32 ] -> [ i32 ] [ ] "simple function name"

func $023eno!thu324 :: [ i32 i32 ] -> [ i32 ]
    [ ] {
    get_local 0
    get_local 1
    i32.add
    return
}

#assertFunction $023eno!thu324 [ i32 i32 ] -> [ i32 ] [ ] "identifier function name 1"

func $02$3e%no!t&hu324 :: [ i32 i32 ] -> [ i32 ]
    [ ] {
    get_local 0
    get_local 1
    i32.add
    return
}

#assertFunction $02$3e%no!t&hu324 [ i32 i32 ] -> [ i32 ] [ ] "identifier function name 2"

func $02$3e%no!t&hu3'24*32++2ao-eunth :: [ i32 i32 ] -> [ i32 ]
    [ ] {
    get_local 0
    get_local 1
    i32.add
    return
}

#assertFunction $02$3e%no!t&hu3'24*32++2ao-eunth [ i32 i32 ] -> [ i32 ] [ ] "identifier function name 3"

func $02$3e%no!t&hu3'24*32++2ao-eu//n<t>h? :: [ i32 i32 ] -> [ i32 ]
    [ ] {
    get_local 0
    get_local 1
    i32.add
    return
}

#assertFunction $02$3e%no!t&hu3'24*32++2ao-eu//n<t>h? [ i32 i32 ] -> [ i32 ] [ ] "identifier function name 3"

func $aenuth_ae`st|23~423 :: [ i32 i32 ] -> [ i32 ]
    [ ] {
    get_local 0
    get_local 1
    i32.add
    return
}

#assertFunction $aenuth_ae`st|23~423 [ i32 i32 ] -> [ i32 ] [ ] "identifier function name 3"
