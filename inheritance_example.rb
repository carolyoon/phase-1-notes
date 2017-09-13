class Vehicle
  def initialize(args={})
    @color = args[:color]
    @wheels = args[:wheels]
  end

  def drive
    @status = :driving
  end

  def brake
    @status = :stopped
  end

  def needs_gas?
    @chances.sample
  end
end

vehicle = Vehicle.new({})
# p vehicle.drive
# p vehicle.brake

class Car < Vehicle

  def initialize(args={})
    super(args)
    @chances = [true,true,false]
    @wheels = 4
   end
end

p car = Car.new({color: "white"})
p car.drive
p car.brake
p car.needs_gas?

class Bus < Vehicle
  attr_reader :passengers
