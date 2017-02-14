desc "Import songs from songs.csv"
task import_songs: :environment do
  puts "Importing... done. LOL."

  csv_content = download_from_internet("http://myserver.ch/songs.csv")

  csv = CSV.read(csv_content)
  # instead of csv_content it could also be :  Rails.root.join("songs.csv")

  csv.each do |song|
    # Song.create(title: song["title"])

    puts "Import: #{song["name"]}"
  end
end
