// docs/chapter3/code/rtl/fsm_rtl.sv
// Minimal example RTL template for Chapter3 simulation + synthesis concept.
// Replace the state set / transitions with your Chapter2 formal spec.
//
// Notes:
// - Use always_ff for sequential logic
// - Use always_comb for combinational next-state/output logic
// - Keep reset deterministic
//
// This module is intentionally small and generic.
// If your Chapter2 RTL has different ports, adapt TB/config accordingly.

module fsm_rtl #(
  parameter int STATE_W = 3
)(
  input  logic             clk,
  input  logic             rst_n,

  // Example inputs (events/conditions)
  input  logic             in_start,
  input  logic             in_done,
  input  logic             in_fault,

  // Example outputs (actions/flags)
  output logic             out_busy,
  output logic             out_error,

  // Debug (optional): export current state for TB visibility
  output logic [STATE_W-1:0] state_q
);

  // Example states (replace with Chapter2 spec)
  localparam logic [STATE_W-1:0] S_IDLE  = 'd0;
  localparam logic [STATE_W-1:0] S_RUN   = 'd1;
  localparam logic [STATE_W-1:0] S_DONE  = 'd2;
  localparam logic [STATE_W-1:0] S_FAULT = 'd3;

  logic [STATE_W-1:0] state_d;

  // Sequential state register
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      state_q <= S_IDLE;
    end else begin
      state_q <= state_d;
    end
  end

  // Next-state + outputs
  always_comb begin
    // Defaults
    state_d   = state_q;
    out_busy  = 1'b0;
    out_error = 1'b0;

    unique case (state_q)
      S_IDLE: begin
        out_busy = 1'b0;
        if (in_fault) begin
          state_d = S_FAULT;
        end else if (in_start) begin
          state_d = S_RUN;
        end
      end

      S_RUN: begin
        out_busy = 1'b1;
        if (in_fault) begin
          state_d = S_FAULT;
        end else if (in_done) begin
          state_d = S_DONE;
        end
      end

      S_DONE: begin
        out_busy = 1'b0;
        // Return to IDLE when start is low (simple handshake)
        if (in_fault) begin
          state_d = S_FAULT;
        end else if (!in_start) begin
          state_d = S_IDLE;
        end
      end

      S_FAULT: begin
        out_busy  = 1'b0;
        out_error = 1'b1;
        // Clear fault by deasserting fault and start (simple policy)
        if (!in_fault && !in_start) begin
          state_d = S_IDLE;
        end
      end

      default: begin
        // Safe fallback
        state_d   = S_IDLE;
        out_busy  = 1'b0;
        out_error = 1'b0;
      end
    endcase
  end

endmodule
