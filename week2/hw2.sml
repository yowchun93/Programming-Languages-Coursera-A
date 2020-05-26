(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
(* datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove *)

(* put your solutions for problem 2 here *)

(* all_except_option ("string", ["string", "hello"]) = SOME [] *)
fun all_except_option(s, xs) =
  case xs of
    [] => NONE
  | x::xs' =>  if same_string(s, x) then SOME xs'
                else all_except_option(s, xs')

(* val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = [] *)
(* get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], "Fred")  =>  ["Fredrick","Freddie","F"] *)
fun get_substitutions1(xs, s) =
  case xs of
    [] => []
  | x::xs' => case all_except_option(s, x) of
                NONE => get_substitutions1(xs', s)
              | SOME i => i @ get_substitutions1 (xs', s)

(* number_in_month([(2012,2,28),(2013,12,1)], 2)  *)
fun number_in_month(xs: (int*int*int) list, month: int) =
  case xs of
    [] => 0
  | (a,b,c)::xs' => if b = month then 1 + number_in_month(xs', month)
                    else number_in_month(xs', month)
