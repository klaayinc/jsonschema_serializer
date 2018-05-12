require 'json'

module JsonschemaSerializer
  class Builder
    class << self
      def build
        new.tap do |builder|
          yield(builder) if block_given?
        end
      end
    end

    attr_reader :schema

    def initialize
      @schema ||= {
        type: :object,
        properties: {}
      }
    end

    def to_json
      @schema.to_json
    end

    def title(title)
      @schema[:title] = title
    end

    def description(description)
      @schema[:description] = description
    end

    def required(*required)
      @schema[:required] = required
    end

    def properties
      @schema[:properties] ||= {}
    end

    def _object(**opts)
      { type: :object, properties: {} }.merge(opts).tap do |h|
        yield(h[:properties]) if block_given?
      end
    end

    [:boolean, :integer, :number, :string].each do |attr_type|
      define_method("_#{attr_type}") do |**opts|
        { type: attr_type }.merge(opts)
      end

      define_method(attr_type) do |name, **opts|
        {
          name => send("_#{attr_type}", **opts)
        }
      end
    end

    def array(name, items:, **opts)
      {
        name => { type: :array, items: items }.merge(opts)
      }
    end
  end
end
