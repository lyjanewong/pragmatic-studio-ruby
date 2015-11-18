require_relative 'playlist'

describe Playlist do

  before do
    @playlist = Playlist.new("Jennifer")
    $stdout = StringIO.new
  end

  it "has a name" do
    @playlist.name.should == "Jennifer"
  end

  it "adds 1 to the rank of the movie when the play function is called" do
    initial_rank = 0
    movie = Movie.new("Thor 2", initial_rank)
    @playlist.add_movie(movie)
    @playlist.play

    movie.rank.should == (initial_rank + 1)
  end

end