if [[ $SDK -ge 24 ]]; then
    echo "检测到Android7以下系统,此版本仅支持Android6+"
    echo "------"
    echo "请去Github搜DogeLand下载适用于Android5+的版本"
    sleep 1000
else
    echo "">/dev/null
fi