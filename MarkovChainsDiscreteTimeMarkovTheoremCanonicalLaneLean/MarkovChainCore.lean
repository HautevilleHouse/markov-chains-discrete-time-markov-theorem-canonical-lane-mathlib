import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean

structure MarkovChainStateSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  measurableStructure : MeasurableSpace carrier

default topology := by infer_instance
default measurableStructure := by infer_instance

structure DiscreteTimeMarkovChain (S : MarkovChainStateSpace) where
  transitionKernel : S.carrier → Set (S.carrier) → ℝ
  transitionMeasurable : ∀ x, MeasurableSet (fun y => y ∈ {z | transitionKernel x {z} > 0})
  totalMassOne : ∀ x, transitionKernel x Set.univ = 1
  nonnegative : ∀ x A, 0 ≤ transitionKernel x A
  sigmaAdditive : ∀ x, MeasureTheory.IsAdditiveMeasure (transitionKernel x)

structure MarkovChainAdmittedObject (S : MarkovChainStateSpace) where
  chain : DiscreteTimeMarkovChain S
  stationaryDistribution : Prop
  irreducible : Prop
  aperiodic : Prop
  convergenceToStationarity : Prop
  conclusion : convergenceToStationarity

def MarkovWitnessClosed (O : MarkovChainAdmittedObject S) : Prop :=
  O.convergenceToStationarity

end MarkovChainsDiscreteTimeMarkovTheoremCanonicalLaneLean
end HautevilleHouse
