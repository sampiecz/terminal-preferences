if [ "$TERM" = "linux" ]; then
echo -en "\e]P0073642" #black
echo -en "\e]P8002b36" #brblack
echo -en "\e]P1dc322f" #red
echo -en "\e]P9cb4b16" #brred
echo -en "\e]P2859900" #green
echo -en "\e]PA586e75" #brgreen
echo -en "\e]P3b58900" #yellow
echo -en "\e]PB657b83" #bryellow
echo -en "\e]P4268bd2" #blue
echo -en "\e]PC839496" #brblue
echo -en "\e]P5d33682" #magenta
echo -en "\e]PD6c71c4" #brmagenta
echo -en "\e]P62aa198" #cyan
echo -en "\e]PE93a1a1" #brcyan
echo -en "\e]P7eee8d5" #white
echo -en "\e]PFfdf6e3" #brwhite
clear #for background artifacting
fi

#alias tb="workon TB_Automator && cd ~/Projects/TB_Automator && clear"
#alias cor="workon correlate_pro && cd ~/PycharmProjects/CorrelatePro && clear"
#alias gb="cd ~/Documents/Greenbridge_Consulting && ls"
#alias art="workon art && cd ~/PycharmProjects/art && clear"
#alias vim="TERM=screen-256color vim"
#alias turing="ssh z1732715@turing.cs.niu.edu"
