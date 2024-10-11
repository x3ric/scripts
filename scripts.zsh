# Chisel

chisel-socks() {
    need chisel-tunnel 
    if [ "$#" -ne 2 ];
    then
        echo "[i] Usage: chisel_socks <ip> <server_port>"
    else
        echo "[+] copied chisel client -v $1:$2 R:socks in clipboard"
        echo "./chisel client -v $1:$2 R:socks" | xclip -sel c
        chisel server -v -p $2 --reverse
    fi
}

chisel-forward() {
    need chisel-tunnel 
    if [ "$#" -ne 4 ]; then
        echo "[i] Usage: chisel_remote <local_ip> <local_port> <remote_ip> <remote_port>"
    else
        echo "./chisel client $1:8888 R:$2:$3:$4" | xclip -sel clip
        echo "[+] Copied to clipboard: ./chisel client $1:8888 R:$2:$3:$4"
        echo "[+] Run this on the target machine"
        chisel server -p 8888 --reverse
    fi
}

# Utils

alias linpeas="curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -s --output $HOME/.local/www/linpeas.sh"
alias upload='curl bashupload.com -T "${@}"'
alias burl='curl -x http://127.0.0.1:8080/ -k'
alias adb-proxy-set="adb shell settings put global http_proxy $(ip a | grep -A 2 "enp4s0:" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'):8080"
alias adb-proxy-unset="adb shell settings put global http_proxy :0"

# Adb utils
if command -v adb >/dev/null 2>&1 ; then
alias adb-ip="adb shell \"ip addr | grep 'inet ' | sed -n '2p' | cut -d' ' -f6 | cut -d'/' -f1\""   
alias adb-wireless='_adb-wireless() { adb tcpip 5454 && adb connect $a:5454 }; a=$(adb-ip); _adb-wireless'
alias adb-mtp='adb shell svc usb setFunctions mtp'
alias adb-input='_adb-input() { if [ -z "$1" ]; then echo -n "Enter text: " && read -r text && text="${text// /\\ }" && adb shell input text "$text"; else text="${1// /\\ }" && adb shell input text "$text"; fi }; _adb-input'
alias adb-tap='_adb-tap() { while true; do echo -n "Enter x y: " && read -r x y && adb shell input tap "$x" "$y"; done }; _adb-tap'
alias adb-screen='if ! pacman -Q scrcpy &>/dev/null; then sudo pacman -Sy scrcpy; fi && scrcpy'
alias adb-screenshot='adb exec-out screencap -p > ./screenshot.png'
alias adb-screenrecord='echo -e "Starting recording\nCtrl+c to stop.\nadb pull /sdcard/screenvid.mp4 ./\nto get the video from the device\n" && adb shell screenrecord /sdcard/screenvid.mp4'
alias adb-keyevent='adb shell input keyevent'
alias adb-keyevent-help='xdg-open https://developer.android.com/reference/android/view/KeyEvent NUL'
fi
