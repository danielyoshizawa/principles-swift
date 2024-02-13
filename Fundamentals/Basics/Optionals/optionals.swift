// Optionals
//
// You use optionals in situations where a value may be absent. An optional represents two 
// possibilities: Either there is a value of a specified type, and you can unwrap the optional to
// access that value, or there isn't a value at all.
//
// As an example of a value that might be missing, Swift's Int type has an initializer that tries
// to convert a String value into an Int value. However, only some strings can be converted into
// integers. The string "123" can be converted into the numeric value 123, but the string "hello,
// world" doesn't have a corresponding numeric value. The example below uses the initializer to try
// to convert a String into an Int:

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// The type of convertedNumber is "optional Int"

// Because the initializer in the code above might fail, it returns an optional Int, rather than an Int
//
// To write an optional type, you write a question mark (?) after the name of the type that the optional
// contains - for exmple, the type of an optional Int is Int?. An optional Int always contains either
// some Int value or no value at all. It can't contain anything else, like a Bool or String value.
//
// nil
//
// You set an optional variable to a valueless state by assigning it the special value nil:

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResonseCode = nil
// serverResponseCode now contains no value

// If you define an optional variable without providing a default value, the variable is automatically
// set to nil:

var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// You can use an if statement to find out wheter an optional contains a value by comparing the
// optional against nil. You perform this comparison with the "equal to" operator (==) or the
// "not equal to" operator (!=).
//
// If n optional has a value, it's considered as "not equal to" nil:

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."

// You can't use nil with non-optional constants or variables. If a  constant or variable in 
// your code needs to work with the absence of a value under certain conditions, declare it as an
// optional value of the appropriate type. A constant or variable that's declared as a non-optional
// value is guaranteed to never contain a nil value. If you try to assign nil to a non-optional value,
// you'll get a compile-time error.
//
// This separation of optional and non-optional values lets you explicitly mark what information
// can be missing, and makes it easier to write code that handle missing values. You can't accidentally
// treat an optional as if it were non-optional because this mistake produces an error at compile time.
// After you unwrap the value, none of the other code that works with that value needs to check for nil,
// so there's no need to repeatedly check the same value in different parts of your code.
//
// When you access an optional value, your code always handles both the nil and non-nil case.
// There are several things you can do when a value is missing, as described in the following sections:
//
// - Skip the code that operates on the value when it's nil.
// - Propagae the nil value, by returning nil or using the?. operator described in Optional Chaining
// - Provide a fallback value, using ?? operator.
// - Stop program esecution, using the ! operator.
//
// NOTE : In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil isn't a pointer -
// it's the absence of a value of a certain type. Optionals of any type can be set to nil, not
// just object types.
//
// Optional Binding
//
// You use optional binding to find out whether an optional contains a value, and if so, to make that
// value avialable as a temporary constant or variable. Optional binding can be used with if, guard,
// and while statements to check for a value inside an optional, and to extract that value into a 
// constant or variable, ar part of a single action. For more information about if, guard, and while
// statements, see Control Flow.
//
// Write an optional binding for an if statement as follows:

if let <#constantName#> = <#someOptional#> {
    <#statement#>
}

// You can rewrite the possibleNumber example from the Optionals section to use optional binding
// rather than forced unwrapping:

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

// This code can be read as:
//
// "If the optional Int returned by Int(possibleNumber) contains a value, set a new constant called
// actualNumber to the value contained in the optional."
//
// If the conversion is successful, the actualNumber constant becomes available for use within the
// first branch of the if statement. It has already been initialized with the value container within
// the optional, and has the corresponding non-optional type. In this case, the type of possibleNumber
// is Int?, so the type of actualNumber is Int.
//
// If you don't need to refer to the original, optional constant or variable after accessing the value
// it contains, you can use the same name for the new constant or variable:

let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// Prints "My number is 123"

// This code starts by checking whether myNumber contains a value, just like the code in the previous
// example. If myNumber has a value, the calue of a new constant named myNumber is set to that value.
// Inside the body of the if statement, writing myNumber refers to that new non-optional constant.
// Writing myNumber before or after the if statement refers to the original optional integer constant.
//
// Because this kind of code is so common, you can use a shorter spelling to unwrap an optional value:
// Write just the name of the constant or variable that you're unwrapping. The new, unwrapped constant
// or variable implicitly uses the same name as the optional value.

if let myNumber {
    print("My number is \(myNumber)")
}
// Prints "My number is 123"

