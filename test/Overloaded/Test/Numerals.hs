{-# LANGUAGE DataKinds #-}
{-# OPTIONS -fplugin=Overloaded -fplugin-opt=Overloaded:Numerals #-}
module Overloaded.Test.Numerals where

import Data.Fin         (Fin (..))
import Test.Tasty       (TestTree, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))

import qualified Data.Type.Nat as N

tests :: TestTree
tests = testGroup "Numerals"
    [ testCase "Fin" $ do
        let f :: Fin (N.FromGHC 5)
            f = 2

        f @?= FS (FS FZ)

    , testCase "Fin pattern-match" $ do
        let res = case 2 :: Fin (N.FromGHC 5) of
                2 -> True -- works, because there is @Num (Fin n)@ instance
                _ -> False
        res @?= True
    ]
