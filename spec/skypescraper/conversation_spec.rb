require 'spec_helper'

describe Skypescraper::Conversation do
  before(:each) { Skypescraper::Extractor.new('./spec/fixtures/main.db') }
  let(:conversation) { Skypescraper::Conversation.new(6654, 'Test conversation') }

  describe '.participants' do
    it 'returns the list of participants' do
      participants = conversation.participants

      expect(participants.size).to eq(4)
      expect(participants.map(&:identity)).to match_array(['pavel.nosov87', 'john.doe', 'jane.doe', 'jim.doe'])
    end
  end

  describe '.messages' do
    it 'returns the conversation messages' do
      messages = conversation.messages
      last = messages.last
      first = messages.first

      expect(messages.size).to eq(22)

      expect(last.identity).to eq('john.doe')
      expect(last.text).to eq('Спасибо!')
      expect(last.created_at.to_date).to eq(Date.parse('2016-10-26'))

      expect(first.identity).to eq('pavel.nosov87')
      expect(first.text).to start_with('Приятного аппетита!')
      expect(first.created_at.to_date).to eq(Date.parse('2016-10-04'))
    end
  end
end