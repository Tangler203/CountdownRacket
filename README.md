# CountdownRacket
This is a numbers game of Countdown written in Racket using the application DrRacket.

## How to Run

To run the game open the file "countdownNumbers.rkt" in DrRacket and use the function (rpn l t). l being a list of numbers (recommended max of 6) and t being the target number

### Example

Input (rpn (list 1 2 3) 6). The function tries to solve for the number 6 using only the numbers 1, 2 and 3. It will return the following lines 

(2 3 *)

(1 2 3 + +)

(1 2 3 * *) 

(1 2 3 * /)

(2 1 / 3 /)

Target:6

At the end of the function. It always output Target:t. This way you know when its finished.

## Issues

Crashes when it divides by zero. (Should be fixed)

Can crash at 6 numbers, although that might be because it takes up too much memory

## Objective of Countdown

The objective of the Countdown numbers game is to get a target number by using 6 numbers with maths. You may only each number once, only add, subtract, divide and multiply, you may not use fractions, powers and logs.

The available small numbers are 2 of each number between 1 and 10 i.e.
> 1, 1, 2, 2, 3, 3, 4, 4, 5, 5,

> 6, 6, 7, 7, 8, 8, 9, 9, 10, 10.

The available big numbers are 25, 50, 75 and 100.

The target number is any number between 101 and 999.

In the actual game of countdown you must have at least one big number, however for simplicity's sake, we won't have that restriction on this application.

The plan for this application is that we give it the the targer number, 6 useable numbers and it gives us each way to solve

We will be using an algorithm called reverse polish notation to help calculate the answer.
