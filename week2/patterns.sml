(* Datatype bindings *)
(* Type t and constructor Ci of type ti *)
(* datatype t = C1 of t1 | C2 of t2 *)
datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int

(* Type synonym *)
type card = suit * rank

type name_record = {
  student_num : int option,
  first : string,
  middle : string option,
  last : string
}

fun is_Queen_of_Spades (c : card) =
  #1 c = Spade andalso #2 c = Queen

val c1 : card = (Diamond, Ace)
val c2 : suit * rank = (Heart, Ace)

fun is_Queen_of_Spades2 c =
  case c of
    (Spade, Queen) => true
  | _ => false

(* Accessing options using pattern matching *)
fun inc_or_zero intoption =
  case intoption of
    NONE => 0
    | SOME i => i + 1

(* Pattern matching in action *)
fun sum_list xs =
  case xs of
    [] => 0
    | x::xs' => x + sum_list 'xs

fun append(xs, ys) =
  case xs of
    [] => ys
    | x::xs' => x :: append('xs, ys)

(* stop using isSome, valOf, null, hd, tl *)
fun sum_triple triple =
  let val (x,y,z) = triple
  in
    x + y + inc_or_zero
  end

(* in ML, every function takes exactly one argument *)
fun full_name {first=x, middle=y, last=z} =
  x ^ " " ^ y ^ " " ^ z

(* Nested patterns *)
(* fun zip3(xs ) *)

fun nondecreasing xs =
  case xs of
    [] => true
