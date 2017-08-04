require 'rails_helper'

describe Comment do
  it { should validate_presence_of :review }
  it { should belong_to :project }
end
