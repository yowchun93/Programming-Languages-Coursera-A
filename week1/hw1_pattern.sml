(* number_in_month([(2012,2,28),(2013,12,1)], 2)  *)
fun number_in_month(xs: (int*int*int) list, month: int) =
  case xs of
    [] => 0
  | (a,b,c)::xs' => if b = month then 1 + number_in_month(xs', month)
                    else number_in_month(xs', month)

(* val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3 *)
fun number_in_months(dates: (int*int*int) list, months: int list) =
  case months of
    [] => 0
  | x::xs' => number_in_month(dates, x) + number_in_months(dates, xs')

(* val test4 = dates_in_month ([(2012,2,28),(2013,12,1)], 2) = [(2012,2,28)] *)
fun dates_in_month(xs: (int*int*int) list, month: int) =
  case xs of
    [] => []
  | x::xs' => case x of
              (a,b,c) => if b = month then x::dates_in_month(xs', month)
                          else dates_in_month(xs', month)

(* val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there" *)
fun get_nth(xs: string list, n: int) =
  if n = 1 then hd xs
  else get_nth((tl xs), n - 1)