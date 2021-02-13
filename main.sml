structure CLA = CommandLineArgs

val fps = CLA.parseInt "fps" 60
val width = CLA.parseInt "width" 640
val height = CLA.parseInt "height" 480
val frames = CLA.parseInt "frames" (10 * fps)
(* val frame = CLA.parseInt "frame" 100 *)

val _ = print ("width " ^ Int.toString width ^ "\n")
val _ = print ("height " ^ Int.toString height ^ "\n")
(* val _ = print ("frame " ^ Int.toString frame ^ "\n") *)
val _ = print ("fps " ^ Int.toString fps ^ "\n")
val _ = print ("frames " ^ Int.toString frames ^ "\n")

val duration = Real.fromInt frames / Real.fromInt fps

val _ = print ("(" ^ Real.fmt (StringCvt.FIX (SOME 2)) duration ^ " seconds)\n")

val _ = print ("generating frames...\n")
val (images, tm) = Util.getTime (fn _ =>
  SeqBasis.tabulate 1 (0, frames) (fn frame =>
    { width = width
    , height = height
    , data =
        ArraySlice.full
        (TinyKaboom.frame (f32.fromInt frame / f32.fromInt fps) width height)
    }))
val _ = print ("generated all frames in " ^ Time.fmt 4 tm ^ "s\n")

val _ = print ("generating palette (TODO could do this better)...\n")
val palette = GIF.Palette.summarize [Color.white, Color.black] 256
  { width = width
  , height = height
  , data = ArraySlice.full (TinyKaboom.frame 5.1667 640 480)
  }

val _ = print ("writing to boom.gif...\n")
val msBetween = Real.round ((1.0 / Real.fromInt fps) * 100.0)
val result =
  GIF.writeMany "boom.gif" msBetween palette
    { width = width
    , height = height
    , numImages = frames
    , getImage = fn i => #remap palette (Array.sub (images, i))
    }
