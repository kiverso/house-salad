require 'rails_helper'

RSpec.describe PropublicaService do
  describe 'instance methods' do
    it 'members_of_house' do
      service = PropublicaService.new
      search = service.members_of_house("CO")
      expect(search).to be_a Hash
      expect(search[:results]).to be_an Array
      member_data = search[:results].first

      expect(member_data).to have_key :name
      expect(member_data).to have_key :role
      expect(member_data).to have_key :district
      expect(member_data).to have_key :party
    end
  end
end
  