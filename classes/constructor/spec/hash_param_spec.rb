require_relative '../klass'

describe "hash param" do

  shared_examples "params" do |params|

    before(:each) do
      @instance = Klass.new(params)
    end

    it 'should have a duration' do
      @instance.duration.should == 142
      @instance.duration(:minutes).should be_within(0.01).of(2.367)
    end

    it 'should have an artist' do
      @instance.artist.should_not be_nil
      artist = params['artist'] || params[:artist]
      if artist
        @instance.artist.should == artist
      else
        @instance.artist.should == 'Unknown'
      end
    end

    it 'should have a genre' do
      genre = params['genre'] || params[:genre]
      if genre
        if genre.is_a?(String)
          @instance.genre.should == genre
        else
          @instance.genre.should be_a(String)
          @instance.genre.should.match /^#{genre[0]}/
            @instance.genre.should.match /#{genre[1]}$/
        end
      else
        @instance.genre.should == 'Undefined'
      end
    end

    it 'should have a year' do
      @instance.year.should == 1996
    end

    it 'should have an album name' do
      @instance.album.should == (params['album'] || params[:album])
    end

    it 'should have a name' do
      name = params['name'] || params[:name]
      if name
        @instance.name.should == name
      else
        @instance.name.should_not be_nil
        @instance.name.length.should > 3
      end
    end

  end

  describe "basic string key hash" do
    include_examples "params", { 
      'duration' => 142,
      'artist'   => 'Matt Aimonetti',
      'genre'    => 'Trip Hop',
      'year'     => '1996',
      'album'    => 'The one',
      'name'     => 'drawn'
    }
  end

  # describe "nil element string key hash" do
  #   include_examples "params", { 
  #     'duration' => '142',
  #     'artist'   => nil,
  #     'genre'    => ['Trip Hop', 'jazz'],
  #     'year'     => 1996,
  #     'album'    => 'Unknown',
  #     'name'     => nil,
  #     'producer' => 'F. Mercury'
  #   }
  # end

end
# context "symbol hash" do

# end
# context "mixed key hash" do

# end
