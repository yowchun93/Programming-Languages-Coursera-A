(* Similar to MAYBE monad in Haskell *)

(* NONE , SOME *)

fun max1 (xs: int list) = 
    if null xs then NONE
    else 
        let val tL_ans = max(tl xs)
        in if isSome tl_ans andalso valOf tl_ans > hd xs
            then tl_ans
            else SOME (hd xs)
        end