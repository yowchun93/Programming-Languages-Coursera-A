(* Solutions here *)
(* https://www.coursera.org/learn/programming-languages/discussions/weeks/2/threads/9ND9BJzaQL6Q_QSc2mC-RQ *)


(* alternate [1,2,3,4] -> 1 - 2 + 3 - 4 = -2 *)
fun alternate(xs: int list) =
  if null xs then 0
  else if null (tl xs) then hd xs
  else hd xs - hd (tl xs) + alternate(tl (tl xs))

(* min_max [1,2,3,4] *)
(* i really have no fking idea how to do this resursively *)
fun min_max(xs: int list) =
  if null (tl xs) then (hd xs, hd xs)
  else
    let val tl_ans = min_max(tl xs)
    in
      if (hd xs) < #1 tl_ans then (hd xs, #2 tl_ans)
      else if hd xs > #2 tl_ans then (#1 tl_ans, hd xs)
      else tl_ans
    end

(* cumsum [1,4,20] -> [1,5,25] *)
fun cumsum(xs: int list) =
  if null xs then []
  else if null (tl xs) then [hd xs]
  else (hd xs) :: cumsum(hd xs + hd (tl xs) :: tl (tl xs))

(* i really like how expressions are done in ML *)
fun greeting(name: string option) =
  "Hello there" ^
  (if isSome name then valOf name else "you") ^
  "!"

(* repeat([1,2,3], [4,0,3]) *)
(* operating on 2 lists *)
fun repeat(xs: int list, times: int list) =
  if null xs then []
  else if (hd times) = 0 then repeat((tl xs), (tl times))
  else (hd xs) :: repeat(xs, (hd times - 1)::(tl times))

(* any [true, false]  -> true *)
(* any [false, false] -> false *)
fun any(xs: bool list) =
  if null xs then false
  else if (hd xs) = true then true
  else any (tl xs)

(* all [true, false]  -> false *)
fun all(xs: bool list) =
  if null xs then true
  else if (hd xs) = false then false
  else all (tl xs)

(* zip [1,2], [4,6] -> [(1,4), (2,6)] *)
(* fun zip(xs: int list, ys: int list) =
  if null xs orelse null ys then []
  else (hd xs, hd ys) :: zip(tl xs, tl ys) *)

(* zip using Pattern matching *)
(* Pattern matching makes the code so much easier to read. *)
exception ListLength

fun zip3 list_triple =
  case list_triple of
    ([], [], []) => []
  | (hd1::tl1,hd2::tl2,hd3::tl3) => (hd1, hd2, hd3)::zip3(tl1, tl2, tl3)
  | _ => []

(* fun zipRecycle(xs: int list, ys: int list) = *)

