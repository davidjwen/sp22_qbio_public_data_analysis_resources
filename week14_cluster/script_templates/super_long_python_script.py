#!/usr/bin/python3.9
# this basically says this is a python script
# that should be executed in python 3.9
# good practice but not required

import itertools

permutation_list = [i for i in range(12)]  # from 1 to 10
all_permutations = itertools.permutations(permutation_list)

f = open("all_permutations.txt", "w")

for i, p in enumerate(all_permutations):
    # write every ten thousandth permutation
    if i % 10000 == 0:
        f.write(str(p) + "\n")

f.close()
