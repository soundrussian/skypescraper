require "sqlite3"
require "skypescraper/contact"
require "skypescraper/conversation"

module Skypescraper
  class Extractor
    class << self
      def connection=(db)
        @db = db
      end

      def connection
        raise 'You must establish a connection by calling Skypescraper::Extractor.new first' unless @db
        @db
      end
    end

    def initialize(database)
      self.class.connection = SQLite3::Database.new(database)
    end

    def connection
      self.class.connection
    end

    CONVERSATIONS_SQL = <<-SQL
      SELECT id, COALESCE(displayname, meta_topic, identity) AS title
             FROM conversations
             WHERE id IN (
                SELECT  DISTINCT(convo_id)
                        FROM participants
                        WHERE identity = ?
             )
             ORDER BY last_activity_timestamp DESC
    SQL
    def conversations_for(identity)
      return @conversations[identity] if @conversations && @conversations[identity]

      @conversations ||= {}
      @conversations[identity] = []

      connection.execute(CONVERSATIONS_SQL, identity) do |row|
        @conversations[identity] << Skypescraper::Conversation.new(*row)
      end

      @conversations[identity]
    end
  end
end