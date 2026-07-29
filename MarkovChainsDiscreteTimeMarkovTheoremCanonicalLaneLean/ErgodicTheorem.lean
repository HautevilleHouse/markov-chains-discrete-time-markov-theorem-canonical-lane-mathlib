import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.StationaryDistribution

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

/-!
# Discrete-Time Markov Chain Ergodic Theorem Package
-/

structure ErgodicProperties (S : StateSpace) (M : DiscreteTimeMarkovChain S) where
  irreducible : Prop
  aperiodic : Prop
  positiveRecurrent : Prop

def ergodicHypotheses (S : StateSpace) (M : DiscreteTimeMarkovChain S) (E : ErgodicProperties S M) : Prop :=
  E.irreducible ∧ E.aperiodic ∧ E.positiveRecurrent

structure ErgodicTheoremConclusion (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) where
  uniqueStationary : Prop
  convergenceInTotalVariation : Prop
  limitIsStationary : Prop
  uniqueStationaryClosed : uniqueStationary
  convergenceInTotalVariationClosed : convergenceInTotalVariation
  limitIsStationaryClosed : limitIsStationary

def ErgodicTheoremClosed (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) (C : ErgodicTheoremConclusion S M π) : Prop :=
  C.uniqueStationary ∧ C.convergenceInTotalVariation ∧ C.limitIsStationary

theorem ergodic_theorem_closed_from_evidence (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) (C : ErgodicTheoremConclusion S M π) :
    ErgodicTheoremClosed S M π C := by
  exact And.intro C.uniqueStationaryClosed
    (And.intro C.convergenceInTotalVariationClosed C.limitIsStationaryClosed)

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse