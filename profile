# Note: I am using the CaskaydiaCove Nerd Font with a regular typeface (https://www.nerdfonts.com/font-downloads).

echo "Good day! Here's a quote:"
fortune

prog() {
	cd ~/Desktop/programming/$1
}

down() {
	git fetch
	git pull
}

update() {
	printf "Enter a commit: "
	read msg
	git add .
	git commit -m "$msg"
}

up() {
	update
	git push
}

search() {
	dir=$1
	if [ "$dir" = "" ]; then
		echo "Please enter a directory."
	else
		regex=${@:2}
		# TODO: make it case-insensitive
		rg "$regex" $dir/*
		# grep -rni "$regex" $dir/*
	fi
}

replace_all() {
	replacement_directory=$1
	to_substitute=$2
	the_substituter=$3

	# Checking for if an uncommon directory was inputted
	if [[ "$replacement_directory" != "src" ]] && [[ $replacement_directory != "." ]]; then
		echo -n "Are you sure you want to replace a text snippet for all files in '$replacement_directory/'? y/n: "
		read msg
		if [ "$msg" = "y" ]; then
			echo "Continuing with substitution."
		elif [ "$msg" = "n" ]; then
			echo "Aborting subtitution."
			return
		else
			echo "Unrecognized input."
			return
		fi
	fi

	if [ "$to_substitute" = "" ]; then
		echo "The text snippet to substitute is empty."
		return
	elif [ "$the_substituter" = "" ]; then 
		echo "The text snippet that acts as the substituter is empty."
		return
	fi

	# https://stackoverflow.com/questions/1585170/how-to-find-and-replace-all-occurrences-of-a-string-recursively-in-a-directory-t
	grep -rl "$to_substitute" $replacement_directory | LC_ALL=C xargs sed -i "" "s/$to_substitute/$the_substituter/g"
}

t() {
	filename=$1

	if [[ $filename == "" ]]; then
		echo "No filename!"
		exit 1
	fi

	tsc $filename.ts
	node $filename.js
}

# = neovim config
vc() {
  orig_dir="$PWD"
  cd ~/.config/nvim/lua
  nvim custom/chadrc.lua
  cd $orig_dir
}

venv() {
  venv_name="$1"
  venv_dir=~/.virtualenvs/$venv_name

  if [[ "$venv_name" = "" ]]; then
    echo "Please specify a venv."
  elif [[ ! -d "$venv_dir" ]]; then
    echo "The venv with name '$venv_name' doesn't exist! These are available:"
    ls ~/.virtualenvs
  else
    source "$venv_dir/bin/activate"
  fi
}

alias :q=exit
alias cl="clear && printf '\e[3J'"

# Linux-specific:
# alias open=xdg-open
# alias reload="source ~/.bashrc"

# MacOS-specific:
alias reload="source ~/.zshrc"

alias l=cl
alias s=ls
alias sl=ls
alias la=ls
alias ake=make
alias mke=make
alias ma=make

alias it=git
alias gi=git
alias gti=git

alias p=python3
alias r="cl; make"

alias dnd="prog dungeon_dave"
alias dr="cl; ./build.sh release run"
