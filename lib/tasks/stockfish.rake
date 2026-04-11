desc "Run Stockfish"
task stockfish: :environment do
  p "Stockfish Run"
  analyzed = StockfishScore.pluck(:fen)
  p "Analyzed : #{analyzed}"
  fens = Move.pluck(:before, :after).flatten.uniq
  p "FENS: #{fens}"
  (fens - analyzed).first(200).each do |fen|
    p "Analyzing #{fen}"
    analysis = Stockfish.analyze(fen, { depth: 26 })
    score = analysis[:variations][0][:score]
    if score.instance_of?(String) && score.include?('mate')
      score = score.include?('-') ? -1000 : 1000
    end
    p "Stockfish Score: #{score}"
    if StockfishScore.create(score: score, fen: fen)
      p "Analysis for #{fen} saved."
    end
  end
end

