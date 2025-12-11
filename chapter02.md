# 第2章：AITL FSM の RTL（Verilog）化

## 概要
第1章の Python FSM を Verilog RTL として実装する。

## Verilog RTL：aitl_fsm.v
```verilog
module aitl_fsm(
    input wire clk,
    input wire reset_n,
    input wire start_cmd,
    input wire startup_done,
    input wire error_detected,
    input wire reset_cmd,
    output reg [1:0] state
);
    localparam IDLE=2'b00, STARTUP=2'b01, RUN=2'b10, FAULT=2'b11;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) state <= IDLE;
        else begin
            case (state)
                IDLE: if (start_cmd) state <= STARTUP;
                STARTUP: begin
                    if (error_detected) state <= FAULT;
                    else if (startup_done) state <= RUN;
                end
                RUN: if (error_detected) state <= FAULT;
                FAULT: if (reset_cmd) state <= IDLE;
                default: state <= IDLE;
            endcase
        end
    end
endmodule
```

## Testbench（tb_aitl_fsm.v）
```verilog
module tb_aitl_fsm;
    reg clk=0; always #5 clk=~clk;
    reg reset_n=0, start_cmd=0, startup_done=0, error_detected=0, reset_cmd=0;
    wire [1:0] state;

    aitl_fsm dut(.clk(clk), .reset_n(reset_n), .start_cmd(start_cmd),
        .startup_done(startup_done), .error_detected(error_detected),
        .reset_cmd(reset_cmd), .state(state));

    initial begin
        $dumpfile("fsm.vcd"); $dumpvars(0, dut);
        #10 reset_n=1;
        #20 start_cmd=1; #10 start_cmd=0;
        #50 startup_done=1; #10 startup_done=0;
        #40 error_detected=1; #10 error_detected=0;
        #50 reset_cmd=1; #10 reset_cmd=0;
        #100 $finish;
    end
endmodule
```

## 成果物
- OpenLane に投入可能な RTL
- 合成前シミュレーション可能なテストベンチ
