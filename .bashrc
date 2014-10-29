export PATH=/usr/local/bin:$PATH

export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/opt/local/perl5/bin:/ユーザ/Takehiro/perl5/bin
export PATH=$PATH:/opt/local/lib/mysql5/bin
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin
export MANPATH=$MANPATH:/opt/local/man

export PATH=$PATH:/Users/Takehiro/bin/lha/bin
export PATH=$PATH:/usr/share/prover9/bin
export PATH=$PATH:/Applications/AndroidSDK/platform-tools

alias apache2ctl='sudo /opt/local/apache2/bin/apachectl'
alias mysql5ctl='sudo /opt/local/share/mysql5/mysql/mysql.server'
alias topcoder='javaws ~/ContestAppletProd.jnlp'
alias codevs='javaws ~/Downloads/codevs3.jnlp'
alias ls='ls -a'
alias gcc='CC=/usr/local/bin/gcc-4.8 gcc'
#alias gvim='~/.vim/gvim.sh'
#alias kvim='open -a MacVim'
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

#export CFLAGS="-arch x86_64 -arch i386"
#export LDFLAGS="-arch x86_64 -arch i386"
#export CXXFLAGS="-arch x86_64 -arch i386"
PS1="(´・∀・｀):\[\033[36m\]\t\[\033[0m\] @\W $ "   
#PS1="yamazaki(仮):\w \$ "

alias git="/Applications/Xcode.app/Contents/Developer/usr/bin/git"

#emacs latest run
alias emacs="/usr/local/Cellar/emacs/24.3/Emacs.app/Contents/MacOS/Emacs -nw"

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export CC=/usr/bin/gcc

#exstended cd
cd() {
  command cd $1
  ls -l
}

#gvim function(http://qiita.com/b4b4r07/items/9013e19ba47fd07e87b5)
gvim() {
  if [$# -eq 0 ]; then
    open -a MacVim
  elif [ $# -eq 1 ]; then
    if [ ! -f "$1" ]; then
      touch "$1" || return 1
    fi
    touch -t $( date -v+1S + '%Y%m%d%H%M' ) ~/.compare

    open -a MacVim "$1" && {
      sleep 0.2
      if [ ~/.compare -ot "$1" ]; then
        [ ! -s "$1" ] && rm "$1"
      fi
      rm ~/.compare
    }
  else
    echo "$@: invalid arguments"
    return 1
  fi
  return 0
}
