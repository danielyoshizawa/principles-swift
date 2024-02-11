# The Basics

## Work with common kinds of data and write basic syntax.

Swift provides many fundamental data types, including Int for Integers, Double for floating-point values, Bool for Boolean values, and String for text. Swift also provides powerful versions of the three primary collection types, Array, Set, and Dictionary, as described in Colletion Types.

Swift uses variables to store and refer to values by an identifying name. Swift also makes extensive use of variables whose values can't be changed. These are known as contants, and are used throughtout Swift to make code safer and clearer in intent when you work with values that don't need to change.

In addition to familiar types, Swift introduces advanced types susch as tuples. Tuples enable you to create and pass around groupings of values. You can use a tuple to return multiple values from a function as a single compound value.

Swift also introduces optional types, whihc handle the absesnce of a value. Optionals say either "there is a value, and it equals x" or "there isn't a value at all".

Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with. If part of your code requires a String, type safely prevents you from passing it an Int by mistake. Likewise, type safety prevents you from accidentally passing an optional String to a piece of code that requires a non-optional String. Type safety helps you catch and fix errors as early as possible in the development process.

### How we'll approach this study

Most of the basic concepts will be split in small .swift files, each in it's own folder, all the explanations will be commented inside those files, this way we can read and test in a single place.

Since we are just starting to learn swift, let's use swiftc to compile our small projects, since it's very familiar (GCC like).