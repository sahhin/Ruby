require_relative 'akteure/freund'
require_relative 'akteure/monster'
require_relative 'gegenstaende/tankstelle'
require_relative 'gegenstaende/teleporter'
require_relative 'gegenstaende/waffe'
require_relative 'gegenstaende/wertgegenstand'
require_relative 'gegenstaende/zaubertrank'
require_relative 'welt'

class WeltdatenLeser

  def self.lese_daten(filename)
    objects_and_position = []
    File.open(filename) do |afile|
      afile.each() do |line|
        data = line.strip().split("::")
        coords = data[0].split().map() {|e| eval(e)}
        klazz = Kernel.const_get(data[1].strip().to_sym)
        name = data[2].strip
        rest = data[3..-1]
        args = rest.map() {|elem| eval(elem)}.unshift(name)
        obj = klazz.new(*args)
        objects_and_position << [coords,obj]
      end
    end
    return objects_and_position
  end
end