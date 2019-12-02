vsim lab111
add wave *

force A(0) 0 0
force A(1) 0 0
force A(2) 0 0
force A(3) 0 0
force A(4) 0 0
force A(5) 1 0
force A(6) 0 0
force A(7) 0 0

force S(0) 0 0
force S(1) 0 0
force S(2) 0 0
force S(3) 0 0
force S(4) 0 0
force S(5) 0 0
force S(6) 0 0
force S(7) 1 0 

force c 0 0, 1 30 -repeat 90

force clk 0 0, 1 5 -repeat 10


run 200