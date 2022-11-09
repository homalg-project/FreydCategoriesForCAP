# SPDX-License-Identifier: GPL-2.0-or-later
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# Declarations
#
# THIS FILE IS AUTOMATICALLY GENERATED, SEE CAP_project/CAP/gap/MethodRecord.gi

#! @Chapter Category of rows

#! @Section Supported CAP operations

#! @Subsection CategoryOfRows of an arbitrary ring

#! The following CAP operations are supported:
#! * <Ref BookName="CAP" Func="AdditionForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="AdditiveGenerators" Label="for Is" />
#! * <Ref BookName="CAP" Func="AdditiveInverseForMorphisms" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="BiasedWeakFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="BiasedWeakPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="Colift" Label="for Is" />
#! * <Ref BookName="CAP" Func="ColiftAlongEpimorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="ColiftOrFail" Label="for Is" />
#! * <Ref BookName="CAP" Func="ComponentOfMorphismFromDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="ComponentOfMorphismIntoDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="Coproduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoproductFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoproductFunctorialWithGivenCoproducts" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectProduct" Label="" />
#! * <Ref BookName="CAP" Func="DirectProductFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectProductFunctorialWithGivenDirectProducts" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectSum" Label="" />
#! * <Ref BookName="CAP" Func="DirectSumCodiagonalDifference" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectSumDiagonalDifference" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectSumFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectSumFunctorialWithGivenDirectSums" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="DirectSumMorphismToWeakBiPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="IdentityMorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="InitialObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="InitialObjectFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="InitialObjectFunctorialWithGivenInitialObjects" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="InjectionOfBiasedWeakPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="InjectionOfBiasedWeakPushoutWithGivenBiasedWeakPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectionOfCofactorOfCoproduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectionOfCofactorOfCoproductWithGivenCoproduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectionOfCofactorOfDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectionOfCofactorOfDirectSumWithGivenDirectSum" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="InjectionOfFirstCofactorOfWeakBiPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="InjectionOfFirstCofactorOfWeakBiPushoutWithGivenWeakBiPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="InjectionOfSecondCofactorOfWeakBiPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="InjectionOfSecondCofactorOfWeakBiPushoutWithGivenWeakBiPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectiveColift" Label="for Is" />
#! * <Ref BookName="CAP" Func="InverseForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsAutomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsCodominating" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsColiftable" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsColiftableAlongEpimorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsCongruentForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsDominating" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEndomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEpimorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualAsFactorobjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualAsSubobjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualForMorphismsOnMor" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualForObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualToIdentityMorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsEqualToZeroMorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsIdempotent" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsInitial" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsIsomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsLiftable" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsLiftableAlongMonomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsMonomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsOne" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsSplitEpimorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsSplitMonomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsTerminal" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsWellDefinedForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsWellDefinedForObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsZeroForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsZeroForObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromCoproductToDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromDirectProductToDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromDirectSumToCoproduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromDirectSumToDirectProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromInitialObjectToZeroObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromTerminalObjectToZeroObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromZeroObjectToInitialObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromZeroObjectToTerminalObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="Lift" Label="for Is" />
#! * <Ref BookName="CAP" Func="LiftAlongMonomorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="LiftOrFail" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismBetweenDirectSums" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismBetweenDirectSumsWithGivenDirectSums" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismConstructor" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismDatum" Label="for Is" />
#! * <Ref BookName="CAP" Func="ObjectConstructor" Label="for Is" />
#! * <Ref BookName="CAP" Func="ObjectDatum" Label="for Is" />
#! * <Ref BookName="CAP" Func="PostCompose" Label="for Is" />
#! * <Ref BookName="CAP" Func="PostComposeList" Label="for Is" />
#! * <Ref BookName="CAP" Func="PostInverseForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="PreCompose" Label="for Is" />
#! * <Ref BookName="CAP" Func="PreComposeList" Label="for Is" />
#! * <Ref BookName="CAP" Func="PreInverseForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectionInFactorOfDirectProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectionInFactorOfDirectProductWithGivenDirectProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectionInFactorOfDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectionInFactorOfDirectSumWithGivenDirectSum" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="ProjectionInFirstFactorOfWeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="ProjectionInFirstFactorOfWeakBiFiberProductWithGivenWeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="ProjectionInSecondFactorOfWeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="ProjectionInSecondFactorOfWeakBiFiberProductWithGivenWeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="ProjectionOfBiasedWeakFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="ProjectionOfBiasedWeakFiberProductWithGivenBiasedWeakFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectiveLift" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismByInteger" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismByList" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismWithFixedRangeByInteger" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismWithFixedRangeByList" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismWithFixedSourceAndRangeByInteger" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismWithFixedSourceAndRangeByList" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismWithFixedSourceByInteger" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomMorphismWithFixedSourceByList" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomObjectByInteger" Label="for Is" />
#! * <Ref BookName="CAP" Func="RandomObjectByList" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifyRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifyRange_IsoFromInputObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifyRange_IsoToInputObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySource" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySourceAndRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySourceAndRange_IsoFromInputRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySourceAndRange_IsoFromInputSource" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySourceAndRange_IsoToInputRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySourceAndRange_IsoToInputSource" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySource_IsoFromInputObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="SimplifySource_IsoToInputObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="SomeReductionBySplitEpiSummand" Label="for Is" />
#! * <Ref BookName="CAP" Func="SomeReductionBySplitEpiSummand_MorphismFromInputRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="SomeReductionBySplitEpiSummand_MorphismToInputRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="SubtractionForMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="SumOfMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="TerminalObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="TerminalObjectFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="TerminalObjectFunctorialWithGivenTerminalObjects" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismFromBiasedWeakPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismFromBiasedWeakPushoutWithGivenBiasedWeakPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromCoproduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromCoproductWithGivenCoproduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromDirectSumWithGivenDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromInitialObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromInitialObjectWithGivenInitialObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismFromWeakBiPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismFromWeakBiPushoutWithGivenWeakBiPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromZeroObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromZeroObjectWithGivenZeroObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismIntoBiasedWeakFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismIntoBiasedWeakFiberProductWithGivenBiasedWeakFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoDirectProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoDirectProductWithGivenDirectProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoDirectSumWithGivenDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoTerminalObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoTerminalObjectWithGivenTerminalObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismIntoWeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="UniversalMorphismIntoWeakBiFiberProductWithGivenWeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoZeroObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoZeroObjectWithGivenZeroObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakBiFiberProduct" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakBiFiberProductMorphismToDirectSum" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakBiPushout" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakCokernelColift" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakCokernelColiftWithGivenWeakCokernelObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakCokernelObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakCokernelProjection" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakCokernelProjectionWithGivenWeakCokernelObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakKernelEmbedding" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakKernelEmbeddingWithGivenWeakKernelObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakKernelLift" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakKernelLiftWithGivenWeakKernelObject" Label="for Is" />
#! * <Ref BookName="FreydCategoriesForCAP" Func="WeakKernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="ZeroMorphism" Label="for Is" />
#! * <Ref BookName="CAP" Func="ZeroObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="ZeroObjectFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="ZeroObjectFunctorialWithGivenZeroObjects" Label="for Is" />

