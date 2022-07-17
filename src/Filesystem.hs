{-# LANGUAGE KindSignatures #-}

module Filesystem where
  class Filesystem (m :: * -> *) where
    readFile' :: FilePath -> m String
    readFiles :: FilePath -> m [String]
    getDirContents :: FilePath -> m [FilePath]