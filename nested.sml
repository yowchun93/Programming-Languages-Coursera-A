(* Nested functions *)

(* count(2, 5) -> [2,3,4,5] *)
(* 5 :: [] *)
(* 4 :: [5] *)
(* 3 :: [4, 5] *)
(* 2 :: [3, 4, 5] *)
fun count(from: int, to: int) = 
    if from=to
    then to::[]
    else from :: count(from+1, to)

(* count_from1_to 5 -> [1,2,3,4,5] *)
(* Problem is we want count function to be private, nested function to the rescue *)
(* fun count_from1_to(x: int) = 
    count(1, x) *)

fun count_from1_to(x: int) = 
    let 
        fun count(from: int) = 
            if from=x
            then x::[]
            else from :: count(from+1)
    in
        count(1)
    end
