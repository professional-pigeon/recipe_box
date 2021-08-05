require 'rails_helper'

describe Instruction do
  it { should belong_to(:recipe) }
end