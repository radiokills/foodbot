class MaliceUtil < Base
  def initialize(query)
    @query = query
  end

  def respond
    unless @query.empty?
      post_to_slack("Command #{@query} is not yet implemented")
    else
      post_to_slack("You can use foodbot with following params: pizzapub, wtc, pauza, all")
    end
  end
end
