class Hooloo::Company < Hooloo::MozartHash
  def self.list(args={})
    Hooloo.request('companies', args)['data'].map { |x| new x['company'] }
  end
end
