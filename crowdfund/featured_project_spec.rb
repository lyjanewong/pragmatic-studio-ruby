require_relative 'featured_project'
require_relative 'pledge_pool'

describe FeaturedProject do

  before do
    @current_funds = 0
    @featured = FeaturedProject.new("Featured", 200, @current_funds)
  end

  it "met half its target" do
    @featured.add_funds

    @featured.funds == (@current_funds + 25)

    @featured.pledge_amount(Pledge.new(:gold, 200))

    @featured.total_pledge_amount.should == 200

    @featured.total_funds == (@current_funds + @featured.total_pledge_amount)

    @featured.total_funds.should ==  225

    @featured.should be_met_half_its_target
  end

  it "double funds received when add_funds is called if the project reaches or exceeds the target" do
    6.times { @featured.add_funds }

    @featured.funds.should == ((25 * 4) + (50 * 2))
  end
  
end
