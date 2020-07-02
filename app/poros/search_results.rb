class SearchResults

  def members(state)

    json = PropublicaService.new.members_of_house(state)
    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end

end