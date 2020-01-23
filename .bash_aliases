alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias updg='sudo apt-get update && sudo apt-get upgrade'
alias updist='sudo apt-get update && sudo apt-get dist-upgrade'

alias clearcaches='sh scripts/clear_caches.sh'

# Youtube-dl
alias mp3dl="youtube-dl -x --audio-format mp3 -o '%(title)s.%(ext)s'"
alias mp3plylstdl="youtube-dl -cit --extract-audio --audio-format mp3"

listen-to-yt() { if [[ -z "$1" ]]; then echo "Enter a search string!"; else mpv "$(youtube-dl --default-search 'ytsearch1:' \"$1\" --get-url | tail -1)"; fi }


alias rmspace="find -name '* *' -type f | rename 's/ /_/g'"


alias xc="xclip -selection clipboard"

alias newident="sudo service tor stop && sudo service polipo stop && sudo service tor start && sudo service polipo start"

alias tb="nc termbin.com 9999"
alias nv="nvim"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# python server
alias py3server="python3 -m http.server 80"             # opening server on port 80 with local ip address


