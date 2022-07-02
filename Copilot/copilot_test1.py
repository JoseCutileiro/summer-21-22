# This is a test of the github copilot tool
# Copilot helping @JoseCutileiro

import random

# Make a bubble sort
def bubble_sort(list):
    for i in range(len(list)):
        for j in range(len(list)-1):
            if list[j] > list[j+1]:
                list[j], list[j+1] = list[j+1], list[j]
    return list

# insertion sort
def insertion_sort(list):
    for i in range(1, len(list)):
        j = i
        while j > 0 and list[j] < list[j-1]:
            list[j], list[j-1] = list[j-1], list[j]
            j -= 1
    return list

# A list of numbers between 1 and 100

list = [random.randint(1, 100) for i in range(100)]

# print the unsorted list
def print_list(list):
    print(list)
    
# print the sorted list using | to separate the numbers
def using_pipe(list):
    print("|".join(str(i) for i in list))

print("Unsorted list:")
using_pipe(list)

insertion_sort(list)

print("Sorted list:")
using_pipe(list)
