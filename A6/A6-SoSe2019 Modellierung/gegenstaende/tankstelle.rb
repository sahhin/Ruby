require_relative 'gegenstand'
class Tankstelle < Gegenstand

  def initialize(name, liter)
    super(name, Float::INFINITY)

    @liter = liter
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    if kurzform
      return ".#{@liter}"
    else
      return " Vorrat: #{@liter}liter"
    end
  end
end