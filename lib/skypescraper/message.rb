require 'date'

module Skypescraper
  class Message
    attr_reader :id, :identity, :text, :type, :created_at

    def initialize(identity, text, type, created_at)
      @identity = identity
      @text = text
      @type = type
      @created_at = DateTime.strptime(created_at.to_s, '%s')
    end
  end
end