class Pokemon
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serializers::JSON

  attr_accessor :id, :image, :name
  attribute :id, :string
  attribute :image, :string
  attribute :name, :string

  def initialize(id)
    @id = id
  end

  def fetch
    poke = PokeResource.new(@id)
    if poke.get_pokemon_data
      @image = poke.data[:sprites][:other][:'official-artwork'][:front_default]
      @name = poke.get_pokemon_jp_name
    else
      false
    end
  end

end
