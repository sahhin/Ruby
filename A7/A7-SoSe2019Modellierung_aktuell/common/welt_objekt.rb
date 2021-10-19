class WeltObjekt # class oder module das müssen Sie entscheiden Teil der Aufgabe
#private_class_method :new
attr_reader :name
  def initialize(name)
    @name = name
  end

  def aktiv?()
    abstract()
  end

  def to_s(kurzform = false)
    if kurzform
      "#{self.class.name[0,2]}."
    else
      "Ich #{self.class.name} #{@name}"
    end
  end
end

