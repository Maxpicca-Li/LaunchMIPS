// `timescale 1ns/1ps
// module pc_reg (
//         input               clk,
//         input               rst,
//         input               pc_en,
//         input               inst_data_ok1,
//         input               inst_data_ok2,
//         input               fifo_full,
//         input               jumpD,
//         input               jalD,
//         input               jrD,
//         input               branch_taken,
//         input               except_taken,

//         input  [31:0]       pc_except,
//         input  [31:0]       pc_next_jr,
//         input  [31:0]       pc_next_jump,
//         input  [31:0]       pc_branchD,

//         output logic[31:0]  pc_curr
//     );
//     reg [31:0] pc_reg;
//     logic[31:0] pc_next;
//     assign pc_curr = pc_reg;

//     always_ff @(posedge clk) begin
//         if(rst)
//             pc_reg <= 32'hbfc00000;
//         else if(pc_en)
//             pc_reg <= pc_next;
//         else
//             pc_reg <= pc_reg;
//     end

//     always_comb begin : compute_pc_next
//         if(except_taken)
//             pc_next = pc_except;
//         else if(jrD)
//             pc_next = pc_next_jr;
//         else if(jumpD|jalD)
//             pc_next = pc_next_jump;
//         else if(branch_taken)
//             pc_next = pc_branchD;
//         else if(fifo_full)
//             pc_next = pc_curr;
//         else if(inst_data_ok1 && inst_data_ok2)
//             pc_next = pc_curr + 32'd8;
//         else if(inst_data_ok1)
//             pc_next = pc_curr + 32'd4;
//         else
//             pc_next = pc_curr;
//     end

// endmodule

`timescale 1ns/1ps
module pc_reg (
        input               clk,
        input               rst,
        input               pc_en,
        input               inst_data_ok1,
        input               inst_data_ok2,
        input               fifo_full,

        output logic[31:0]  pc_curr
    );
    reg [31:0] pc_reg;
    logic[31:0] pc_next;
    assign pc_curr = pc_reg;

    always_ff @(posedge clk) begin
        if(rst)
            pc_reg <= 32'hbfc00000;
        else if(pc_en)
            pc_reg <= pc_next;
        else
            pc_reg <= pc_reg;
    end

    always_comb begin : compute_pc_next
        if(fifo_full)
            pc_next = pc_curr;
        else if(inst_data_ok1 && inst_data_ok2)
            pc_next = pc_curr + 32'd8;
        else if(inst_data_ok1)
            pc_next = pc_curr + 32'd4;
        else
            pc_next = pc_curr;
    end

endmodule
