#~/.zshrc
####### 履歴関係設定 start ########
##

# 履歴の設定, screen でも共有
HISTFILE="$HOME"/.zhistory

# メモリ内の履歴の数
HISTSIZE=100000

# 保存される履歴の数
SAVEHIST=100000

# 既にヒストリにあるコマンドは古い方を削除
setopt hist_ignore_all_dups

# コマンドラインの余分なスペースを削除
setopt hist_reduce_blanks

#ヒストリの共有 for GNU Screen
setopt share_history

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# 先頭マッチのヒストリサーチ
bindkey '^P' history-beginning-search-backward

# 先頭マッチのヒストリサーチ
bindkey '^N' history-beginning-search-forward

##
######## 履歴関係設定 end ########

######## 補完関係設定 start ########
##

# 補完候補リストの日本語を適正表示
setopt print_eight_bit
#setopt print_eightbit

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除く
setopt auto_remove_slash

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドごとに補完関数を使う
autoload -U compinit
compinit -u

##
######## 補完関係設定 end #######


####### プロンプト関係設定 start ########
##

# プロンプトのカラー表示を有効
autoload -U colors  ; colors

if [ $USER = "root" ]
then
PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
# 左プロンプト
PROMPT=$'%{\e[1;31m%}%m %{\e[01;34m%}${WINDOW:+"[$WINDOW]"}#%{\e[0m%} '
# 右プロンプト
RPROMPT=$'%{\e[01;31m%}[%{\e[01;34m%}%~%{\e[01;31m%}]%{\e[0m%}'
else
# 左プロンプト
PROMPT=$'%{\e[1;32m%}%n@%m %{\e[01;34m%}${WINDOW:+"[$WINDOW]"}$%{\e[0m%} '
# 右プロンプト
RPROMPT=$'%{\e[01;32m%}[%{\e[01;34m%}%~%{\e[01;32m%}]%{\e[0m%}'
fi

# 被る時は右プロンプトを消す
unsetopt promptcr

# 環境変数をプロンプトに展開する
setopt prompt_subst

##
####### プロンプト関係設定 end ########


# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
#setopt auto_cd

# cdの後に自動的にls
#function chpwd() { ls }

# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt auto_resume

# ビープ音を鳴らさないようにする
setopt NO_beep

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# コマンドのスペルチェックをする
setopt correct

# =command を command のパス名に展開する
setopt equals

# ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control

# シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
setopt NO_hup

# Ctrl+D では終了しないようになる（exit, logout などを使う）
#setopt ignore_eof

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios

# ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
setopt numeric_glob_sort

# for, repeat, select, if, function などで簡略文法が使えるようになる
setopt short_loops

#色を変える
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# 色を使う
setopt prompt_subst

# 文字列末尾に改行コードが無い場合でも表示する
unsetopt promptcr

#コピペの時rpromptを非表示する
setopt transient_rprompt

# cd -[tab] でpushd
setopt autopushd

# cd history
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
# cd and ls
# add-zsh-hook chpwd chpwd_recent_dirs

# switch ctrl+w to delete per word unit
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# VCS Info
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

# alias
alias addall='git add --all && git status'
git config --global alias.ci commit
git config --global alias.st status

RPROMPT="%v"
