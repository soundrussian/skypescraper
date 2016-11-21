require "skypescraper/message"

module Skypescraper
  class Conversation
    attr_reader :id, :title

    def initialize(id, title)
      @id = id
      @title = title
    end

    PARTICIPANTS_QUERY = <<-SQL
      SELECT  p.identity AS identity,
              COALESCE(c.fullname, c.displayname, c.skypename, c.pstnnumber, '') AS name
         FROM participants AS p LEFT JOIN contacts AS c
         ON p.identity = c.skypename
         WHERE p.convo_id = ?
         ORDER BY name COLLATE NOCASE
    SQL
    def participants
      return @participants if @participants
      @participants = []
      Skypescraper::Extractor.connection.execute(PARTICIPANTS_QUERY, id) do |row|
        @participants << Skypescraper::Contact.new(*row)
      end
      @participants
    end

    # type = 61 is the ordinary message
    MESSAGES_QUERY = <<-SQL
      SELECT  m.author AS identity,
              m.body_xml AS text,
              m.type AS m_type,
              m.timestamp AS created_at
         FROM messages AS m
         WHERE m.convo_id = ? AND m.type = 61
         ORDER BY timestamp
    SQL
    def messages
      return @messages if @messages

      @messages = []
      Skypescraper::Extractor.connection.execute(MESSAGES_QUERY, id) do |row|
        messages << Skypescraper::Message.new(*row)
      end
      @messages
    end
  end
end