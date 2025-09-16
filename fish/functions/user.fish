function mkcd
    mkdir $argv
    cd $argv
end

function fattach -d "Fuzzy-find and attach to tmux session"
    tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}'a | fzf | read -l result
    tmux attach -t $result
end

function fbranch -d "Fuzzy-find and checkout a local git branch"
    git branch | grep -v HEAD | string trim | fzf | read -l result
    git checkout "$result"
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

function trackpad -d "Connect and disconnect Apple Magic Trackpad"
    set TRACKPAD_MAC 3c-a6-f6-b9-7e-2d

    if test (count $argv) -eq 0
        echo "Usage: trackpad --connect | --disconnect"
        return 1
    end

    switch $argv[1]
        case --connect
            echo "Connecting to Magic Trackpad ($TRACKPAD_MAC)..."
            blueutil --connect $TRACKPAD_MAC
        case --disconnect
            echo "Disconnecting Magic Trackpad ($TRACKPAD_MAC)..."
            blueutil --disconnect $TRACKPAD_MAC
        case '*'
            echo "Unknown option: $argv[1]"
            echo "Usage: trackpad --connect | --disconnect"
            return 1
    end
end
