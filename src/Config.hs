module Config where
import Control.Lens (Getter)
import Control.Lens.Getter (to)

data Config = Config
  { articlesPath :: FilePath
  , somethingPath :: FilePath
  }

class HasArticlesPath e where
  articlesPath' :: Getter e FilePath

instance HasArticlesPath Config where
  articlesPath' = to articlesPath