require 'rails_helper'

describe Project do
  it { should validate_presence_of :title }
  it { should have_many :comments }
end
