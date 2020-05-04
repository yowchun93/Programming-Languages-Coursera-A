(* Let are expressions *)
(* Introduces the concept of scopes *)

fun silly1 (z : int) = 
  let
    val x = if z > 0 then z else 34      
  in
    x + 1
  end

fun silly2 (x: int) = 
  let 
    val z = x
  in 
    z + 1
  end

(* outer scoped x will not be relevant *)
fun silly3 (x: int) = 
  let 
    val x = 1
  in     
    (* 3 + 4 *)
    (let val x = 2 in x + 1 end) + (let val y = x + 2 in y + 1 end)
  end