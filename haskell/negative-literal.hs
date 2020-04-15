{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NegativeLiterals #-}

import GHC.TypeLits

data Foo (n :: Nat) = Foo

foo :: Foo n -> Foo (n - 1)
foo Foo = Foo
