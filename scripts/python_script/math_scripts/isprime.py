number = input()
if (int(number) == 1):
  result = False
else:
  result = True
  for i in range(2,int(number)):
    if (int(number) % i == 0):
      result = False
print(result)
