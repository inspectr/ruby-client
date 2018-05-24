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
end
