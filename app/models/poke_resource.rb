class PokeResource
  include ActiveModel::Model

  attr_reader :data

  def initialize(id)
    @poke_id = id
    @uri = URI.parse('https://pokeapi.co')
    @data = nil
  end

  def pokemon_data
    response = Client.new.pokemon_response(@poke_id)
    begin
      response.value
    rescue StandardError => e
      errors.add(:base, '通信に失敗しました')
      Rails.logger.error e.full_message
    end

    return data_parse(response.body) if response.code == '200'

    false
  end

  def pokemon_jp_name
    response = Client.new.name_response(@poke_id)
    begin
      response.value
      JSON.parse(response.body)['names'].find { |name| name['language']['name'] == 'ja' }['name']
    rescue StandardError => e
      errors.add(:base, '通信に失敗しました')
      Rails.logger.error e.full_message
      false
    end
  end

  private

    def data_parse(data)
      @data = JSON.parse(data).deep_symbolize_keys
      true
    end
end
