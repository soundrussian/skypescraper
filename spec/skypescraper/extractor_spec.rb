require 'spec_helper'

describe Skypescraper::Extractor do
  let(:extractor) { Skypescraper::Extractor.new('./spec/fixtures/main.db') }

  it 'is initialized with a Skype database' do
    expect(extractor.class.connection).to be_a_kind_of(SQLite3::Database)
  end

  describe '.conversations_for' do
    it 'fetches conversations where the given identity took part' do
      result = extractor.conversations_for('pavel.nosov87')
      group_chat = result.first

      expect(result.size).to eq(1)
      expect(group_chat).to be_a Skypescraper::Conversation
      expect(group_chat.id).to eq(6654)
      expect(group_chat.title).to eq('Test conversation')
    end
  end
end