structure f32 =
struct
  open Real32
  val sin = Math.sin
  val floor = realFloor
  fun max a b = Real32.max (a, b)
  fun min a b = Real32.min (a, b)
end
