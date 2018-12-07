equire 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it {should belong_to(:book)}
  end
end
