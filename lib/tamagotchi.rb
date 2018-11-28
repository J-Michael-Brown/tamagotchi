class Tamagotchi
  attr_reader :name,:hunger,:exhaustion,:boredom, :birth_time
  def initialize(name, time = Time.now)
    @name = name
    @hunger = 0
    @exhaustion = 0
    @boredom = 0
    @birth_time = time
    @last_update_time = time
    @alive = true
    @@tamagotchi = self
  end
  def add_time(time = Time.now)
    time_difference = time > @last_update_time ? time - @last_update_time : 0
    @hunger += time_difference
    @exhaustion += time_difference
    @boredom += time_difference
    @last_update_time = time
  end
  def check_live
    @alive = (@hunger < 100) & (@exhaustion < 100) & (@boredom < 100)
  end
  def rest(amount = @exhaustion)
    @exhaustion -= amount
  end
  def feed(amount = @hunger)
    @hunger -= amount
  end
  def play(amount = @boredom)
    @boredom -= amount
  end
  def self.fetch_existing
    @@tamagotchi
  end
end
