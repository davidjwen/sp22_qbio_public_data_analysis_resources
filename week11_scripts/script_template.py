import numpy as np  # we don't actually do anything with numpy here

def reverseString(str):
    return str[::-1]

def reverseStringBuggy(str):
    rev = ""
    for i in range(len(str)):
        rev += str[len(str) - i]
    return rev

def main():
    my_string = "Hello, world!"
    my_string = reverseString(my_string)
    # my_string = reverseStringBuggy(my_string)
    print(my_string)

if __name__ == "__main__":
    main()