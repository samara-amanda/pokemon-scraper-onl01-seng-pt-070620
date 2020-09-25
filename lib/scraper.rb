class Scraper

  def initialize(db)
    @db = db
    #@html = File.open("pokemon_index.html")
  end

  def scrape
    doc = Nokogiri::HTML(open("pokemon_index.html"))

    doc.search("span.infocard-tall").collect do |pokemon|
      name = pokemon.search("a.ent-name").text
      type = pokemon.search("small.aside a").text
      Pokemon.save(name, type, @db)
    end
  end
end
