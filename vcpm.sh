#!/bin/sh
# version control package manager v0.0

# check where we can put the repos file- ideally in .config but just $HOME will work

# --------------
#  Functions
# --------------
read_config(){
    filename="undef"
    if [ -e "$HOME/.config/" ]; then 
        filename="$HOME/.config/.vcpm_repos"
    else 
        filename="$HOME/.vcpm_repos"
    fi

    repos
    if [ -e "$filename" ]; then 
        return "$(cat "$filename")"
    else 
        printf "It doesn't seem like you have a list of repos in '%s'. A template will be created for you in this location- please fill it out with the repos you want cloned." "$filename"
        printf "\n\n# https://gitlab.com/exampleauthor/examplerepo\n# https://github.com/exampleauthor/examplerepo.git\n# git://cool.exampleserver.local/exampleauthor/examplerepo\n# ssh://cringe.exampleserver.local:6969/exampleauthor/examplerepo" > $filename
    fi
}


# --------------
#  Main
# --------------
