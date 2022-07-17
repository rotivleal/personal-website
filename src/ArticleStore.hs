module ArticleStore where
import Article

class ArticleStore m where
  getArticles :: m [Article]