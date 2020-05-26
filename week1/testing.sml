(* num_list [1, 2, 3]  -> 1 + 1 + 1 + 0 *)
fun num_list(xs: int list) =
  if null xs then 0
  else 1 + num_list(tl xs)

fun product_list(xs: int list) =
  if null xs then 1
  else hd xs * product_list(tl xs)

(* append [1,2], [3,4] -> [1,2,3,4]) *)
fun append(list1: int list, list2: int list) =
  if null list1 then list2
  else (hd list1) :: append(tl list1, list2)

(* sum_pair_list( [(1,2), (3,4)] ) -> (1+2) + (3+4)*)
fun sum_pair_list(xs : (int * int) list) =
  if null xs then 0
  else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

(* firsts [(1,2), (3,4), (5,6)] *)
fun firsts(xs: (int*int) list) =
  if null xs then []
  else #1 (hd xs) :: firsts(tl xs)

(* seconds [(1,2), (3,4)] *)
fun seconds(xs: (int*int) list) =
  if null xs then []
  else #2 (hd xs) :: seconds(tl xs)

(* Y, M, D *)
(* val test1 = is_older ((1,2,3),(2,3,4)) = true *)

(* number_in_month ([(2012,2,28),(2013,12,1), (2014,2,30)],2) -> 1 *)
fun number_in_month(dates: (int*int*int) list, month: int) =
  if null dates then 0
  else if #2 (hd dates) = month
  then 1 + number_in_month(tl dates, month)
  else number_in_month(tl dates, month)

(* val test4 = dates_in_month ([(2012,2,28),(2013,12,1), (2014,2,30)], 2) = [(2012,2,28)] *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
  if null dates then []
  else if #2 (hd dates) = month
  then hd dates :: dates_in_month(tl dates, month)
  else dates_in_month(tl dates, month)

(* [(2012,2,28)] :: [(2011,3,31)] ::  [(2011,4,28)] *)
(* val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)] *)
fun dates_in_months(dates: (int*int*int) list, months: int list) =
  if null months then []
  else dates_in_month(dates, hd months) :: dates_in_months(dates, tl months)

(* val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there" *)
fun get_nth(list: string list, n: int) =
  if n = 1 then hd list
  else get_nth(tl list, n - 1)

(* val test7 = date_to_string (2013, 6, 1) = "June 1, 2013" *)
fun date_to_string(date: (int*int*int)) =
  let
    val day   = Int.toString(#3 date);
    val year  = Int.toString(#1 date);
    val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    val month  = get_nth(months, #2 date)
  in
    month ^ " " ^ day ^ "," ^ " " ^ year
  end

(* val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3 *)
fun number_before_reaching_sum(sum: int, numbers: int list) =
  if sum - (hd numbers) > 0
  then 1 + number_before_reaching_sum(sum - hd numbers, tl numbers)
  else 0

(* number_before_reaching_sum (10, [1,2,3,4,5]) = 3 *)
(* val test9 = what_month 70 = 3 *)
fun what_month(day: int) =
  let
    val total_days_in_month_list = [31,28,31,30,31,30,31,31,30,31,30,31]
    val total_month = number_before_reaching_sum(day, total_days_in_month_list) + 1
  in
    total_month
  end

(* val test10 = month_range (31, 34) = [1,2,2,2] *)
fun month_range(day1: int, day2: int) =
  if day1 > day2
  then []
  else what_month(day1) :: month_range(day1 + 1, day2)

