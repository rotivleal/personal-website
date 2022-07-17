module MyLib (program) where

import Control.Monad.IO.Class (MonadIO (liftIO))
import ArticleStore
import Console

program :: (Monad m, Console m, ArticleStore m) => m ()
program = do
  out "loading articles..."
  articles <- getArticles
  out "loaded articles"
  pure ()