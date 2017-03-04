class Bike < Hanami::Entity
  TYPES = {
    'road'       => 'Road Bike',
    'mountain'   => 'Montain Bike',
    'time_trial' => 'Time Trial Bike',
    'cross'      => 'Cross Bike'
  }

  def type_name
    TYPES[type]
  end
end
