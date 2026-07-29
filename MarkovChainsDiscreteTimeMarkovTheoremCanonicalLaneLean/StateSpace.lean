import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure StateSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  sigmaAlgebraClosed : sigmaAlgebra ≠ ∅

def stateSpaceWitness (S : StateSpace) : Prop :=
  S.sigmaAlgebraClosed

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse