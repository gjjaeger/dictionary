class Word
  @@words = []

  def initialize(word)
    @word = word
    @id=@@words.length().+1
    @definitions=[]
  end

  attr_reader(:word, :id, :definitions)

  def self.all()
    @@words
  end

  def save()
    @@words.push(self)
  end

  def self.clear()
    @@words=[]
  end

  def self.find(idToBeFound)
    found_word = nil
    @@words.each() do |word|
      if word.id() == idToBeFound.to_i
        found_word=word
      end
    end
    found_word
  end

  def add_definition(definition)
    @definitions.push(definition)
  end
end
