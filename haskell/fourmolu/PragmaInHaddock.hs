module PragmaInHaddock where

-- | Haddock with bird track
--
-- > bar :: Bar ()
-- > bar = ()
-- > {\-# INLINE bar #-\}
--
-- and with regular codeblock
--
-- @
-- bar :: Bar ()
-- bar = ()
-- {\-# INLINE bar #-\}
-- @
--
-- Outside of codeblock
--
-- {\-# INLINE bar #-\}
--
-- Multi-line syntax inside single-line haddock (both in codeblock and outside)
--
-- {\- -\}
--
-- > {\- -\}
foo :: ()
foo = ()
