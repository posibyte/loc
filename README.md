loc
===

Counts lines of code through files or directories.
```
[8:08 PM] (matadam@cs8:~/plvpy/python) loc helloworld.py 
1
[8:09 PM] (matadam@cs8:~/plvpy/perl) loc daily.pl 
27
[8:09 PM] (matadam@cs8:~/plvpy/perl) loc newdaily.pl 
13
```

It also supports counting lines across multiple files.
```
[8:12 PM] (matadam@cs8:~/cs2/intsorter) loc sorter.c sorter.h main.c
58
```

Even across directories...
```
[8:13 PM] (matadam@cs8:~/cs2) loc stacks/ queues/
583
```

What about pretty formatting? Everybody loves it!
```
[11:08 PM] (matadam@cs8:~/cs2) loc .. [out,go] -p
../plvpy/output/PL-columns.out:(21)
../plvpy/output/PY-structures.out:(84)
../plvpy/output/PY-columns.out:(22)
../plvpy/output/PY-helloworld.out:(26)
../plvpy/output/PL-report.out:(9)
../plvpy/output/PL-helloworld.out:(15)
../plvpy/output/PY-report.out:(11)
../go-proj/test.go:(12)
../go-proj/gointerfex.go:(30)
231
```

Brackets? Oh, you can filter by file extension!
```
[11:10 PM] (matadam@cs8:~/cs2) loc .. [java]
2845
```
