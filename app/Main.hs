{-# LANGUAGE DerivingVia #-}
module Main where

import MyLib (program)
import Config
import Control.Monad.IO.Class
import Control.Monad.Reader
import Console
import Adapters.Console.IOConsole (IOConsoleT(IOConsoleT))
import Filesystem (Filesystem)
import Adapters.Filesystem.IOFilesystem (IOFileSystemT(IOFileSystemT))
import ArticleStore (ArticleStore)
import Adapters.ArticleStore.FsArticleStore (FsArticleStoreT(FsArticleStoreT))

newtype App a = App { runApp :: Config -> IO a }
  deriving (Functor, Applicative, Monad, MonadIO, MonadReader Config)
    via ReaderT Config IO
  deriving Console
    via IOConsoleT App
  deriving Filesystem
    via IOFileSystemT App
  deriving ArticleStore
    via FsArticleStoreT App

app :: App ()
app = program

main :: IO ()
main = do
  print "hello world"
  runApp app cfg
  where
    cfg :: Config
    cfg = Config "articles/" ""