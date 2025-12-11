# 第4章：Magic による SPICE 抽出

## GDS のロード
```
magic -T sky130A.tech
> gds read aitl_fsm.gds
> load aitl_fsm
```

## 抽出
```
extract all
ext2spice cthresh 0 rthresh 0
```

## 出力
- `aitl_fsm.spice`（MOS + RC を含む netlist）
