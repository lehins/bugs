{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnboxedTuples #-}
import GHC.Exts
import GHC.IO

data MutableArray a = MutableArray (MutableArray# RealWorld a)

readArray :: MutableArray a -> Int -> IO a
readArray (MutableArray ma#) (I# i#) = IO (readArray# ma# i#)

casArray :: MutableArray a -> Int -> a -> a -> IO (Bool, a)
casArray (MutableArray ma#) (I# i#) expected new =
  IO $ \s ->
    case casArray# ma# i# expected new s of
      (# s', failed#, actual #) -> (# s', (isTrue# failed#, actual) #)

newArray :: Int -> a -> IO (MutableArray a)
newArray (I# n#) a =
  IO $ \s ->
    case newArray# n# a s of
      (# s', ma# #) -> (# s', MutableArray ma# #)

casArrayBug :: IO ()
casArrayBug = do
  arr <- newArray 1 99
  expected <- readArray arr 0
  (hasFailed, actual) <- casArray arr 0 expected 100
  current <- readArray arr 0
  putStrLn $
    unlines
      [ "========== Boxed Array ==========="
      , "Expected: " ++ show expected
      , "Actual: " ++ show actual
      , "Has CAS failed: " ++ show hasFailed
      , "Current: " ++ show current
      ]


data SmallMutableArray a = SmallMutableArray (SmallMutableArray# RealWorld a)

readSmallArray :: SmallMutableArray a -> Int -> IO a
readSmallArray (SmallMutableArray ma#) (I# i#) = IO (readSmallArray# ma# i#)

casSmallArray :: SmallMutableArray a -> Int -> a -> a -> IO (Bool, a)
casSmallArray (SmallMutableArray ma#) (I# i#) expected new =
  IO $ \s ->
    case casSmallArray# ma# i# expected new s of
      (# s', failed#, actual #) -> (# s', (isTrue# failed#, actual) #)

newSmallArray :: Int -> a -> IO (SmallMutableArray a)
newSmallArray (I# n#) a =
  IO $ \s ->
    case newSmallArray# n# a s of
      (# s', ma# #) -> (# s', SmallMutableArray ma# #)

casSmallArrayBug :: IO ()
casSmallArrayBug = do
  arr <- newSmallArray 1 99
  expected <- readSmallArray arr 0
  (hasFailed, actual) <- casSmallArray arr 0 expected 100
  current <- readSmallArray arr 0
  putStrLn $
    unlines
      [ "========== Small Boxed Array ==========="
      , "Expected: " ++ show expected
      , "Actual: " ++ show actual
      , "Has CAS failed: " ++ show hasFailed
      , "Current: " ++ show current
      ]



data MutVar a = MutVar (MutVar# RealWorld a)

readMutVar :: MutVar a -> IO a
readMutVar (MutVar ma#) = IO (readMutVar# ma#)

casMutVar :: MutVar a -> a -> a -> IO (Bool, a)
casMutVar (MutVar ma#) expected new =
  IO $ \s ->
    case casMutVar# ma# expected new s of
      (# s', failed#, actual #) -> (# s', (isTrue# failed#, actual) #)

newMutVar ::  a -> IO (MutVar a)
newMutVar a =
  IO $ \s ->
    case newMutVar# a s of
      (# s', ma# #) -> (# s', MutVar ma# #)

casMutVarBug :: IO ()
casMutVarBug = do
  ref <- newMutVar 99
  expected <- readMutVar ref
  (hasFailed, actual) <- casMutVar ref expected 100
  current <- readMutVar ref
  putStrLn $
    unlines
      [ "========== MutVar ==========="
      , "Expected: " ++ show expected
      , "Actual: " ++ show actual
      , "Has CAS failed: " ++ show hasFailed
      , "Current: " ++ show current
      ]

data MutableByteArray a = MutableByteArray (MutableByteArray# RealWorld)

readByteArray :: MutableByteArray Int -> Int -> IO Int
readByteArray (MutableByteArray ma#) (I# i#) =
  IO $ \s ->
    case readIntArray# ma# i# s of
      (# s', e# #) -> (# s', I# e# #)

casByteArray :: MutableByteArray Int -> Int -> Int -> Int -> IO (Bool, Int)
casByteArray (MutableByteArray ma#) (I# i#) (I# expected#) (I# new#) =
  IO $ \s ->
    case casIntArray# ma# i# expected# new# s of
      (# s', actual# #) ->
        let hasFailed = isTrue# (expected# /=# actual#)
            current# = if hasFailed then actual# else new#
        in (# s', (hasFailed, I# current#) #)

newByteArray :: Int -> Int -> IO (MutableByteArray Int)
newByteArray (I# n#) (I# a#) =
  IO $ \s ->
    case newByteArray# (n# *# 8#) s of
      (# s', ma# #) -> (# setByteArray# ma# 0# n# a# s', MutableByteArray ma# #)

casByteArrayNoBug :: IO ()
casByteArrayNoBug = do
  arr <- newByteArray 1 99
  expected <- readByteArray arr 0
  (hasFailed, actual) <- casByteArray arr 0 expected 100
  current <- readByteArray arr 0
  putStrLn $
    unlines
      [ "========== ByteArray ==========="
      , "Expected: " ++ show expected
      , "Actual: " ++ show actual
      , "Has CAS failed: " ++ show hasFailed
      , "Current: " ++ show current
      ]


main :: IO ()
main = do
  casArrayBug
  casSmallArrayBug
  casMutVarBug
  casByteArrayNoBug
