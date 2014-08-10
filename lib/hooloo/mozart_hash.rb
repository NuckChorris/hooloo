class Hooloo::MozartHash
  class << self
    def field_mapping(fields)
      fields = [fields] unless fields.is_a? Array
      fields.map do |field|
        if field.is_a?(Hash)
          arr = field.to_a[0]
          [arr[0], arr[1].to_s]
        else
          [field, field.to_s]
        end
      end
    end
    def date(*mappings)
      field_mapping(mappings).each do |field, mapping|
        define_method(field) { Date.iso8601(@obj[mapping.to_s]) }
      end
    end
    def bool(*mappings)
      field_mapping(mappings).each do |field, mapping|
        define_method(field.to_s + '?') { @obj[mapping] }
      end
    end
    def cast(klass, mappings, opts={map_array: true, map: false})
      field_mapping(mappings).each do |field, mapping|
        define_method(field) do
          if opts[:map] || (@obj[mapping].is_a?(Array) && opts[:map_array])
            @obj[mapping].map { |x| klass.new(x) }
          else
            klass.new @obj[mapping]
          end
        end
      end
    end
    private :field_mapping
  end
  def initialize(o)
    @obj = o
  end
  # Honestly, we should generate methods when we initially parse the Hash
  # instead of doing this crap in method_missing.  I'll do that later.
  def method_missing(method)
    @obj[method.to_s]
  end
  def respond_to?(method)
    @obj.has_key? method.to_s or super
  end
  def inspect
    "#<%s:%014x>" % [self.class.name, object_id]
  end
end
