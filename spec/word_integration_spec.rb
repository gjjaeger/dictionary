require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('adding a word path', {:type => :feature}) do
    it('takes user entry and saves the word') do
      visit('/')
      fill_in('word', :with => 'hello')
      click_button('Add word')
      expect(page).to have_content('hello')
    end
  end

  describe('clicking on a word path', {:type => :feature}) do
    it('routes user to clicked on word') do
      visit('/')
      fill_in('word', :with => 'hello2')
      click_button('Add word')
      click_link('hello2')
      expect(page).to have_content('Here are all the definitions')
    end
  end
