require('rspec')
  require('definition')
  require('word')

  describe(Word)do
    before()do
      Word.clear()
    end

    describe('#word') do
      it("returns the word") do
        test_word = Word.new("table")
        expect(test_word.word()).to(eq("table"))
      end
    end

    describe("#save") do
      it("adds a word to the array of saved words") do
        test_word = Word.new("chair")
        test_word.save()
        expect(Word.all()).to(eq([test_word]))
      end
    end

    describe(".find") do
      it("returns a word by its id number") do
        test_word = Word.new("mug")
        test_word.save()
        test_word2 = Word.new("glass")
        test_word2.save()
        expect(Word.find(test_word.id())).to(eq(test_word))
      end
    end
  end
