# Tritium Scheduler

一个专注于Snapdragon的调度.

基于CuprumTurbo Scheduler

本调度内置四种调度模式

- 省电模式：不推荐日常使用，推荐作为待机时使用的模式

- 均衡模式：及其推荐作为日常使用首选模式，能在保证流畅的前提下尽量保证较低的功耗

- 性能模式：提供适量的性能，推荐在和平精英，王者荣耀这类中负载的游戏中使用

- 极速模式：提供最激进的性能调度，推荐在原神，崩坏 星穹铁道这类重负载游戏中使用

支持的SOC列表（后续也可能会增加）
（注：仅代表本调度，并不代表原CT）

骁龙：845/855/855+/860/865/865+/870/888/888+/8Gen1/8+Gen1/7+Gen2/8Gen2/8Gen3/765/765G/768G/778G/778G+/782/835

# 使用方法及使用须知

本调度可以使用配置文件导入Cutoolbox APP使用，也可以使用magisk模块刷入使用

安装cutoolbox 之后给cutoolbox无障碍和电池无限制权限

然后再去Cutoolbox里面找到拓展功能，点击里面的转系统应用模块，装好之后就不用cutoolbox软件留后台，因为已经成为系统级应用

然后点击自定义配置，点击导入，找到我的配置文件选择导入

1.确认是官方内核的情况下使用此调度

2.使用后不兼容任何形式的CPU降压和调速器模块

3.不能装asoul线程优化模块，Uperf及其子模块，miui优化模块

# 反馈格式

- 系统版本:
- CPU型号:
- CT版本:
- 调度版本:
- 是否是官方内核:
- 是否存在以下冲突模块:A-SOUL YC（含子模块）及二改 对CPU GPU进行改动的模块
- 游戏的话必须有scene记录的游戏帧数图（长截图到底）
