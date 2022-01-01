`timescale 1ns / 1ps
`include "common.vh"
module memory(
        input                       clk,
        input                       rst,

        input [31:0] 	            address,
        input [31:0] 	            rt_value,
        input [ 1:0] 	            mem_type,
        input [ 2:0] 	            mem_size,
        input 		                mem_signed,

        // Connect to sram.
        output logic 	            mem_en,
        output logic [3:0]          mem_wen,
        output logic [31:0]         mem_addr,
        output logic [31:0]         mem_wdata,
        input logic [31:0]          mem_rdata,

        output logic [31:0]         result,
        // Report error
        output logic                address_error
);

    assign mem_en   = |mem_type && (~address_error);
    assign mem_addr = address;

    always_comb begin : detect_alignment_error
        if(mem_type != `MEM_NOOP) begin
            unique case(mem_size)
            `SZ_HALF:
                address_error = address[0];
            `SZ_FULL:
                address_error = |address[1:0];
            default:
                address_error = 1'b0;
            endcase
        end
        else
            address_error = 1'b0;
    end

    // Read or write
    always_comb begin : memory_control
        result = address;
        mem_wen = 4'b0;
        mem_wdata = rt_value;
        if(address_error) begin
        // We do noting when align error
        end
        else begin
            if(mem_type == `MEM_STOR) begin
                unique case(mem_size)
                `SZ_FULL:
                    mem_wen = 4'b1111;
                `SZ_HALF: begin
                    mem_wdata = {2{rt_value[15:0]}};
                    mem_wen = {address[1],address[1],~address[1],~address[1]};
                end
                `SZ_BYTE: begin
                    mem_wdata = {4{rt_value[7:0]}};
                    unique case(address[1:0])
                    2'd0:
                        mem_wen = 4'b0001;
                    2'd1:
                        mem_wen = 4'b0010;
                    2'd2:
                        mem_wen = 4'b0100;
                    2'd3:
                        mem_wen = 4'b1000;
                    default:
                        mem_wen = 4'b0000;
                    endcase
                end
                default:
                    mem_wen = 4'b1111;
                endcase
            end
            else if(mem_type == `MEM_LOAD) begin
                mem_wen = 4'b0;
                unique case(mem_size)
                `SZ_HALF: begin
                    if(address[1])
                    result = mem_signed? { 16'b0 ,mem_rdata[31:16]} :
                                {{16{mem_rdata[31]}}, mem_rdata[31:16]};
                    else
                    result = mem_signed? { 16'b0 ,mem_rdata[15:0]} :
                                {{16{mem_rdata[15]}}, mem_rdata[15:0]};
                end
                `SZ_BYTE: begin
                    unique case(address[1:0])
                    2'b01:
                        result = mem_signed? { 24'b0, mem_rdata[15:8]} :
                                {{24{mem_rdata[15]}}, mem_rdata[15:8]};
                    2'b10:
                        result = mem_signed? { 24'b0, mem_rdata[23:16]} :
                                {{24{mem_rdata[23]}}, mem_rdata[23:16]};
                    2'b11:
                        result = mem_signed? { 24'b0, mem_rdata[31:24]} :
                                {{24{mem_rdata[31]}}, mem_rdata[31:24]};
                    default:
                        result = mem_signed? { 24'b0, mem_rdata[7:0]} :
                                {{24{mem_rdata[7]}}, mem_rdata[7:0]};
                    endcase
                end
                default:
                    result = mem_rdata;
                endcase
            end
        end
    end
    
endmodule