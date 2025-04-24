`default_nettype none
module memory (
    input wire rst, clk,

    // control signals input
    input wire reg_write_MEM, mem_write_en_MEM, mem_read_en_MEM,
    input wire [1:0] length_MEM,
    input wire sign_MEM,

    // data signals input
    input wire [31:0] alu_result_MEM,
    input wire [31:0] write_data_MEM,

    // data signals outputs
    output wire [31:0] mem_data_MEM
);

// Length: 0 = byte, 1 = half, 2 = word

   memory2c iMEMORY( // output wires
                     .data_out(mem_data_MEM), 
                     // input wires
                     .data_in(write_data_MEM), 
                     .length(length_MEM),
                     .addr(alu_result_MEM), 
                     .enable(mem_write_en_MEM | mem_read_en_MEM), 
                     .wr(mem_write_en_MEM), 
                     .createdump(1'b0), 
                     .sign(sign_MEM),
                     .clk(clk), 
                     .rst(rst));
   
endmodule
`default_nettype wire
