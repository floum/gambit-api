desc "Run Stockfish"
task stockfish: :environment do
  p "Stockfish Run"
  moves = Move.all.select { |move| !move.stockfish_score }
  moves.each do |move|
    p "Analyzing #{move.id} : #{move.san}, #{move.after}"
    analysis = Stockfish.analyze(move.after, { depth: 26 })
    score = analysis[:variations][0][:score]
    p score
    StockfishScore.create(score: score, move: move)
  end
end
