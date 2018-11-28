require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  erb(:home)
end

post('/start') do
  name = params["name"]
  @tamagotchi = Tamagotchi.new(name)
  erb(:alive)
end

post('/feed') do
  @tamagotchi = Tamagotchi.fetch_existing
  @tamagotchi.add_time
  if(@tamagotchi.check_live)
    @tamagotchi.feed
    erb(:alive)
  else
    erb(:dead)
  end
end

post('/play') do
  @tamagotchi = Tamagotchi.fetch_existing
  @tamagotchi.add_time
  if(@tamagotchi.check_live)
    @tamagotchi.play
    erb(:alive)
  else
    erb(:dead)
  end
end

post('/rest') do
  @tamagotchi = Tamagotchi.fetch_existing
  @tamagotchi.add_time
  if(@tamagotchi.check_live)
    @tamagotchi.rest
    erb(:alive)
  else
    erb(:dead)
  end
end
