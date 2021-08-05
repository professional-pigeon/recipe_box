require 'rails_helper'

describe Recipe do
  it { should have_and_belong_to_many :tags}
  it { should have_many(:ingredients) }
  it { should have_many(:instructions) }
end
