vsim lab06
add wave *

force A(0) 0 0
force A(1) 0 0
force A(2) 1 0
force A(3) 0 0

force clk 0 0, 1 10 -repeat 20

force K 0 0
force K 1 20

force enable 1 80
force enable 0 81



 

run 300