
//input ports
add mapped point clk_i clk_i -type PI PI
add mapped point rst_n_i rst_n_i -type PI PI

//output ports
add mapped point q_o[2] q_o[2] -type PO PO
add mapped point q_o[1] q_o[1] -type PO PO
add mapped point q_o[0] q_o[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point q_o[2]/q q_o_reg[2]/Q -type DFF DFF
add mapped point q_o[1]/q q_o_reg[1]/Q -type DFF DFF
add mapped point q_o[0]/q q_o_reg[0]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
