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

  context "when funding is more than or equal to target" do

    before do
      @project = Project.new("Project ABC", 1000, 1200)
    end

    it "is fully funded" do
      @project.should be_fully_funded
    end

    it "has reached its target" do
      @project.status.should == "Target Reached"
    end

  end 

  context "when funding is less than target" do

    before do
      @project = Project.new("Project ABC", 1000, 500)
    end

    it "is in progress" do
      @project.should_not be_fully_funded
    end

    it "has a 'Funding in Progress' status" do
      @project.status.should == "Funding in Progress"
    end

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