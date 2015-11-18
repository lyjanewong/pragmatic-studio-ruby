require_relative 'project'

describe Project do

  before do
    @current_funds = 100
    @project = Project.new("Project ABC", 1000, @current_funds)
    $stdout = StringIO.new
  end

  it "has an initial funding amount" do
    @project.target.should == 1000
  end

  it "computes the total funding outstanding as the target minus the current funds" do
    @project.funds_to_target.should == (1000 - @current_funds)
  end

  it "increases funds by 25 when funds are added" do
    @project.add_funds

    @project.funds.should == (@current_funds + 25)
  end

  it "decreasese funds by 15 when funds are removed" do
    @project.remove_funds

    @project.funds.should == (@current_funds - 15)
  end

  context "created without a specified funding amount" do

    before do
      @project = Project.new("Project ABC", 1000)
    end

    it "has a default value of 0 for funding amount" do
      @project.funds.should == 0
    end

  end
  
end