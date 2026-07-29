import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure MarkovPropertyPackage {M : MarkovChain} where
  markovProperty : Prop
  transitionIndependence : Prop
  memoryless : Prop

structure MarkovPropertyEvidence {M : MarkovChain} (P : MarkovPropertyPackage) where
  markovPropertyClosed : P.markovProperty
  transitionIndependenceClosed : P.transitionIndependence
  memorylessClosed : P.memoryless

def MarkovPropertyClosed {M : MarkovChain} (P : MarkovPropertyPackage) : Prop :=
  P.markovProperty ∧ P.transitionIndependence ∧ P.memoryless

theorem markov_property_closed_from_evidence {M : MarkovChain} (P : MarkovPropertyPackage) (E : MarkovPropertyEvidence P) : MarkovPropertyClosed P :=
  And.intro E.markovPropertyClosed (And.intro E.transitionIndependenceClosed E.memorylessClosed)

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse