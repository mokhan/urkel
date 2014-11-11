require 'spec_helper'

module Urkel
  describe Connection do
    subject { Connection.new(configuration) }

    describe "#publish" do
      let(:hostname) { Socket.gethostname }
      let(:error_hash) do  
        { 
          "error"=> 
          { 
            "message" => error.message, 
            "hostname" => hostname, 
            "error_type" => error.class.name, 
            "backtrace" => error.backtrace
          } 
        } 
      end
      let(:error) do
        begin
          1/0
        rescue => error
          error
        end
      end

      context "given proper credentials" do
        let(:configuration) { Configuration.new('http://localhost:3000', '02513a35-b875-40a1-a1fc-f2d2582bdcc5') }

        it 'publishes a new error' do
          stub_request(:post, "http://localhost:3000/api/v1/failures")
            .with(body: error_hash, headers: { 'Authorization'=>'Token token=02513a35-b875-40a1-a1fc-f2d2582bdcc5' })
            .to_return(status: 200, body: "", headers: {})
          expect(subject.publish(error)).to be_truthy
          expect(subject.publish!(error)).to be_truthy
        end
      end

      context "when invalid credentials" do
        let(:configuration) { Configuration.new('http://localhost:3000', 'blah') }

        it 'raises a meaningful error' do
          stub_request(:post, "http://localhost:3000/api/v1/failures")
            .with(body: error_hash, headers: { 'Authorization' => 'Token token=blah' })
            .to_return(status: 401, body: "HTTP Token: Access denied.", headers: {})

          expect(subject.publish(error)).to be_falsey
          expect(-> { subject.publish!(error) }).to raise_error(InvalidAPITokenError)
        end
      end
    end
  end
end
