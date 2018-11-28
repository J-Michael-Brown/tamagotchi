require('capybara/rspec')
require('./app')
require('pry')
require('tamagotchi')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('website', {:type => :feature}) do
  it('allows you to name a tamagotchi') do
    visit('/')
    fill_in('name', :with => 'spider')
    click_button('Begin Tamagotchi!')
    expect(page).to have_content('Name: spider')
  end
  it('allows you to feed your tamagotchi') do
    visit('/')
    fill_in('name', :with => 'spider')
    click_button('Begin Tamagotchi!')
    click_button('feed')
    expect(page).to have_content('Hunger: 0')
  end
  it('allows you to put your tamagotchi to sleep') do
    visit('/')
    fill_in('name', :with => 'spider')
    click_button('Begin Tamagotchi!')
    click_button('rest')
    expect(page).to have_content('Exhaustion: 0')
  end
  it('allows you to play with your tamagotchi') do
    visit('/')
    fill_in('name', :with => 'spider')
    click_button('Begin Tamagotchi!')
    click_button('play')
    expect(page).to have_content('Boredom: 0')
  end
  it('allows your tamagotchi to die if you neglect it') do
    visit('/')
    fill_in('name', :with => 'spider')
    click_button('Begin Tamagotchi!')
    tamagotchi = Tamagotchi.fetch_existing
    tamagotchi.add_time(Time.now + 100)
    click_button('play')
    expect(page).to have_content('Your tamagotchi is already dead.')
  end
end
