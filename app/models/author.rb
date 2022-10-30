class Author
  attr_accessor :name, :articles, :magazines

  def initialize(name)
    @name = name
  end

  def articles
    Article.all.filter { |article| article.author == self.name }
  end

  def magazines
    articles.uniq
  end

  def add_article(magazine, title)
    Magazine.new(magazine, title) && Article.new(@name, magazine, title)
  end

  def topic_areas
    topics = []
    Magazine.all.filter { |magazined|
      magazines.select { |magazine|
        magazined[:name]
        if magazined[:name] == magazine.magazine
          topics << magazined[:category]
        else
          "No Magazines"
        end
      }
    }
    topics.uniq
  end
end
