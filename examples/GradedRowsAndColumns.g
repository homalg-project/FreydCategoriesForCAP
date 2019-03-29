#################################################################
#################################################################
#! @Chapter Examples on graded rows and columns
#################################################################
#################################################################

LoadPackage( "FreydCategoriesForCAP" );;



#################################################################
#! @Section Constructors of objects and reduction of degree lists
#################################################################

#! @Example
Q := HomalgFieldOfRationalsInSingular();
#! Q
S := GradedRing( Q * "x_1, x_2, x_3, x_4" );
#! Q[x_1,x_2,x_3,x_4]
#! (weights: yet unset)
SetWeightsOfIndeterminates( S, [[1,0],[1,0],[0,1],[0,1]] );
#!
ObjectL := GradedRow( [ [[1,0],2] ], S );
#! <A graded row of rank 2>
DegreeList( ObjectL );
#! [ [ ( 1, 0 ), 2 ] ]
Object2L := GradedRow( [ [[1,0],2], 
           [[1,0],3],[[0,1],2],[[1,0],1] ], S );
#! <A graded row of rank 8>
DegreeList( Object2L );
#! [ [ ( 1, 0 ), 5 ], [ ( 0, 1 ), 2 ], [ ( 1, 0 ), 1 ] ]
UnzipDegreeList( Object2L );
#! [ ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 0, 1 ), ( 0, 1 ), ( 1, 0 ) ]
ObjectR := GradedColumn( [ [[1,0],2] ], S );
#! <A graded column of rank 2>
DegreeList( ObjectR );
#! [ [ ( 1, 0 ), 2 ] ]
Object2R := GradedColumn( [ [[1,0],2], 
           [[1,0],3],[[0,1],2],[[1,0],1] ], S );
#! <A graded column of rank 8>
DegreeList( Object2R );
#! [ [ ( 1, 0 ), 5 ], [ ( 0, 1 ), 2 ], [ ( 1, 0 ), 1 ] ]
UnzipDegreeList( Object2R );
#! [ ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 1, 0 ), ( 0, 1 ), ( 0, 1 ), ( 1, 0 ) ]
#! @EndExample


#! Whenever the object constructor is called, it tries to simplify the given degree list. To this end it checks if
#! subsequent degree group elements match. If so, their multiplicities are added. So, as in the example above we have:
#! $$ [ [(1,0),2], [(1,0),3],[(0,1),2],[(1,0),1] ] \mapsto [ [ ( 1, 0 ), 5 ], [ ( 0, 1 ), 2 ], [ ( 1, 0 ), 1 ] ] $$
#! Note that, even though there are two occurances of $\left( 1,0 \right)$ in the final degree list, we do not
#! simplify further. The reason for this is as follows. Assume that we have a map of graded rows
#! $$ \varphi \colon A \to B $$
#! given by a homomgeneous matrix $M$ and that we want to compute the weak kernel embedding of this mapping. To this end we
#! first compute the row syzygies of
#! $M$. Let us call the corresponding matrix $N$. Then we deduce the degree list of the weak kernel object from $N$ and
#! from the graded row $A$. Once this degree list is known, we would call the object constructor.
#! If this object constructor summarised all (and not only subsequent) occurances of one degree element in the
#! degree list, then in order to make sure that the weak kernel embedding is a mapping of graded rows, the rows
#! of the matrix $N$ would have to be shuffled. The latter we do not wish to perform.
#!
#! Note that the 'IsEqualForObjects' methods returns true whenever the degree lists of two graded rows/columns are identical. So
#! in particular it returns false, if the degree lists are mere permutations of one another.
#! Here is an example.

#! @Example

Object2LShuffle := GradedRow( [ [[0,1],1],
           [[1,0],2],[[0,1],1],[[1,0],4] ], S );
#! <A graded row of rank 8>
IsEqualForObjects( Object2L, Object2LShuffle );
#! false
Object2RShuffle := GradedColumn( [ [[0,1],1],
           [[1,0],2],[[0,1],1],[[1,0],4] ], S );
#! <A graded column of rank 8>
IsEqualForObjects( Object2R, Object2RShuffle );
#! false

#! @EndExample



#####################################
#! @Section Constructors of morphisms
#####################################

