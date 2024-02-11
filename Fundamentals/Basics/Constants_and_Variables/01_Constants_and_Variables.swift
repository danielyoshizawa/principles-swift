// Constants and Variables
//
// Constants and variables associate a name (such as maximumNumberOfLoginAttempts or WelcomeMessage)
// with a value of a particular type (such as the number 10 or the string "Hello"). The value of a 
// constant can't be changed once it's set, whereas a variable can be set to a different value in the
// future.
//
// Declaring Constants and Variables
//
// Constants and variables must be declared before they're used. You declare constants with the let
// keyword and variables with the var keyword. Here's an example of how constants and variables can
// be used to track the number of login attempts a user has made:

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// This code can be read as:
// "Declare a new constant called maximumNumberOfLoginAttempts, and give it a value of 10. Then,
// declare a new variable called currentLoginAttempt, and give it an initial value of 0."
//
// In this example, the maximum number of allowed login attempts is declared as a constant, because
// the maximum value never changes. The current login attempt counter is decalred as a variable,
// because this value must be incremented after each failed login attempt.
//
// If a stored value in your code won't change, always declare it as a constant with the let keyword.
// Use variables only for storing values that change.
//
// When you declare a constant or a variable, you can give it a value as part of that declaration,
// like the examples above. Alternatively, you can assign its initial value later in the program,
// as long as it's guaranteed to have a value before the first time you read from it.

var enviroment = "development"
let maximumNumberOfLoginAttempts_ : Int
// maximumNumberOfLoginAttempts_ has no value yet.

if enviroment == "development" {
    maximumNumberOfLoginAttempts_ = 100
} else {
    maximumNumberOfLoginAttempts_ = 10
}
// Now maximumNumberOfLoginAttemps_ has a value, and can be read.

// In this example, the maximum number of login attempts is constant, and its value depends on the
// environment. In the development environment, it has a value of 100; in any other environment, its
// value is 10. Both branches of the if statement initialize maximumNumberOfLoginAttempts_ with some
// value, guaranteeing that the constant always gets a value. For information about how Swift checks
// your code when you set an initial value this way, see Constant Declaration.
//
// You can decalre multiple constants or multiple variables on a single line, separated by commas:

var x = 0.0, y = 0.0, z = 0.0

// Type Annotations
//
// You can provide a type annotation when you declare a constant or variable, to be clear about the 
// kind of values the constant or variable can store. Write a type annotation by placing a colon
// after the constant or variable name, followed by a space, followed by the name of the type to use.
//
// This example provides a type annotation for a variable called welcomeMessage, to indicate that the
// variable can store String values:

var welcomeMessage: String

// The colon in the declaration means "...of type...", so the code above can be read as:
//
// "Declare a variabel called welcomeMessage that's of type String."
//
// The phrase "of type String" means "can store any String value". Think of it as meaning "the type
// of thing" (or "the kind of thing") that can be stored.
//
// The welcomeMessage variable can now be set to any string value without error:

welcomeMessage = "Hello"

// You can define multiple related variables of the same type on a single line, separated by commas,
// with a single type annotation after the final variable name:

var red, green, blue : Double

// NOTE : It's rare that you need to write type annotations in practice. If you provide an initial
// value for a constant or variable at the point that it's defined, Swift can almost always infer
// the type to be used for that constant or variable, as described in Type Safety and Type Inference.
// In the welcomeMessage example above, no initial value is provided, and so the type of the 
// welcomeMessage variable is specified with a type annotation rather than being inferred from an
// initial value.
//
// Naming constants and Variables
//
// Constant and variables names can contain almost any character, including Unicode characters:

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// Constant and variable names can't contain whitespace characters, mathematical symbols, arrows,
// private-use Unicode scalar values, or line- and box-drawing characters. Nor can they begin with
// a number, although numbers may be included elsewhere within the name.
//
// Once you've declared a constant or variable of a certain type, you can't declare it again with
// the same name, or change it to store values of a different type. Nor can you change a constant
// into a variable or a variable into a constant.
//
// NOTE : If you need to give a constant or variable the same name as a reserved Swift keyword,
// surround the keyword with backticks (`) when using it as a name. However, avoid using keywords
// as names unless you have absolutely no choice.
//
// You can change the value of an existing variable to another value of a compatible type. In this
// example, the value of friendlyWelcome is changed from "Hello!" to "Bonjour!":

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"

// Unlike a variable, the value of a constant can't be changed after it's set. Attempting to do so
// is reported as an error when your code is compiled.

let languageName = "Swift"
// languageName = "Swift++" // This is a compile-time error : languageName cannot be changed.

// Printing Constants and Variables
//
// You can print the current value of a constant or variable with the print(_:separator:terminator:)
// function:

print(friendlyWelcome)
// Prints "Bonjour!"

// The print(_:separator:terminator:) function is a global function that prints one or more values
// to an appropriate output. In Xcode, for example, the print(_:separator:terminator:) function 
// prints its output in Xcode's "console" pane. The separator and terminator parameter have default
// values, so you can omit them when you call this function. By default, the function terminates
// the line it prints by adding a line break. To print a value without a line break after it, pass
// an empty string as terminator, for example, print(someValue, terminator: ""). For information
// about parameters with default values, see Default Parameter Values.
//
// Swift uses string interpolation to include the name of a constant or variable as a placeholder
// in a longer string, and to prompt Swift to replace it with the current value of that constant 
// or variable. Wrap the name in parentheses and escape it with a backslash before the opening
// parenthesis:

print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcmome is Bonjour!"

// NOTE : All options you can use with string interpolation are described in String Interpolation.
//
// Comments
// 
// Use comments to include nonexecutable text in your code, as a note or reminder to yourself.
// Comments are ignored by the Swift compiler when your code is compiled.
//
// Comments in Swift are very similar to comments in C. Single-line comments begin with two
// forward-slashes (//):
//
// This is a comment.
//
// Multiline comments start with a forward-slash followed by an asterisk (/*) and end with an
// asterisk followed by a forward-slash (*/):
//
/* This is also a comment
   but is written over multiple lines. */
//
// Unlike multiline comments in C, multiline comments in Swift can nested inside other multiline
// comments. You write nested comments by starting a multiline comment block and then starting
// a seconde multiline comment within the first block. The second block is then closes,
// followed by the first block:
//
/* This is the start of the first multiline comment.
   /* This is the second, nested multine comment. */
   This is the end of the first multiline comment. */
//
// Nested multiline comments enable you to comment out large blocks of code quickly and easily,
// even if the code already contains multiline comments.
//
// Semicolons
//
// Unlike many other languages, Swift doesn't require you to write a semicolon (;) after each
// statement in your code, although you can do so if you wish. However, semicolons are required
// if you want to write multiple separate statements on a single line:
//
let cat = "🐱"; print(cat)
// Prints "🐱"