# SPDX-License-Identifier: GPL-2.0-or-later
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# Declarations
#
#! @Chapter Category of rows

####################################
##
#! @Section GAP Categories
##
####################################

#! @Description
#! The GAP category of objects in the category
#! of rows over a ring $R$.
#! @Arguments object
DeclareCategory( "IsCategoryOfRowsObject",
                 IsCapCategoryObject );

DeclareCategory( "IsCategoryOfRowsMorphism",
                 IsCapCategoryMorphism );

DeclareGlobalFunction( "INSTALL_FUNCTIONS_FOR_CATEGORY_OF_ROWS" );

DeclareCategory( "IsCategoryOfRows",
                 IsCapCategory );

####################################
##
#! @Section Constructors
##
####################################

DeclareOperation( "CategoryOfRows",
                  [ IsHomalgRing ] );

DeclareOperation( "CategoryOfRowsObject",
                  [ IsInt, IsCategoryOfRows ] );

KeyDependentOperation( "CategoryOfRowsObject",
                       IsCategoryOfRows, IsInt, ReturnTrue );

DeclareOperation( "AsCategoryOfRowsMorphism",
                  [ IsHomalgMatrix, IsCategoryOfRows ] );

DeclareOperation( "CategoryOfRowsMorphism",
                  [ IsCategoryOfRowsObject, IsHomalgMatrix, IsCategoryOfRowsObject ] );

DeclareOperation( "\/",
                  [ IsHomalgMatrix, IsCategoryOfRows ] );

KeyDependentOperation( "StandardRowMorphism",
                       IsCategoryOfRowsObject, IsInt, ReturnTrue );

####################################
##
#! @Section Random Methods in Category of Rows
##
####################################

if false then

#! @Description
#! The arguments are a category <A>C</A> and a list <A>L</A> of integers. The output is an object whose
#! rank is the absolute value of a random element in <A>L</A>, or 0 if <A>L</A> is empty.
#! @Returns an object in a category of rows
#! @Arguments C, L
DeclareOperation( RandomObjectByList, [ IsCategoryOfRows, IsList ] );

#! @Description
#! The arguments are a category of rows <A>C</A> and an integer <A>n</A>. The output is an object whose rank
#! is at most the absolute value of <A>n</A>.
#! @Returns an object in a category of rows
#! @Arguments C, n
DeclareOperation( RandomObjectByInteger, [ IsCategoryOfRows, IsInt ] );

#! @Description
#! The arguments are two objects <A>S</A>, <A>R</A> and a list <A>L</A> of integers.
#! The output is a morphism from <A>S</A> to <A>R</A> whose matrix is an <A>L</A>-linear combination of random
#! matrices over the underlying ring, or the zero morphism if <A>L</A> is empty.
#! @Returns  a morphism in a category of rows
#! @Arguments S, R, L
DeclareOperation( RandomMorphismWithFixedSourceAndRangeByList, [ IsCategoryOfRowsObject, IsCategoryOfRowsObject, IsList ] );

#! @Description
#! The arguments are two objects <A>S</A>, <A>R</A> and an integer <A>n</A>.
#! The output is a morphism from <A>S</A> to <A>R</A> defined by a random matrix over the underlying ring.
#! Particularly, the argument <A>n</A> will be disregarded.
#! @Returns  a morphism in a category of rows
#! @Arguments S, R, n
DeclareOperation( RandomMorphismWithFixedSourceAndRangeByInteger, [ IsCategoryOfRowsObject, IsCategoryOfRowsObject, IsInt ] );

#! @Description
#! The arguments are an object <A>S</A> and a list <A>L</A> consisting of two lists of integers.
#! The output is a morphism from <A>S</A> to an object <A>R</A> whose rank is the absolute value of a random element
#! in <A>L</A>[1], or 0 if <A>L</A>[1] is empty.
#! The matrix of the morphism is an <A>L</A>[2]-linear combination of random matrices over the underlying ring, or the zero matrix
#! if <A>L</A>[2] is empty.
#! @Returns a morphism in a category of rows
#! @Arguments S, L
DeclareOperation( RandomMorphismWithFixedSourceByList, [ IsCategoryOfRowsObject, IsList ] );

