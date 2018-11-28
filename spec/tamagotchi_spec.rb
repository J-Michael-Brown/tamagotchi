require ('tamagotchi')
require ('rspec')

describe("Tamagotchi") do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagothchi") do
      my_pet = Tamagotchi.new("puppo")
      expect(my_pet.name).to(eq("puppo"))
      expect(my_pet.hunger).to(eq(0))
      expect(my_pet.exhaustion).to(eq(0))
      expect(my_pet.boredom).to(eq(0))
      expect((my_pet.birth_time).to_i > 0).to(eq(true))
    end
  end
  describe("#add_time") do
    it("adds passed time to tamagotchi's status bars") do
      my_pet = Tamagotchi.new("puppo", Time.at(0))
      my_pet.add_time(Time.at(50))
      expect(my_pet.hunger).to(eq(50))
      expect(my_pet.exhaustion).to(eq(50))
      expect(my_pet.boredom).to(eq(50))
    end
  end
  describe("#check_live") do
    it("checks whether your tamagotchi has been neglected and died") do
      my_pet = Tamagotchi.new("spider", Time.at(0))
      expect(my_pet.check_live).to(eq(true))
      my_pet.add_time(Time.at(100))
      expect(my_pet.check_live).to(eq(false))
    end
  end
  describe("#feed") do
    it("decreases hunger level") do
      my_pet = Tamagotchi.new("spud", Time.at(0))
      my_pet.add_time(Time.at(50))
      expect(my_pet.feed(0)).to(eq(50))
      expect(my_pet.feed(34)).to(eq(16))
      expect(my_pet.feed()).to(eq(0))
    end
  end
  describe("#play") do
    it("decreases boredom level") do
      my_pet = Tamagotchi.new("spud", Time.at(0))
      my_pet.add_time(Time.at(50))
      expect(my_pet.play(0)).to(eq(50))
      expect(my_pet.play(29)).to(eq(21))
      expect(my_pet.play()).to(eq(0))
    end
  end
  describe("#rest") do
    it("decreases exhaustion level") do
      my_pet = Tamagotchi.new("spud", Time.at(0))
      my_pet.add_time(Time.at(50))
      expect(my_pet.rest(0)).to(eq(50))
      expect(my_pet.rest(7)).to(eq(43))
      expect(my_pet.rest()).to(eq(0))
    end
  end
end
