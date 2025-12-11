# 第5章：ngspice による波形解析

## TR simulation 例
```
tran 0.1n 50n
plot v(state0) v(state1)
```

## 見えること
- state 遷移の遅延
- RC による波形ゆがみ
- セル実装によるタイミング差
