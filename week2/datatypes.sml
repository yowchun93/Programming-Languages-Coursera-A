
(* TwoInts and Str are constructors *)
(* what happens when if some other datatype also uses the same constructor *)
datatype mytype = TwoInts of int * int
                | Str of string
                | Pizza

(* what happens now *)
datatype yourtype = Str of string
                  | Pizza

val a = Str "hi"
val b = Pizza
val c = TwoInts(1+2,3+4)

fun f (x: mytype) =
  case x of
    Pizza => 3
  | Str s => 8
  | TwoInts(i1,i2) => i1 + i2

(* Enumerations *)
datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int

(* Identifying real-world things/people *)
datatype id = StudentNum of int
            | Name of string
            * (string option)
            * string

(* bad language that makes one-of types inconvenient lead to common bad style *)
(* {
  student_num: int,
  first: string,
  middle: string option,
  last: string
} *)

(* Expression trees *)
(* Recursive dataTypes *)
(* I think of this more of a function type? *)
datatype exp = Constant of int
             | Negate of exp
             | Add of exp * exp
             | Multiply of exp * exp

fun eval(e: exp) =
  case e of
      Constant i => i
    | Negate e2   => ~(eval e2)
    | Add(e1, e2) => (eval e1) + (eval e2)
    | Multiply(e1, e2) => (eval e1) * (eval e2)

fun number_of_adds e =
  case e of
    Constant i => 0
    | Negate e2 => number_of_adds e2
    | Add(e1, e2) => 1 + number_of_adds e1 + number_of_adds e2
    | Multiply(e1, e2) => number_of_adds e1 + number_of_adds e2

val example_exp : exp = Add (Constant 19, Negate (Constant 4))
val example_ans : int = eval example_exp

val example_addcount = number_of_adds (Multiply(example_exp, example_exp))
