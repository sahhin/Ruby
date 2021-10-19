require_relative "Raum"
require_relative "akteure/monster"
require_relative "spiel_utility"
require_relative "gegenstaende/waffe"
require_relative "gegenstaende/teleporter"
require_relative "gegenstaende/zaubertrank"
require_relative "akteure/freund"
require_relative 'gegenstaende/tankstelle'
require_relative 'gegenstaende/wertgegenstand'
require_relative 'weltdaten_leser'

require 'singleton'

class Welt
  include Singleton

  def erschaffen(groesse, weltdaten_datei)
    @groesse = groesse
    @raeume = Array.new(@groesse) {Array.new(@groesse) {0}}
    @weltanzeiger = WeltAnzeiger.new(@raeume)
    @weltdaten_datei = weltdaten_datei
    raeume_erzeugen()

    verbinden()
    bevoelkern()
  end

  def raeume_erzeugen()
    @raeume.each_with_index do |x, x_index|
      x.each_index do |y_index|
        @raeume[x_index][y_index] = Raum.new(name_generieren(x_index, y_index))
      end
    end
  end

  def verbinden()  # return 0 <= x && x < @groesse && 0 <= y && y < @groesse

    @raeume.each_with_index do |x, zeile|
      x.each_index do |spalte |

        if gueltiger_quadrant?(zeile - 1, spalte)
          @raeume[zeile][spalte].setze_ausgang(SpielUtility::NORDEN, raum_an_position(zeile-1, spalte))
        end
        if gueltiger_quadrant?(zeile + 1, spalte)
          @raeume[zeile][spalte].setze_ausgang(SpielUtility::SUEDEN, raum_an_position(zeile+1, spalte))
        end
        if gueltiger_quadrant?(zeile, spalte-1)
          @raeume[zeile][spalte].setze_ausgang(SpielUtility::WESTEN, raum_an_position(zeile, spalte-1))
        end
        if gueltiger_quadrant?(zeile, spalte+1)
          @raeume[zeile][spalte].setze_ausgang(SpielUtility::OSTEN, raum_an_position(zeile, spalte+1))
        end

      end

      end

  end

  #   @raeume.each_with_index do |x, x_index|
  #     x.each_index do |y_index|
  #       if x_index == 0
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::SUEDEN, raum_an_position(x_index + 1, y_index))
  #       elsif x_index == @groesse - 1
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::NORDEN, raum_an_position(x_index - 1, y_index))
  #       else
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::SUEDEN, raum_an_position(x_index + 1, y_index))
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::NORDEN, raum_an_position(x_index - 1, y_index))
  #       end
  #
  #       if y_index == 0
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::OSTEN, raum_an_position(x_index, y_index + 1))
  #       elsif y_index == @groesse - 1
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::WESTEN, raum_an_position(x_index, y_index - 1))
  #       else
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::OSTEN, raum_an_position(x_index, y_index + 1))
  #         @raeume[x_index][y_index].setze_ausgang(SpielUtility::WESTEN, raum_an_position(x_index, y_index - 1))
  #       end
  #     end
  #   end
  # end

  def bevoelkern()
    weltdaten = WeltdatenLeser.lese_daten(@weltdaten_datei)

    weltdaten.each_with_index do |elem|

      raum_an_position(elem[0][0],elem[0][1]) << elem[1]

    end

    # Ein paar Beispieldaten zum Testen
    # troll = Monster.new("x_troll", 45, 30)
    #w1 = Waffe.new("xcalur", 20, 30, 30)
    # puts w1
    # t1 = Teleporter.new("flydsk", 10, 20)
    # puts t1
    # z = Zaubertrank.new("elixa", 2, 10, 100, true)
    # puts z
    # fr = Freund.new("elfe_7", 50, 20)
    # puts fr
    # ts = Tankstelle.new("orbitfuel", 200)
    # puts ts
    # wg = Wertgegenstand.new("w1", 1, 40)
    # puts wg
    # puts wg.to_s(true)
    #raum_an_position(1, 1).ansiedeln(troll)
    # raum_an_position(1, 1).ansiedeln(fr)
    # raum_an_position(0, 1).gegenstand_ablegen(w1)
    # raum_an_position(0, 1).gegenstand_ablegen(t1)
    # raum_an_position(1, 1).gegenstand_ablegen(z)
    # raum_an_position(4, 6).gegenstand_ablegen(ts)
    # raum_an_position(0, 2).gegenstand_ablegen(wg)

  end

  def ausgeben()
    @weltanzeiger.ausgeben()
  end

  def name_generieren(x, y)
    return "Q_#{x}_#{y}"
  end

  def raum_an_position(x, y)
    check_in_welt(x, y)
    return @raeume[x][y]
  end

  def position_von_raum(raum)
    @raeume.each_with_index() do |reihe, hoehe|
      reihe.each_index() do |breite|
        if @raeume[hoehe][breite] == raum
          return [hoehe, breite]
        end
      end
    end
    return nil
  end

  def gueltiger_quadrant?(x, y)
    return 0 <= x && x < @groesse && 0 <= y && y < @groesse
  end

  def self.schliesse_ausgang(raum, richtung)
    naechster_raum = raum.ausgang(richtung)
    raum.schliesse_ausgang(richtung)
    unless naechster_raum.nil?
      naechster_raum.schliesse_ausgang(SpielUtility.inverse_richtung(richtung))
    end
  end

  def sackgasse(x, y, zugang_aus_richtung)
    check_in_welt(x, y)
    sackgasse = @raeume[x][y]
    if sackgasse.zugang?(zugang_aus_richtung)
      SpielUtility.restliche_richtungen(zugang_aus_richtung).each() do |richtung|
        Welt.schliesse_ausgang(sackgasse, richtung)
      end
    end
    return sackgasse
  end

  def tunnel_vertikal(y, x_start, x_end)
    check_in_welt(y, x_start, x_end)
    for hoehe in (x_start..x_end)
      raum = @raeume[hoehe][y]
      Welt.schliesse_ausgang(raum, SpielUtility::WESTEN)
      Welt.schliesse_ausgang(raum, SpielUtility::OSTEN)
    end
  end

  def tunnel_horizontal(x, y_start, y_end)
    check_in_welt(x, y_start, y_end)
    for breite in (y_start..y_end)
      raum = @raeume[x][breite]
      Welt.schliesse_ausgang(raum, SpielUtility::NORDEN)
      Welt.schliesse_ausgang(raum, SpielUtility::SUEDEN)
    end
  end

  def to_s(kurzform = false)
    interim = @raeume.inject("[") {|akku, reihe| akku + "[#{reihe.map() {|raum| raum.to_s(kurzform)}.join(",")}]\n "}
    interim[-2, 2] = "]\n"
    return interim
  end

  private

  def check_in_welt(*x_y_werte)
    raise EndeDerWeltException, "Werte: #{x_y_werte} nicht von dieser Welt" if x_y_werte.any?() {|wert| wert < 0 || wert >= @groesse}
  end



  class WeltAnzeiger
    def initialize(raeume)
      @meine_raeume = raeume
    end

    def ausgeben()
      max_breite = max_bewohner_size() + 4
      if max_breite % 2 != 0
        max_breite += 1
      end
      for hoehe in (0...@meine_raeume.size())
        welt_streifen = @meine_raeume[hoehe]
        puts streifen_oben(max_breite, welt_streifen)
        puts streifen_quadrant(max_breite, welt_streifen)
        puts streifen_leerbereich(max_breite, welt_streifen)
        puts streifen_mitte(hoehe, max_breite, welt_streifen)
        puts streifen_leerbereich(max_breite, welt_streifen)
      end
      puts streifen_unten(max_breite, @meine_raeume[-1])
    end

    def streifen_oben(breite, korridor)
      korridor.inject("") do |acc, raum|
        if (raum.zugang?(SpielUtility::NORDEN))
          acc + "|" + "-" * (breite / 2 - 1) + "  " + "-" * (breite / 2 - 1)
        else
          acc + "|" + "-" * breite
        end
      end + "|"
    end

    def streifen_quadrant(breite, korridor)
      korridor.inject("") do |acc, raum|
        koordinaten = raum.name().split("_")[-2..2]
        padding = (@meine_raeume.size() - 1).to_s().size
        koord_string = "%#{padding}s.%#{padding}s" % koordinaten
        acc +"|" + " " + koord_string.ljust(breite - 1) # + " " * (breite - 1 - koord_string.size())
      end + "|"
    end

    def streifen_leerbereich(breite, korridor)
      korridor.inject("") do |acc, raum|
        acc +"|" + " " * (breite)
      end + "|"
    end

    def streifen_mitte(zeile, breite, korridor)
      anzahl_zeilen = max_inventar(zeile)
      raeume_plus_inventar = korridor.map() do |raum|
        [raum, raum.map() {|elem| elem.to_s(true)}]
      end
      zeilen_mitte = (0..anzahl_zeilen).inject("") do |acc2, index|
        acc2 + raeume_plus_inventar.inject("") do |acc, raum_plus_inventar|
          kurzform = ""
          unless raum_plus_inventar[1][index].nil?
            kurzform = raum_plus_inventar[1][index]
          end
          if (raum_plus_inventar[0].zugang?(SpielUtility::WESTEN))
            acc + " " + kurzform.center(breite) #kurzform + " " * (breite -kurzform.size())
          else
            acc + "|" + kurzform.center(breite) # + " " * (breite-kurzform.size())
          end
        end + "|\n"
      end
      return zeilen_mitte.chomp("\n")
    end

    def streifen_unten(breite, korridor)
      korridor.inject("") do |acc, raum|
        if (raum.zugang?(SpielUtility::SUEDEN))
          acc + "|" + "-" * (breite / 2 - 1) + "   " + "-" * (breite / 2 - 1)
        else
          acc + "|" + "-" * breite
        end
      end + "|"
    end


    def max_bewohner_size()
      max_b_size = @meine_raeume.flatten().reject() {|raum| raum.to_a().empty?()}.map() {|raum| raum.to_a()}.flatten().map() {|obj| obj.to_s(true)}.max_by() {|string| string.size()}
      if max_b_size
        return max_b_size.size()
      else
        return 0
      end
    end


    def max_inventar(zeile)
      @meine_raeume[zeile].max_by() {|raum| raum.count()}.count()
    end
  end
end

class EndeDerWeltException < StandardError

end
#
# welt = Welt.instance
# welt.erschaffen(5, "weltdaten")
# welt.ausgeben