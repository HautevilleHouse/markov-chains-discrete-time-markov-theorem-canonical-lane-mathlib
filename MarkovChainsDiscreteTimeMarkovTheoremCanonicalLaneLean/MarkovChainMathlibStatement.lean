import canonicalLaneMathlib.AdmissibleClass
import MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.MarkovChainAdmissibleClass
import MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.BridgeLemmas
import MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

def ConstrainedMarkovChainClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_chain_endgame (A : AdmissibleClass) :
    ConstrainedMarkovChainClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse