class RekursiveSubstitution


  def expand(rules,l_word,n,sp=[])
    # TODO
    return []
  end
end

expanded1 = RekursiveSubstitution.new().expand({"F"=>"C0FF[C1-F++F][C2+F--F]C3++F--F"}, "F",  1, []).join()
p expanded1

#ERGEBNIS: "C0FF[C1-F++F][C2+F--F]C3++F--F"


expanded2 = RekursiveSubstitution.new().expand({"F"=>"C0FF[C1-F++F][C2+F--F]C3++F--F"}, "F",  2, []).join()
p expanded2

#ERGEBNIS: "C0C0FF[C1-F++F][C2+F--F]C3++F--FC0FF[C1-F++F][C2+F--F]C3++F--F[C1-C0FF[C1-F++F][C2+F--F]C3++F--F++C0FF[C1-F++F][C2+F--F]C3++F--F][C2+C0FF[C1-F++F][C2+F--F]C3++F--F--C0FF[C1-F++F][C2+F--F]C3++F--F]C3++C0FF[C1-F++F][C2+F--F]C3++F--F--C0FF[C1-F++F][C2+F--F]C3++F--F"