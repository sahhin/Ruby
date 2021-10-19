class MagischesBuch
  #
  def alle_sprueche_mit_wort(wort)
    alle_sprueche = []
    @sprueche.each() {|spruch|
      if (spruch.include?(wort))
        alle_sprueche << spruch
      end
    }
    return alle_sprueche
  end
end