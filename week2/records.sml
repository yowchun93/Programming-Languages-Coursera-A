(* sml Records *)

val x = {
  bar=(1+2, true andalso true),
  foo=3+4,
  baz=(false,9)
  };

val my_niece = {id=41111,name="Amelia"} : {id:int, name:string}

(* tuples are Syntactic sugar for records *)
(* val x = {3="hi", 1=true}; *)

