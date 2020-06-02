{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnboxedTuples #-}

import GHC.IO
import GHC.Exts

data MutByteArray s = MutByteArray (MutableByteArray# s)

newMutByteArray :: Int# -> IO (MutByteArray RealWorld)
newMutByteArray n# =
  IO $ \s -> case newByteArray# n# s of {(# s', mb# #) -> (# s', MutByteArray mb# #)}

resizeMutByteArray :: MutByteArray RealWorld -> Int# -> IO (MutByteArray RealWorld)
resizeMutByteArray (MutByteArray mb#) n# =
  IO $ \s -> case resizeMutableByteArray# mb# n# s of {(# s', mb'# #) -> (# s', MutByteArray mb'# #)}

shrinkMutByteArray :: MutByteArray RealWorld -> Int# -> IO ()
shrinkMutByteArray (MutByteArray mb#) n# = IO $ \s -> (# shrinkMutableByteArray# mb# n# s, () #)

getSizeofMutByteArray :: MutByteArray RealWorld -> IO Int
getSizeofMutByteArray (MutByteArray mb#) =
  IO $ \s -> case getSizeofMutableByteArray# mb# s of {(# s', n# #) -> (# s', I# n# #)}

sizeofMutByteArray :: MutByteArray s -> Int
sizeofMutByteArray (MutByteArray mb#) = I# (sizeofMutableByteArray# mb#)
