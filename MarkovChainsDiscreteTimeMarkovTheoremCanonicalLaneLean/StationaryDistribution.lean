import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.DiscreteTimeMarkovChain

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

/-!
# Stationary Distribution Package
-/

structure StationaryDistribution (S : StateSpace) (M : DiscreteTimeMarkovChain S) where
  distribution : S.carrier -> ℝ
  nonnegative : ∀ i, distribution i ≥ 0
  sumsToOne : (∑' i, distribution i) = 1
  invariance : ∀ j, (∑' i, distribution i * M.transition.matrix i j) = distribution j

structure StationaryDistributionEvidence (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) where
  invarianceClosed : π.invariance (∀ j, True)

def StationaryDistributionClosed (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) : Prop :=
  π.invariance

theorem stationary_distribution_closed_from_evidence (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) (E : StationaryDistributionEvidence S M π) :
    StationaryDistributionClosed S M π := by
  exact E.invarianceClosed

theorem stationary_distribution_sums_to_one (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (π : StationaryDistribution S M) : (∑' i, π.distribution i) = 1 :=
  π.sumsToOne

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse