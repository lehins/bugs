import Control.Exception

main :: IO ()
main = pure ()

lists :: [String]
lists =
  [ "It is often that lists do not fit into a single line.",
    "We need to format them in a readable fashion",
    "without compromising functionality.",
    "Placement of commas at the end increases git diffs!"
  ]

data Record = Record
  { records :: String,
    are :: Bool,
    no :: Bool,
    exception :: SomeException
  }

myRecord :: Record
myRecord =
  Record
    { records = "Records are aslo suscpetible to trailing comma problem",
      are = True,
      no = False,
      exception = toException StackOverflow
    }

data VeryLongTypeNameThatCausesForTupleiInTheTypeSignatureToWrapAroundTooAmIRight = AmIRight

tuples ::
  ( String,
    String,
    VeryLongTypeNameThatCausesForTupleiInTheTypeSignatureToWrapAroundTooAmIRight,
    Bool
  )
tuples =
  ( "It is less common for tuples to not fit into a single line.",
    "However it does still happen",
    AmIRight,
    True
  )


foo :: Num a => (a, a, a) -> a
foo ( x
    , y
    , z
    ) = x + y + z


bar :: Num a => [a] -> a
bar [ x
    , y
    , z
    ] = x + y + z


baz :: Num a => [a] -> a
baz xs =
  case xs of
    Foo [ x
        , y
        , z
        ] -> x + y + z
    _ -> 0

bar :: Num a => [a] -> a
bar [ x
    , y
    , z
    ] = x + y + z
bar _ = 0
