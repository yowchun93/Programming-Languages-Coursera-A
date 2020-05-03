(* exponential calls on bad_max twice *)
fun bad_max (xs: int list) = 
    if null xs then 0
    else if null (tl xs) then hd xs
    else if hd xs > bad_max(tl xs) 
    then hd xs
    else bad_max(tl xs)

(* good_max is only called once *)
(* even this is easier to read and understand *)
fun good_max(xs : int list) = 
    if null xs then 0 
    else if null (ts xs) then hd xs
    else 
        (* is this called memoization? *)
        let val tl_ans = good_max(tl xs)
        in 
            if hd xs > tl_ans
            then hd xs
            else tl_ans
        end
