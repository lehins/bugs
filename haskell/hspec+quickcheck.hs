
specBug = do
  describe "Same values" $ do
    prop "1st test" $ forAll (genValid :: Gen Int) $ \x -> x > -50
    prop "2st test" $ forAll (genValid :: Gen Int) $ \x -> x > -50

specNoBug = do
  describe "Same values" $ do
    prop "1st test" $ forAll (arbitrary :: Gen Int) $ \x -> x > -50
    prop "2st test" $ forAll (arbitrary :: Gen Int) $ \x -> x > -50

specNoBug2 = do
  describe "Same values" $ do
    prop "1st test" $ \xs -> all (> (-9 :: Int)) (xs :: [Int])
    prop "2st test" $ \xs -> all (> (-9 :: Int)) (xs :: [Int])
