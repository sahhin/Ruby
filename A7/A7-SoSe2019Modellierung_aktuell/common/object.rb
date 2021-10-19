
class Object

  def abstract()
    raise AbstractMethodError, "#{self.class} muss abstrakte Methode #{caller().first().split()[-1]} implementieren"
  end
end

class AbstractMethodError < StandardError
end

