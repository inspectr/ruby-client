require 'minitest/autorun'
require 'inspectr'

class InspectrTest < Minitest::Test

  describe 'client' do
    mock = Minitest::Mock.new

    before do
      Aws::SQS::Client.stubs(:new).returns(mock)
    end

    describe '.client' do
      it 'returns a Client' do
        Inspectr.client.is_a?(Inspectr::Client).must_equal(true)
      end
    end
  end

  describe '.configuration' do
    it 'returns a Config' do
      Inspectr.configuration.is_a?(Inspectr::Config).must_equal(true)
    end
  end

  describe '.stringify_message' do
    let(:msg_hash) do
      {
        actor: 1234,
        actorMetadata: {},
        target: '4321',
        targetMetadata: {},
        origin: 'origin',
        event: 'event',
        timestamp: 123456789
      }
    end

    let(:result) do
      {
        actor: '1234',
        actorMetadata: {},
        target: '4321',
        targetMetadata: {},
        origin: 'origin',
        event: 'event',
        timestamp: 123456789
      }
    end

    it 'returns a stringified message' do
      Inspectr.stringify_message(msg_hash).must_equal(result)
    end
  end
end
