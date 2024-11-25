更新日志:

## V5.0.0 
@Suni-code
- 暂无

@xianyu6556
- 暂无

### 维护者:
[@Suni-code](https://github.com/Suni-code) (Magisk_suni_Vxxx.zip)
[@xianyu6556](https://github.com/xianyu6556)(Magisk_fiage_Vxxx.zip)

> [!TIP]
> 两位维护者的大版本相同，细节和风格会有差异，适配的SOC不同，选择适合自己的版本即可.

> [!WARNING]
> 这次更新版本只是适配模块，配置未进行更改，请等待后期维护者适配.

### Tritium_box 更新日志
 2.0.0_alpha 更新日志

- 跟进上游
- 更新内置模块
- ~~无障碍~~

### Cutoolbox 上游更新日志
```log
V8.2.0 测试版 更新内容：

[Framework] 重写程序框架， 提升性能， 减少开销.
[CpuGovernor] 优化功耗模型的生成， 区分小核/中核/大核， 更贴近CPU满载时的真实功耗.
[CpuGovernor] 调整功耗限制策略， 改善在突发负载和CPU过热场景下的表现.
[CpuGovernor] 新增多核负载限制策略， 在单丛集内多核高负载的场景下主动限制CPU最高频率.
[CpuGovernor] 调整CPU升频延迟策略， 修复在不同丛集CPU性能差异较大时升频延迟不合理的问题.
[CpuGovernor] 调整低延迟状态时的调频策略， 请求低延迟事件触发后实际升频耗时由最低50ms减少至最低10ms。
[CpuGovernor] 改进调频器Timer根据不同场景自动调整工作频率的策略， 降低开销的同时允许更高的工作频率（100HZ）。
[CpuGovernor] 改进CPU负载滤波方式， 解决由于粗糙的CPU负载数据导致的CPU频率异常波动问题.
[CpuGovernor] 新增动态冗余功能， 解决CPU运行在较高频率时实际冗余更大导致功耗增加的问题.
[ThreadSchedOpt] 改进线程优化的触发方式， 改善在APP冷启动等场景下的表现， 降低开销.
[MtkGpuGovernor] 改进调频器策略， 支持类似CPU调频器的升降频延迟/BOOST/EXTRA_MARGIN等功能.
[DevfreqTuner] 新增的模块， 支持联发科/高通/麒麟/紫光展锐平台的DDR/GPU频率调整功能.
[Trigger] 新增的模块， 支持在特定场景触发时调整Property值和写入文件以改变调度策略， 例如提高CPU调频器的冗余.
[Thermal] 新增的模块， 支持在芯片过热时调整Property值以改变调度策略， 例如降低CPU的最大功耗和限制GPU的最高频率.
[APP] 更新掉帧监测模块, 修复在安卓14/15系统上无法准确判断掉帧的问题, 改善部分场景下的表现, 降低开销.
[APP] 修复附加模块无法在Magisk28+上正常安装的问题。
其他细节优化及bug修复.
```

## 贡献:
- @chenzyadb 
- @Suni-code
- @xianyu6556
- @NightRainMilkyWay

Full Changelog: [`V4.9.0 -> V5.0.0`](https://github.com/TimeBreeze/Tritium/commits/main/)

## 使用项目
- [CuprumTurbo Scheduler](https://github.com/chenzyadb/CuprumTurbo-Scheduler)
- [Tritium](https://github.com/TimeBreeze/Tritium)
- [Tritium_box](https://github.com/TimeBreeze/Tritium_box)
