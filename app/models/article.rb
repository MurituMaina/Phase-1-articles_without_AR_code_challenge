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
