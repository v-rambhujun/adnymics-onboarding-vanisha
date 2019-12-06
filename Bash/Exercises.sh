#####################################################################
# Exercise 2 
# Find where the file abc.py is located on your file system
locate -b '\abc.py'

#####################################################################
# Exercise 3
# Create a file that contains a count from 1 to 1000000 (one number 
# per line), and print then number of lines the files contains
seq -w  1 1000000 > number.txt && wc -l < number.txt

#####################################################################
# Exercise 4
# Same file as in Exercise 3, but in revers order 1000000 to 1
seq -w  100 -1 1 > rebmun.txt && wc -l < rebmun.txt
# or

# However here, the output is a string
for i in {1000000..1}; do echo $i; done > rebmun.txt && wc -l < rebmun.txt

#####################################################################
# Exercise 5
# Print the second to last directory from PATH environment variable
echo $PATH | awk -F: '{print $(NF-2)}'

#####################################################################
# Exercise 6
# Use file created in Exercise 3 and count how many numbers can be 
# divided by 777 without remainder
cat number.txt | awk -F" " '{if ($1 % 777 ==0) {counter+=1}} END {print counter}'

#####################################################################
# Exercise 7
# Print the most command that is used with "sudo" from each user from 
# log file: /var/log/auth.log. input

grep sudo /var/log/auth.log | awk -F';' '{print($3 "\t" $4)}' | awk -F' ' '{print $1 "\t" $2}' | sed -r '/^\s*$/d' |  awk  '{arr[$1 "\t" $2]++; count++;} END {for (i in arr){ if (counter < arr[i]) {counter = arr[i] }   } ;} END {for (i in arr){ if (counter == arr[i]) {user = i }   } ;} END  {print(user "\t" counter) }'

#####################################################################
# Exercise 8
# Extract temperature value from http://weather.gc.ca/rss/city/on-118_e.xml 
curl https://weather.gc.ca/rss/city/on-118_e.xml | grep "<title>" | awk -F">" '{print $2}' | awk -F "<" '{print $1}' | awk -F":" '{if ($1 == "Current Conditions"){temp = $2 }} END {print(temp)}' | awk -F'#' '{print($1)}' |grep -Eo '[+-]?[0-9]+([.][0-9]+)?' $1 

#####################################################################
# Exercise 9
# Histogram
curl https://poloniex.com/chartData/USDT_BTC-1800.json | jq -r '.[] | (.date | tostring) + "\t " + (.quoteVolume | tostring)' | awk '{ print strftime("%k",$1)"\t" $2 }' | awk '{arr[$1]+=$2;} END { for (i in arr) print i, arr[i]/10000}' |  awk '{$2=sprintf("%-*s", $2, ""); gsub(" ", "#", $2); printf("%-10s%s\n", $1, $2 )}'


# Doesn't work with volume
curl https://poloniex.com/chartData/USDT_BTC-1800.json | jq -r '.[] | (.date | tostring) + "\t " + (.quoteVolume | tostring)' | awk '{ print strftime("%k",$1)"\t" $2 }' |  awk '{arr[$1]+=$2; count[$1]+=1;} END { for (i in arr) print i, arr[i]/count[i] }' | awk '{$2=sprintf("%-*s", $2, ""); gsub(" ", "#", $2); printf("%-10s%s\n", $1, $2 )}'