#! @Subsection CategoryOfRows of a commutative ring

#! The following additional CAP operations are supported:
#! * <Ref BookName="MonoidalCategories" Func="AssociatorLeftToRight" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="AssociatorLeftToRightWithGivenTensorProducts" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="AssociatorRightToLeft" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="AssociatorRightToLeftWithGivenTensorProducts" Label="for Is" />
#! * <Ref BookName="CAP" Func="BasisOfExternalHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="Braiding" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="BraidingInverse" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="BraidingInverseWithGivenTensorProducts" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="BraidingWithGivenTensorProducts" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoDualOnMorphisms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoDualOnMorphismsWithGivenCoDuals" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoDualOnObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoDualityTensorProductCompatibilityMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoDualityTensorProductCompatibilityMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoLambdaElimination" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoLambdaIntroduction" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoRankMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoTraceMap" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedCoevaluationForCoDual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedCoevaluationForCoDualWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedCoevaluationMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedCoevaluationMorphismWithGivenSource" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedEvaluationForCoDual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedEvaluationForCoDualWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedEvaluationMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoclosedEvaluationMorphismWithGivenRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoefficientsOfMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoevaluationForDual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoevaluationForDualWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoevaluationMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="CoevaluationMorphismWithGivenRange" Label="for Is" />
#! * <Ref BookName="CAP" Func="DistinguishedObjectOfHomomorphismStructure" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="DualOnMorphisms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="DualOnMorphismsWithGivenDuals" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="DualOnObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="EvaluationForDual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="EvaluationForDualWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="EvaluationMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="EvaluationMorphismWithGivenSource" Label="for Is" />
#! * <Ref BookName="CAP" Func="HomomorphismStructureOnMorphisms" Label="for Is" />
#! * <Ref BookName="CAP" Func="HomomorphismStructureOnMorphismsWithGivenObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="HomomorphismStructureOnObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomOnMorphisms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomOnMorphismsWithGivenInternalCoHoms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomOnObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomTensorProductCompatibilityMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomTensorProductCompatibilityMorphismInverse" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomTensorProductCompatibilityMorphismInverseWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomTensorProductCompatibilityMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalCoHomToTensorProductAdjunctionMap" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalHomOnMorphisms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalHomOnMorphismsWithGivenInternalHoms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalHomOnObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="InternalHomToTensorProductAdjunctionMap" Label="for Is" />
#! * <Ref BookName="CAP" Func="InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure" Label="for Is" />
#! * <Ref BookName="CAP" Func="InterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructureWithGivenObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="InterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromCoDualObjectToInternalCoHomFromTensorUnit" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromDualObjectToInternalHomIntoTensorUnit" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalCoHomFromTensorUnitToCoDualObject" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalCoHomToObject" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalCoHomToObjectWithGivenInternalCoHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalCoHomToTensorProductWithCoDualObject" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalHomIntoTensorUnitToDualObject" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalHomToObject" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalHomToObjectWithGivenInternalHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromInternalHomToTensorProductWithDualObject" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromObjectToInternalCoHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromObjectToInternalCoHomWithGivenInternalCoHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromObjectToInternalHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromObjectToInternalHomWithGivenInternalHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromTensorProductWithCoDualObjectToInternalCoHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="IsomorphismFromTensorProductWithDualObjectToInternalHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LambdaElimination" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LambdaIntroduction" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftDistributivityExpanding" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftDistributivityExpandingWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftDistributivityFactoring" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftDistributivityFactoringWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftUnitor" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftUnitorInverse" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftUnitorInverseWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="LeftUnitorWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="MereExistenceOfSolutionOfLinearSystemInAbCategory" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPostCoComposeMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPostCoComposeMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPostComposeMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPostComposeMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPreCoComposeMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPreCoComposeMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPreComposeMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MonoidalPreComposeMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromBidualWithGivenBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromCoBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromCoBidualWithGivenCoBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromInternalCoHomToTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromInternalCoHomToTensorProductWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromInternalHomToTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromInternalHomToTensorProductWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromTensorProductToInternalCoHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromTensorProductToInternalCoHomWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromTensorProductToInternalHom" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismFromTensorProductToInternalHomWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismToBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismToBidualWithGivenBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismToCoBidual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="MorphismToCoBidualWithGivenCoBidual" Label="for Is" />
#! * <Ref BookName="CAP" Func="MultiplyWithElementOfCommutativeRingForMorphisms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RankMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightDistributivityExpanding" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightDistributivityExpandingWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightDistributivityFactoring" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightDistributivityFactoringWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightUnitor" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightUnitorInverse" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightUnitorInverseWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="RightUnitorWithGivenTensorProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="SolveLinearSystemInAbCategory" Label="for Is" />
#! * <Ref BookName="CAP" Func="SolveLinearSystemInAbCategoryOrFail" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductDualityCompatibilityMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductDualityCompatibilityMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductInternalHomCompatibilityMorphism" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductInternalHomCompatibilityMorphismInverse" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductInternalHomCompatibilityMorphismInverseWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductInternalHomCompatibilityMorphismWithGivenObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductOnMorphisms" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductOnMorphismsWithGivenTensorProducts" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductOnObjects" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductToInternalCoHomAdjunctionMap" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorProductToInternalHomAdjunctionMap" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TensorUnit" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="TraceMap" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="UniversalPropertyOfCoDual" Label="for Is" />
#! * <Ref BookName="MonoidalCategories" Func="UniversalPropertyOfDual" Label="for Is" />

