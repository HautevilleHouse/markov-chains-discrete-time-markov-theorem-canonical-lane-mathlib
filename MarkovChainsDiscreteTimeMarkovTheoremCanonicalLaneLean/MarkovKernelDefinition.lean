import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure MarkovKernel where
  stateSpace : Type u
  transition : stateSpace → stateSpace → ℝ
  nonnegative : ∀ s t, transition s t ≥ 0
  rowStochastic : ∀ s, ∑' t, transition s t = 1

structure MarkovKernelEvidence (M : MarkovKernel) where
  nonnegativeClosed : ∀ s t, M.transition s t ≥ 0
  rowStochasticClosed : ∀ s, ∑' t, M.transition s t = 1

def MarkovKernelClosed (M : MarkovKernel) : Prop :=
  (∀ s t, M.transition s t ≥ 0) ∧ (∀ s, ∑' t, M.transition s t = 1)

theorem markov_kernel_closed_from_evidence (M : MarkovKernel)
    (E : MarkovKernelEvidence M) : MarkovKernelClosed M := by
  exact And.intro E.nonnegativeClosed E.rowStochasticClosed

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse