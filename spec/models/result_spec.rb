require 'rails_helper'

RSpec.describe Result, type: :model do
  it { should validate_presence_of(:student_name) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:submitted_at) }
  it { should validate_presence_of(:marks) }
  it { should validate_numericality_of(:marks).only_integer.is_greater_than_or_equal_to(0) }
end
