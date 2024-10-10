function mkcd
  mkdir $argv
  cd $argv
end

function fattach -d "Fuzzy-find and attach to tmux session"
  tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}'a | fzf | read -l result; tmux attach -t $result
end

function fbranch -d "Fuzzy-find and checkout a local git branch"
  git branch | grep -v HEAD | string trim | fzf | read -l result; git checkout "$result"
end

function fcheckout -d "Fuzzy-find and checkout a remote git branch"
  git branch --remote | grep -v HEAD | string trim | fzf | read -l result; and git checkout -B (string replace origin/ '' $result) --track $result
end

function fhistory -d "Fuzzy-find history repeat"
  eval (history | fzf)
end

function fkill -d "Fuzzy-find and kill process"
  ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill
end

function desk -d "Control Ikea Idasen desk height"
  /Users/yury.lebedev/Library/Python/3.9/bin/idasen-controller --move-to $argv
end
