require 'spec_helper'

describe Urkel do
  it 'has a version number' do
    expect(Urkel::VERSION).not_to be nil
  end

  describe ".oops" do
    it 'publishes a new error' do
      Urkel.configure do |configuration|
        configuration.api_host = 'http://localhost:3000'
        configuration.api_key = '02513a35-b875-40a1-a1fc-f2d2582bdcc5'
      end
      Urkel.oops(error)
    end
  end
end
