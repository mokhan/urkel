require 'spec_helper'

describe Urkel do
  it 'has a version number' do
    expect(Urkel::VERSION).not_to be nil
  end

  describe ".oops" do
    let(:error) { StandardError.new("Ooops... did i do that?") }

    it 'publishes a new error' do
      stub_request(:post, "http://localhost:3000/api/v1/failures").to_return(status: 200)
      Urkel.configure do |configuration|
        configuration.api_host = 'http://localhost:3000'
        configuration.api_key = '02513a35-b875-40a1-a1fc-f2d2582bdcc5'
      end
      expect(Urkel.oops(error)).to be_truthy
    end

    it 'raises an error when not configured' do
      Urkel.reset
      expect(-> { Urkel.oops(error) }).to raise_error(Urkel::InvalidConfigurationError)
    end
  end
end
