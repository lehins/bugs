module Section (
    -- * Section

    --
    -- $long_section
    foo,
    bar,
) where

-- | Very short one line function documentation.
foo :: ()
foo = ()

{- | Short function documentation that spans multiple lines

 This one has a second line
-}
bar :: ()
bar = ()

{- $long_section

=== Lengthy section

This is where we have a very long description on what functions in this section do and multi-line syntax is more convenient.
-}
