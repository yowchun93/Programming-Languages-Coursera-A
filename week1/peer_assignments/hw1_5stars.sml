fun is_older (x: (int*int*int), y:(int*int*int)) =
    if ((#1 x)<(#1 y)) then true
	else
	    if (((#1 x)=(#1 y)) andalso ((#2 x)<(#2 y))) then true
	else
	    if (((#1 x)=(#1 y)) andalso ((#2 x)=(#2 y)) andalso ((#3 x)<(#3 y))) then true
	else false

fun number_in_month (xs: (int*int*int) list, month: int) =
    if (xs = []) then 0
    else
      if ((#2 (hd xs)) = month) then (1 + number_in_month (tl xs, month))
      else (0 + number_in_month (tl xs, month))
				  
 
fun number_in_months (m_xs: (int*int*int) list, months: int list) =
    if (null months) then 0
    else
	    number_in_month (m_xs, (hd months)) + number_in_months (m_xs, (tl months))

fun dates_in_month (xs: (int*int*int) list, month: int) =
    if (null xs) then []
    else
      if (#2 (hd xs) = month) then ((hd xs) :: dates_in_month (tl xs, month))
      else dates_in_month (tl xs, month)

fun dates_in_months (xs: (int*int*int) list, months: int list) =
    if (null months) then []
    else
	    dates_in_month(xs, (hd months)) @ dates_in_months(xs, (tl months))

fun get_nth (xs: string list, nth: int) =
    if (nth = 1) then (hd xs)
    else
	    get_nth (tl xs, nth-1)

fun date_to_string (date: (int*int*int)) =
	get_nth (["January","February","March","April","May","June","July","August","September","October","November","December"], #2 date)
	^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)

fun number_before_reaching_sum (sum: int, list_of_int: int list) =
    if (sum > (hd list_of_int)) then 1 + number_before_reaching_sum(sum - (hd list_of_int), tl list_of_int)
    else 0

fun what_month (day: int) =
    number_before_reaching_sum (day, [31,28,31,30,31,30,31,31,30,31,30,31]) + 1

fun month_range (day1: int, day2: int) =
    if (day1 > day2) then []
    else
	    if (day1 <= day2) then what_month (day1) :: month_range (day1 + 1, day2)
        else []

fun oldest (list_of_date: (int*int*int) list) =
    if null list_of_date then NONE
    else
	let fun oldest_nonempty (sublist: (int*int*int) list) =
	    if null (tl sublist) then (hd sublist)
	    else
          let val tail_oldest = oldest_nonempty (tl sublist)
          in
              if is_older (hd sublist, tail_oldest) then (hd sublist)
              else
                 tail_oldest
          end
	 in SOME (oldest_nonempty (list_of_date))
   end