#! @Description
#! The arguments are an object <A>S</A> and an integer <A>n</A>.
#! The output is a morphism from <A>S</A> to an object <A>R</A> whose rank is at most the absolute value of <A>n</A>.
#! @Returns  a morphism in a category of rows
#! @Arguments S, n
DeclareOperation( RandomMorphismWithFixedSourceByInteger, [ IsCategoryOfRowsObject, IsInt ] );

#! @Description
#! The arguments are an object <A>R</A> and a list <A>L</A> consisting of two lists of integers.
#! The output is a morphism to <A>R</A> from an object <A>S</A> whose rank is the absolute value of a random element
#! in <A>L</A>[1], or 0 if <A>L</A>[1] is empty.
#! The matrix of the morphism is an <A>L</A>[2]-linear combination of random matrices over the underlying ring, or the zero matrix
#! if <A>L</A>[2] is empty.
#! @Returns a morphism in a category of rows
#! @Arguments R, L
DeclareOperation( RandomMorphismWithFixedRangeByList, [ IsCategoryOfRowsObject, IsList ] );

#! @Description
#! The arguments are an object <A>R</A> and an integer <A>n</A>.
#! The output is a morphism to <A>R</A> from an object <A>S</A> whose rank is at most the absolute value of <A>n</A>.
#! @Returns a morphism in a category of rows
#! @Arguments R, n
DeclareOperation( RandomMorphismWithFixedRangeByInteger, [ IsCategoryOfRowsObject, IsInt ] );

#! @Description
#! The arguments are a category of rows <A>C</A> and a list <A>L</A> consisting of 3 lists of integers.
#! The output is a morphism from an object <A>S</A> to an object <A>R</A> whose ranks are the absolute values of
#! random elements in <A>L</A>[1] resp. <A>L</A>[2].
#! Its matrix is an <A>L</A>[3]-linear combination of random matrices over the underlying ring, or the zero matrix if <A>L</A>[3] is empty.
#! @Returns  a morphism in a category of rows
#! @Arguments C, L
DeclareOperation( RandomMorphismByList, [ IsCategoryOfRows, IsList ] );

#! @Description
#! The arguments are a category of rows <A>C</A> and an integer <A>n</A>.
#! The output is a morphism whose source and range ranks are at most the absolute value of <A>n</A>.
#! @Returns  a morphism in a category of rows
#! @Arguments C, n
DeclareOperation( RandomMorphismByInteger, [ IsCategoryOfRows, IsInt ] );

fi;


####################################
##
#! @Section Attributes
##
####################################

DeclareAttribute( "UnderlyingRing",
                  IsCategoryOfRows );
CapJitAddTypeSignature( "UnderlyingRing", [ IsCategoryOfRows ], IsHomalgRing );

DeclareAttribute( "GeneratingSystemOfRingAsModuleInRangeCategoryOfHomomorphismStructure",
                  IsCategoryOfRows );

DeclareAttribute( "ColumnVectorOfGeneratingSystemOfRingAsModuleInRangeCategoryOfHomomorphismStructure",
                  IsCategoryOfRows );

DeclareAttribute( "RingInclusionForHomomorphismStructure",
                  IsCategoryOfRows );

DeclareAttribute( "RankOfObject",
                  IsCategoryOfRowsObject );
CapJitAddTypeSignature( "RankOfObject", [ IsCategoryOfRowsObject ], IsInt );

DeclareAttribute( "UnderlyingMatrix",
                  IsCategoryOfRowsMorphism );
CapJitAddTypeSignature( "UnderlyingMatrix", [ IsCategoryOfRowsMorphism ], IsHomalgMatrix );

DeclareAttribute( "UnderlyingMatrix",
                  IsCategoryOfRowsMorphism );

DeclareAttribute( "CATEGORY_OF_ROWS_ReductionBySplitEpiSummandTuple",
                  IsCategoryOfRowsMorphism );

####################################
##
#! @Section Global functions
##
####################################

DeclareGlobalFunction( "CATEGORY_OF_ROWS_SimplificationSourceAndRangeTuple" );

DeclareGlobalFunction( "CATEGORY_OF_ROWS_SimplificationSourceTuple" );

DeclareGlobalFunction( "CATEGORY_OF_ROWS_SimplificationRangeTuple" );
