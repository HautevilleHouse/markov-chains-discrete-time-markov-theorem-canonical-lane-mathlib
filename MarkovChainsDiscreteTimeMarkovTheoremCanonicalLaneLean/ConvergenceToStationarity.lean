import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure ConvergencePackage (M : MarkovKernel) (S : StationaryDistributionPackage M) where
  totalVariationDistance : ℕ → ℝ
  tvdBound : ∀ n, totalVariationDistance n ≥ 0
  convergenceLimit : Filter.Tendsto (λ n : ℕ => totalVariationDistance n) Filter.atTop (nhds 0)

structure ConvergenceEvidence (C : ConvergencePackage M S) where
  tvdBoundClosed : ∀ n, C.totalVariationDistance n ≥ 0
  convergenceLimitClosed : Filter.Tendsto (λ n : ℕ => C.totalVariationDistance n) Filter.atTop (nhds 0)

def ConvergenceClosed (C : ConvergencePackage M S) : Prop :=
  (∀ n, C.totalVariationDistance n ≥ 0) ∧
  Filter.Tendsto (λ n : ℕ => C.totalVariationDistance n) Filter.atTop (nhds 0)

theorem convergence_closed_from_evidence (C : ConvergencePackage M S)
    (E : ConvergenceEvidence C) : ConvergenceClosed C := by
  exact And.intro E.tvdBoundClosed E.convergenceLimitClosed

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse