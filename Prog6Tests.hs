{- ##################################
   Richard Burns
   Units Tests for Homework 6.

   Usage: ghci Prog2Tests; main

   Dependencies: cabal install tasty
                 cabal install tasty-hunit
   ################################## -}


import Prog6
import Test.Tasty 
import Test.Tasty.HUnit 
import System.Environment

import Data.List

main = do
    setEnv "TASTY_TIMEOUT" "2s"
    defaultMain tests

{-
main = defaultMain tests 
-}

e1, e2, e3, e4, e5 :: Expr
e1 = (Lit 5)
e2 = (Add e1 e1)               --   (5 + 5)
e3 = (Lit (-3))
e4 = (Sub e1 e2)               --    5 - (5 + 5)
e5 = (Add e4 e2)               --    (5 - (5 + 5)) + (5 + 5)

eqhelper :: Set345 -> Set345 -> Bool
eqhelper (NonEmptySet a) (NonEmptySet b) = (Data.List.sort a) == (Data.List.sort b)
eqhelper EmptySet EmptySet = True
eqhelper _ _ = False

burnss1 = NonEmptySet [1..5]
burnss2 = NonEmptySet [1,3..9]
burnss3 = NonEmptySet [2,4..10]
burnss4 = NonEmptySet [1..10]
burnss5 = EmptySet

tests :: TestTree
tests = testGroup "Tests" [unitTests]

unitTests = testGroup "Unit tests"
  [
    -- numAdds :: Expr -> Int
    testCase "test_numAdds1" $ assertEqual [] 0 (numAdds e1),
    testCase "test_numAdds2" $ assertEqual [] 1 (numAdds e2),
    testCase "test_numAdds3" $ assertEqual [] 1 (numAdds e4),
    testCase "test_numAdds4" $ assertEqual [] 3 (numAdds e5),

    -- depth :: Expr -> Int
    testCase "test_depth1" $ assertEqual [] 0 (depth e1),
    testCase "test_depth2" $ assertEqual [] 1 (depth e2),
    testCase "test_depth3" $ assertEqual [] 2 (depth e4),
    testCase "test_depth4" $ assertEqual [] 3 (depth e5),    

    -- singletonOrEmpty :: Set345 -> Bool
    testCase "test_singletonOrEmpty1" $ assertEqual [] True (singletonOrEmpty EmptySet),
    testCase "test_singletonOrEmpty2" $ assertEqual [] True (singletonOrEmpty (NonEmptySet [5])),
    testCase "test_singletonOrEmpty3" $ assertEqual [] False (singletonOrEmpty (NonEmptySet [9,5])),
    testCase "test_singletonOrEmpty4" $ assertEqual [] False (singletonOrEmpty (NonEmptySet [9,5,2])),

    -- member :: Int -> Set345 -> Bool 
    testCase "test_member1" $ assertEqual [] False (member 3 (NonEmptySet [1,2,4,5])),
    testCase "test_member2" $ assertEqual [] False (member 3 EmptySet),
    testCase "test_member3" $ assertEqual [] True (member 3 (NonEmptySet [3..7])),  
    testCase "test_member4" $ assertEqual [] True (member 3 (NonEmptySet [1..4])),  

    -- size :: Set345 -> Int 
    testCase "test_size1" $ assertEqual [] 0 (size EmptySet),
    testCase "test_size2" $ assertEqual [] 1 (size (NonEmptySet [9])),
    testCase "test_size3" $ assertEqual [] 2 (size (NonEmptySet [9,8])),
    testCase "test_size4" $ assertEqual [] 10 (size (NonEmptySet [1..10])),  
            
    -- ins :: Int -> Set345 -> Set345
    testCase "test_ins1" $ assertEqual [] True (eqhelper (NonEmptySet [1..5]) (ins 3 (NonEmptySet [1,2,4,5]))),
    testCase "test_ins2" $ assertEqual [] True (eqhelper (NonEmptySet [3]) (ins 3 EmptySet)),
    testCase "test_ins3" $ assertEqual [] True (eqhelper (NonEmptySet [3..7]) (ins 3 (NonEmptySet [3..7]))),  
    testCase "test_ins4" $ assertEqual [] True (eqhelper (NonEmptySet [1..4]) (ins 3 (NonEmptySet [1..4]))),    

    -- union' :: Set345 -> Set345 -> Set345
    testCase "test_union1" $ assertEqual [] True (eqhelper burnss1 (union' burnss1 burnss1)),
    testCase "test_union2" $ assertEqual [] True (eqhelper burnss4 (union' burnss2 burnss3)),
    testCase "test_union3" $ assertEqual [] True (eqhelper (NonEmptySet ([1..5]++[7,9])) (union' burnss1 burnss2)),
    testCase "test_union4" $ assertEqual [] True (eqhelper (NonEmptySet ([1..5]++[7,9])) (union' burnss2 burnss1)),
    testCase "test_union5" $ assertEqual [] True (eqhelper burnss4 (union' burnss4 burnss2)),

    -- intersection' :: Set345 -> Set345 -> Set345
    testCase "test_intersection1" $ assertEqual [] True (eqhelper burnss1 (intersection' burnss1 burnss1)),
    testCase "test_intersection2" $ assertEqual [] True (eqhelper EmptySet (intersection' burnss2 burnss3)),
    testCase "test_intersection3" $ assertEqual [] True (eqhelper (NonEmptySet [1,3,5]) (intersection' burnss1 burnss2)),
    testCase "test_intersection4" $ assertEqual [] True (eqhelper (NonEmptySet [1,3,5]) (intersection' burnss2 burnss1)),
    testCase "test_intersection5" $ assertEqual [] True (eqhelper burnss2 (intersection' burnss4 burnss2)) 

    -- countLetters :: IO [Int]
    -- tested manually with the following:
    -- 1. (countLetters), with user input Haskell is Fun, should return [7,2,3]
    -- 2. (countLetters), with user input One Two One, should return [3,3,3]
    -- 3. (countLetters), with user input one week left, should return [3,4,4]
    -- 4. (countLetters), with user input april showers bring, should return [5,7,5]

    -- range :: IO [Int]
    -- tested manually with the following:
    -- 1. (range), with user input 5 9, should return [5,6,7,8,9]
    -- 2. (range), with user input 5 5, should return [5]
    -- 3. (range), with user input 7 2, should return [2,3,4,5,6,7]
  ]
