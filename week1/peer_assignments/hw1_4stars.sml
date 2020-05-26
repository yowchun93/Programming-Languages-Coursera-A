fun is_older(date1: (int * int * int), date2: (int * int * int)) = 
    let 
        fun date_to_int_value(date: (int * int * int)) =
            #1 date * 31 * 12 + #2 date * 31 + #3 date
        val date1 = date_to_int_value(date1)
        val date2 = date_to_int_value(date2)
    in
        date1 < date2
    end


fun number_in_month(dates: (int * int * int) list, month: int) = 
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month)



fun number_in_months(dates: (int * int * int) list, months: int list) = 
    let 
        fun exist(nums: int list, num: int) = 
            if null nums
            then false
            else if hd nums = num
            then true
            else exist(tl nums, num)
    in
        if null dates
        then 0
        else if exist(months,#2 (hd dates))
        then 1 + number_in_months(tl dates, months)
        else number_in_months(tl dates, months)
    end



fun dates_in_month(dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else if month = #2 (hd dates)
    then hd dates :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)



fun dates_in_months(dates: (int * int * int) list, months: int list) = 
let 
    fun exist(month: int, months: int list) = 
        if null months
        then false
        else if month = hd months
        then true
        else exist(month, tl months)
in
    if null dates
    then []
    else if exist(#2 (hd dates), months)
    then hd dates :: dates_in_months(tl dates, months)
    else dates_in_months(tl dates, months)
end


fun get_nth(strs: string list, n: int) = 
let 
    fun get_nth_helper(strs: string list, i: int) = 
        if i = n
        then hd strs
        else get_nth_helper(tl strs, i + 1)
in
    get_nth_helper(strs, 1)
end


fun date_to_string(date: int * int * int) = 
let 
    val months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
in
    get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
end


fun number_before_reaching_sum(sum: int, nums: int list) = 
let 
    fun number_before_reaching_sum_helper(sum: int, nums: int list, i: int) = 
        if hd nums < sum
        then number_before_reaching_sum_helper(sum - hd nums, tl nums, i + 1)
        else i - 1
in
    number_before_reaching_sum_helper(sum, nums, 1)
end


fun what_month(day: int) = 
let 
    val months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
in
    number_before_reaching_sum(day, months) + 1
end


fun month_range(day1: int, day2: int) = 
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)


fun oldest(dates: (int * int * int) list) = 
let 
    fun oldest_helper(dates: (int * int * int) list) =
        if null dates
        then (0,0,0)
        else
            let 
                val oldest_rest = oldest_helper(tl dates)
            in
                if null (tl dates)
                then hd dates
                else if is_older(hd dates, oldest_rest)
                then hd dates
                else oldest_rest
            end
in
    if null dates
    then NONE
    else SOME(oldest_helper(dates))
end



fun number_in_months_challenge(dates: (int * int * int) list, months: int list) = 
number_in_months(dates, months)
