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

function kubectlenv
  if set -l exportstr (ibmcloud cs cluster-config pricing-$argv | grep export)
    eval $exportstr
    echo "kubectl is configured for pricing-$argv"
  else
    echo (ibmcloud cs cluster-config pricing-$argv)
  end
end
