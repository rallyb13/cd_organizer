require('rspec')
require('organizer')

describe("Album") do

  before do
    Album.clear()
  end

  describe(".all") do
    it("at first is empty") do
      expect(Album.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves entry") do
      test_album = Album.new({:key_a => "Dark Side of the Moon", :key_b => "Pink Floyd"})
      test_album.save()
      expect(Album.all()).to(eq([test_album]))
    end
  end

  describe(".clear") do
    it("clears all entries") do
      test_album = Album.new({:key_a => "Dark Side of the Moon", :key_b =>
        "Pink Floyd"})
      test_album.save()
      Album.clear()
      expect(Album.all()).to(eq([]))
    end
  end

  describe('#title') do
    it("returns title from list") do
      test_album = Album.new({:key_a => "Amalgamut", :key_b => "Filter"})
      test_album.save()
      expect(test_album.title()).to(eq("Amalgamut"))
    end
  end

  describe('.search_title') do
    it("locates the album by title") do
      test_album = Album.new({:key_a => "Bleed American", :key_b => "Jimmy Eats World"})
      test_album.save()
      test_album2 = Album.new({:key_a => "Underdogs", :key_b => "Matthew Good Band"})
      test_album2.save()
      expect(Album.search_title("Underdogs")).to(eq(test_album2))
    end
  end

end

describe("Artist") do

  before do
    Artist.clear()
  end

  describe(".all") do
    it("at first is empty") do
      expect(Artist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves entry") do
      test_artist = Artist.new({:key1 => "Phil Collins", :key2 => ["Phil Collins"]})
      test_artist.save()
      expect(Artist.all()).to(eq([test_artist]))
    end
  end

  describe(".clear") do
    it("clears all entries") do
      test_artist = Artist.new({:key1 => "Matthew Good Band", :key2 =>
        ["Matthew Good"]})
      test_artist.save()
      Artist.clear()
      expect(Artist.all()).to(eq([]))
    end
  end

  describe('#members') do
    it("returns member from list") do
      test_artist = Artist.new({:key1 => "Tina and the Metro Gnomes", :key2 =>
        ["Tina Strong", "Lee Power", "Ben Jammin", "JT"]})
      test_artist.save()
      expect(test_artist.members()).to(eq(["Tina Strong", "Lee Power",
        "Ben Jammin", "JT"]))
    end
  end

  describe('#band') do
    it("returns band from list") do
      test_artist = Artist.new({:key1 => "The Power Rockets",
        :key2 => ["Dustin Time", "Kelly Mesoftly", "Mac Truck"]})
      test_artist.save()
      expect(test_artist.band()).to(eq("The Power Rockets"))
    end
  end


  describe('.search_members') do
    it("locates artist according to list of members") do
      test_artist = Artist.new({:key1 => "Tina and the Metro Gnomes",
        :key2 => ["Tina Strong", "Lee Power", "Ben Jammin", "JT"]})
      test_artist.save()
      test_artist2 = Artist.new({:key1 => "The Power Rockets",
        :key2 => ["Dustin Time", "Kelly Mesoftly", "Mac Truck"]})
      test_artist2.save()
      expect(Artist.search_members("Lee Power")).to(eq("Tina and the Metro Gnomes"))
    end
  end

  # describe('.search_members') do
  #   it("locates artist according to list of members") do
  #     test_artist = Artist.new({:key1 => "Tina and the Metro Gnomes",
  #       :key2 => ["Tina Strong", "Lee Power", "Ben Jammin", "JT"]})
  #     test_artist.save()
  #     test_artist2 = Artist.new({:key1 => "The Power Rockets",
  #       :key2 => ["Dustin Time", "Kelly Mesoftly", "Mac Truck"]})
  #     test_artist2.save()
  #     test_artist3 = Artist.new({:key1 => "CSNY", :key2 => ["David Crosby", "Stephen Stills", "Graham Nash", "Neil Young"]})
  #     test_artist3.save()
  #     expect(Artist.search_members("Young")).to(eq("CSNY"))
  #   end
  # end




end
