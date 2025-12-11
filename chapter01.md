# 第1章：AITL 制御アーキテクチャ（Python 基準モデル）

## 概要
AITL（三層：PID / FSM / LLM）の構造を定義し、Python による基準モデルを作成する。

## 三層構造
- PID：実時間制御ループ
- FSM：モード管理
- LLM：適応・再設計層（プレースホルダー）

## Python コード骨格
```python
class PID:
    def __init__(self, kp, ki, kd, dt):
        self.kp, self.ki, self.kd = kp, ki, kd
        self.dt = dt
        self._integral = 0
        self._prev = 0

    def update(self, sp, x):
        e = sp - x
        self._integral += e * self.dt
        d = (e - self._prev) / self.dt
        self._prev = e
        return self.kp*e + self.ki*self._integral + self.kd*d
```

```python
from enum import Enum, auto
class AITLState(Enum):
    IDLE = auto()
    STARTUP = auto()
    RUN = auto()
    FAULT = auto()
```

```python
class AITLControllerA:
    def __init__(self, pid):
        self.pid = pid
        self.state = AITLState.IDLE
        self.start_cmd = False
        self.reset_cmd = False
        self.error_detected = False
        self.startup_done = False
        self.setpoint = 0
        self.measured = 0
        self.control_output = 0

    def _update_fsm(self):
        s = self.state
        if s == AITLState.IDLE:
            if self.start_cmd: self.state = AITLState.STARTUP
        elif s == AITLState.STARTUP:
            if self.error_detected: self.state = AITLState.FAULT
            elif self.startup_done: self.state = AITLState.RUN
        elif s == AITLState.RUN:
            if self.error_detected: self.state = AITLState.FAULT
        elif s == AITLState.FAULT:
            if self.reset_cmd: self.state = AITLState.IDLE

    def step(self, measured):
        self.measured = measured
        self._update_fsm()
        if self.state in (AITLState.STARTUP, AITLState.RUN):
            self.control_output = self.pid.update(self.setpoint, self.measured)
        else:
            self.control_output = 0
        return self.control_output
```

## 本章の成果物
- Python で動作する AITL-A 基準モデル
- 第2章の RTL 化の入力となる FSM 定義
