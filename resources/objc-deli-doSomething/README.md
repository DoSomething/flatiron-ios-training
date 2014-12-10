---
  tags: methods, arrays, iteration
  languages: objc
---

# Deli Counter - Take a Number

## Instructions

A pretty important deli needs somebody to program the "Take a Number" feature for their counter.

At the beginning of the day, the deli is empty and is represented by an empty array.

Example: 


Write all of your code in `FISAppDelegate.m`.  All method signatures should be added to 'FISAppDelegate.h'.

1. Build a method that a new customer will use when entering the deli. The method, `takeANumberWithDeli:Name:`, should accept the new person's name, the current line in `NSMutableArray` format, and return the updated line. Also, the method should `NSLog` their position in line. And don't go being too programmer-y and give them their index. These are normal people. If they are 7th in line, tell them that. Don't get their hopes up by telling them they are number 6 in line.

2. Build a method `nowServingWithDeli:`. This method also should take a `NSMutableArray` deliLine as an argument. This method should return the updated `NSMutableArray` deli Line and `NSLog` the name of the next person in line after removing them from the line. If there is nobody in line, it should `NSLog` that "There is nobody waiting to be served!" and return an empty `NSMutableArray`

3. Build a method `lineWithDeli:` that returns people their current place in line (returned as an NSString). If there is nobody in line, it should return "The line is currently empty."
