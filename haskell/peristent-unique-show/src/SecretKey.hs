{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
module SecretKey where

import Control.Monad ((<=<))
import Crypto.Error
import qualified Crypto.PubKey.Ed25519 as Ed25519
import Data.Bifunctor (bimap)
import Data.ByteArray (convert)
import Data.ByteString
import Data.Proxy
import Data.Text as T
import Database.Persist
import Database.Persist.Sql


newtype SecretKey = SecretKey { unSecretKey :: Ed25519.SecretKey }

instance PersistFieldSql SecretKey where
  sqlType _ = sqlType (Proxy :: Proxy ByteString)

instance Show SecretKey where
  show _ = "BOGUS"

instance PersistField SecretKey where
  toPersistValue = toPersistValue @ByteString . convert . unSecretKey
  fromPersistValue =
    bimap toTextError SecretKey . eitherCryptoError . Ed25519.secretKey <=<
    fromPersistValue @ByteString
    where
      toTextError err =
        "Error deserializing SecretKey blob: " <> T.pack (show err)

