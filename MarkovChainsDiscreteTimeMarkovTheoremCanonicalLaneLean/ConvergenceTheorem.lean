import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure ConvergenceTheoremPackage {M : MarkovChain} {S : StationaryDistributionPackage M} where
  aperiodicityCond : Prop
  irreducibilityCond : Prop
  convergenceToStationary : Prop
  mixingTimeBound : Prop

structure ConvergenceTheoremEvidence {M : MarkovChain} {S : StationaryDistributionPackage M} (C : ConvergenceTheoremPackage) where
  aperiodicityCondClosed : C.aperiodicityCond
  irreducibilityCondClosed : C.irreducibilityCond
  convergenceToStationaryClosed : C.convergenceToStationary
  mixingTimeBoundClosed : C.mixingTimeBound

def ConvergenceTheoremClosed {M : MarkovChain} {S : StationaryDistributionPackage M} (C : ConvergenceTheoremPackage) : Prop :=
  C.apenriodicityCond ∧ C.irreducibilityCond ∧ C.convergenceToStationary ∧ C.mixingTimeBound

theorem convergence_theorem_closed_from_evidence {M : MarkovChain} {S : StationaryDistributionPackage M} (C : ConvergenceTheoremPackage) (E : ConvergenceTheoremEvidence C) : ConvergenceTheoremClosed C :=
  And.intro E.aperiodicityCondClosed (And.intro E.irreducibilityCondClosed (And.intro E.convergenceToStationaryClosed E.mixingTimeBoundClosed))

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse