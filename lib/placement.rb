class Placement
  attr_reader :pegs,
              :set

  def initialize(pegs)
    @pegs = pegs
    @set = []
  end

  def place_peg(pegs)
    pegs.count.times do
      @set << pegs.shuffle[0]
    end
    @set
  end

  def set_details
    @set.map do |peg|
      peg.initial
    end
  end
end
