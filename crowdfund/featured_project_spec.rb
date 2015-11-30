require_relative 'featured_project'

describe FeaturedProject do

  before do
    @initial_funds = 0
    @featured = FeaturedProject.new("Featured", 200, @initial_funds)
  end

  it "met half its target" do
    @featured.add_funds
    @featured.add_funds

    @featured.met_half_its_target?.should be_true
  end

  it "double funds received when add_funds is called if the project reaches or exceeds the target" do
    6.times { @featured.add_funds }

    @initial_funds.should == ((25 * 4) + (50 * 2))
  end
  
end
