require 'rails_helper'

describe User do
  describe '#twitter_client' do
    it 'assigns @client variable and returns the client' do
      expect(client = subject.send(:twitter_client)).not_to be_nil
      expect(subject.instance_variable_get(:@client)).to eq(client)
    end
  end
end
