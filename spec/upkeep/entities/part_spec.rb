RSpec.describe Part do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:type_id) }
  it { is_expected.to respond_to(:bike_id) }
end
