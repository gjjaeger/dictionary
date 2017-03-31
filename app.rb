require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/definition')
  require('./lib/word')

  get('/') do
    @words=Word.all()
    erb(:index)
  end

  post('/newword') do
    word = params.fetch('word')
    Word.new(word).save()
    @words=Word.all()
    erb(:index)
  end

  get('/words/:id')do
    @word=Word.find(params.fetch('id').to_i)
    erb(:word)
  end

  get('/words/:id/definitions/new') do
    @word=Word.find(params.fetch('id').to_i)
    erb(:word_definition_form)
  end

  post('/newdefinition')do
    content=params.fetch('definition')
    @definition=Definition.new(content)
    @definition.save()
    @word=Word.find(params.fetch('word_id').to_i)
    @word.add_definition(@definition)
    erb(:success)
  end
