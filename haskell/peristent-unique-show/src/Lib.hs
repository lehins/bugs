{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
module Lib where

import Database.Persist
import Database.Persist.TH
import SecretKey

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
MySecretTable
  secretKey SecretKey
  UnqueSecretKey secretKey
|]
