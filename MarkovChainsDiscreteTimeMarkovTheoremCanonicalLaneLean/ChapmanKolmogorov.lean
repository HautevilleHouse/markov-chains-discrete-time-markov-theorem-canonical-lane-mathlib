import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure ChapmanKolmogorovPackage (M : MarkovKernel) where
  nStepTransition : ℕ → stateSpace M → stateSpace M → ℝ
  ckIdentity : ∀ (m n : ℕ) (s t : stateSpace M),
    nStepTransition (m + n) s t = ∑' u, nStepTransition m s u * nStepTransition n u t
  nStepNonnegative : ∀ (n : ℕ) (s t : stateSpace M), nStepTransition n s t ≥ 0
  nStepRowStochastic : ∀ (n : ℕ) (s : stateSpace M), ∑' t, nStepTransition n s t = 1

structure ChapmanKolmogorovEvidence (C : ChapmanKolmogorovPackage M) where
  ckIdentityClosed : ∀ (m n : ℕ) (s t : stateSpace M),
    C.nStepTransition (m + n) s t = ∑' u, C.nStepTransition m s u * C.nStepTransition n u t
  nStepNonnegativeClosed : ∀ (n : ℕ) (s t : stateSpace M), C.nStepTransition n s t ≥ 0
  nStepRowStochasticClosed : ∀ (n : ℕ) (s : stateSpace M), ∑' t, C.nStepTransition n s t = 1

def ChapmanKolmogorovClosed (C : ChapmanKolmogorovPackage M) : Prop :=
  (∀ (m n : ℕ) (s t : stateSpace M),
    C.nStepTransition (m + n) s t = ∑' u, C.nStepTransition m s u * C.nStepTransition n u t) ∧
  (∀ (n : ℕ) (s t : stateSpace M), C.nStepTransition n s t ≥ 0) ∧
  (∀ (n : ℕ) (s : stateSpace M), ∑' t, C.nStepTransition n s t = 1)

theorem chapman_kolmogorov_closed_from_evidence (C : ChapmanKolmogorovPackage M)
    (E : ChapmanKolmogorovEvidence C) : ChapmanKolmogorovClosed C := by
  exact And.intro E.ckIdentityClosed (And.intro E.nStepNonnegativeClosed E.nStepRowStochasticClosed)

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse