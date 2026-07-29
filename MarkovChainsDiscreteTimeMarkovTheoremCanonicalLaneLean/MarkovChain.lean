import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.StateSpace
import HautevilleHouse.MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.TransitionKernel

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure MarkovChain (S : StateSpace) where
  kernel : TransitionKernel S
  initialDistribution : Set (S.carrier) → ℝ
  initialProbability : initialDistribution S.carrier = 1 ∧ ∀ A, initialDistribution A ≥ 0

def markovChainClosed {S : StateSpace} (M : MarkovChain S) : Prop :=
  transitionKernelClosed M.kernel ∧ M.initialProbability

theorem markovChainClosedFromEvidence {S : StateSpace} (M : MarkovChain S) (h : transitionKernelClosed M.kernel ∧ M.initialProbability) : markovChainClosed M := h

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse