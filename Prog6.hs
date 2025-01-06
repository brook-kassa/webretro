{- ##################################
   Name: 
   Date:
   Homework Assignment: 
   ################################## -}

module Prog6 where

{----------}

data Expr = Lit Int
          | Add Expr Expr
          | Sub Expr Expr
      deriving Show

numAdds :: Expr -> Int
numAdds _ = error "undefined"

depth :: Expr -> Int
depth _ = error "undefined"

{----------}

data Set345 = NonEmptySet [Int]
            | EmptySet
      deriving Show

singletonOrEmpty :: Set345 -> Bool
singletonOrEmpty _ = error "undefined"

member :: Int -> Set345 -> Bool
member _ = error "undefined"

size :: Set345 -> Int
size _ = error "undefined"

ins :: Int -> Set345 -> Set345
ins _ = error "undefined"

union' :: Set345 -> Set345 -> Set345
union' _ = error "undefined"

intersection' :: Set345 -> Set345 -> Set345
intersection' _ = error "undefined"

{----------}

countLetters :: IO [Int]
countLetters = error "undefined"

range :: IO [Int]
range = error "undefined"
