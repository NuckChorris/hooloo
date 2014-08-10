# Represents a publisher of videos on Hulu
class Hooloo::Company < Hooloo::MozartHash
  # Provides a list of all companies on Hulu
  #
  # @param args [Hash] (see Hooloo#request)
  def self.list(args={})
    Hooloo.request('companies', args)['data'].map { |x| new x['company'] }
  end
end
