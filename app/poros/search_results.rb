class SearchResults

  def members(state)
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['propublica_key']
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end

end