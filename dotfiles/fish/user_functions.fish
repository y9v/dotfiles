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

function fnvim -d "Fuzzy-find file and open in nvim"
  fzf | xargs nvim
end

function fpod -d "Fuzzy-find and get k8s pod id"
  kubectl get pods | fzf | awk '{print $1}'
end

function fingress -d "Fuzzy-find and get k8s ingres id"
  kubectl get ingresses | fzf | awk '{print $1}'
end

function fconfigmap -d "Fuzzy-find and edit k8s configmap id"
  kubectl get configmaps | fzf | awk '{print $1}'
end

function fsecret -d "Fuzzy-find and edit k8s secret id"
  kubectl get secrets | fzf | awk '{print $1}'
end

function fsealedsecret -d "Fuzzy-find and edit k8s sealed secret id"
  kubectl get sealedsecrets | fzf | awk '{print $1}'
end

function fdeployment -d "Fuzzy-find and get k8s deployment id"
  kubectl get deployments | fzf | awk '{print $1}'
end
