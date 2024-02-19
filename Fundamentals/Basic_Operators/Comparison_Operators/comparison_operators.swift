// Comparison Operators
//
// Swift supports the following comparison operators:
// - Equal to (a == b)
// - Not equal to (a != b)
// - Greater than (a > b)
// - Less than (a < b)
// - Greater than or equal to (a >= b)
// - Less than or equal to (a <= b)
// 
// NOTE : Swift also provides two identity operators (=== and !==), which you use to test wheter
// two object references both refet to the same object instance. For more information, see
// Identity Operators.
//
// Each of the comparison operators returns a Bool value to indicate wheter or not the statement
// is true:

1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 isn't equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 isn't less than or equal to 1

// Comparison operators are often used in conditional statements, such as the if statement:

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world"

// For more about the if statement, see Control Flow.
//
// You can compare two tuples if they have the same type and the same number of values. Tuples are
// compared from left to right, one value at a time, until the comparison finds two values that
// aren't equal. Those two values are compared, and the result of that comparison determines the
// overal result of the tuple comparison. If all elements are equal, then the tuple themselves are
// equal. For example.

(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and apple aren't compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

// In the example above, you can see the left-to-right comparison behavior on the first line.
// Because 1 is less than 2, (1, "zebra") is considered less then (2, "apple"), regardless of any
// other values in the tuples. It doesn't matter that "zebra" isn't less than "apple", because
// the comparison is already determinded by the tuples'first elements. However, when the 
// tuples'first elements are the same, their second elements are compared - this is what happens
// on the second and third line.
//
// Tuples can be compared with a given operator only if the operator can be applied to each value
// in the respective tuples. For example, as demonstrated in the code below, you can compare two
// tuples of type (String, Int) because both String and Int values can be compared using the <
// operator. In contrast, two tuples of type (String, Bool) can't be compared with the < operator
// because the < operator can't be applied to Bool values.

("blue", -1) < ("purple", 1)             // OK, evaluates to true
("blue", false) < ("purple", true)       // Error because < can't compare Boolean values

// NOTE : The Swift standard library includes tuple comparison operators for tuples with fewer than
// seven elements. To compare tuples with seven or more elements, you must implement the comparison
// operators yourself.