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
