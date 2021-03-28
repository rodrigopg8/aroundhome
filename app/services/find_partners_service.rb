class FindPartnersService
  attr_reader :material, :lat, :lon

  def initialize(material, lat, lon)
    @material = material
    @lat = lat
    @lon = lon
  end

  def call
    Partner.with_experience(material).within(lat, lon)
      .map { |p| { id: p.id, rating: p.rating, materials: p.materials } }
  end
end
