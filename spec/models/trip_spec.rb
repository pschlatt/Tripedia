require 'rails_helper'

RSpec.describe Trip do
  it { should validate_presence_of :origin }
  it { should validate_presence_of :destination }
  it { should belong_to(:user)}
end
