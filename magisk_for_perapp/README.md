# CuprumTurbo-Magisk-Perapp
基于 CuprumTurbo Scheduler 的 Magisk 模块提供一些扩展功能.
# Document for who would use this

```sh
// 具体配置文件在/storage/emulated/0/Android/ct/perapp.txt
// 很简单和uperf的配置文件几乎一模一样
# 分应用性能模式配置
# 配置格式 {包名} {模式}
# 对于模式有 powersave balance performance fast
# '*' 代表着默认，如果你没有为app单独配置模式，这会默认使用该模式

com.miHoYo.Yuanshen fast
* powersave

```
很简单，把你的配置文件复制到 Configs 然后 zip 打包即可，如果你想修改作者或者自定义脚本，那请随意，在修改时不要忘了：  
- 做他妈的你想做的任何事.

当然我不是很建议你删掉`我的名字`或者 `Chenzyyzd `的名字，当然只是建议.

都看到这里了，你会发现妈的README.md怎么还都一样