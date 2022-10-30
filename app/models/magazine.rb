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
    # Magazine.all.find(name){|magazine| magazine[:name] == name}
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
