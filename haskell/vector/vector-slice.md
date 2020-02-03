;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.


Data.Vector.Generic:

```
-- | Construct a vector from a monadic initialiser.
new :: Vector v a => New v a -> v a
{-# INLINE_FUSED new #-}
new m = m `seq` runST (unsafeFreeze =<< New.run m)

fromList :: Vector v a => [a] -> v a
{-# INLINE fromList #-}
fromList = unstream . Bundle.fromList

slice :: Vector v a => Int   -- ^ @i@ starting index
                    -> Int   -- ^ @n@ length
                    -> v a
                    -> v a
{-# INLINE_FUSED slice #-}
slice i n v = BOUNDS_CHECK(checkSlice) "slice" i n (length v)
            $ basicUnsafeSlice i n v

"slice/new [Vector]" forall i n p.
  slice i n (new p) = new (New.slice i n p)

```

Data.Vector.Generic.New:

```
unstream :: Vector v a => Bundle v a -> New v a
{-# INLINE_FUSED unstream #-}
unstream s = s `seq` New (MVector.vunstream s)

slice :: Vector v a => Int -> Int -> New v a -> New v a
{-# INLINE_FUSED slice #-}
slice i n m = apply (MVector.slice i n) m

"slice/unstream [New]" forall i n s.
  slice i n (unstream s) = unstream (Bundle.slice i n s)
```

Data.Vector.Generic.Mutable

```
vunstream :: (PrimMonad m, V.Vector v a)
         => Bundle v a -> m (V.Mutable v (PrimState m) a)
{-# INLINE_FUSED vunstream #-}
vunstream s = vmunstream (Bundle.lift s)
```


slice i n (fromList xs)

slice i n (unstream (Bundle.fromList xs))                    -- INLINE

slice i n (new (New.unstream (Bundle.fromList xs)))          -- INLINE

new (New.slice i n (New.unstream (Bundle.fromList xs)))      -- REWRITE "slice/new [Vector]"

new (New.unstream (Bundle.slice i n (Bundle.fromList xs)))   -- REWRITE "slice/unstream [New]"


new (New (MVector.vunstream (Bundle.slice i n (Bundle.fromList xs)))) -- INLINE

-- INLINE:
new (New (MVector.vmunstream (Bundle.lift (Bundle.slice i n (MBundle.unsafeFromList Unknown xs)))))


-- INLINE:
new (New (MVector.vmunstream (Bundle.lift (Bundle.take n (Bundle.drop i (MBundle.unsafeFromList Unknown xs))))))

-- INLINE:
new (New (MVector.vmunstream (Bundle.lift (Bundle.take n (Bundle.drop i (Bundle.fromStream (S.fromList xs) Unknown))))))



-- EVAL: Bundle.fromStream
Bundle.fromStream (S.fromList xs) Unknown ==
Bundle (Stream step t) (Stream step' t) Nothing Unknown

-- EVAL: Bundle.drop i
Bundle.drop i (Bundle (Stream step t) (Stream step' t) Nothing Unknown) ==
fromStream (S.drop i (Stream step t)) (clampedSubtract Unknown (Exact i)) ==
fromStream (S.drop i (Stream step t)) Unknown

-- EVAL: fromStream
Bundle.take n (fromStream (S.drop i (Stream step t)) Unknown) ==
Bundle.take n (Bundle (S.drop i (Stream step t)) (Stream step' t) Nothing Unknown)

-- EVAL: Bundle.take
Bundle.take n (Bundle (S.drop i (Stream step t)) (Stream step' t) Nothing Unknown) ==
fromStream (S.take n (S.drop i (Stream step t) Unknown)) (smaller (Exact n) Unknown) ==
fromStream (S.take n (S.drop i (Stream step t) Unknown)) (Max n)

-- EVAL: fromStream
fromStream (S.take n (S.drop i (Stream step t) Unknown)) (Max n) ==
Bundle (S.take n (S.drop i (Stream step t) Unknown)) (Stream step' t) Nothing (Max n)

-- EVAL: lift
new (New (MVector.vmunstream (Bundle.lift (Bundle (S.take n (S.drop i (Stream step t) Unknown)) (Stream step' t) Nothing (Max n))))) ===
new (New (MVector.vmunstream (Bundle (S.take n (S.drop i (Stream step t) Unknown)) (Stream step' t) Nothing (Max n))))

-- EVAL: vmunstream
new (New (MVector.vmunstream (Bundle (S.take n (S.drop i (Stream step t) Unknown)) (Stream step' t) Nothing (Max n)))) ==
new (New (vmunstreamMax (Bundle (S.take n (S.drop i (Stream step t) Unknown)) (Stream step' t) Nothing (Max n))))

Bundle:
```
-- | Convert a pure stream to a monadic stream
lift :: Monad m => M.Bundle Id v a -> M.Bundle m v a
{-# INLINE_FUSED lift #-}
lift (M.Bundle (Stream step s) (Stream vstep t) v sz)
    = M.Bundle (Stream (return . unId . step) s)
               (Stream (return . unId . vstep) t) v sz
```


MBundle:
```
-- | The first @n@ elements
take :: Monad m => Int -> Bundle m v a -> Bundle m v a
{-# INLINE_FUSED take #-}
take n Bundle{sElems = s, sSize = sz} = fromStream (S.take n s) (smaller (Exact n) sz)

-- | All but the first @n@ elements
drop :: Monad m => Int -> Bundle m v a -> Bundle m v a
{-# INLINE_FUSED drop #-}
drop n Bundle{sElems = s, sSize = sz} =
  fromStream (S.drop n s) (clampedSubtract sz (Exact n))

fromStream :: Monad m => Stream m a -> Size -> Bundle m v a
{-# INLINE fromStream #-}
fromStream (Stream step t) sz = Bundle (Stream step t) (Stream step' t) Nothing sz
  where
    step' s = do r <- step s
                 return $ fmap (\x -> Chunk 1 (\v -> M.basicUnsafeWrite v 0 x)) r

data Bundle m v a = Bundle { sElems  :: Stream m a
                           , sChunks :: Stream m (Chunk v a)
                           , sVector :: Maybe (v a)
                           , sSize   :: Size
                           }
```

smaller (Exact maxBound) Unknown
Max 9223372036854775807

```
-- | Convert a list to a 'Stream'
fromList :: Monad m => [a] -> Stream m a
{-# INLINE fromList #-}
fromList zs = Stream step zs
  where
    step (x:xs) = return (Yield x xs)
    step []     = return Done
```
