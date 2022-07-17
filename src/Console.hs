{-# LANGUAGE KindSignatures #-}

module Console where
  class Console (m :: * -> *) where
    out :: Show a => a -> m ()