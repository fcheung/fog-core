module Fog
  module Support
    def self.[](provider)
      new(:provider => provider)
    end

    def self.new(attributes)
      attributes = attributes.dup
      provider = attributes.delete(:provider).to_s.downcase.to_sym

      if provider == :stormondemand
        require 'fog/storm_on_demand/support'
        Fog::Support::StormOnDemand.new(attributes)
      else
        fail ArgumentError, "#{provider} has no support service"
      end
    end

    def self.providers
      Fog.services[:support]
    end
  end
end
