# KABOOM! in 146 lines of Parallel ML

A port (MPL) of a [port (Futhark)](https://github.com/athas/tinykaboom) of the
[KABOOM (C++)](https://github.com/ssloy/tinykaboom) tiny graphics program.

Here's my current result at 24 fps with MPL. (Also see `boom-60fps.gif`,
but high framerate GIFs don't seem to play very well in the browser for
some reason...)

![](boom-24fps.gif)

## Multicore performance

Machine: 4x Intel 18-core E7-8867 v4 Xeons (144 hyperthreads).

Time to generate one frame:

| MPL   | Futhark |
| ----- | ------- |
| 0.094 | 0.212   | 

Specifics for running MPL:
```
$ make main.mpl
$ ./main.mpl @mpl procs 144 set-affinity -- -frames 100
...
average time per frame: 0.0943s
```

And, running @athas's [implementation in Futhark](https://github.com/athas/tinykaboom):
```
$ futhark bench --backend=multicore --runs=100 tinykaboom.fut
Compiling tinykaboom.fut...
Reporting average runtime of 100 runs for each dataset.

Results for tinykaboom.fut:
#0 ("640i64 480i64 0.1f32 6.28f32"):     212341μs (RSD: 0.108; min: -13%; max: +88%)
```
