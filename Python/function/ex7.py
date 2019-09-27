## 7. Write a Python function that accepts a string and calculate the number of upper case letters and lower case letters.

def string_test(s):
    upper = 0
    lower = 0
    for c in s:
        if c.isupper():
           upper+=1
        elif c.islower():
           lower+=1
        else:
           pass
    print ("Original String : ", s)
    print ("No. of Upper case characters : ", upper)
    print ("No. of Lower case Characters : ", lower)
