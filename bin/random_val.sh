if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <number>"
    exit 1
fi

echo "$(cat /dev/urandom | tr -dc 'a-fA-F0-9' | fold -w $1 | head -n 1)"
