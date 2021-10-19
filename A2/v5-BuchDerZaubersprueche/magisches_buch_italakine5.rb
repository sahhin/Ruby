
require "./MagischesBuch"

buch = MagischesBuch.new()
buch.spruch_eintragen("Imperio-Einer der Unverzeihlichen Flüche, er unterwirft eine andere Person dem eigenen Willen")
buch.spruch_eintragen("Reductio-Zauberspruch, um ein Objekt in Nichts aufzulösen")
buch.spruch_eintragen("Prior Incantato-Zauberspruch, um einem Zauberstab den letzten Fluch zu entlocken, den er ausgeführt hat")
buch.spruch_eintragen("Serpensortia-Zauberspruch, um eine Schlange heraufzubeschwören")
buch.spruch_eintragen("Portus-Zauberspruch, um einen Gegenstand zu einem Portschlüssel zu machen")

buch.spruch_ersetzen(3,"Anapneo-Zauberspruch, um jemandem, der keine Luft mehr kriegt, die Atemwege wieder frei zu machen")
buch
