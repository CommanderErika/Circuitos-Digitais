vsim ckt1
add wave *

force A 0 0, 1 40 -repeat 80
force B 0 0, 1 20 -repeat 40
force C 0 0, 1 10 -repeat 20
force D 0 0, 1  5 -repeat 10

run 160