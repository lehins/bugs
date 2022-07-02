Rule fired: Class op show (BUILTIN)
Rule fired: Class op cfoldl (BUILTIN)
Rule fired: Class op + (BUILTIN)
Rule fired: plusFloat# (BUILTIN)

==================== Specialise ====================
Result size of Specialise
  = {terms: 46, types: 36, coercions: 3, joins: 0/0}

-- RHS size: {terms: 7, types: 0, coercions: 0, joins: 0/0}
v [InlPrag=NOINLINE] :: V3 Float
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=False, ConLike=False,
         WorkFree=False, Expandable=False, Guidance=IF_ARGS [] 70 0}]
v = Algebra.Linear.V3.$WV3f
      (ghc-prim-0.5.3:GHC.Types.F# 1.0#)
      (ghc-prim-0.5.3:GHC.Types.F# 2.0#)
      (ghc-prim-0.5.3:GHC.Types.F# 3.0#)

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IT :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
$trModule_s3IT = "main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IU :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
$trModule_s3IU = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IT

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IV :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
$trModule_s3IV = "Main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IW :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
$trModule_s3IW = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IV

-- RHS size: {terms: 3, types: 0, coercions: 0, joins: 0/0}
Main.$trModule :: ghc-prim-0.5.3:GHC.Types.Module
[LclIdX,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 30}]
Main.$trModule
  = ghc-prim-0.5.3:GHC.Types.Module $trModule_s3IU $trModule_s3IW

-- RHS size: {terms: 13, types: 13, coercions: 0, joins: 0/0}
main_s3Lx :: String
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=False, ConLike=False,
         WorkFree=False, Expandable=False, Guidance=IF_ARGS [] 72 0}]
main_s3Lx
  = GHC.Float.$fShowFloat_$sshowSignedFloat
      GHC.Float.$fShowFloat2
      GHC.Float.$fRealFracFloat3
      (case v of { V3f co_a3La dt_a3Lb dt1_a3Lc dt2_a3Ld ->
       ghc-prim-0.5.3:GHC.Types.F#
         (ghc-prim-0.5.3:GHC.Prim.plusFloat#
            (ghc-prim-0.5.3:GHC.Prim.plusFloat# dt_a3Lb dt1_a3Lc) dt2_a3Ld)
       })
      (ghc-prim-0.5.3:GHC.Types.[] @ Char)

-- RHS size: {terms: 4, types: 0, coercions: 0, joins: 0/0}
main :: IO ()
[LclIdX,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 40 60}]
main
  = GHC.IO.Handle.Text.hPutStr'
      GHC.IO.Handle.FD.stdout main_s3Lx ghc-prim-0.5.3:GHC.Types.True

-- RHS size: {terms: 2, types: 1, coercions: 0, joins: 0/0}
main_s4DK
  :: ghc-prim-0.5.3:GHC.Prim.State# ghc-prim-0.5.3:GHC.Prim.RealWorld
     -> (# ghc-prim-0.5.3:GHC.Prim.State#
             ghc-prim-0.5.3:GHC.Prim.RealWorld,
           () #)
[LclId,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 60}]
main_s4DK = GHC.TopHandler.runMainIO1 @ () main

-- RHS size: {terms: 1, types: 0, coercions: 3, joins: 0/0}
:Main.main :: IO ()
[LclIdX,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True,
         Guidance=ALWAYS_IF(arity=0,unsat_ok=True,boring_ok=True)}]
