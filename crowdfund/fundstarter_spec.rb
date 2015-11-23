require_relative 'fundstarter'
require_relative 'die'

describe FundStarter do
  
  before do
    @fundstarter = FundStarter.new("VC-Friendly Start-up Projects")
    $stdout = StringIO.new

    @initial_funds = 500
    @project = Project.new("Project ABC", 1000, @initial_funds)

    @fundstarter.add_project(@project)
  end

  it "has a title" do
    @fundstarter.title.should == "VC-Friendly Start-up Projects"
  end

  it "adds funds to a project if an even number is rolled" do
    Die.any_instance.stub(:roll).and_return(4)
    @fundstarter.request_funding

    @project.funds.should == @initial_funds + 25
  end

  it "removes funds from a project if an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(1)
    @fundstarter.request_funding

    @project.funds.should == @initial_funds - 15
  end

end


## TBD - Having problems trying to create a conditional that works.
## Tried slotting if @funds == 0 condition into case block but having issues.
## Come back to this later!
##
#  context "there are no initial funds" do
#
#    before do
#      @fundstarter = FundStarter.new("VC-Friendly Start-up Projects")
#      
#      @initial_funds = 0
#      @project = Project.new("Project ABC", 1000, @initial_funds)
#
#      @fundstarter.add_project(@project)
#    end
#    
#    it "does not remove funds if initial funds is equal to zero" do
#      Die.any_instance.stub(:roll).and_return(1)
#      @fundstarter.request_funding
#
#      @project.funds.should == @initial_funds
#    end
#
#  end



