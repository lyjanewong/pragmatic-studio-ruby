require_relative 'fundstarter'

describe FundStarter do
  
  before do
    @fundstarter = FundStarter.new("VC-Friendly Start-up Projects")
    $stdout = StringIO.new
  end

  it "has a title" do
    @fundstarter.title.should == "VC-Friendly Start-up Projects"
  end

  it "adds $25, removes $15, then adds $25 to the project's current funds when the request_funding method is called" do
    initial_funds = 25
    project = Project.new("Project ABC", 75, initial_funds)
    @fundstarter.add_project(project)
    @fundstarter.request_funding

    project.funds.should == (initial_funds + 25 - 15 + 25)

  end

end



