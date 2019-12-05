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

grep sudo /var/log/auth.log | awk -F';' '{print($3 "\t" $4)}' | awk -F' ' '{print $1 "\t" $2}' | sed -r '/^\s*$/d' |  awk  '{arr[$1 "\t" $2]++; count++;} END {for (i in arr){ if (counter < arr[i]) {counter = arr[i] }   } ;} END {for (i in arr){ if (counter == arr[i]) {user = i }   } ;} END  {print(user "\t" counter) } END {print("\t" "List of all the users, the commands used and the number of times the commands were used") } END { for (i in arr) print  "(", i, ") => ", arr[i]; }'
