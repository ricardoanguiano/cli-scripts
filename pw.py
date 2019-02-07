#!/usr/bin/python3

import random

# Iterate over the lines in the file and put them in a list
word_list = []
with open("/usr/share/dict/american-english") as f:
    for line in f:
        # omit words with apostrophe
        if "'" in line:
            continue
        else:
            word_list.append(line.rstrip())

# Select 10 elements of the list at random        
random.seed()
for x in range(10):
    print(random.choice(word_list))
