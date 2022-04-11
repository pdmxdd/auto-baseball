# curl -s 'https://statsapi.mlb.com/api/v1/schedule?sportid=1&date=2022-04-09' > today.schedule

d=$(date +%Y-%m-%d)

curl -s "https://statsapi.mlb.com/api/v1/schedule?sportId=1&date=$d" > today.schedule

cat today.schedule | jq '.dates[0].games[]' | jq '.status.detailedState, .teams.away.team.name, "(", .teams.away.leagueRecord.wins, "-", .teams.away.leagueRecord.losses, ")", "@", .teams.home.team.name, "(", .teams.home.leagueRecord.wins, "-", .teams.home.leagueRecord.losses, ")"' > daily.schedule.txt

sed 'N;N;N;N;N;N;N;N;N;N;N;N;N;s/\n/,/g' daily.schedule.txt | sed 's/"//g' | sed 's/(,\([0-9]*\),-,\([0-9]*\),)/(\1-\2)/g' > daily-schedule.csv

rm today.schedule
rm daily.schedule.txt
