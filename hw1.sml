
(* val test1 = is_older ((1,2,3),(2,3,4)) = true *)

fun getYear(date: int * int * int) = #1 date
fun getMonth(date: int * int * int) = #2 date
fun getDate(date: int * int * int) = #3 date

fun is_older(date1: (int*int*int), date2: (int*int*int)) = 
    if getYear(date1) < getYear(date2) then true
    else if getYear(date1) > getYear(date2) then false
    else if getMonth(date1) < getMonth(date2) then true
    else if getMonth(date1) > getMonth(date2) then false
    else if getDate(date1) < getDate(date2) then true
    else false