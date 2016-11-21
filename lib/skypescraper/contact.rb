module Skypescraper
  class Contact
    attr_reader :identity, :name

    def initialize(identity, name)
      @identity = identity
      @name = name
    end
  end
end