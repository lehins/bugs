{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE TypeApplications #-}

module Head where

import Data.Maybe (fromJust)
import Test.QuickCheck
  ( Property,
    choose,
    chooseInt,
    counterexample,
    elements,
    oneof,
    property,
    vectorOf,
    (===),
    (.&&.),
    conjoin,
  )
