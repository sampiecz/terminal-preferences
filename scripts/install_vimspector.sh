git clone https://github.com/puremourning/vimspector

cd vimspector

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     brew install node@12 npm pip golang-go tcl tcl-dev
     ;;

   Linux)
     echo 'Linux'
     sudo apt install curl
     curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
     sudo apt install nodejs npm pip golang-go tcl tcl-dev
     ;;

   *)
     echo 'Other OS'
     ;;
esac

./install_gadget.py --all
