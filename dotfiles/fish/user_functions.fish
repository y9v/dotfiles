function mkcd
  mkdir $argv
  cd $argv
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

function fcluster
  set -l cluster (ibmcloud cs clusters -s | awk '{print $1}' | fzf)

  if [ $cluster ]
    set -l exportstr (ibmcloud cs cluster-config $cluster | grep export)

    eval $exportstr
    kubectl cluster-info
  end
end

function fpod
  kubectl get pods | fzf | awk '{print $1}'
end
