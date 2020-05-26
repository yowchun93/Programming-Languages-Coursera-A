
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

(* let is used called in each execution context *)
(* number_in_month [(2012,2,28),(2013,12,1),]  *)
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
  then hd dates :: dates_in_month((tl dates), month)
  else dates_in_month((tl dates), month)

(* 5 *)
(* val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)] *)
fun dates_in_months(dates: (int*int*int) list, months: int list) =
  if null months then []
  else
    dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* 6 *)
(* val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there" *)
fun get_nth(sentence: string list, index: int) =
  if index = 1 then hd sentence
  else get_nth(tl sentence, index - 1)

(* 7 *)
(* val test7 = date_to_string (2013, 6, 1) = "June 1, 2013" *)
(* get_nth (["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], 6 ) *)
fun date_to_string(date: (int*int*int)) =
  let
    val day   = Int.toString(#3 date);
    val year  = Int.toString(#1 date);
    val month = get_nth (["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], #2 date);
  in
    month ^ " " ^ day ^ "," ^ " " ^ year
  end

(* 8 *)
(* val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3 *)
(* returns n , first n + 1 adds to sum or more *)
(* this is super interesting *)
fun number_before_reaching_sum(sum: int, numbers: int list) =
  if sum - hd(numbers) > 0
    then 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)
    else 0

(* 9 *)
(* val test9 = what_month 70 = 3 *)
fun what_month(day: int) =
  let
    val total_days_in_month_list = [31,28,31,30,31,30,31,31,30,31,30,31]
    val total_month = number_before_reaching_sum(day, total_days_in_month_list) + 1
  in
    total_month
  end

(* 10 *)
(* val test10 = month_range (31, 34) = [1,2,2,2] *)
fun month_range(day1: int, day2: int) =
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1 + 1, day2)

(* 11 *)
(* val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31) *)
fun oldest(dates: (int*int*int) list) =
  if null dates then NONE
  else if null (tl dates) then SOME(hd dates)
  else
    let val oldest_date = oldest(tl dates)
      in
        if is_older(hd dates, valOf oldest_date)
        then SOME(hd dates)
        else oldest_date
      end