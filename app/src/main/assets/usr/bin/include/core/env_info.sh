#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
env_info() {
    model=$(getprop ro.product.model)
    if [ -n "$model" ]; then
        echo -n "设备: "
        echo "$model"
    fi
    android_version=$(getprop ro.build.version.release)
    if [ -n "$android_version" ]; then
        echo -n "安卓版本: "
        echo "Android $android_version"
    fi

    echo -n "容器已安装系统:"
    if [ -f "$rootfs/etc/issue" ];then
    export linux_version=$(cat $rootfs/etc/issue)
    else
    export linux_version="  未安装或无法识别"
    fi
    echo "$linux_version"

    echo -n "CPU架构: "
    echo "$(uname -m)"

    echo -n "内核版本: "
    echo "$(uname -r)"

    echo -n "内存: "
    mem_status=$(sed -n '1,p' /proc/meminfo)
    echo "$mem_status"

    echo -n "SELinux: "
    selinux_inactive && echo "关闭" || echo "开启"

    echo -n "支持 Loop:"
    loop_support && echo "是" || echo "否"

    echo "文件系统支持:"
    supported_fs=$(cat /proc/filesystems)
    echo "$supported_fs"
    
    echo 'busybox版本:'
    $TOOLKIT/busybox | grep BusyBox

    echo "运行路径:"
    pwd
    
    echo ""
    echo "CLI版本:"
    sh $TOOLKIT/cli.sh version

    echo "PRoot版本:"
    $TOOLKIT/proot -V

    echo "chroot状态:"
    $TOOLKIT/busybox chroot
}
