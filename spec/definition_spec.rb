require('rspec')
  require('definition')

  describe('Definition') do
    before() do
      Definition.clear()
    end

    describe(".find") do
      it("returns a definition by its id number") do
        test_definition = Definition.new("furniture item")
        test_definition.save()
        test_definition2 = Definition.new("Another furniture item")
        test_definition2.save()
        expect(Definition.find(test_definition.id())).to(eq(test_definition))
      end
    end
  end
