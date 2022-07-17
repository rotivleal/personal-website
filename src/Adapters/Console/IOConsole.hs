{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Adapters.Console.IOConsole where
import Control.Monad.Cont
import Console

newtype IOConsoleT f a = IOConsoleT (f a)
  deriving (Functor, Applicative, Monad, MonadIO)

instance MonadIO m => Console (IOConsoleT m) where
  out = liftIO . print