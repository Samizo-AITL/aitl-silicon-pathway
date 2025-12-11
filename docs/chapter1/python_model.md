# Python Model — Full Explanation

## PID Controller
Implements:
u(t) = Kp·e(t) + Ki·∫e(t)dt + Kd·de/dt.

### Code
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

## FSM Implementation
Python Enum defines:
IDLE → STARTUP → RUN → FAULT → IDLE
