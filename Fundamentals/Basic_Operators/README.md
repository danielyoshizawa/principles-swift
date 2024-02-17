# Basic Operators
### Perform operations like assignments, arithmetic, and comparison.

An operator is a special symbol or phrase that you use to check, change or combine values. For example, the addition operator (+) adds two numbers, as in let i = 1 + 2, and the logical AND operator (&&) combines two Boolean values, as in if enteredDoorCode && passedRetinaScan.

Swift supports the operators you may already know from languages like C, and improves several capabilities to eliminate common coding erros. The assignment operator (=) doesn't return a value, to prevent it from being mistakenly used when the equal to operator (==) is intended. Arithmetic operators (+, -, *, /, % and so forth) detect and disallow value overflow, to avoid unexpected results when working with numbers that become larger or smaller than the allowed value range of the type that stores them. You can opt in to value overflow behavior by using Swift's overflow operators, as described in Overflow Operators.

Swift also provides range operators that aren't found in C, sucha as ..<b and a...b, as a shortcut for expressing a range of values.

This chapter describes the common operators in Swift. Advanced Operators covers Swift's advanced operators, and describs how to define your own custom operators and implement the standard operators for your own custom types.

## Terminology

Operators are unary, binary, or ternary:
- Unary operators operate on a single target (such as -a). Unary prefix operators appear immediately before their target (such as !b), and unary postfix operators appear immediately after their target (such as c!).
- Binary operators operate on two targets (such as 2 + 3) and are infix because they appear in between their two targets.
- Ternary operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator (a ? b : c).

The values that operators affect are operands. In the expression 1 + 2, the symbol is an infix operator and its two operands are the values 1 and 2.