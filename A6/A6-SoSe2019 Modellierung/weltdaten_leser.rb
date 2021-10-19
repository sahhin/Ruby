require_relative 'akteure/freund'
require_relative 'akteure/monster'
require_relative 'gegenstaende/tankstelle'
require_relative 'gegenstaende/teleporter'
require_relative 'gegenstaende/waffe'
require_relative 'gegenstaende/wertgegenstand'
require_relative 'gegenstaende/zaubertrank'

class WeltdatenLeser

  def self.lese_daten(filename)
    objects_and_position = []

    File.open(filename) do |file|
      file.each_line do |line|
        if line.strip!() != ""
          quadrant_objekt_daten = line.split("::")
          quadrant = quadrant_objekt_daten[0].split(" ").map() do |elem|
            eval(elem)
          end
          klazz = Kernel.const_get(quadrant_objekt_daten[1].to_sym)
          name = quadrant_objekt_daten[2]
          args = quadrant_objekt_daten[3..quadrant_objekt_daten.size - 1].map() do |elem|
            eval(elem)
          end
          obj = klazz.new(name, *args)
          objects_and_position << [quadrant, obj]
        end
      end
    end

    #
    # if inhalt == "Freund"
    #   freund = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size]=freund.new(elem[1],elem[2],eval(elem[3]))
    # end
    #
    # if inhalt == "Monster"
    #   monster = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size] = monster.new(elem[1],elem[2],eval(elem[3]))
    # end
    #
    # if inhalt == "Waffe"
    #   waffe = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size] = waffe.new(elem[2],eval(elem[3]),eval(elem[4]), eval(elem[5]))
    # end
    #
    # if inhalt == "Teleporter"
    #   teleporter = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size] = teleporter.new(elem[2],eval(elem[3]),eval(elem[4]))
    # end
    #
    # if inhalt == "Zaubertrank"
    #   zaubertrank = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size] = zaubertrank.new(elem[2],eval(elem[3]),eval(elem[4]), eval(elem[5]), eval(elem[6]))
    # end
    #
    # if inhalt == "Tankstelle"
    #   tankstelle = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size] = tankstelle.new(elem[2],eval(elem[3]))
    # end
    #
    # if inhalt == "Wertgegenstand"
    #   wertgegenstand = Kernel.const_get(inhalt.to_sym)
    #   elem[1..elem.size] = wertgegenstand.new(elem[2],eval(elem[3]),eval(elem[4]))
    # end
    #
    return objects_and_position
  end
end


puts WeltdatenLeser.lese_daten("weltdaten").to_s
