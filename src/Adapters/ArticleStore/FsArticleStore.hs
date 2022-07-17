{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE UndecidableInstances #-}

module Adapters.ArticleStore.FsArticleStore where
import ArticleStore
import Filesystem
import Control.Monad.RWS ( MonadIO, MonadReader )
import Config
import Control.Lens (view)

newtype FsArticleStoreT f a = FsArticleStoreT (f a)
  deriving (Functor, Monad, Applicative, Filesystem, MonadReader r)

instance (Filesystem m, MonadReader r m, HasArticlesPath r) => ArticleStore (FsArticleStoreT m) where
  getArticles = do
    path  <- view articlesPath'
    files <- readFiles path
    pure []