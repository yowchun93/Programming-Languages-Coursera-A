val it = [7, 8 , 9]

(* functions that operate on lists *)
(* num_list [1, 2, 3]  -> 1 + 1 + 1 + 0 *)
fun num_list(xs: int list) =
  if null xs then 0
  else  1 + num_list(tl xs)

(* sum_list [1, 2, 3] -> 1 + 2 + 3 + 0 *)
fun sum_list(xs: int list) =
  if null xs then 0
  else hd xs + sum_list(tl xs)

(* 𝚟𝚊𝚕𝚡=𝚕𝚒𝚜𝚝_𝚙𝚛𝚘𝚍𝚞𝚌𝚝[];(∗𝟷∗)
𝚟𝚊𝚕𝚢=𝚕𝚒𝚜𝚝_𝚙𝚛𝚘𝚍𝚞𝚌𝚝[𝟻];(∗𝟻∗)
𝚟𝚊𝚕𝚣=𝚕𝚒𝚜𝚝_𝚙𝚛𝚘𝚍𝚞𝚌𝚝[𝟸,𝟺,𝟸];(∗𝟷𝟼∗) *)

(* sum_list [2, 4, 2] ->  2 * 4 * 2 * 1 *)
fun list_products(xs: int list) =
    if null xs
    then 1
    else hd xs * list_products(tl xs)

(* 5 *)
(* [5,4,3,2,1] -> 5 :: 4 :: 3 :: 2 :: 1 :: [] *)
fun countdown (x: int) =
  if x = 0 then []
  else x :: countdown(x-1)

(* fun factorial (n : int) = list_products(countdown n) *)
fun factorial (n : int) =
  if n = 0 then 1
  else n * factorial(n-1)

(* append [1,2], [3,4]  -> 1 :: append(2], [3,4]) -> append([], [3,4]) *)
fun append (xs: int list, ys: int list) =
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys)

(* this is simpler *)
fun sum_pair_list(xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

(* firsts [(1,2), (3,4)] *)
fun firsts(xs: (int * int) list) =
    if null xs
    then []
    else (#1 (hd xs) :: firsts(tl xs))

fun seconds(xs: (int * int) list) =
    if null xs
    then []
    else (#2 (hd xs) :: seconds(tl xs))

(* Functions over lists are usually recursive, what should the answet be for empty list? , non-empty list *)
