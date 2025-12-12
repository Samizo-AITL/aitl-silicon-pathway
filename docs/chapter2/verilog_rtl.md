# File: docs/chapter2/verilog_rtl.md

# FSM Verilog RTL  
## Skeleton to Complete Implementation

This document presents the **Verilog RTL implementation** of the FSM specified in
`fsm_spec.md`, following the translation rules defined in `mapping_rules.md`.

The implementation is shown in two stages:
1. **Skeleton RTL** – structural template
2. **Complete RTL** – fully specified FSM

All code is **synthesizable** and suitable for **ASIC flows (OpenLane)**.

---

## Design Assumptions

- Single clock domain
- Synchronous active-high reset
- Moore-type FSM
- Binary state encoding
- Fully deterministic behavior

---

## 1. FSM RTL Skeleton

The skeleton defines the **minimum structure** required for a clean FSM implementation.

```verilog
module fsm_controller (
    input  wire clk,
    input  wire reset,

    input  wire start,
    input  wire init_done,
    input  wire fault_detected,
    input  wire recover_done,

    output wire mode_idle,
    output wire mode_init,
    output wire mode_run,
    output wire mode_fault,
    output wire mode_recover
);

    // --------------------------------------------------
    // State encoding (placeholder)
    // --------------------------------------------------
    localparam S_IDLE    = 3'b000;
    localparam S_INIT    = 3'b001;
    localparam S_RUN     = 3'b010;
    localparam S_FAULT   = 3'b011;
    localparam S_RECOVER = 3'b100;

    // --------------------------------------------------
    // State registers
    // --------------------------------------------------
    reg [2:0] state;
    reg [2:0] next_state;

    // --------------------------------------------------
    // State register (sequential)
    // --------------------------------------------------
    always @(posedge clk) begin
        if (reset)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    // --------------------------------------------------
    // Next-state logic (combinational)
    // --------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            S_IDLE: begin
                // transition logic
            end
            S_INIT: begin
                // transition logic
            end
            S_RUN: begin
                // transition logic
            end
            S_FAULT: begin
                // transition logic
            end
            S_RECOVER: begin
                // transition logic
            end
            default: begin
                next_state = S_IDLE;
            end
        endcase
    end

    // --------------------------------------------------
    // Output logic (Moore)
    // --------------------------------------------------
    assign mode_idle    = (state == S_IDLE);
    assign mode_init    = (state == S_INIT);
    assign mode_run     = (state == S_RUN);
    assign mode_fault   = (state == S_FAULT);
    assign mode_recover = (state == S_RECOVER);

endmodule
```

---

## 2. Complete FSM RTL Implementation

This version implements the **full transition logic** defined in `fsm_spec.md`.

```verilog
module fsm_controller (
    input  wire clk,
    input  wire reset,

    input  wire start,
    input  wire init_done,
    input  wire fault_detected,
    input  wire recover_done,

    output wire mode_idle,
    output wire mode_init,
    output wire mode_run,
    output wire mode_fault,
    output wire mode_recover
);

    // --------------------------------------------------
    // State encoding
    // --------------------------------------------------
    localparam S_IDLE    = 3'b000;
    localparam S_INIT    = 3'b001;
    localparam S_RUN     = 3'b010;
    localparam S_FAULT   = 3'b011;
    localparam S_RECOVER = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    // --------------------------------------------------
    // State register
    // --------------------------------------------------
    always @(posedge clk) begin
        if (reset)
            state <= S_IDLE;
        else
            state <= next_state;
    end

    // --------------------------------------------------
    // Next-state logic
    // --------------------------------------------------
    always @(*) begin
        next_state = state;
        case (state)
            S_IDLE: begin
                if (start)
                    next_state = S_INIT;
            end

            S_INIT: begin
                if (init_done)
                    next_state = S_RUN;
            end

            S_RUN: begin
                if (fault_detected)
                    next_state = S_FAULT;
            end

            S_FAULT: begin
                if (!fault_detected)
                    next_state = S_RECOVER;
            end

            S_RECOVER: begin
                if (recover_done)
                    next_state = S_INIT;
            end

            default: begin
                next_state = S_IDLE;
            end
        endcase
    end

    // --------------------------------------------------
    // Output logic (Moore)
    // --------------------------------------------------
    assign mode_idle    = (state == S_IDLE);
    assign mode_init    = (state == S_INIT);
    assign mode_run     = (state == S_RUN);
    assign mode_fault   = (state == S_FAULT);
    assign mode_recover = (state == S_RECOVER);

endmodule
```

---

## Notes on Synthesizability

- All `always` blocks have clear intent (sequential vs combinational)
- No latches can be inferred
- No blocking delays or non-synthesizable constructs
- All outputs are driven continuously
- Reset behavior is explicit and dominant

---

## Summary

This RTL implementation:

- Directly reflects the formal FSM specification
- Obeys all Python-to-Verilog mapping rules
- Is suitable for simulation and ASIC synthesis
- Can be integrated as the FSM layer in the AITL architecture

The next document defines **RTL coding guidelines** to ensure robustness
during synthesis and physical implementation.

---
