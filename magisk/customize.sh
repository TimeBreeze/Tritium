#!/system/bin/sh
SKIPUNZIP=0
MODDIR=${0%/*}
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

set_perm_recursive $MODPATH 0 0 0755 0644

rm -rf /data/powercfg.json
rm -rf /data/powercfg.sh


cp -f $MODPATH/powercfg/powercfg.json /data/
cp -f $MODPATH/powercfg/powercfg.sh /data/


ui_print "- Tritium Scheduler Module"
ui_print "- Installing..."

ui_print "- 当前版本为: $(grep '^version=' module.prop | cut -d'=' -f2)"
ui_print "- 构建时间:$(stat -c %y $MODPATH/module.prop | cut -d: -f1,2)"
ui_print "- CPU型号:$(getprop ro.board.platform)"
ui_print "- 手机代号:$(getprop ro.product.board)"
ui_print "- 安卓版本:$(getprop ro.build.version.release)"


arr="Pandora Yuni Angel"
string="$(cat "/proc/version")"
for item in $arr; do
    if echo "$string" | grep -q "$item"; then
        abort "内核不兼容，终止安装"
    fi
done

unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
chmod -R 0777 $MODPATH

function get_taro_name() {
    cpu7_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq)
    gpu_max_freq=$(cat /sys/class/kgsl/kgsl-3d0/max_clock_mhz)
    # SDM8+GEN1: 2.0+2.75+3.19 SDM8GEN1/8+GEN1UC: 1.8+2.5+3.0 SDM7+GEN2: 1.8+2.5+2.91.
    if [ $cpu7_max_freq -gt 3100000 ]; then
        ui_print "sdm8+gen1"
    elif [ $cpu7_max_freq -gt 2950000 ]; then
        if [ $gpu_max_freq -gt 850 ]; then
            # Adreno730 @ 900MHz
            ui_print "sdm8+gen1"
        else
            # Adreno730 @ 818MHz
            ui_print "sdm8gen1"
        fi
    elif [ $cpu7_max_freq -gt 2900000 ]; then
        ui_print "sdm7+gen2"
    else
        ui_print "sdm7gen1"
    fi
}

function get_lahaina_name() {
    cpu7_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq)
    cpu4_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy4/cpuinfo_max_freq)
    if [ $cpu7_max_freq -gt 2800000 ]; then
        ui_print "sdm888"
    elif [ $cpu4_max_freq -gt 2300000 ]; then
        ui_print "sdm778"
    else
        ui_print "sdm780"
    fi
}

function get_lito_name() {
    cpu_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq)
    if [ $cpu_max_freq -gt 2300000 ]; then
        ui_print "sdm765"
    else
        ui_print "sdm750"
    fi
}

function get_sm6150_name() {
    cpu_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq)
    if [ $cpu_max_freq -gt 2200000 ]; then
        ui_print "sdm730"
    else
        ui_print "sdm675"
    fi
}

function get_mt6895_name() {
    cpu_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq)
    if [ $cpu_max_freq -gt 3000000 ]; then
        ui_print "dimensity8200"
    else
        ui_print "dimensity8100"
    fi
}

function get_bengal_name() {
    cpu_max_freq=$(cat /sys/devices/system/cpu/cpufreq/policy7/cpuinfo_max_freq)
    if [ $cpu_max_freq -gt 2300000 ]; then
        ui_print "sdm680"
    else
        ui_print "sdm665"
    fi
}

function get_config_name() {
    case "$1" in
    pineapple*)
        ui_print "sdm8gen3"
        ;;
    sunstone*)
        ui_print "sdm4gen1"
        ;;
    sky*)
        ui_print "sdm4gen2"
        ;;
    kalama*)
        ui_print "sdm8gen2"
        ;;
    taro*)
        get_taro_name
        ;;
    lahaina*)
        # snapdragon 888/778/780
        get_lahaina_name
        ;;
    shima*)
        get_lahaina_name
        ;;
    yupik*)
        get_lahaina_name
        ;;
    kona*)
        ui_print "sdm865"
        ;;
    msmnile*)
        ui_print "sdm855"
        ;;
    sdm845*)
        ui_print "sdm845"
        ;;
    lito*)
        get_lito_name
        ;;
    sm7150*)
        ui_print "sdm730"
        ;;
    sm6150*)
        get_sm6150_name
        ;;
    sdm710*)
        ui_print "sdm710"
        ;;
    sdm450*)
        ui_print "sdm625"
        ;;
    sdm4350*)
        # snapdragon 480
        ui_print "sdm730"
        ;;
    msm8953*)
        ui_print "sdm625"
        ;;
    sdm660*)
        ui_print "sdm660"
        ;;
    sdm636*)
        ui_print "sdm660"
        ;;
    trinket*)
        ui_print "sdm665"
        ;;
    bengal*)
        # snapdragon 665/460/680
        get_bengal_name
        ;;
    holi*)
        # snapdragon 695
        ui_print "sdm4gen1"
        ;;
    msm8998*)
        ui_print "sdm835"
        ;;
    msm8996*)
        ui_print "sdm820"
        ;;
    universal9925*)
        ui_print "exynos2200"
        ;;
    universal2100*)
        ui_print "exynos2100"
        ;;
    universal1080*)
        ui_print "exynos1080"
        ;;
    universal990*)
        ui_print "exynos990"
        ;;
    universal9825*)
        ui_print "exynos9825"
        ;;
    universal9820*)
        ui_print "exynos9820"
        ;;
    mt6771*)
        # Helio P60/P70
        ui_print "helio_p60"
        ;;
    mt6779*)
        # Helio P90
        ui_print "helio_g80"
        ;;
    mt6762*)
        # Helio G25/P22
        ui_print "helio_p35"
        ;;
    mt6765*)
        # Helio G35/P35
        ui_print "helio_p35"
        ;;
    mt6768*)
        ui_print "helio_g80"
        ;;
    mt6785*)
        ui_print "helio_g90"
        ;;
    mt6789*)
        ui_print "helio_g99"
        ;;
    mt6833*)
        ui_print "dimensity700"
        ;;
    mt6853*)
        ui_print "dimensity700"
        ;;
    mt6873*)
        ui_print "dimensity820"
        ;;
    mt6875*)
        ui_print "dimensity820"
        ;;
    mt6877*)
        ui_print "dimensity900"
        ;;
    mt6885*)
        ui_print "dimensity1000"
        ;;
    mt6886*)
        ui_print "dimensity7200"
        ;;
    mt6889*)
        ui_print "dimensity1000"
        ;;
    mt6891*)
        ui_print "dimensity1100"
        ;;
    mt6893*)
        ui_print "dimensity1100"
        ;;
    mt6895*)
        # Dimensity8200 also named mt6895(k6895v1_64)
        get_mt6895_name
        ;;
    mt6983*)
        ui_print "dimensity9000"
        ;;
    mt6985*)
        ui_print "dimensity9200"
        ;;
    mt6989*)
        ui_print "dimensity9300"
        ;;
    kirin970*)
        ui_print "kirin970"
        ;;
    hi3670*)
        ui_print "kirin970"
        ;;
    hi3660*)
        ui_print "kirin960"
        ;;
    hi3650*)
        ui_print "kirin950"
        ;;
    kirin710*)
        ui_print "kirin710"
        ;;
    hi6250*)
        ui_print "kirin650"
        ;;
    sp9863a*)
        ui_print "sc9863a"
        ;;
    ums512*)
        ui_print "unisoc_t618"
        ;;
    ud710*)
        ui_print "unisoc_t740"
        ;;
    ums9620*)
        ui_print "unisoc_t770"
        ;;
    ums9230*)
        # Unisoc T606
        ui_print "unisoc_t618"
        ;;
    *)
        ui_print "universal"
        ;;
    esac
}

platform_name=$(getprop ro.board.platform)
config_name=$(get_config_name $platform_name)

if [ -e ${MODPATH}/configs/${config_name}.json ]; then
    cp -f ${MODPATH}/configs/${config_name}.json ${MODPATH}/config.json
    rm -rf ${MODPATH}/configs/

    ui_print "- ${platform_name} 您的芯片已适配😋."
    ui_print "- install finished."
else
    ui_print "- ${platform_name} 您的芯片未适配😑."
    abort "- Abort!"
fi

