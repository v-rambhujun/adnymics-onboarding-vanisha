# Exercise 2 
# Find where the file abc.py is located on your file system
locate -b '\abc.py'

# Exercise 3
# Create a file that contains a count from 1 to 1000000 (one number per line), and print then number of lines the files contains
seq -w  1 1000000 > number.txt && wc -l < number.txt

# Exercise 4
# Same file as in Exercise 3, but in revers order 1000000 to 1
for i in {1000000..1}; do echo $i; done > number.txt && wc -l < number.txt

# Exercise 5
# Print the second to last directory from PATH environment variable
echo $PATH | awk -F: '{print $(NF-2)}'

# Exercise 6
#