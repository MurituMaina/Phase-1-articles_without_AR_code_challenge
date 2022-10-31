# Please copy/paste all three classes into this file to submit your solution!

# article.rb

class Article
  attr_reader :author, :magazine, :title
  @@articles = []

  def initialize(author, magazine, title)
    @author = author
    @magazine = magazine
    @title = title
    @@articles << self
  end

  def self.all
    @@articles
  end

  def magazine
    @magazine
  end
end

# author.rb
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

# magazine.rb

class Magazine
  attr_accessor :name, :category

  @@magazines = []

  def initialize(name, category)
    @name = name
    @category = category
    @@magazines << { :name => "#{name}", :category => "#{category}" }
  end

  def self.all
    @@magazines
  end

  def magazine_contributors
    Article.all.select { |article|
      article.magazine == @name
    }
  end

  def contributors
    contributors = []
    magazine_contributors.map { |article|
      article.author
    }.uniq
  end

  def self.find_by_name(name)
    @@magazines.find(name) { |magazine| magazine[:name] == name }
  end

  def article_titles
    article_titles = []
    Article.all.map { |article|
      if article.magazine == self.name
        article_titles << article.title
      end
    }
    article_titles
  end

  def contributing_authors
    contributions = []

    authors = []
    magazine_contributors.select { |author|
      authors << author.author
    }
    authors.tally.select { |author, value|
      value > 2 && contributions << author
    }
    contributions
  end
end
