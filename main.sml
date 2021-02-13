structure CLA = CommandLineArgs

val fps = CLA.parseInt "fps" 60
val width = CLA.parseInt "width" 640
val height = CLA.parseInt "height" 480
(* val frames = CLA.parseInt "frames" (10 * fps) *)
val frame = CLA.parseInt "frame" 100

val _ = print ("width " ^ Int.toString width ^ "\n")
val _ = print ("height " ^ Int.toString height ^ "\n")
val _ = print ("frame " ^ Int.toString frame ^ "\n")
(* val _ = print ("fps " ^ Int.toString fps ^ "\n") *)
(* val _ = print ("frames " ^ Int.toString frames ^ "\n") *)

(* val duration = Real.fromInt frames / Real.fromInt fps *)

(* val _ = print ("(" ^ Real.fmt (StringCvt.FIX (SOME 2)) duration ^ " seconds)\n") *)

val image = TinyKaboom.frame (f32.fromInt frame / f32.fromInt fps) width height
val image = ArraySlice.full image
val _ = GIF.write "boom.gif" {width=width, height=height, data=image}
