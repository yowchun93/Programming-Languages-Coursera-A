
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

 (* number_in_month ([(2012,2,28),(2013,12,1)],2) -> 1 *)
 (* without using Let *)

 (* fun number_in_month(dates: (int*int*int) list, month: int ) =     
    if null dates then 0
    else if (#2 (hd dates) = month) 
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month) *)

(* let is used called in each execution context *)
fun number_in_month(dates: (int*int*int) list, month: int) = 
    if null dates then 0 
    else 
        let val tl_number_in_month = number_in_month(tl dates, month)
        in 
            if #2 (hd dates) = month
            then 1 + tl_number_in_month
            else tl_number_in_month
        end

(* val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3 *)
fun number_in_months(dates: (int*int*int) list, months: int list) = 
  if null months then 0 
  else 
    number_in_month(dates, (hd months)) + number_in_months(dates, (tl months))

(* Operating on lists *)
(* val test4 = dates_in_month ([(2012,2,28),(2013,12,1)], 2) = [(2012,2,28)] *)
fun dates_in_month(dates: (int*int*int) list, month: int) = 
  if null dates then []
  else if #2 (hd dates) = month 
  then hd dates :: dates_in_month(tl dates, month) 
  else dates_in_month(tl dates, month)