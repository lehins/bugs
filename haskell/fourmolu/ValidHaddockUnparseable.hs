module ValidHaddockUnparseable where


{- | Haddock regular codeblock

 > bar :: Bar ()
 > bar = ()
 > {\-# INLINE bar #-\}

-}
bar :: ()
bar = ()



{- |

 Indented multi-line syntax inside multi-line haddock

 {- -}

 This is valid haddock

-}
foo :: ()
foo = ()
