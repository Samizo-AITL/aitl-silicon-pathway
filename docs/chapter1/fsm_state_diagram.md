# FSM State Diagram

State transitions:
- IDLE → STARTUP (start_cmd)
- STARTUP → RUN (startup_done)
- RUN → FAULT (error_detected)
- FAULT → IDLE (reset_cmd)