#! @Example
Q1L := GradedRow( [ [[1,0],1] ], S );
#! <A graded row of rank 1>
IsWellDefined( Q1L );
#! true
Q2L := GradedRow( [ [[0,0],2] ], S );
#! <A graded row of rank 2>
m1L := GradedRowOrColumnMorphism( 
      Q1L, HomalgMatrix( [["x_1","x_2"]], S ) ,Q2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
IsWellDefined( m1L );
#! true
Display( Source( m1L ) );
#! A graded row over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 1 and degrees: 
#! [ [ ( 1, 0 ), 1 ] ]
Display( Range( m1L ) );
#! A graded row over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 2 and degrees: 
#! [ [ 0, 2 ] ]
Display( UnderlyingHomalgMatrix( m1L ) );
#! x_1,x_2
#! (over a graded ring)
Q1R := GradedColumn( [ [[1,0],1] ], S );
#! <A graded column of rank 1>
IsWellDefined( Q1R );
#! true
Q2R := GradedColumn( [ [[0,0],2] ], S );
#! <A graded column of rank 2>
m1R := GradedRowOrColumnMorphism( 
      Q1R, HomalgMatrix( [["x_1"],["x_2"]], S ) ,Q2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
IsWellDefined( m1R );
#! true
Display( Source( m1R ) );
#! A graded column over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 1 and degrees: 
#! [ [ ( 1, 0 ), 1 ] ]
Display( Range( m1R ) );
#! A graded column over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 2 and degrees: 
#! [ [ 0, 2 ] ]
Display( UnderlyingHomalgMatrix( m1R ) );
#! x_1,
#! x_2
#! (over a graded ring)

#! @EndExample



##############################
#! @Section The GAP categories
##############################

#! @Example

categoryL := CapCategory( Q1L );
#! CAP category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])
categoryR := CapCategory( Q1R );
#! CAP category of graded columns over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])

#! @EndExample



#######################################################################
#! @Section A few categorical constructions for graded rows
#######################################################################

#! @Example

ZeroObject( categoryL );
#! <A graded row of rank 0>
O1L := GradedRow( [ [[1,0],2] ], S );
#! <A graded row of rank 2>
Display( ZeroMorphism( ZeroObject( categoryL ), O1L ) );
#! A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! (an empty 0 x 2 matrix)
O2L := GradedRow( [ [[0,0],1] ], S );
#! <A graded row of rank 1>
Display( IdentityMorphism( O2L ) );
#! A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! 1
#! (over a graded ring)
directSumL := DirectSum( [ O1L, O2L ] );
#! <A graded row of rank 3>
Display( directSumL );
#! A graded row over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 3 and degrees:
#! [ [ ( 1, 0 ), 2 ], [ 0, 1 ] ]
i1L := InjectionOfCofactorOfDirectSum( [ O1L, O2L ], 1 );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( i1L ) );
#! 1,0,0,
#! 0,1,0 
#! (over a graded ring)
i2L := InjectionOfCofactorOfDirectSum( [ O1L, O2L ], 2 );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ],[ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( i2L ) );
#! 0,0,1
#! (over a graded ring)
proj1L := ProjectionInFactorOfDirectSum( [ O1L, O2L ], 1 );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( proj1L ) );
#! 1,0,
#! 0,1,
#! 0,0 
#! (over a graded ring)
proj2L := ProjectionInFactorOfDirectSum( [ O1L, O2L ], 2 );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( proj2L ) );
#! 0,
#! 0,
#! 1 
#! (over a graded ring)
kL := WeakKernelEmbedding( proj1L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( kL ) );
#! 0,0,1
#! (over a graded ring)
ckL := WeakCokernelProjection( kL );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( ckL ) );
#! 1,0,
#! 0,1,
#! 0,0 
#! (over a graded ring)
IsMonomorphism( kL );
#! true
IsEpimorphism( kL );
#! false
IsMonomorphism( ckL );
#! false
IsEpimorphism( ckL );
#! true
m1L := GradedRowOrColumnMorphism( O1L, 
      HomalgMatrix( [[ "x_1" ], [ "x_2" ]], S ), O2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
m2L := IdentityMorphism( O2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
liftL := Lift( m1L, m2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( liftL ) );
#! x_1,
#! x_2 
#! (over a graded ring)
O3L := GradedRow( [ [[-1,0],2] ], S );
#! <A graded row of rank 2>
morL := GradedRowOrColumnMorphism( 
       O2L, HomalgMatrix( [[ "x_1, x_2" ]], S ), O3L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
coliftL := Colift( m2L, morL );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( coliftL ) );
#! x_1,x_2
#! (over a graded ring)
fpL := WeakBiFiberProduct( m1L, m2L );
#! <A graded row of rank 2>
fp_proj1L := ProjectionInFirstFactorOfWeakBiFiberProduct( m1L, m2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( fp_proj1L ) );
#! 1,0,
#! 0,1 
#! (over a graded ring)
fp_proj2L := ProjectionInSecondFactorOfWeakBiFiberProduct( m1L, m2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( fp_proj2L ) );
#! x_1,
#! x_2 
#! (over a graded ring)
BiasedWeakFiberProduct( m1L, m2L );
#! <A graded row of rank 2>
pbwfprow := ProjectionOfBiasedWeakFiberProduct( m1L, m2L );
#! <A morphism in the category of graded rows over
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( pbwfprow );
#! A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! with matrix: 
#! 1,0,
#! 0,1 
#! (over a graded ring)
poL := WeakBiPushout( morL, m2L );
#! <A graded row of rank 2>
inj1L := InjectionOfFirstCofactorOfWeakBiPushout( morL, m2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( inj1L ) );
#! 1,0,
#! 0,1 
#! (over a graded ring)
inj2L := InjectionOfSecondCofactorOfWeakBiPushout( morL, m2L );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( inj2L ) );
#! x_1,x_2
#! (over a graded ring)
injectionL := InjectionOfBiasedWeakPushout( morL, m2L );
#! <A morphism in the category of graded rows over
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
IsWellDefined( injectionL );
#! true
Display( injectionL );
#! A morphism in the category of graded rows over
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])
#! with matrix:
#! 1,0,
#! 0,1
#! (over a graded ring)
tensorProductL := TensorProductOnObjects( O1L, O2L );
#! <A graded row of rank 2>
Display( tensorProductL );
#! A graded row over Q[x_1,x_2,x_3,x_4] (with weights 
#! [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 2 and degrees: 
#! [ [ ( 1, 0 ), 2 ] ]
tensorProductMorphismL := TensorProductOnMorphisms( m2L, morL );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( tensorProductMorphismL );
#! A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! x_1,x_2
#! (over a graded ring)
Display( DualOnObjects( TensorProductOnObjects( ObjectL, Object2L ) ) );
#! A graded row over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 16 and degrees: 
#! [ [ ( -2, 0 ), 5 ], [ ( -1, -1 ), 2 ], [ ( -2, 0 ), 6 ], [ ( -1, -1 ), 2 ], 
#! [ ( -2, 0 ), 1 ] ]
Display( DualOnMorphisms( m1L ) );
#! A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! x_1,x_2
#! (over a graded ring)
Display( EvaluationForDualWithGivenTensorProduct( TensorProductOnObjects( 
DualOnObjects( ObjectL ), ObjectL ), ObjectL, TensorUnit( categoryL ) ) );
#! A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! 1,
#! 0,
#! 0,
#! 1 
#! (over a graded ring)
Display( InternalHomOnObjects( ObjectL, ObjectL ) );
#! A graded row over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! of rank 4 and degrees: 
#! [ [ 0, 4 ] ]

