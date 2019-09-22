vsim lab08
add wave *

force A(0) 0 0
force A(1) 0 0
force A(2) 0 0
force A(3) 1 0

force B(0) 0 0
force B(1) 0 0
force B(2) 1 0
force B(3) 0 0

force en  0 0
force clr 0 0
force clr 1 1

force enp 0 0
force enp 1 80
force enp 0 81

force en  1 80


force clk 0 0, 1 10 -repeat 20


run 300