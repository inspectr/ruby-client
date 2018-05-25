require 'minitest/autorun'
require 'inspectr'

class InspectrTest < Minitest::Test
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
