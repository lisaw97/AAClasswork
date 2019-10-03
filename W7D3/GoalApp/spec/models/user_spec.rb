require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: 'jack1', password: '123456') }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

end