#! @Subsection CategoryOfRows of a field

#! The following additional CAP operations are supported:
#! * <Ref BookName="CAP" Func="AstrictionToCoimage" Label="for Is" />
#! * <Ref BookName="CAP" Func="AstrictionToCoimageWithGivenCoimageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoastrictionToImage" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoastrictionToImageWithGivenImageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoimageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoimageProjection" Label="for Is" />
#! * <Ref BookName="CAP" Func="CoimageProjectionWithGivenCoimageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelColift" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelColiftWithGivenCokernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelObjectFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelObjectFunctorialWithGivenCokernelObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelProjection" Label="for Is" />
#! * <Ref BookName="CAP" Func="CokernelProjectionWithGivenCokernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="DirectSumProjectionInPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="EpimorphismFromSomeProjectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="EpimorphismFromSomeProjectiveObjectWithGivenSomeProjectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="FiberProduct" Label="" />
#! * <Ref BookName="CAP" Func="FiberProductEmbeddingInDirectSum" Label="for Is" />
#! * <Ref BookName="CAP" Func="FiberProductFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="FiberProductFunctorialWithGivenFiberProducts" Label="for Is" />
#! * <Ref BookName="CAP" Func="HomologyObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="HomologyObjectFunctorialWithGivenHomologyObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="ImageEmbedding" Label="for Is" />
#! * <Ref BookName="CAP" Func="ImageEmbeddingWithGivenImageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="ImageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectionOfCofactorOfPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="InjectionOfCofactorOfPushoutWithGivenPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="InverseMorphismFromCoimageToImageWithGivenObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsBijectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsInjective" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsProjective" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromCoimageToCokernelOfKernel" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromCokernelOfDiagonalDifferenceToPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromCokernelOfKernelToCoimage" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromFiberProductToKernelOfDiagonalDifference" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromHomologyObjectToItsConstructionAsAnImageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromImageObjectToKernelOfCokernel" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromItsConstructionAsAnImageObjectToHomologyObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromKernelOfCokernelToImageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromKernelOfDiagonalDifferenceToFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="IsomorphismFromPushoutToCokernelOfDiagonalDifference" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelEmbedding" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelEmbeddingWithGivenKernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelLift" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelLiftWithGivenKernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelObjectFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="KernelObjectFunctorialWithGivenKernelObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="MonomorphismIntoSomeInjectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="MonomorphismIntoSomeInjectiveObjectWithGivenSomeInjectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromCoimageToImageWithGivenObjects" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromFiberProductToSink" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromFiberProductToSinkWithGivenFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromKernelObjectToSink" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromKernelObjectToSinkWithGivenKernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromSourceToCokernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromSourceToCokernelObjectWithGivenCokernelObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromSourceToPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="MorphismFromSourceToPushoutWithGivenPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectionInFactorOfFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="ProjectionInFactorOfFiberProductWithGivenFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="Pushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="PushoutFunctorial" Label="for Is" />
#! * <Ref BookName="CAP" Func="PushoutFunctorialWithGivenPushouts" Label="for Is" />
#! * <Ref BookName="CAP" Func="SomeInjectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="SomeProjectiveObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromImage" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromImageWithGivenImageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismFromPushoutWithGivenPushout" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoCoimage" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoCoimageWithGivenCoimageObject" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoFiberProduct" Label="for Is" />
#! * <Ref BookName="CAP" Func="UniversalMorphismIntoFiberProductWithGivenFiberProduct" Label="for Is" />
