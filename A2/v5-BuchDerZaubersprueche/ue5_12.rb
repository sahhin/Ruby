class MagischesBuch

  def alle_sprueche_mit_wort_loeschen(wort)
#    for spruch in @sprueche
#      if spruch.include?(wort)
#        @sprueche.delete(spruch)
#      end
#    end

    (anzahl_sprueche() - 1).downto(0) {|index|
      if @sprueche[index].include?(wort)
        @sprueche.delete_at(index)
      end
    }
    return @sprueche
  end
end