#! @EndExample



########################################################################
#! @Section A few categorical constructions for graded columns
########################################################################

#! @Example
ZeroObject( categoryR );
#! <A graded column of rank 0>
O1R := GradedColumn( [ [[1,0],2] ], S );
#! <A graded column of rank 2>
Display( ZeroMorphism( ZeroObject( categoryR ), O1R ) );
#! A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! with matrix: 
#! (an empty 2 x 0 matrix)
O2R := GradedColumn( [ [[0,0],1] ], S );
#! <A graded column of rank 1>
Display( IdentityMorphism( O2R ) );
#! A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! with matrix: 
#! 1
#! (over a graded ring)
directSumR := DirectSum( [ O1R, O2R ] );
#! <A graded column of rank 3>
Display( directSumR );
#! A graded column over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 3 and degrees:
#! [ [ ( 1, 0 ), 2 ], [ 0, 1 ] ]
i1R := InjectionOfCofactorOfDirectSum( [ O1R, O2R ], 1 );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( i1R ) );
#! 1,0,
#! 0,1,
#! 0,0
#! (over a graded ring)
i2R := InjectionOfCofactorOfDirectSum( [ O1R, O2R ], 2 );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ],[ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( i2R ) );
#! 0,
#! 0,
#! 1
#! (over a graded ring)
proj1R := ProjectionInFactorOfDirectSum( [ O1R, O2R ], 1 );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( proj1R ) );
#! 1,0,0,
#! 0,1,0
#! (over a graded ring)
proj2R := ProjectionInFactorOfDirectSum( [ O1R, O2R ], 2 );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( proj2R ) );
#! 0,0,1
#! (over a graded ring)
kR := WeakKernelEmbedding( proj1R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( kR ) );
#! 0,
#! 0,
#! 1
#! (over a graded ring)
ckR := WeakCokernelProjection( kR );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( ckR ) );
#! 1,0,0,
#! 0,1,0
#! (over a graded ring)
IsMonomorphism( kR );
#! true
IsEpimorphism( kR );
#! false
IsMonomorphism( ckR );
#! false
IsEpimorphism( ckR );
#! true
m1R := GradedRowOrColumnMorphism( O1R, 
      HomalgMatrix( [[ "x_1", "x_2" ]], S ), O2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
m2R := IdentityMorphism( O2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
liftR := Lift( m1R, m2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( UnderlyingHomalgMatrix( liftR ) );
#! x_1,x_2
#! (over a graded ring)
O3R := GradedColumn( [ [[-1,0],2] ], S );
#! <A graded column of rank 2>
morR := GradedRowOrColumnMorphism( 
       O2R, HomalgMatrix( [[ "x_1" ], [ "x_2" ]], S ), O3R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
coliftR := Colift( m2R, morR );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( coliftR ) );
#! x_1,
#! x_2
#! (over a graded ring)
fpR := WeakBiFiberProduct( m1R, m2R );
#! <A graded column of rank 2>
fp_proj1R := ProjectionInFirstFactorOfWeakBiFiberProduct( m1R, m2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( fp_proj1R ) );
#! 1,0,
#! 0,1 
#! (over a graded ring)
fp_proj2R := ProjectionInSecondFactorOfWeakBiFiberProduct( m1R, m2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( fp_proj2R ) );
#! x_1, x_2
#! (over a graded ring)
BiasedWeakFiberProduct( m1R, m2R );
#! <A graded column of rank 2>
pbwfpcol := ProjectionOfBiasedWeakFiberProduct( m1R, m2R );
#! <A morphism in the category of graded columns over
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( pbwfpcol );
#! A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! with matrix: 
#! 1,0,
#! 0,1 
#! (over a graded ring)
poR := WeakBiPushout( morR, m2R );
#! <A graded column of rank 2>
inj1R := InjectionOfFirstCofactorOfWeakBiPushout( morR, m2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( inj1R ) );
#! 1,0,
#! 0,1 
#! (over a graded ring)
inj2R := InjectionOfSecondCofactorOfWeakBiPushout( morR, m2R );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( UnderlyingHomalgMatrix( inj2R ) );
#! x_1,
#! x_2
#! (over a graded ring)
injectionR := InjectionOfBiasedWeakPushout( morR, m2R );
#! <A morphism in the category of graded columns over
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
IsWellDefined( injectionR );
#! true
Display( injectionR );
#! A morphism in the category of graded columns over
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])
#! with matrix:
#! 1,0,
#! 0,1
#! (over a graded ring)
tensorProductR := TensorProductOnObjects( O1R, O2R );
#! <A graded column of rank 2>
Display( tensorProductR );
#! A graded column over Q[x_1,x_2,x_3,x_4] (with weights 
#! [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 2 and degrees: 
#! [ [ ( 1, 0 ), 2 ] ]
tensorProductMorphismR := TensorProductOnMorphisms( m2R, morR );
#! <A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ])>
Display( tensorProductMorphismR );
#! A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! x_1,
#! x_2
#! (over a graded ring)
Display( DualOnObjects( TensorProductOnObjects( ObjectR, Object2R ) ) );
#! A graded column over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) of rank 16 and degrees: 
#! [ [ ( -2, 0 ), 5 ], [ ( -1, -1 ), 2 ], [ ( -2, 0 ), 6 ], [ ( -1, -1 ), 2 ], 
#! [ ( -2, 0 ), 1 ] ]
Display( DualOnMorphisms( m1R ) );
#! A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! with matrix: 
#! x_1,
#! x_2 
#! (over a graded ring)
Display( EvaluationForDualWithGivenTensorProduct( TensorProductOnObjects( 
DualOnObjects( ObjectR ), ObjectR ), ObjectR, TensorUnit( categoryR ) ) );
#! A morphism in the category of graded columns over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [0, 1 ] ]) 
#! with matrix: 
#! 1,0,0,1
#! (over a graded ring)
Display( InternalHomOnObjects( ObjectR, ObjectR ) );
#! A graded column over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) 
#! of rank 4 and degrees: 
#! [ [ 0, 4 ] ]

#! @EndExample







#! @Section FreydCategory for graded rows

#! @Example
cat := CAPCategoryOfGradedRows( S );
#! CAP category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])
obj1 := GradedRow( [ [[1,1],1] ], S );
#! <A graded row of rank 1>
obj2 := GradedRow( [ [[1,1],2] ], S );
#! <A graded row of rank 2>
gamma := GradedRowOrColumnMorphism( obj2, 
                       HomalgMatrix( [ [ 1, 1 ], [ 1, 1 ] ], 2, 2, S ), obj2 );
#! <A morphism in the category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
freyd := FreydCategory( cat );
#! Freyd( CAP category of graded rows over Q[x_1,x_2,x_3,x_4]
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )
IsAbelianCategory( freyd );
#! true
obj_gamma := FreydCategoryObject( gamma );
#! <An object in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
f := FreydCategoryMorphism( obj_gamma, gamma, obj_gamma );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
witness := MorphismWitness( f );
#! <A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( witness );
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 2,0,
#! 2,0 
#! (over a graded ring)
g := FreydCategoryMorphism( obj_gamma, 
                                   ZeroMorphism( obj2, obj2 ), obj_gamma );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
