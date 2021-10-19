require "./termin_kalender"
require './termin'
require './tag'
require './monat'
require './dauer'
require './datum'

datum = Datum.new(1,2,2019,12,5)
puts "datum.monat_im_jahr: #{datum.monat_im_jahr}"
puts "datum.tag_im_monat: #{datum.tag_im_monat}"
puts "datum.to_s: #{datum.to_s}"

dauer = Dauer.new(290)
puts "dauer.minuten_anteil: #{dauer.minuten_anteil}"
puts "dauer.stunden_anteil: #{dauer.stunden_anteil}"
puts "dauer.in_sekunden: #{dauer.in_sekunden}"
puts "dauer.to_s: #{dauer.to_s}"

monat = Monat.new(1,1992)
puts "monat.to_s: #{monat.to_s}"

tag = Tag.new(11,monat.time.month,monat.time.year)
puts "tag.to_s: #{tag.to_s}"

termin0 = Termin.new("One Punch Man - Season 2 Episode 4",Datum.new(30,4,2019,16,30),Dauer.new(25))
termin1 = Termin.new("One Punch Man - Season 2 Episode 5",Datum.new(7,5,2019,16,30),Dauer.new(25))
puts "termin0.to_s: #{termin0.to_s}"

tk = TerminKalender.new("Saitama")
tk << termin0
tk << termin1
puts "tk.zeilen: #{tk.zeilen}"
puts "tk[1]: #{tk[1]}"
puts "tk.delete(termin0): #{tk.delete(termin0)}"