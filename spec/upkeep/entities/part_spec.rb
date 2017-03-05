RSpec.describe Part do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:type_id) }
end
