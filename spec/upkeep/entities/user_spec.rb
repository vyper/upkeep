RSpec.describe User do
  it { is_expected.to respond_to(:firstname) }
  it { is_expected.to respond_to(:lastname) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:provider) }
  it { is_expected.to respond_to(:uid) }
  it { is_expected.to respond_to(:code) }
end
