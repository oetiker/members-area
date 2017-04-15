require 'open-uri'
require 'csv'

desc "Import songs from songs.csv"
# task import_songs: :environment do
task :import_songs, [:url] => [:environment] do |t, args|
  puts "Importing... done. LOL."

  if !args.url
    puts "Please provide an url argument in brackets!"
    next
  end

  puts "Loading CSV from #{args.url}..."

  csv_file = open(args.url)
  csv = CSV.table(csv_file, encoding: 'UTF-8')

  csv.each do |song|
    voices = song[:voices] || ""
    composer = song[:composer] || "N/A"
    Song.create!(
      title: song[:title],
      composer: composer,
      number: song[:number],
      sopran: voices.include?("S"),
      alt: voices.include?("A"),
      tenor: voices.include?("T"),
      bass: voices.include?("B")
    )
    puts "Import: #{song[:composer]}"
  end
end
