require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it {should belong_to(:book)}
    it {should belong_to(:user)}

    it {should validate_presence_of(:title)}
  end

end
