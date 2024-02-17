// Assertions and Preconditions
//
// Assertions and preconditions are checks that happen at runtime. You use them to make sure an essential
// condition is satisfied before executing any further code. If the Boolean condition in the assertion
// or precondtion evaluates to true, code executions continues as usual. If the condition evaluates to
// false, the current state of the program is invalid; code execution ends, and your app is terminated.
// 
// You use assertions an precondigitons to express the assumptions you make and the expectations you
// have while coding, so you can include them as part of your code. Assertions help you find mistakes
// and incorrect assumptions during development, and preconditions help you detect issues in productions.
//
// In addition to verifying your expectations at runtime, assertions and preconditions also become a
// useful form of documentation within the code. Unlike the error conditions discussed in Erro Handling
// above, assertions and preconditions aren't used for recoverable or expected errors. Beacuase a
// failed assertion or precondition indicates an invalid program state, there's no way to catch a
// failed assertion. Recovering from an invalid stat is impossible. When an assertion fails, at least
// one piece of the program's data is invalid - but you don't know why it's invalid or wheter an
// additional state is also invalid.
//
// Using assertions and preconditions isn't a substitute for designing your code in such a way that
// invalid conditions are unlikely to arise. Howerver, using them to enforce valid data and state
// causes your app to terminate more predictably if an invalid state occurs, and helps make the
// problem easier to debug. When assumptions aren't checked, you might not notice this kind of
// problem until much later when code elsewhere starts failing viibly, and after user data has
// been silently corrupted. Stopping execution as soon as an invalid state is detected also
// helps limit the damage caused by that invalid state.
//
// The difference between assertions and preconditions is in when they're checked: Assertions are
// checked only in debug builds, but preconditions are checked in both debug and production builds.
// In productions builds, the condition inside an assertions isn't evaluated. This means you can use
// as many assertions as you want during your development process, without impacting performance
// in production.
//
// Debugging with Assertions
//
// You write an assertions by calling the assert(_:_:file:line) function from the Swift standard 
// library. You pass this function an expression that evaluates to true or false and a message to
// display if the result of the condition is false. For example:

let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 isn't >= 0

// In this example, code execution continues if age >= 0 evaluates to true, that is, if the value
// of age is nonnegative. If the value of age is negative, as in the code above, then age >= 0
// evaluates to false, and the assertion fails, terminating the applications.
//
// You can omit the assertion message - for example, when it would just repeat the condition as prose.

assert(age >= 0)

// If the code already checks the condition, you use the assertionFailure(_:file:line:) function to
// indicate that an assertion has failed. For example:

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

// Enforcing Preconditions
//
// Use a precondition whenerver a condition has the potential to be false, but must definitely be
// true for your code to continue execution. For example, use a precondition to check that a subscript
// isn't out of bounds, or to check that a function has been passed a valid value.
//
// You write a precondition by calling the precondition(_:_:file:line:) function. You pass this
// function an expression that evaluates to true or false and a message to display if the result
// of the condition is false, For example:

// In the implmentation of a subscript
precondition(index > 0, "Index must be greater than zero.")

// You can also call the preconditionFailure(_:file:line:) function to indicate that a failure has
// occurred - for example, if the default case of a switch was taken, but all valid input data
// should have been handled by one of the switch's other cases.
//
// NOTE : If you compile in unchecked mode (-Ounchecked), preconditions arent's checked. The compiler
// assumes that preconditions are always true, and it optimizes your code accordingly. However, the
// fatalError(_:file:line:) function always halts execution, regardless of optimization settings.
//
// NOTE : You can use the fatalError(_:file:line) function during prototyping and early development
// to create stubs for functionality that hasn't been implemented yet, by writing fatalError("Unimplmented")
// as the stub implementation. Because fatal errors are never optimized out, unlike assertions or
// preconditions, you can be sure that execution always halts if it encounters a stub implementation.