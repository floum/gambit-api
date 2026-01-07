desc "Run Stockfish"
task stockfish: :environment do
  p "Stockfish Run"
  moves = Move.all.select { |move| !move.stockfish_score }
  moves.each do |move|
    p "Analyzing #{move.id} : #{move.san}, #{move.after}"
    analysis = Stockfish.analyze(move.after, { depth: 26 })
    score = analysis[:variations][0][:score]
    if score.instance_of?(String) && score.include?('mate')
      score = score.include?('-') ? -1000 : 1000
    end

    p score
    StockfishScore.create(score: score, move: move)
  end
end