// You can use both constants and variables with optional binding. If you wanted to manipulate the
// value of myNumber within the first branch of the if statement, you could write if var myNumber
// insted, and the value contained within the optional would be made available as a variable rather
// than a constant. Changes you make to myNumber inside the body of the if statement apply only to
// that local variable, not to the original, optional constant or variable that you unwrapped.
//
// You can include as many optional bindings and Boolean conditions in a single if statement as you
// need to, separated by commas. If any of the values in the optional binding are nil or any Boolean
// condition evaluates to false, the whole if statement condition is considered to be false. The
// following if statements are equivalent:

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber 
    && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"

// Constants and variables created with optional binding in an if statement are available only within
// the body of the if statement. In contrast, the constants and variables created with a guard statement
// are available in the lines of code that follows the guard statement, as described in Early Exit.
//
// Providing a Fallback Value
//
// Another way to handle a missing value is to supply a default value using the nil-coalescing
// operator (??). If the optional on the left of the ?? isn't nil, that value is unwrapped and used.
// Otherwise, the value on the right of ?? is used. For example, the code below greets someone by
// name if one is specified, and uses a generic greeting when the name is nil.

let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)
// Prints "Hello, friend!"

// For more information about using ?? to provide a fallback value, see Nil-Coalescing Operator.
//
// Force Unwrapping
//
// When nil represents an unrecoverable failure, such a programmer error or corrupted state, you can
// access the underlying value by adding an exclamation mark (!) to the end of the optional's name.
// This is known as force unwrapping the optional's value. When you force unwrap a non-nil value,
// the result is its unwrapped value. Force unwrapping a nil value triggers a runtime error.
//
// The ! is, effectively, a shorter spelling of fatalError(_:file:line:). For example, the code
// below shows two equivalent approaches:

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

let number = convertedNumber!

guard let number = convertedNumber else {
    fatalError("The number was invalid")
}

// Both versions of the code above depend on convertedNumber always containing a value. Writting that
// requirement as part of the code, using either of the approaches above, lets your code check that
// the requirement is true at runtime.
//
// For more information about enforcing data requirements and checking assumptions at runtime, see
// Aseertions and Preconditions.
//
// Implicitly Unwrapped Optionals
//
// As described above, optionals indicate that a constant or variable is allowed to have "no value".
// Optionals can be checked with an if statement to see if a value exists, and can be conditionally
// unwrapped with optional binding to access the optional's value if it does exist.
//
// Sometimes it's clear from a program's structure that an optional will always have a value, after
// that value is first set. In these cases, it's useful to remove the need to check an unwrap the
// optional's value every time it's accessed, because it can be safely assumed to have a value all
// of the time.
//
// These kinds of optionals are defined as implicitly unwrapped optionals. You write an implicitly
// unwrapped optional by placing an exclamation point (String!) rather than a question mark (String?)
// after the type that you want to make optional. Rather than placing an exclamation point after the
// optional's name when you use it, you place an exclamation point after the optional's type when
// you declare it.
//
// Implicitly unwrapped optionals are useful when an optional's value is confirmed to exist immediately
// after the optional is first defined and can definitely be assumed to exist at every point thereafter.
// The primary use of implicitly unwrapped optionals in Swift is during class initialization, as
// described in Unowened References and Implicitle Unwrapped Optional Properties.
//
// Don't use an implicitly unwrapped optional when there's a possibility of a variable becomming nil
// at a later point. Always use a normal optional type if you need to check for a nil value during
// the lifetime of a variable.
//
// An implicitly unwrapped optional is a normal optional behind the scenes, but can also be used like
// a non-optional value, without the need to unwrap the optional value each time it's accessed. The
// following example shows the difference in behavior between an optional string and an implicitly
// optional string when accessing their wrapped value as an explicit String:

let possibleSting: String? = "An optional string."
let forcedString: String = possibleString! // Requires explicit unwrapping

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

// You can think of an implicitly unwrapped optionla as giving permission for the optional to be
// forced-unwrapped if needed. When you use an implicitly unwrapped optional value, Swift first
// tries to use it as an ordinary optional value; if it can't be used as an optional, Swift 
// force-unwrappes the value. In the code above, the optional value assumedString is force-unwrapped
// before assigning its value to implicitString because implicitString has an explicit, non-optional
// type of String. In code below, optionalString doesn't have an explicit type so it's an ordinary
// optional.

let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.

// If an implicitly unwrapped optional is nil and you try to access its wrapped value, you'll trigger
// a runtime error. The result is exactly the same as if you write an exclamation point to force
// unwrap a normal optional that doesn't contain a value.
//
// You can check whether an implicitly unwrapped optional is nil the same way you check a normal optional:

if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicitly unwrapped optional string."

// You can also use an implicitly unwrapped optional with optional binding, to check and unwrap its
// value in a single statement:

if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."