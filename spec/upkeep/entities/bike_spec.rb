RSpec.describe Bike do
  let(:name) { 'Bike name' }
  let(:type) { 'road' }

  subject { described_class.new(name: name, type: type) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:type) }

  it { expect(subject.type_name).to eq('Road Bike') }
end
