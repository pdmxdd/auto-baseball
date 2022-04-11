curl -s 'https://statsapi.mlb.com/api/v1/standings?sportId=1&leagueId=103,104' > standings.json

cat standings.json | jq .records[].teamRecords[] | jq '.team.name, .leagueRecord.wins, .leagueRecord.losses' > standings.txt

rm standings.json

sed 'N;N;s/\n/,/g' standings.txt | sed 's/"//g' > standings.csv

rm standings.txt
