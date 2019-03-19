$TOOLBOXTITLE = 'Besuch'
$CLASSES = [ :Haus,:Siedlung,:Kreatur ]

#
# Konfiguration der Objektmethoden von der Klassen
#
$METHOD_CONFIG = {
  :Haus => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :bewegen => { :label => :'bewegen(...)' ,
  :args => [
  [:'delta_x', :Integer],
  [:'delta_y', :Integer],
  [:'wdh', :Integer],
  [:'wdh_nach [ms]', :Integer],
  [:'starten_nach [ms]', :Integer]] },
  :position => {:label => :position, :ergebnis => :Point},
  :auf_position_setzen => { :label => :'auf_position_setzen(...)' , :args => [ [:'ziel_pos_x', :Integer], [:'ziel_pos_y', :Integer] ] },
  },
  # Konfiguration der Klassenmethoden von StehLampe
  :Haus_class => {
  :new => { :label => :'new()' },
  },
  :Kreatur => {
    :sichtbar_machen => { :label => :sichtbar_machen },
    :bewegen => { :label => :'bewegen(...)' ,
                  :args => [
                      [:'delta_x', :Integer],
                      [:'delta_y', :Integer],
                      [:'wdh', :Integer],
                      [:'wdh_nach [ms]', :Integer],
                      [:'starten_nach [ms]', :Integer]] },
    :position => {:label => :position, :ergebnis => :Point},
    :auf_position_setzen => { :label => :'auf_position_setzen(...)' , :args => [ [:'ziel_pos_x', :Integer], [:'ziel_pos_y', :Integer] ] },
  },
  # Konfiguration der Klassenmethoden von StehLampe
  :Kreatur_class => {
    :new => {
        :label => :'new()',
        :args => [[:x,:Integer], [:y,:Integer]]
  }},
  :Siedlung => {
      :sichtbar_machen => {:label => :sichtbar_machen},
      :besuch => {:label => :besuch}
  },
  :Siedlung_class => {
      :new => {:label => :'new()'}
  }
}
