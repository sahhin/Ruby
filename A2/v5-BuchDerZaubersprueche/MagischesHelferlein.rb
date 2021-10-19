# Die Klasse liest Inhalte einer Sprüche Datei in einen Hash und erlaubt das Extrahieren einer frei 
# wählbaren Anzahl von Sprüchen (Methode self.gib_sprueche)
# Implementierung muss von Ihnen noch nicht verstanden werden, da Klassenmethoden noch 
# nicht Stoff der Vorlesung waren.

class MagischesHelferein
  def self.lese_sprueche(datei)
    das_buch = {}
    File.open(datei,'r') {|f|
      i = 1
      f.each_line() {|line|
        key,val = line.split("-")
        das_buch[key.strip().to_sym()] = val.strip()
        #   puts "#{i} :#{key} => #{val}"
        i+=1
      }
    }
    return das_buch
  end

  def self.gib_sprueche(datei,n)
    srand(13456)
    return lese_sprueche(datei).to_a().shuffle()[0...n].map() {|pair| pair.join("-")}
  end

end

# gibt 7 "zufällig" gewählte Sprüche auf der Konsole aus.
puts MagischesHelferein.gib_sprueche("sprueche",7).join("\n")