:Main.main
  = main_s4DK
    `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
            :: (ghc-prim-0.5.3:GHC.Prim.State#
                  ghc-prim-0.5.3:GHC.Prim.RealWorld
                -> (# ghc-prim-0.5.3:GHC.Prim.State#
                        ghc-prim-0.5.3:GHC.Prim.RealWorld,
                      () #))
               ~R# IO ())




==================== SpecConstr ====================
Result size of SpecConstr
  = {terms: 39, types: 25, coercions: 4, joins: 0/0}

-- RHS size: {terms: 4, types: 1, coercions: 1, joins: 0/0}
v [InlPrag=NOINLINE] :: V3 Float
[LclId, Str=m12]
v = Algebra.Linear.V3.V3f
      @ Float
      @~ (<Float>_N :: Float ghc-prim-0.5.3:GHC.Prim.~# Float)
      1.0#
      2.0#
      3.0#

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IT :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId]
$trModule_s3IT = "main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IU :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId, Str=m1]
$trModule_s3IU = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IT

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IV :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId]
$trModule_s3IV = "Main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IW :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId, Str=m1]
$trModule_s3IW = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IV

-- RHS size: {terms: 3, types: 0, coercions: 0, joins: 0/0}
Main.$trModule :: ghc-prim-0.5.3:GHC.Types.Module
[LclIdX, Str=m]
Main.$trModule
  = ghc-prim-0.5.3:GHC.Types.Module $trModule_s3IU $trModule_s3IW

-- RHS size: {terms: 9, types: 1, coercions: 0, joins: 0/0}
main_s3Lx :: String
[LclId]
main_s3Lx
  = GHC.Float.$w$sshowSignedFloat1
      GHC.Float.$fShowFloat2
      GHC.Float.$fRealFracFloat3
      (ghc-prim-0.5.3:GHC.Prim.plusFloat#
         (ghc-prim-0.5.3:GHC.Prim.plusFloat# 1.0# 2.0#) 3.0#)
      (ghc-prim-0.5.3:GHC.Types.[] @ Char)

-- RHS size: {terms: 4, types: 0, coercions: 0, joins: 0/0}
main :: IO ()
[LclIdX, Arity=1]
main
  = GHC.IO.Handle.Text.hPutStr'
      GHC.IO.Handle.FD.stdout main_s3Lx ghc-prim-0.5.3:GHC.Types.True

-- RHS size: {terms: 2, types: 1, coercions: 0, joins: 0/0}
main_s4DK
  :: ghc-prim-0.5.3:GHC.Prim.State# ghc-prim-0.5.3:GHC.Prim.RealWorld
     -> (# ghc-prim-0.5.3:GHC.Prim.State#
             ghc-prim-0.5.3:GHC.Prim.RealWorld,
           () #)
[LclId, Arity=1]
main_s4DK = GHC.TopHandler.runMainIO1 @ () main

-- RHS size: {terms: 1, types: 0, coercions: 3, joins: 0/0}
:Main.main :: IO ()
[LclIdX,
 Arity=1,
 Unf=Unf{Src=InlineStable, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True,
         Guidance=ALWAYS_IF(arity=0,unsat_ok=True,boring_ok=True)
         Tmpl= main_s4DK
               `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
                       :: (ghc-prim-0.5.3:GHC.Prim.State#
                             ghc-prim-0.5.3:GHC.Prim.RealWorld
                           -> (# ghc-prim-0.5.3:GHC.Prim.State#
                                   ghc-prim-0.5.3:GHC.Prim.RealWorld,
                                 () #))
                          ~R# IO ())}]
:Main.main
  = main_s4DK
    `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
            :: (ghc-prim-0.5.3:GHC.Prim.State#
                  ghc-prim-0.5.3:GHC.Prim.RealWorld
                -> (# ghc-prim-0.5.3:GHC.Prim.State#
                        ghc-prim-0.5.3:GHC.Prim.RealWorld,
                      () #))
               ~R# IO ())



Rule fired: plusFloat# (BUILTIN)
Rule fired: plusFloat# (BUILTIN)

==================== Tidy Core ====================
Result size of Tidy Core
  = {terms: 30, types: 22, coercions: 3, joins: 0/0}

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
Main.$trModule4 :: ghc-prim-0.5.3:GHC.Prim.Addr#
[GblId,
 Caf=NoCafRefs,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
Main.$trModule4 = "main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
Main.$trModule3 :: ghc-prim-0.5.3:GHC.Types.TrName
[GblId,
 Caf=NoCafRefs,
 Str=m1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
Main.$trModule3 = ghc-prim-0.5.3:GHC.Types.TrNameS Main.$trModule4

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
Main.$trModule2 :: ghc-prim-0.5.3:GHC.Prim.Addr#
[GblId,
 Caf=NoCafRefs,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
Main.$trModule2 = "Main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
Main.$trModule1 :: ghc-prim-0.5.3:GHC.Types.TrName
[GblId,
 Caf=NoCafRefs,
 Str=m1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
Main.$trModule1 = ghc-prim-0.5.3:GHC.Types.TrNameS Main.$trModule2

-- RHS size: {terms: 3, types: 0, coercions: 0, joins: 0/0}
Main.$trModule :: ghc-prim-0.5.3:GHC.Types.Module
[GblId,
 Caf=NoCafRefs,
 Str=m,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 30}]
Main.$trModule
  = ghc-prim-0.5.3:GHC.Types.Module Main.$trModule3 Main.$trModule1

-- RHS size: {terms: 5, types: 1, coercions: 0, joins: 0/0}
Main.main1 :: String
[GblId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=False, ConLike=False,
         WorkFree=False, Expandable=False, Guidance=IF_ARGS [] 50 0}]
Main.main1
  = GHC.Float.$w$sshowSignedFloat1
      GHC.Float.$fShowFloat2
      GHC.Float.$fRealFracFloat3
      6.0#
      (ghc-prim-0.5.3:GHC.Types.[] @ Char)

-- RHS size: {terms: 4, types: 0, coercions: 0, joins: 0/0}
main :: IO ()
[GblId,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 40 60}]
main
  = GHC.IO.Handle.Text.hPutStr'
      GHC.IO.Handle.FD.stdout Main.main1 ghc-prim-0.5.3:GHC.Types.True

-- RHS size: {terms: 2, types: 1, coercions: 0, joins: 0/0}
Main.main2
  :: ghc-prim-0.5.3:GHC.Prim.State# ghc-prim-0.5.3:GHC.Prim.RealWorld
     -> (# ghc-prim-0.5.3:GHC.Prim.State#
             ghc-prim-0.5.3:GHC.Prim.RealWorld,
           () #)
[GblId,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 60}]
Main.main2 = GHC.TopHandler.runMainIO1 @ () main

-- RHS size: {terms: 1, types: 0, coercions: 3, joins: 0/0}
:Main.main :: IO ()
[GblId,
 Arity=1,
 Unf=Unf{Src=InlineStable, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True,
         Guidance=ALWAYS_IF(arity=0,unsat_ok=True,boring_ok=True)
         Tmpl= Main.main2
               `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
                       :: (ghc-prim-0.5.3:GHC.Prim.State#
                             ghc-prim-0.5.3:GHC.Prim.RealWorld
                           -> (# ghc-prim-0.5.3:GHC.Prim.State#
                                   ghc-prim-0.5.3:GHC.Prim.RealWorld,
                                 () #))
                          ~R# IO ())}]
:Main.main
  = Main.main2
    `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
            :: (ghc-prim-0.5.3:GHC.Prim.State#
                  ghc-prim-0.5.3:GHC.Prim.RealWorld
                -> (# ghc-prim-0.5.3:GHC.Prim.State#
                        ghc-prim-0.5.3:GHC.Prim.RealWorld,
                      () #))
               ~R# IO ())



[1 of 1] Compiling Main
Rule fired: Class op show (BUILTIN)
Rule fired: Class op cfoldl (BUILTIN)
Rule fired: Class op + (BUILTIN)
Rule fired: plusFloat# (BUILTIN)

==================== Specialise ====================
Result size of Specialise
  = {terms: 46, types: 36, coercions: 3, joins: 0/0}

-- RHS size: {terms: 7, types: 0, coercions: 0, joins: 0/0}
v [InlPrag=NOINLINE] :: V3 Float
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=False, ConLike=False,
         WorkFree=False, Expandable=False, Guidance=IF_ARGS [] 70 0}]
v = Algebra.Linear.V3.$WV3f
      (ghc-prim-0.5.3:GHC.Types.F# 1.0#)
      (ghc-prim-0.5.3:GHC.Types.F# 2.0#)
      (ghc-prim-0.5.3:GHC.Types.F# 3.0#)

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IF :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
$trModule_s3IF = "main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IG :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
$trModule_s3IG = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IF

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IH :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
$trModule_s3IH = "Main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3II :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
$trModule_s3II = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IH

-- RHS size: {terms: 3, types: 0, coercions: 0, joins: 0/0}
Main.$trModule :: ghc-prim-0.5.3:GHC.Types.Module
[LclIdX,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 30}]
Main.$trModule
  = ghc-prim-0.5.3:GHC.Types.Module $trModule_s3IG $trModule_s3II

-- RHS size: {terms: 13, types: 13, coercions: 0, joins: 0/0}
main_s3Lj :: String
[LclId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=False, ConLike=False,
         WorkFree=False, Expandable=False, Guidance=IF_ARGS [] 72 0}]
main_s3Lj
  = GHC.Float.$fShowFloat_$sshowSignedFloat
      GHC.Float.$fShowFloat2
      GHC.Float.$fRealFracFloat3
      (case v of { V3f co_a3KW dt_a3KX dt1_a3KY dt2_a3KZ ->
       ghc-prim-0.5.3:GHC.Types.F#
         (ghc-prim-0.5.3:GHC.Prim.plusFloat#
            (ghc-prim-0.5.3:GHC.Prim.plusFloat# dt_a3KX dt1_a3KY) dt2_a3KZ)
       })
      (ghc-prim-0.5.3:GHC.Types.[] @ Char)

-- RHS size: {terms: 4, types: 0, coercions: 0, joins: 0/0}
main :: IO ()
[LclIdX,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 40 60}]
main
  = GHC.IO.Handle.Text.hPutStr'
      GHC.IO.Handle.FD.stdout main_s3Lj ghc-prim-0.5.3:GHC.Types.True

-- RHS size: {terms: 2, types: 1, coercions: 0, joins: 0/0}
main_s4Dw
  :: ghc-prim-0.5.3:GHC.Prim.State# ghc-prim-0.5.3:GHC.Prim.RealWorld
     -> (# ghc-prim-0.5.3:GHC.Prim.State#
             ghc-prim-0.5.3:GHC.Prim.RealWorld,
           () #)
[LclId,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 60}]
main_s4Dw = GHC.TopHandler.runMainIO1 @ () main

-- RHS size: {terms: 1, types: 0, coercions: 3, joins: 0/0}
:Main.main :: IO ()
[LclIdX,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True,
         Guidance=ALWAYS_IF(arity=0,unsat_ok=True,boring_ok=True)}]
:Main.main
  = main_s4Dw
    `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
            :: (ghc-prim-0.5.3:GHC.Prim.State#
                  ghc-prim-0.5.3:GHC.Prim.RealWorld
                -> (# ghc-prim-0.5.3:GHC.Prim.State#
                        ghc-prim-0.5.3:GHC.Prim.RealWorld,
                      () #))
               ~R# IO ())




==================== SpecConstr ====================
Result size of SpecConstr
  = {terms: 39, types: 25, coercions: 4, joins: 0/0}

-- RHS size: {terms: 4, types: 1, coercions: 1, joins: 0/0}
v [InlPrag=NOINLINE] :: V3 Float
[LclId, Str=m12]
v = Algebra.Linear.V3.V3f
      @ Float
      @~ (<Float>_N :: Float ghc-prim-0.5.3:GHC.Prim.~# Float)
      1.0#
      2.0#
      3.0#

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IF :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId]
$trModule_s3IF = "main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IG :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId, Str=m1]
$trModule_s3IG = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IF

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
$trModule_s3IH :: ghc-prim-0.5.3:GHC.Prim.Addr#
[LclId]
$trModule_s3IH = "Main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
$trModule_s3II :: ghc-prim-0.5.3:GHC.Types.TrName
[LclId, Str=m1]
$trModule_s3II = ghc-prim-0.5.3:GHC.Types.TrNameS $trModule_s3IH

-- RHS size: {terms: 3, types: 0, coercions: 0, joins: 0/0}
Main.$trModule :: ghc-prim-0.5.3:GHC.Types.Module
[LclIdX, Str=m]
Main.$trModule
  = ghc-prim-0.5.3:GHC.Types.Module $trModule_s3IG $trModule_s3II

-- RHS size: {terms: 9, types: 1, coercions: 0, joins: 0/0}
main_s3Lj :: String
[LclId]
main_s3Lj
  = GHC.Float.$w$sshowSignedFloat1
      GHC.Float.$fShowFloat2
      GHC.Float.$fRealFracFloat3
      (ghc-prim-0.5.3:GHC.Prim.plusFloat#
         (ghc-prim-0.5.3:GHC.Prim.plusFloat# 1.0# 2.0#) 3.0#)
      (ghc-prim-0.5.3:GHC.Types.[] @ Char)

-- RHS size: {terms: 4, types: 0, coercions: 0, joins: 0/0}
main :: IO ()
[LclIdX, Arity=1]
main
  = GHC.IO.Handle.Text.hPutStr'
      GHC.IO.Handle.FD.stdout main_s3Lj ghc-prim-0.5.3:GHC.Types.True

-- RHS size: {terms: 2, types: 1, coercions: 0, joins: 0/0}
main_s4Dw
  :: ghc-prim-0.5.3:GHC.Prim.State# ghc-prim-0.5.3:GHC.Prim.RealWorld
     -> (# ghc-prim-0.5.3:GHC.Prim.State#
             ghc-prim-0.5.3:GHC.Prim.RealWorld,
           () #)
[LclId, Arity=1]
main_s4Dw = GHC.TopHandler.runMainIO1 @ () main

-- RHS size: {terms: 1, types: 0, coercions: 3, joins: 0/0}
:Main.main :: IO ()
[LclIdX,
 Arity=1,
 Unf=Unf{Src=InlineStable, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True,
         Guidance=ALWAYS_IF(arity=0,unsat_ok=True,boring_ok=True)
         Tmpl= main_s4Dw
               `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
                       :: (ghc-prim-0.5.3:GHC.Prim.State#
                             ghc-prim-0.5.3:GHC.Prim.RealWorld
                           -> (# ghc-prim-0.5.3:GHC.Prim.State#
                                   ghc-prim-0.5.3:GHC.Prim.RealWorld,
                                 () #))
                          ~R# IO ())}]
:Main.main
  = main_s4Dw
    `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
            :: (ghc-prim-0.5.3:GHC.Prim.State#
                  ghc-prim-0.5.3:GHC.Prim.RealWorld
                -> (# ghc-prim-0.5.3:GHC.Prim.State#
                        ghc-prim-0.5.3:GHC.Prim.RealWorld,
                      () #))
               ~R# IO ())



Rule fired: plusFloat# (BUILTIN)
Rule fired: plusFloat# (BUILTIN)

==================== Tidy Core ====================
Result size of Tidy Core
  = {terms: 30, types: 22, coercions: 3, joins: 0/0}

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
Main.$trModule4 :: ghc-prim-0.5.3:GHC.Prim.Addr#
[GblId,
 Caf=NoCafRefs,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
Main.$trModule4 = "main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
Main.$trModule3 :: ghc-prim-0.5.3:GHC.Types.TrName
[GblId,
 Caf=NoCafRefs,
 Str=m1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
Main.$trModule3 = ghc-prim-0.5.3:GHC.Types.TrNameS Main.$trModule4

-- RHS size: {terms: 1, types: 0, coercions: 0, joins: 0/0}
Main.$trModule2 :: ghc-prim-0.5.3:GHC.Prim.Addr#
[GblId,
 Caf=NoCafRefs,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 0}]
Main.$trModule2 = "Main"#

-- RHS size: {terms: 2, types: 0, coercions: 0, joins: 0/0}
Main.$trModule1 :: ghc-prim-0.5.3:GHC.Types.TrName
[GblId,
 Caf=NoCafRefs,
 Str=m1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 20}]
Main.$trModule1 = ghc-prim-0.5.3:GHC.Types.TrNameS Main.$trModule2

-- RHS size: {terms: 3, types: 0, coercions: 0, joins: 0/0}
Main.$trModule :: ghc-prim-0.5.3:GHC.Types.Module
[GblId,
 Caf=NoCafRefs,
 Str=m,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 10 30}]
Main.$trModule
  = ghc-prim-0.5.3:GHC.Types.Module Main.$trModule3 Main.$trModule1

-- RHS size: {terms: 5, types: 1, coercions: 0, joins: 0/0}
Main.main1 :: String
[GblId,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=False, ConLike=False,
         WorkFree=False, Expandable=False, Guidance=IF_ARGS [] 50 0}]
Main.main1
  = GHC.Float.$w$sshowSignedFloat1
      GHC.Float.$fShowFloat2
      GHC.Float.$fRealFracFloat3
      6.0#
      (ghc-prim-0.5.3:GHC.Types.[] @ Char)

-- RHS size: {terms: 4, types: 0, coercions: 0, joins: 0/0}
main :: IO ()
[GblId,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 40 60}]
main
  = GHC.IO.Handle.Text.hPutStr'
      GHC.IO.Handle.FD.stdout Main.main1 ghc-prim-0.5.3:GHC.Types.True

-- RHS size: {terms: 2, types: 1, coercions: 0, joins: 0/0}
Main.main2
  :: ghc-prim-0.5.3:GHC.Prim.State# ghc-prim-0.5.3:GHC.Prim.RealWorld
     -> (# ghc-prim-0.5.3:GHC.Prim.State#
             ghc-prim-0.5.3:GHC.Prim.RealWorld,
           () #)
[GblId,
 Arity=1,
 Unf=Unf{Src=<vanilla>, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True, Guidance=IF_ARGS [] 20 60}]
Main.main2 = GHC.TopHandler.runMainIO1 @ () main

-- RHS size: {terms: 1, types: 0, coercions: 3, joins: 0/0}
:Main.main :: IO ()
[GblId,
 Arity=1,
 Unf=Unf{Src=InlineStable, TopLvl=True, Value=True, ConLike=True,
         WorkFree=True, Expandable=True,
         Guidance=ALWAYS_IF(arity=0,unsat_ok=True,boring_ok=True)
         Tmpl= Main.main2
               `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
                       :: (ghc-prim-0.5.3:GHC.Prim.State#
                             ghc-prim-0.5.3:GHC.Prim.RealWorld
                           -> (# ghc-prim-0.5.3:GHC.Prim.State#
                                   ghc-prim-0.5.3:GHC.Prim.RealWorld,
                                 () #))
                          ~R# IO ())}]
:Main.main
  = Main.main2
    `cast` (Sym (ghc-prim-0.5.3:GHC.Types.N:IO[0] <()>_R)
            :: (ghc-prim-0.5.3:GHC.Prim.State#
                  ghc-prim-0.5.3:GHC.Prim.RealWorld
                -> (# ghc-prim-0.5.3:GHC.Prim.State#
                        ghc-prim-0.5.3:GHC.Prim.RealWorld,
                      () #))
               ~R# IO ())

