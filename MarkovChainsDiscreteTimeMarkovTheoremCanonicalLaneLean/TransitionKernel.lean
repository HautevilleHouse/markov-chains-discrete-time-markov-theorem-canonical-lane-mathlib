import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.StateSpace

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure TransitionKernel (S : StateSpace) where
  kernel : S.carrier → Set (S.carrier) → ℝ
  nonnegative : ∀ x A, kernel x A ≥ 0
  totalOne : ∀ x, kernel x S.carrier = 1

def transitionKernelClosed {S : StateSpace} (K : TransitionKernel S) : Prop :=
  K.nonnegative Closed ∧ K.totalOne Closed

theorem transitionKernelClosedFromEvidence {S : StateSpace} (K : TransitionKernel S) (h : K.nonnegative Closed ∧ K.totalOne Closed) : transitionKernelClosed K := h

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse