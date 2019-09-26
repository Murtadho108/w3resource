## 4. Write a Python program to reverse a string.

def reverse_str(string):
  rev_str = ''
  index = len(string)
  while index > 0:
    rev_str += string[index -1]
    index = index - 1
  return rev_str
  
