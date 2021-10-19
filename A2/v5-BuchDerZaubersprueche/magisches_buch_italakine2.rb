
require "./MagischesBuch"
require "./"

buch = MagischesBuch.new()
buch.spruch_eintragen("Imperio-Einer der Unverzeihlichen Flüche, er unterwirft eine andere Person dem eigenen Willen")
buch.spruch_eintragen("Reductio-Zauberspruch, um ein Objekt in Nichts aufzulösen")
buch.spruch_eintragen("Prior Incantato-Zauberspruch, um einem Zauberstab den letzten Fluch zu entlocken, den er ausgeführt hat")

buch
buch.spruch_loeschen(1)
buch

puts buch.alle_sprueche_start_mit_I()

