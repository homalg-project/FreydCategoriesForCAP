#! @Chapter Examples and Tests

#! @Section Rings as Ab-categories

LoadPackage( "FreydCategoriesForCAP" );;

#! @Example
CR := RingAsCategory( Integers );;
u := RingAsCategoryUniqueObject( CR );;
alpha := 2 / CR;
#! <2>
IsOne( alpha );
#! false
IsZero( alpha );
#! false
alpha * alpha;
#! <4>
-alpha;
#! <-2>
IsZero( alpha + AdditiveInverse( alpha ) );
#! true
beta := RingAsCategoryMorphism( 1/2, CR );;
IsWellDefined( beta );
#! false
gamma := IdentityMorphism( u );
#! <1>
IsOne( gamma );
#! true
delta := ZeroMorphism( u, u );
#! <0>
IsZero( delta );
#! true
2 * alpha;
#! <4>
Lift( alpha * alpha, alpha );
#! <2>
Colift( alpha, alpha * alpha );
#! <2>
BasisOfExternalHom( u, u );
#! [ <1> ]
CoefficientsOfMorphism( alpha );
#! [ 2 ]
IsCongruentForMorphisms( alpha, SumOfMorphisms( u, ListN( CoefficientsOfMorphism( alpha ), BasisOfExternalHom( u, u ), { x, y } -> MultiplyWithElementOfCommutativeRingForMorphisms( x, y ) ), u ) );
#! true

EEE := KoszulDualRing( HomalgFieldOfRationalsInSingular( ) * "x,y" );;
CE := RingAsCategory( EEE );;
u := RingAsCategoryUniqueObject( CE );;
alpha := ("2 + 3 * e0 + 4 * e1 + 5 * e0*e1" / EEE) / CE;
#! <5*e0*e1+3*e0+4*e1+2>
IsOne( alpha );
#! false
IsZero( alpha );
#! false
alpha * alpha;
#! <20*e0*e1+12*e0+16*e1+4>
-alpha;
#! <-5*e0*e1-3*e0-4*e1-2>
IsZero( alpha + AdditiveInverse( alpha ) );
#! true
gamma := IdentityMorphism( u );
#! <1>
IsOne( gamma );
#! true
delta := ZeroMorphism( u, u );
#! <0>
IsZero( delta );
#! true
2 * alpha;
#! <10*e0*e1+6*e0+8*e1+4>
Lift( alpha * alpha, alpha );
#! <5*e0*e1+3*e0+4*e1+2>
Colift( alpha, alpha * alpha );
#! <5*e0*e1+3*e0+4*e1+2>
BasisOfExternalHom( u, u );
#! [ <1>, <e0>, <e1>, <e0*e1> ]
CoefficientsOfMorphism( alpha );
#! [ 2, 3, 4, 5 ]
IsCongruentForMorphisms( alpha, SumOfMorphisms( u, ListN( CoefficientsOfMorphism( alpha ), BasisOfExternalHom( u, u ), { x, y } -> MultiplyWithElementOfCommutativeRingForMorphisms( x, y ) ), u ) );
#! true

#! @EndExample
