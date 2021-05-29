require 'spec_helper'

describe ElloProtobufs do
  describe '.load_protobuf_factories' do
    it 'loads the protobuf factories provided by the gem' do
      FactoryBot.factories.clear
      FactoryBot.sequences.clear
      ElloProtobufs.load_protobuf_factories

      expect(FactoryBot.factories.find(:protobuf_user)).to_not be_nil
      expect(FactoryBot.factories.find(:protobuf_post)).to_not be_nil
    end
  end

  it 'has a version number' do
    expect(ElloProtobufs::VERSION).not_to be nil
  end
end