IsCongruentForMorphisms( f, g );
#! true
c := PreCompose( f, f );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( c );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 2,2,
#! 2,2 
#! (over a graded ring)
s := g + g;
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( s );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 0,0,
#! 0,0 
#! (over a graded ring)
a := GradedRowOrColumnMorphism( obj1, 
                                 HomalgMatrix( [ [ 2 ] ], 1, 1, S ), obj1 );
#! <A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ])>
Display( a );
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 2
#! (over a graded ring)
Z2 := FreydCategoryObject( a );
#! <An object in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( Z2 );
#! Relation morphism:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 2
#! (over a graded ring)
id := IdentityMorphism( Z2 );
#! <An identity morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
z := id + id + id;
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( z );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 3
#! (over a graded ring)
d := DirectSumFunctorial( [ z, z, z ] );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( d );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 3,0,0,
#! 0,3,0,
#! 0,0,3 
#! (over a graded ring)
pr2 := ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 2 );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
pr3 := ProjectionInFactorOfDirectSum( [ Z2, Z2, Z2 ], 3 );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( UniversalMorphismIntoDirectSum( [ pr3, pr2 ] ) );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 0,0,
#! 0,1,
#! 1,0 
#! (over a graded ring)
inj1 := InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 1 );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
inj2 := InjectionOfCofactorOfDirectSum( [ Z2, Z2, Z2 ], 2 );
#! <A morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( UniversalMorphismFromDirectSum( [ inj2, inj1 ] ) );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 0,1,0,
#! 1,0,0 
#! (over a graded ring)
ZFree := AsFreydCategoryObject( obj1 );
#! <A projective object in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( ZFree );
#! Relation morphism:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! (an empty 0 x 1 matrix)
id := IdentityMorphism( ZFree );
#! <An identity morphism in Freyd( CAP category of graded rows over 
#! Q[x_1,x_2,x_3,x_4] (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
z := id + id;
#! <A morphism in Freyd( CAP category of graded rows over Q[x_1,x_2,x_3,x_4]
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) )>
Display( z );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4] 
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 2
#! (over a graded ring)
Display( CokernelProjection( z ) );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4]
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 1
#! (over a graded ring)
Display( CokernelColift( z, CokernelProjection( z ) ) );
#! Morphism datum:
#! A morphism in the category of graded rows over Q[x_1,x_2,x_3,x_4]
#! (with weights [ [ 1, 0 ], [ 1, 0 ], [ 0, 1 ], [ 0, 1 ] ]) with matrix: 
#! 1
#! (over a graded ring)
#! @EndExample
