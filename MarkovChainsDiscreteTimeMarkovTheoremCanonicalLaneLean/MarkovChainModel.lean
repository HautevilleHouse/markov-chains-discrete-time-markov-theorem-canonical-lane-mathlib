import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure MarkovChain where
  stateSpace : Type u
  transitionMatrix : stateSpace → stateSpace → ℝ
  initialDistribution : stateSpace → ℝ
  probabilityAxioms : Prop
  probabilisticIndependence : Prop

structure MarkovChainEvidence (M : MarkovChain) where
  probabilityAxiomsClosed : M.probabilityAxioms
  probabilisticIndependenceClosed : M.probabilisticIndependence

def MarkovChainClosed (M : MarkovChain) : Prop :=
  M.probabilityAxioms ∧ M.probabilisticIndependence

theorem markov_chain_closed_from_evidence (M : MarkovChain) (E : MarkovChainEvidence M) : MarkovChainClosed M :=
  And.intro E.probabilityAxiomsClosed E.probabilisticIndependenceClosed

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse