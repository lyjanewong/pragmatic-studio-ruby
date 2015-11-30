require_relative 'grant_project'

describe GrantProject do

  before do
    @initial_funds = 0
    @grant = GrantProject.new("Grant Project", 500, @initial_funds)
  end

  it "cannot have funds removed from it" do
    @grant.remove_funds

    @initial_funds.should == @initial_funds
  end

end
