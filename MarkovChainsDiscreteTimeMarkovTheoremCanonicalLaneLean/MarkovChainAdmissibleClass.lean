import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure DiscreteTimeMarkovChain where
  stateSpace : Type u
  transitionMatrix : stateSpace → stateSpace → ℝ
  transitionIsStochastic : ∀ x, ∑' y, transitionMatrix x y = 1
  markovProperty : Prop

structure MarkovAdmittedObject where
  chain : DiscreteTimeMarkovChain
  stationaryDistribution : Prop
  irreducible : Prop
  aperiodic : Prop
  conclusion : stationaryDistribution

def MarkovWitnessClosed (O : MarkovAdmittedObject) : Prop :=
  O.stationaryDistribution

structure AdmissibleClass where
  object : MarkovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MarkovWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse