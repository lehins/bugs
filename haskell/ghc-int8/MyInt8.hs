{-# LANGUAGE MagicHash #-}
{-# LANGUAGE UnboxedTuples #-}
module MyInt8
  ( Int8(..)
  ) where

import Data.Bits
import GHC.Enum
import GHC.Exts
import GHC.Base
import qualified GHC.Int as GHC (Int8(..))
import GHC.Num (integerToInt, smallInteger)
import GHC.Real

data Int8 = I8# Int8#

instance Eq Int8 where
  (==) = eqInt8
  (/=) = neInt8

eqInt8, neInt8 :: Int8 -> Int8 -> Bool
I8# x# `eqInt8` I8# y# = isTrue# (x# `eqInt8#` y#)
I8# x# `neInt8` I8# y# = isTrue# (x# `neInt8#` y#)

instance Ord Int8 where
  (<)  = ltInt8
  (<=) = leInt8
  (>=) = geInt8
  (>)  = gtInt8

gtInt8, geInt8, ltInt8, leInt8 :: Int8 -> Int8 -> Bool
I8# x# `gtInt8` I8# y# = isTrue# (x# `gtInt8#` y#)
I8# x# `geInt8` I8# y# = isTrue# (x# `geInt8#` y#)
I8# x# `ltInt8` I8# y# = isTrue# (x# `ltInt8#` y#)
I8# x# `leInt8` I8# y# = isTrue# (x# `leInt8#` y#)

instance Num Int8 where
  I8# x# + I8# y# = I8# (x# `plusInt8#` y#)
  I8# x# - I8# y# = I8# (x# `subInt8#` y#)
  I8# x# * I8# y# = I8# (x# `timesInt8#` y#)
  negate (I8# x#) = I8# (negateInt8# x#)
  abs x
    | x >= 0 = x
    | otherwise = negate x
  signum x
    | x > 0 = 1
  signum 0 = 0
  signum _ = -1
  fromInteger i = I8# (narrowInt8# (integerToInt i))

instance Enum Int8 where
  succ x = x + 1
  pred x = x - 1
  toEnum i@(I# i#)
    | i >= fromIntegral (minBound :: Int8) && i <= fromIntegral (maxBound :: Int8) =
      I8# (narrowInt8# i#)
    | otherwise = error "Int8"
  fromEnum (I8# x#) = I# (extendInt8# x#)
  enumFrom = boundedEnumFrom
  enumFromThen = boundedEnumFromThen

instance Real Int8 where
  toRational x = toInteger x % 1

instance Bounded Int8 where
  minBound = I8# (narrowInt8# -0x80#)
  maxBound = I8# (narrowInt8# 0x7F#)

instance Integral Int8 where
  quot x@(I8# x#) y@(I8# y#)
    | y == 0 = divZeroError
    | y == (-1) && x == minBound = overflowError
    | otherwise = I8# (x# `quotInt8#` y#)
  rem (I8# x#) y@(I8# y#)
    | y == 0 = divZeroError
    | otherwise = I8# (x# `remInt8#` y#)
  div x@(I8# x#) y@(I8# y#)
    | y == 0 = divZeroError
    | y == (-1) && x == minBound = overflowError
    | otherwise = I8# (x# `divInt8#` y#)
  mod (I8# x#) y@(I8# y#)
    | y == 0 = divZeroError
    | otherwise = I8# (x# `modInt8#` y#)
  quotRem x@(I8# x#) y@(I8# y#)
    | y == 0 = divZeroError
    | y == (-1) && x == minBound = (overflowError, 0)
    | otherwise =
      case x# `quotRemInt8#` y# of
        (# q#, r# #) -> (I8# q#, I8# r#)
  divMod x@(I8# x#) y@(I8# y#)
    | y == 0 = divZeroError
    | y == (-1) && x == minBound = (overflowError, 0)
    | otherwise =
      case x# `divModInt8#` y# of
        (# d#, m# #) -> (I8# d#, I8# m#)
  toInteger (I8# x#) = smallInteger (extendInt8# x#)

-- divInt8# :: Int8# -> Int8# -> Int8#
-- divInt8# x# y# = narrowInt8# (divInt# (extendInt8# x#) (extendInt8# y#))

modInt8# :: Int8# -> Int8# -> Int8#
modInt8# x# y# = narrowInt8# (modInt# (extendInt8# x#) (extendInt8# y#))

divModInt8# :: Int8# -> Int8# -> (# Int8#, Int8# #)
divModInt8# x# y# =
  case divModInt# (extendInt8# x#) (extendInt8# y#) of
    (# q#, r# #) -> (# narrowInt8# q#, narrowInt8# r# #)


divInt8# :: Int8# -> Int8# -> Int8#
x# `divInt8#` y#
  | isTrue# (x# `gtInt8#` zero#) && isTrue# (y# `ltInt8#` zero#) =
    ((x# `subInt8#` one#) `quotInt8#` y#) `subInt8#` one#
  | isTrue# (x# `ltInt8#` zero#) && isTrue# (y# `gtInt8#` zero#) =
    ((x# `plusInt8#` one#) `quotInt8#` y#) `subInt8#` one#
  | otherwise = x# `quotInt8#` y#
  where
    zero# = narrowInt8# 0#
    one# = narrowInt8# 1#
