import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

/-!
# Discrete-Time Markov Chain Package
-/

structure StateSpace where
  carrier : Type u
  countable : Prop

structure TransitionMatrix (S : StateSpace) where
  matrix : S.carrier -> S.carrier -> ℝ
  nonnegative : ∀ i j, matrix i j ≥ 0
  stochastic : ∀ i, (∑' j, matrix i j) = 1

def transitionCompatible {S : StateSpace} (T : TransitionMatrix S) : Prop :=
  T.nonnegative (∀ i j, True) ∧ T.stochastic (∀ i, True)

structure DiscreteTimeMarkovChain (S : StateSpace) where
  transition : TransitionMatrix S
  initialDistribution : S.carrier -> ℝ
  initialProbabilities : (∑' i, initialDistribution i) = 1
  initialNonnegative : ∀ i, initialDistribution i ≥ 0
  markovProperty : Prop
  timeHomogeneous : Prop

structure MarkovChainEvidence (S : StateSpace) (M : DiscreteTimeMarkovChain S) where
  markovPropertyClosed : M.markovProperty
  timeHomogeneousClosed : M.timeHomogeneous

def MarkovChainClosed (S : StateSpace) (M : DiscreteTimeMarkovChain S) : Prop :=
  M.markovProperty ∧ M.timeHomogeneous

theorem markov_chain_closed_from_evidence (S : StateSpace) (M : DiscreteTimeMarkovChain S)
    (E : MarkovChainEvidence S M) : MarkovChainClosed S M := by
  exact And.intro E.markovPropertyClosed E.timeHomogeneousClosed

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse