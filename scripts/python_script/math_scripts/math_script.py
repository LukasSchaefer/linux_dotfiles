# This python script can be used for simple math operations just as addition (+),
# subtraction (-), multiplication (*), division (/) and modulo (%).
# First of all we import sys for sys.exit and operator for the
# calculations (easier because the term is given as a string)
import operator
import sys

print("Welcome to Lukas' math-script!")
print(
    "For a quick overview or in-detail description of all different options please type 'help' anytime.")

# This loop is intended to keep the program active until the input quit is
# recognized
while 1:

# Initialising two lists for all the numbers(nums) and all the
# operators(ops) while lastchar saves if the last read char was a number
# or operator
    nums = []
    ops = []
    lastchar = "ops"
    term = input("Please enter your calculation now: ")

# First of all there is the option to enter help as the input following in
# a short summary of the programs functionality
    if (term == "help"):
        print("Here is a list of all different options:")
        print("'help' to open this short overwiew'")
        print("'quit' to leave this math-script")
        print(
            "Inside calculations please use + for addition, - for subtraction, * for multiplication, / for division and % for modulo.")
        print(
            "Attention: This script is NOT able to calculate * and / before + and -!")

# The argument quit should be the only way to leave the program with the
# help of sys.exit
    elif (term == "quit"):
        print("You left the math-script.")
        sys.exit()

    elif (term == ""):
        print("No input found!")

    else:

        # In the beginning we add whitespaces between the operators to make the
        # split function afterwards possible
        term = term.replace("+", " + ")
        term = term.replace("-", " - ")
        term = term.replace("*", " * ")
        term = term.replace("/", " / ")
        term = term.replace("%", " % ")

        # Now we split the term into a list of all parts seperated by
        # whitespaces (which should be only between operators and numbers
        # because whitespaces between numbers would make the input
        # mathematically invalid)
        term = term.split()

        # Here we delete all the whitespaces again to make the calculation
        # afterwards possible in case of a mathematically valid term
        for counter in term:
            if (counter == " "):
                term.remove(counter)

        # Now we move through all the elements in the list term created by the split function which were seperated by whitespaces adding them to the list of operators or numbers depending on the lastcharacter (if the last char was a number then the next one has to be a operator and visa versa)
        # Furthermore we always check the input to actually be a number
        # (isdigit) or a valid operator (+, -, *, /, %)
        for s in term:
            if (lastchar == "ops"):
                if (s.isdigit() == True):
                    nums.append(s)
                    lastchar = "nums"
                else:
                    print("Number expected but", s, "found")

            elif (lastchar == "nums"):
                if (s == "+" or s == "-" or s == "*" or s == "/" or s == "%"):
                    ops.append(s)
                    lastchar = "ops"
                else:
                    print("Operator expected but", s, "found")

# Finally we check if the term ended with an operator which would make the
# term mathematically invalid
        if (lastchar == "ops"):
            print("Calculation can't end with an operator - invalid input!")

# Now we actually calculate the term if so far no errors occured with the
# help of the imported operator functionality (We check which operator is
# the next one and calculate it with the result so far)
        erg = nums[0]
        currentelement = 1
        while currentelement < len(nums):
            if (ops[currentelement - 1] == "+"):
                erg = operator.add(int(erg), int(nums[currentelement]))
            elif (ops[currentelement - 1] == "-"):
                erg = operator.sub(int(erg), int(nums[currentelement]))
            elif (ops[currentelement - 1] == "*"):
                erg = operator.mul(int(erg), int(nums[currentelement]))
            elif (ops[currentelement - 1] == "/"):
                erg = operator.truediv(int(erg), int(nums[currentelement]))
            elif (ops[currentelement - 1] == "%"):
                erg = operator.mod(int(erg), int(nums[currentelement]))
            currentelement = currentelement + 1

# In the end we print the result
        print ("= ", erg)
