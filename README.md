# Programming Assignment 6

[![Points badge](../../blob/badges/.github/badges/points.svg)](../../actions)



**Date Out:** Friday, April 4  
**Due Date:** Friday, April 18

----

This programming assignment focuses specifically on (1) algebraic data types and (2) I/O.

## Haskell Resources

Use, and only use, our "approved" course material: that is, the course notes, the Thompson text, other Haskell textbooks and tutorials, and our Discord server. **In coding your functions, you may only use what we have introduced so far in this course.** Using any other language features of Haskell will result in no credit for a given problem.

Googling and utilizing stackoverflow is not allowed, except for trying to decipher Haskell error messages. However, you really shouldn't be trying to use stackoverflow to understand any errors at this point in the course. Re-read your notes. Re-read them again. Study the text. Think hard. Googl'ing your way to a quick solution will only be a disservice to you. The end does not justify the means.

This is an individual programming assignment.

## Haskell Functions

Code the following Haskell functions in a file named `Prog6.hs`. I've given you the starter code already. Complete these functions by replacing the line `error "undefined"` in them. _In your solution, you may define helper functions that are called by the original function._

If you cannot figure out one of the problems, do not remove the function, but leave it in as `error`.

In the following functions, we are going to implement an Expr algebraic data type, as we did in class to represent arithmetic expressions.

 ```haskell
   data Expr = Lit Int
             | Add Expr Expr
             | Sub Expr Expr
       deriving Show
 ```
1. Write a function `numAdds` that takes an arithmetic expressions and returns the number of "+s" in it. 
   `numAdds :: Expr -> Int`
1. Write a function `depth` that returns the depth of the integer expression tree. The root of the tree is depth level 0.
   `depth :: Expr -> Int`   

<hr>

In the following functions, we are going to implement a Set algebraic data type by taking advantage of built-in Haskell lists. But, we'll have to manually check that we never violate most important property of sets: _that there are no duplicate items_. Use the following type constructor and data constructors. (Note: Haskell also has a built-in Set data type, that is much more advanced. We'll call our data type `Set345` to  distinguish it. Our data type is completely different from the built-in Set. Googling will be a waste of time; instead, spend that time on understanding your notes on type constructors and data constructors.)

 ```haskell
   data Set345 = NonEmptySet [Int]
               | EmptySet
       deriving Show
 ```

1. Write a function `singletonOrEmpty` that takes a set and returns if it is empty or is a singleton.  
   `singletonOrEmpty :: Set345 -> Bool`
1. Write a function `member` that checks whether the given item is present in the given set.  
   `member :: Int -> Set345 -> Bool`
1. Write a function `size` that returns the number of elements in a given set.
   `size :: Set345 -> Int`  
1. Write a function `ins` that inserts the given item into a set. (If the item is already in the set, simply return the set unmodified.) (Hint: you may want to program a helper function that takes two Sets and merges them into one.)  
   `ins :: Int -> Set345 -> Set345`
1. Write a function `union'` that takes two sets and returns the union of both sets.  
   `union' :: Set345 -> Set345 -> Set345`
1. Write a function `intersection'` that takes two sets and returns the intersection of both sets.  
   `intersection' :: Set345 -> Set345 -> Set345`

<hr>

The next two questions involve I/O:

1. Write a function `countLetters` that inputs three Strings from the user on separate lines (feel free to prompt the user to enter each String if you wish), and returns the number of letters in each entered String as a list.
   `countLetters :: IO [Int]`
1. Write a function `range` that inputs two integers from the user on separate lines (feel free to prompt the user to enter these two numbers separately), and returns a list spanning from the lower integer to the higher integer, stepping by 1. The lower integer may not always be entered first.
   `range :: IO [Int]`

## Submission instructions

Push your completed Haskell program to your GitHub. Verify the success of the autograding GitHub Action.
