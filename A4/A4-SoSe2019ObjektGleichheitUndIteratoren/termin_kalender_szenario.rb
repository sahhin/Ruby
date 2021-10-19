require "./termin_kalender"
require './termin'
require './tag'
require './monat'
require './dauer'

tk = TerminKalender.new("Von Birgit")

#TERMINE APRIL
termin1 = Termin.new("PM1/PT1", Datum.new(17, 4, 2019, 8, 15), Dauer.new(180))
termin2 = Termin.new("PM1/PT1", Datum.new(18, 4, 2019, 11, 30), Dauer.new(120))
termin3 = Termin.new("Vorbereitung", Datum.new(18, 4, 2019, 11, 15), Dauer.new(15))
termin4 = Termin.new("Nachbereitung", Datum.new(19, 4, 2019, 13, 25), Dauer.new(180))

#TERMINE MAI
termin5 = Termin.new("Tag der Arbeit", Datum.new(1, 5, 2019, 0, 0), Dauer.new(1440))
termin6 = Termin.new("Unabhängigkeitstag Argentiens", Datum.new(25, 5, 2019, 0, 0), Dauer.new(1440))
termin7 = Termin.new("PTP: Aufgabe 5", Datum.new(14, 5, 2019, 8, 15), Dauer.new(195))
termin8 = Termin.new("UFC237: CERRONE vs IAQUINTA", Datum.new(14, 5, 2019, 12, 00), Dauer.new(120))

#TERMINE JUNI
termin9 = Termin.new("Agustinas Geburtstag ", Datum.new(2, 6, 2019, 00, 00), Dauer.new(1440))
termin10 = Termin.new("PTP: Aufgabe 6", Datum.new(11, 6, 2019, 8, 15), Dauer.new(195))
termin11 = Termin.new("PM:Vorlesung", Datum.new(12, 6, 2019, 8, 15), Dauer.new(195))
termin12 = Termin.new("Flagtag Argentiniens", Datum.new(20, 6, 2019, 00, 00), Dauer.new(1440))

tmp_tk_ary = [termin1, termin2, termin3, termin4, termin5, termin6, termin7, termin8, termin9, termin10, termin11, termin12]
tmp_tk_ary.each do |termin|
  tk << termin
end

puts "4.3.a Termine ausgeben"
tk.each {|termin| puts termin}
puts

puts "4.3.b Terminkalender nach Datum absteigend sortieren"
puts tk.sort {|elem1, elem2| elem2.datum <=> elem1.datum}
#tk.reverse_each(){|termin| puts termin}
puts

tag = Tag.new(19,4,2019)
puts "4.3.c Termine vor Tag #{tag}"
puts tk.find_all() {|elem| elem.datum.tag_im_monat.time < tag.time}
puts

tag2 =Tag.new(18,4,2019)
puts "4.3.d Termine am Tag #{tag2}"
#puts tk.select() {|termin| termin.datum.tag_im_monat == tag2}
puts tk.find_all() {|termin| termin.datum.tag_im_monat == tag2}
puts

puts "4.3.e Gruppieren nach Tag"
#Frage stellen, warum mit hash und eql Methoden geht, und mit to_s
# Auf das Ergebnis ein map(){|key,val| "#{key} => [#{val.join(", ")}]"} anwenden um die gezeigte Ausgabe zur erhalten
puts tk.group_by {|termin| termin.datum.tag_im_monat}.map() {|key, val| "#{key} => [#{val.join(", ")}]"}
puts

puts "4.3.f Gruppieren nach Monat"
puts tk.group_by {|termin| termin.datum.monat_im_jahr}.map() {|key, val| "#{key} => [#{val.join(", ")}]"}
puts

puts "4.3.g Frühester Termin"
puts tk.min_by() {|termin| termin.datum.time}
puts

puts "4.3.h Längster Termin"
puts tk.max_by() {|termin| termin.dauer.minuten}
#puts tk.find_all() {|termin| termin.dauer == tk.max_by{|termin| termin.dauer}.dauer}
puts

puts "4.3.i Prüfen auf Enthaltensein"
termin11 = Termin.new("PM1/PT1", Datum.new(17, 4, 2019, 8, 15), Dauer.new(180))
puts "Termin #{termin11} enthalten in Kalender: #{tk.include? (termin11)}"
puts

puts "4.3.j Gruppieren nach Dauer:"
puts tk.group_by {|termin| termin.dauer}.map() {|key, val| "#{key} => [#{val.join(", ")}]"}
puts


puts "4.3.k Abbilden auf Dauer und Datum: #{tk.map() {|termin| [termin.datum.to_s, termin.dauer.to_s]}}"
puts

beschreibung = "PM1/PT1"
#puts "4.3.l Gesamtdauer von Terminen #{beschreibung} #{Dauer.new(tk.find_all {|termin| termin.beschreibung == beschreibung}.map() {|key, _| key.dauer.minuten}.sum)}"
dauer=tk.find_all {|termin| termin.beschreibung == beschreibung}.inject(Dauer.new(0)) {|sum, termin| sum+termin.dauer}
puts "4.3.l Gesamtdauer von Terminen #{beschreibung} #{dauer}"
puts

monat = Monat.new(4,2019)
puts "4.3.m Sind alle Termine im Monat #{monat} mindestens 30 Minuten lang: #{tk.all? {|termin| !(termin.datum.monat_im_jahr == monat) || termin.dauer.minuten >= 30}}"
#puts "4.3.m Sind alle Termine im Monat #{monat} mindestens 30 Minuten lang: #{tk.select() {|termin| termin.datum.monat_im_jahr == monat}.all?() {|termin| termin.dauer.minuten >= 30}}"
puts

puts "4.3.n Ist ein Termin im Monat #{monat} mindestens 30 Minuten lang: #{tk.any?() {|termin| !(termin.datum.monat_im_jahr == monat) || (termin.dauer.minuten >= 30) }}"
#puts "4.3.n Ist ein Termin im Monat #{monat} mindestens 30 Minuten lang: #{tk.select() {|termin| termin.datum.monat_im_jahr == monat}.any?() {|termin| termin.dauer.minuten >= 30}}"