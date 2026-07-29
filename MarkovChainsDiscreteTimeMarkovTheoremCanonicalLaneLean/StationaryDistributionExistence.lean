import canonicalLaneMathlib.AdmissibleClass
import MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean.MarkovChainAdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure StationaryDistributionExistencePackage (A : AdmissibleClass) where
  finiteIrreducibleAperiodic : Prop
  stationaryMeasureExists : Prop
  stationaryMeasureNormalizable : Prop
  existenceProof : stationaryMeasureExists
  normalizationProof : stationaryMeasureNormalizable

structure StationaryDistributionEvidence (A : AdmissibleClass) (P : StationaryDistributionExistencePackage A) where
  finiteIrreducibleAperiodicClosed : P.finiteIrreducibleAperiodic
  stationaryMeasureExistsClosed : P.stationaryMeasureExists
  stationaryMeasureNormalizableClosed : P.stationaryMeasureNormalizable

def StationaryDistributionExistenceClosed (A : AdmissibleClass) (P : StationaryDistributionExistencePackage A) : Prop :=
  P.finiteIrreducibleAperiodic ∧ P.stationaryMeasureExists ∧ P.stationaryMeasureNormalizable

theorem stationary_distribution_existence_closed_from_evidence
    (A : AdmissibleClass) (P : StationaryDistributionExistencePackage A)
    (E : StationaryDistributionEvidence A P) : StationaryDistributionExistenceClosed A P := by
  exact And.intro E.finiteIrreducibleAperiodicClosed
    (And.intro E.stationaryMeasureExistsClosed E.stationaryMeasureNormalizableClosed)

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse