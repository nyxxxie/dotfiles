#!/bin/bash

echo "IT IS STRONGLY RECCOMENDED THAT YOU USE ACTUAL DICE TO SELECT THE WORDS"
echo "RANDOMLY.  This script cannot garuntee there is true randomn selection"
echo "of words.  This could affect the time it takes to crack your password."
echo ""
printf  "How many words in password? "
read n

num_words=$(wc -l < "diceware.wordlist.asc")

password=""
i=$n
while [ $i -gt 0 ]; do

    # Gen random number
    rand=$((($(od -vAn -N4 -tu4 < /dev/urandom) % num_words)))
    word=$(sed "${rand}q;d" diceware.wordlist.asc | awk '{print $2}')

    # Append word to overall password
    password="$word $password"

    # Count down
    i=$((i-1))
done

total_comb=$(echo "$num_words^$n" | bc -l)
time_avg=$(echo "(((($num_words^$n)/100000000)/60)/60)/24" | bc -l)
time_adv=$(echo "(((($num_words^$n)/30000000000)/60)/60)/24" | bc -l)
time_nsa=$(echo "(((($num_words^$n)/1000000000000)/60)/60)/24" | bc -l)
echo ""
echo "Total possible passwords: $total_comb"
echo "Time to guess all possible combinations:"
echo "  Average cracker (1b/s): $time_avg days"
echo "  25 GPU Cluster (300b/s): $time_adv days"
echo "  Snowden's NSA estimate (1t/s): $time_nsa days"
echo ""
echo "Your generated password: $password"

# Citations for guess capability:
# NSA capability is implied by snowden here: https://www.wired.com/2014/10/snowdens-first-emails-to-poitras/
