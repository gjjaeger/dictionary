class Definition
  @@definitions = []

  def initialize(content)
    @content=content
    @id=@@definitions.length().+(1)
  end

  attr_reader(:content,:id)

  def self.clear()
    @@definitions=[]
  end

  def save()
    @@definitions.push(self)
  end

  def self.all()
    @@definitions
  end

  def self.find(idToBeFound)
    found_definition=nil
    @@definitions.each() do |definition|
      if definition.id()==idToBeFound.to_i
        found_definition=definition
      end
    end
    found_definition
  end
end
