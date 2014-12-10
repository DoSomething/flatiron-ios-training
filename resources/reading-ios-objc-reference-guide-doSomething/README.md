#
#Objective-C Reference Guide

###Table of Contents
* [Data Types](#Data-Types)
* [Declaring Variables](#Declaring-Variables)
* [Operators](#Operators)
* [NSString](#NSString)
* [NSArray](#NSArray)
* [NSDictionary](#NSDictionary)
* [Class Structure](#Class-Structure)
* [Properties](#Properties)
* [Methods](#Methods)
* [Initializers](#Initializers)
* [Predicates](#Predicates) 
* [Sort Descriptors](#Sort-Descriptors) 
* [Singleton](#Singleton)

----------

##Data Types 
######[Back to Top](#)
- **int, NSInteger**
  - Integers; 1, 5, 500, 1000
  - `int` is typically used as a control loop variable, i.e. `for (int count = 0; count < [array length]; count++)`
	- `NSInteger` will determine the size of the variable based on processor architecture so you don't have to. As this maintains data integrity when passing a value as an argument to or a return value from a function, use of NSInteger outside of control loop variables is encouraged.
- **float, double, CGFloat**
	- Rational Numbers; 1.2, 3.14, 33.3333
	- A double has 2x the precision of a float. Float is 32-bit while double is 64-bit
	- `CGFloat` will determine the size of the variable based on processor architecture so you don't have to. It is the rational number version of `NSInteger`
- **BOOL**
	- `YES` or `NO`, 1 or 0
	- `nil` == 0 == `NO`
	- Logging:
		- `NSLog(@"isReadyBool value is %d", isReadyBool); //prints 0 or 1`
		- `NSLog(@"isReadtBool value is %@", isReadyBool ? @"True" : @"False"); //prints True or False`
- **id**
  - The id type is a generic type for any Objective-C object, similar to C's void pointer. Because the id type stores a *reference* to any type of object, it automatically implies that the variable is a pointer and so the `*` is not necessary.
  - `id car = [[FISCar alloc] init];`

##Declaring Variables
######[Back to Top](#)

- Variables let us store values for future use. We can declare a variable by
  stating its type followed by a its name:

	```objc
	int count;
	```

- And we can subsequently set the variable's value, or we can accomplish this
all in one line.

	```objc
	count = 3;
	BOOL counting = YES;
	```

- **Ampersands (&) and Stars (*)** 
  - `&` is the **reference operator**. The reference operator gives us the
    memory "address of" a variable. This can be read as "address of".
	
		```objc
		int x = 5;
		NSLog(@"The memory address of variable x is: %p", &x);
		NSLog(@"The value of variable x is %d", x);

		```
  - `*` in the declaration of a pointer just means that the variable is a pointer. This will be seen with all objects in Objective-C, with the exception of the *id* type as being a pointer is implied.

##Operators
######[Back to Top](#)

Let's say `int x = 0;`:

- `x++; x--; //x = 1; x = -1`
  - this is equivalent to x is equal to x + 1 and  x is equal to x - 1
- `x += 5; x -= 5; x *= 5; x \= 5`
  - this is equivalent to x is equal to x plus/minus/times/divided by 5
- Ternary Operators: 
  - this is an if/else statement that we can write on one line. It should
    only be used if it increases code clarity/neatness.
  - `BOOL result = 3 > 2 ? YES : NO`

##NSString
######[Back to Top](#)

- Immutable strings (NSString) cannot be changed. Mutable strings (NSMutableString) can be changed.
  
    ```objc
    // creating strings
    NSString *string1 = @"Hi there!";
    NSString *string2 = @"My name is Chris.";

    // appending strings
    NSString *string3 = [string1 stringByAppendingString: string2]; // returns
    "Hi there! My name is Chris."

    // interpolation & formatting strings
    NSString *string4 = [NSString stringWithFormat:@"%@ I'm a bit lost. %@ Can you tell me where Room 1408 is?", string1, string2];

    // converting strings
    NSString *numberOfRoomsString = @"2000";
    NSInteger *numberOfRooms = [numberOfRoomsString integerValue];
    ```

- Logging
	
	```objc
	NSString *greeting = @"Good morning!";
	NSLog(@"In the morning, I typically say %@", greeting);
	```

##NSArray
######[Back to Top](#)

Objective-C arrays can only hold objects. To store primitive types, wrap them in object wrappers, like NSNumber for any kind of number.

  - Immutable

	```objc

	// creating a new array
	NSArray *numbersArray = @[@1,@2,@3]; // creates an array with NSNumbers [1,2,3]
	NSArray *moreNumbersArray = [NSArray arrayWithObjects:@4,@5,@6,nil]; // creates an array with NSNumbers [4,5,6]

	// getting the number of items in an array
	[numbersArray count]; 

	// getting an object from an array
	numbersArray[0]; // gets the object at index 0 of the array
	[numbersArray objectAtIndex:2] // gets the object at index 2 of the array

	// check if object is in an array
	[numbersArray containsObject:@2]; // returns YES

	// get index of object in array, returns NSNotFound if the object is not present
	[numbersArray indexOfObject:@2]; // returns 1
	```

  - Mutable

	```objc
	// creating an empty mutable array
	NSMutableArray *roster = [[NSMutableArray alloc] init];

	// creating a mutable array from an NSArray
	NSMutableArray *mutableNumbers = [numbersArray mutableCopy];
	NSMutableArray *moreMutableNumbers = [[NSMutableArray alloc] initWithArray:moreNumbersArray];

	// adding objects
	[roster addObject: @"Chris"]; adds the object Chris to the empty roster array
	[roster addObjectsFromArray: @[@"Joe", @"Zach"]]; // adds Joe and Zach to the roster array
	[roster insertObjects:@"Al" atIndex:0]; // inserts Al at index 0 in the roster array

	// removing objects
	[roster removeObject:@"Al"]; // removes Al from the roster array
	[roster removeObjectAtIndex:1]; // removes the object at index 1 in the roster array
	[roster removeAllObjects]; // removes all objects from the roster array
	```

  - Bounds Checking - Bounds checking allows us to avoid errors that arise from accessing an index that is beyond the bounds (available indexes) of the array.

    ```objc
    NSUInteger desiredIndex = 3;
    NSArray *roster = @[@"Chris", @"Zach", @"Joe"];
    if (desiredIndex < [roster count]) {
        NSLog(@"%@", roster[desiredIndex]);
    }
    ```

	-  When an object is asked for at an index that does not exist, we get the following bad access error:

		```objc
		*** Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayI objectAtIndex:]: index 3 beyond bounds [0 .. 2]'
		```

  - Iteration

	```objc
  NSArray *roster = @[@"Chris", @"Zach", @"Joe"];

	// The standard for loop, where we access the object at each index manually
	for (NSUInteger x = 0; x < [roster count]; x++) {
			NSLog(@"%@", roster[x]);
	}

	// the for-in loop, where iterate over each item in the array and assign it to a temporary variable called person
	for (NSString *person in roster) {
			NSLog(@"%@", person);
	}
	```

##NSDictionary
######[Back to Top](#)

  - Keys & Values - Each key-value pair in a dictionary is called an entry, with one object that conforms to the `NSCopying` protocol serving as the key and any object serving as the value. Neither the key nor the value can be nil. You can represent nil as a value in a dictionary by using `NSNull`

  - Iteration

	```objc
	NSArray *playerNames = [playerTeams allKeys];
	for (NSString *name in playerNames) {
			NSLog(@"Player: %@ Team: %@", name, playerTeams[name]);
	}
	```


##Class Structure
######[Back to Top](#)

- **header**

	```objc
#import "AHeaderFile.h"
#import "AnotherHeaderFile.h"

	@interface ClassName : SuperClass

	// declare public properties
	// declare public methods

	@end
	```
- **implementation**

	```objc
#import "YourClassName.h"

	@interface ClassName ()

	// the private interface, or extension, is optional
	// declare private properties
	// declare private methods

	@end

	@implementation ClassName {

	// declare private instance variables 

	}

	// implement methods

	@end

	```

##Properties
######[Back to Top](#)

1. Behind the scenes, creating a property automatically defines a private instance variable: 
`type _propertyName;`
2. A property also automatically creates a getter and setter: 

	```objc
	- (type)propertyName;
	- (void)setPropertyName:(type)name;
	```

- To access the instance variable directly (typically during initialization or within the respective getter/setter), use `_propertyName`. To use the getter/setter, use `self.propertyName` (all other cases). 

- Declaring a property:

	```objc
	@property (attribute1, attribute2) type propertyName;
	```
- Attibute Guide:

	|attribute|description|
	|---------|:-----------:|
	|strong|strong adds a reference to keep object alive|
	|weak|the object can disappear, become nil|
	|assign|normal assign, no reference|
	|copy|makes a copy on assign|
	|nonatomic|makes not threadsafe, increase performance| 
	|readwrite|creates a getter & setter (default)|
	|readonly | creates just a getter|

- Dot Notation - Use dot notation only for properties of an object and computed properties of an object. An example of a computed property would be the `count` method on `NSArray`

##Methods
######[Back to Top](#)

- Declaring methods (publicly, in the header file)
	```obj
	- (returnType)methodNameWithParameterA:(parameterType)a parameterB:(parameterType)b;
	```

- Defining methods (in the implementation file, these will only be public if they are also declared in the header file)

	```objc
	- (returnType)methodNameWithParameterA:(parameterType)a parameterB:(parameterType)b {
		 // Do something with parameters a and b...
		 return returnValue; // the return statement only needs to exist if the return type is not void
	}
	```

- Calling methods

	```objc
	[anObject methodNameWithParameterA:a parameterB:b];
	[anObject methodNameWithNoParameters];
	```

- One thing to note:
	- The first thing we encounter is the return type of the method. If this is an object, it'll look something like `(NSString *)`; if it's a primitive type, there won't be a star or asterisk `(NSInteger)`, and if nothing is supposed to be returned, the return type should be `(void)` and there should be no return statement in the method body.

##Initializers
######[Back to Top](#)

- **default** - Here we override the default initializer and perform some setup before the
    object is completely initialized.

	```objc
	- (instancetype)init
	{
			self = [super init];
			if (self) {
					<#statements#>
			}
			return self;
	}
	```

- **designated** - Here we create a designated initializer that we will filter
  all other initializers through (including our default initializer).  

	```objc
	- (instancetype)initWithName:(NSString*)name andAddress:(NSString*)address
	{
			self = [super init];
			if (self) {
				_name = name;
				_address = address;
			}
			return self;
	}

	-(instancetype)init
	{
			return [self initWithName:@"" andAddress:@""]; // initialize an object with
			default empty strings for name and address
	}
	```

- **setters v instance variables** - When assigning values to properties in an
  initializer, the value should be assigned to the instance variable (_name,
  _address in this case) rather than through the setter (self.name,
  self.address) because "self" is not a fully formed object of the type you are
  trying to create at that point in
  the initialization.


##Predicates
######[Back to Top](#)

Please see the [Predicate Programming
Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html#//apple_ref/doc/uid/TP40001798-SW1)

##Sort Descriptors
######[Back to Top](#)

Please see [Sort Descriptor Programming Topics](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/SortDescriptors/SortDescriptors.html#//apple_ref/doc/uid/10000174-BCICJDHA)

##Singleton
######[Back to Top](#)

The singleton method allows for only one instance of a class to be created and
accessed. The singleton method below is thread-safe using GCD and
dispatch_once.

```objc
+ (instancetype)shared<#name#> {
    static <#class#> *_shared<#name#> = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared<#name#> = <#initializer#>;
    });
    
    return _shared<#name#>;
}
```
