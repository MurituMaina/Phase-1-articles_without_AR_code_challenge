require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

jack = Author.new("Jack")
mike = Author.new("Michael")
tom = Author.new("Tom")



magazine_1 = Magazine.new("Congrats", "sucess")
magazine_2 = Magazine.new("Avocados", "Fruits")
magazine_3 = Magazine.new("Beans", "Cereals")


article_1 = Article.new(tom.name, magazine_1.name, "Great success!")
article_2 = Article.new(tom.name, magazine_1.name, " Life of Success ")
article_3 = Article.new(jack.name, magazine_1.name, " Coding for Success")
article_4 = Article.new(tom.name, magazine_1.name, " Success as a Journey")
article_5 = Article.new(jack.name, magazine_2.name, " Benefits of Avocados ")
article_6 = Article.new(mike.name, magazine_2.name, " History of Avocados ")



tom.add_article( magazine_3.name, "Cereals benefits")



Magazine.find_by_name(magazine_1.name)




### DO NOT REMOVE THIS
binding.pry

0
