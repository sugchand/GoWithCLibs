package main

import (
    "fmt"
    "unsafe"
)

// #include <stdlib.h>
// #include <dynamicLib.h>
// #include <staticLib.h>
// #cgo CFLAGS: -I./include/dynamic/ -I./include/static/
// #cgo LDFLAGS: -L./include/static/bin -L./include/dynamic/bin -lDynamic -lStatic
import "C"

func main() {
    string1 := "malayalam" //paliandrome
    string2 := "sugesh chandran"
    string1C := C.CString(string1)
    string2C := C.CString(string2)
    ret := C.isCharRepeatInString(string1C, 's')
    fmt.Print("\n--------------------------------------------------\n")    
    if ret == 1 {
        fmt.Printf("'s' character is repeating in %s\n", string1)
    } else {
        fmt.Printf("'s' character is not repeating in %s\n", string1)
    }
    ret = C.isPaliandrome(string1C)
    if ret == 1 {
        fmt.Printf("%s is paliandrome\n", string1)
    } else {
        fmt.Printf("%s is not paliandrome\n", string2)
    }
    ret = C.isCharRepeatInString(string2C, 's')
    if ret == 1 {
        fmt.Printf("\n's' character is repeating in %s\n", string2)
    } else {
        fmt.Printf("\n's' character is not repeating in %s\n", string2)
    }
    
    ret = C.isPaliandrome(string2C)
    if ret == 1 {
        fmt.Printf("%s is paliandrome\n", string2)
    } else {
        fmt.Printf("%s is not paliandrome\n", string2)
    }    
    fmt.Print("\n--------------------------------------------------\n")    
    C.free(unsafe.Pointer(string1C))
    C.free(unsafe.Pointer(string2C))    
}