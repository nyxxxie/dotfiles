#!/bin/bash
#
# This script adds hosts to your ~/.ssh/config.  Useful for quickly setting up
# a new config on a new machine, or just quickly adding new hosts.
#
#
#

print_et_help() {
    echo "Machine entry"
    echo "  Standard ssh entry.  Use this for remote machines you intend"
    echo "  to ssh into."
    echo ""
    echo ""
    echo "Git User entry"
    echo "  Entry to use with git.  Useful if you have multiple ssh keys you"
    echo "  want to use for different repos.  For example, you might have two"
    echo "  github users you maintain, each having their own ssh key.  You'd"
    echo "  use them like this:"
    echo "    git clone <entry_name>:<repo>.git"
    echo ""
    echo "  EX (let Connection Name be 'github.com-nyxxie'):"
    echo "    git clone github.com-nyxxie:nyxxie/butt.git"
}

add_entry_machine() {

    # Prompt for input
    printf "Hostname/IP: "
    read entry_hostname
    printf "Port (default=22): "
    read entry_port
    printf "Username (empty for none): "
    read entry_username
    printf "X Forward? (y/n): "
    read entry_xforward
    printf "Connection Name: "
    read entry_name
    echo "" >> ~/.ssh/config

    # Add entry to ssh config
    echo "Host $entry_name" >> ~/.ssh/config
    echo "    HostName $entry_hostname" >> ~/.ssh/config
    if [ "$entry_username" != "" ]; then
        echo "    User $entry_username" >> ~/.ssh/config
    fi
    if ["$entry_port" == ""]; then
        entry_port="22"
    fi
    echo "    Port $entry_port" >> ~/.ssh/config
    if [ "$entry_xforward" == "y" ]; then
        echo "    XForwarding yes" >> ~/.ssh/config
    fi

    echo "Added new entry."
}

add_entry_gituser() {

    # Prompt for input
    printf "Hostname/IP: "
    read entry_hostname
    printf "Port (default=22): "
    read entry_port
    printf "Connection Name: "
    read entry_name
    printf "SSH Key Path: "
    read entry_sshkey

    # Add entry to ssh config
    echo "Host $entry_name" >> ~/.ssh/config
    echo "    HostName $entry_hostname" >> ~/.ssh/config
    echo "    User git" >> ~/.ssh/config
    echo "    Port $entry_port" >> ~/.ssh/config
    echo "    IdentityFile $entry_sshkey" >> ~/.ssh/config
    echo "    IdentitiesOnly" >> ~/.ssh/config
    echo "" >> ~/.ssh/config

    echo "Added new entry."
}

print_opt_help() {
    echo "1.) About entry types"
    echo "2.) Add new Machine entry"
    echo "3.) Add new Git User entry"
    echo "4.) Quit"
}

# Cr
if [ ! -f "$HOME/.ssh/config" ]; then
    touch "$HOME/.ssh/config"
    chmod 600 "$HOME/.ssh/config"
    echo "ssh config doesn't exist, creating it now."
fi

# Display banner text
echo "Welcome to Nyx's ssh config host adding tool thing."
echo "Type '?' for options."

# Main command loop
while true; do

    # Prompt for option
    printf "\n> "
    read entry_type

    # Run the cooresponding option handler
    case "$entry_type" in
        "1" )
            print_et_help;;
        "2" )
            add_entry_machine;;
        "3" )
            add_entry_gituser;;
        "4" | "q" | "\x04" )
            exit;;
        "?" )
            print_opt_help;;
        * )
            echo "Invalid option, type '?' for help.";;
    esac

done
