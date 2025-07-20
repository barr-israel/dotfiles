if status is-interactive
    set FZF_CTRL_T_COMMAND fd
    set FZF_ALT_C_COMMAND 'fd --type d'
    export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
    export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
    batman --export-env | source
    alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
    alias dotfilesu='dotfiles diff --name-only && dotfiles pull && dotfiles add -u && dotfiles commit -m "dotfiles update" && dotfiles push'
    alias clear='clear && fastfetch --load-config paleofetch'
    alias cat='bat'
    alias grep='rg'
    alias find='fd'
    alias n='nvim'
    alias yayu='yay --noconfirm'
    alias ls='eza -lh --icons'
    alias yayfile='yay -F'
    alias btop='btop --force-utf'
    alias icat='kitten icat'
    alias ssh='kitten ssh'
    alias tree='eza --icons -T'
    alias diff='delta --side-by-side --line-numbers'
    export editor='nvim'
    fzf_key_bindings
end
#function fish_right_prompt
#    set_color -r blue
#    set -l S (math "$CMD_DURATION/1000")
#    set -l M (math "floor($S/60)")
#    set -l H (math "floor($M/60)")
#    if test $H -gt 0
#        echo -n -s $H h $(math $M % 60) m $(math "floor($S) % 60") s
#    else if test $M -gt 0
#        echo -n -s $M m $(math "floor($S) % 60") s
#    else if test $S -gt 1
#        echo -n -s $S s
#    else
#        echo -n -s $CMD_DURATION ms
#    end
#    echo -n " ~ " (date +%H:%M:%S)
#    set_color normal
#end
set EDITOR nvim
