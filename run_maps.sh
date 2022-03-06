

for file in $(ls /data/tweets_corona/); 
do ./src/map.py --input_path=/data/tweets_corona/$file;
done

./src/reduce.py --input_paths outputs/geoTwitter*.lang --output_path=reduced.lang
./src/reduce.py --input_paths outputs/geoTwitter*.country --output_path=reduced.country

var="'#코로나바이러스' '#コロナウイルス' '#冠状病毒' '#covid2019' '#covid-2019' '#covid19' '#covid-19' '#coronavirus' '#corona' '#virus' '#flu' '#sick' '#cough' '#sneeze' '#hospital'  '#nurse'  '#doctor'"
for h in $var;
do ./src/visualize.py --input_path=reduced.lang --key=$h | head > viz/$h;
done
