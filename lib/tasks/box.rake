desc "Box Repertoire Moves"
task box: :environment do
  p "Box Repertoire Moves"
  moves = RepertoireMove.all.map(&:move).select { |move| move.crushing.nil? }
  p moves.size
  engine = IO.popen("stockfish", "r+")
  engine.puts "uci"
  engine.puts "setoption name MultiPV value 2"
  engine.puts "isready"

  moves.first(100).each do |move|
    fen = move.before
    p fen
    engine.puts "position fen #{fen}"
    engine.puts "go depth 24"

    multipv = []

    while line = engine.gets
      multipv << line if line[/multipv/]
      break if line.start_with?("bestmove")
    end

    scores = multipv.last(2).map do |line|
      match = line.match(/score (cp|mate) (-?\d+)/)
      type = match[1]
      value = match[2].to_i
      if type == "cp"
        score = value
      else
        score = value > 0 ? 10_000 : -10_000
      end
      score
    end
    p scores
    box = scores[1] < 250 && (scores.reduce(:-) > 40)
    p "box: #{box}"
    move.update(box: (scores.reduce(:-) > 40), crushing: scores[0] > 250)
  end
end
