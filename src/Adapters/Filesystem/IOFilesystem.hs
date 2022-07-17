{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Adapters.Filesystem.IOFilesystem where
import Control.Monad.Except (MonadIO (liftIO))
import Filesystem
import System.Directory

newtype IOFileSystemT f a = IOFileSystemT (f a)
  deriving (Functor, Applicative, Monad, MonadIO)

instance MonadIO m => Filesystem (IOFileSystemT m) where
  readFile' = liftIO . readFile
  getDirContents = liftIO . getDirectoryContents
  readFiles = (=<<) (traverse readFile') . getDirContents