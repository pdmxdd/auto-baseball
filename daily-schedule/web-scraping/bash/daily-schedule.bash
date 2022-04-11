# curl -s https://www.baseball-reference.com/  | grep -zo "<h3>Today's Games.*<h3>" | sed 's/(S)//g' | sed 's/<\/*[^>]*>//g' | sed '/^[[:space:]]*$/d' | awk '{$1=$1;print}' | sed -e '2,${N;N;N;s/\n/ /g}' > bb-ref.schedule

curl -s https://www.baseball-reference.com/  | grep -zo "<h3>Today's Games[^,]\+,[^,]\+," | sed 's/(S)//g' | sed 's/<\/*[^>]*>//g' | sed '/^[[:space:]]*$/d' | awk '{$1=$1;print}' | sed -e '2,${N;N;N;s/\n/ /g}' | sed 's/^[A-Za-z]\+,//' | sed '/^[[:space:]]*$/d' > bb-ref.schedule

