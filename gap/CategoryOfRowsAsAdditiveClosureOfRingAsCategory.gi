# SPDX-License-Identifier: GPL-2.0-or-later
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# Implementations
#

####################################
##
## Constructors
##
####################################

##
InstallMethod( CategoryOfRowsAsAdditiveClosureOfRingAsCategory,
               [ IsHomalgRing ],
               
  function( homalg_ring )
    local ring_as_category, add, object_constructor, object_datum, morphism_constructor, morphism_datum, category_object_filter, wrapper;
    
    ring_as_category := RingAsCategory( homalg_ring : FinalizeCategory := true );
    
    add := AdditiveClosure( ring_as_category : FinalizeCategory := true );
    
    object_constructor := function ( cat, object_datum )
        
        return CategoryOfRowsObject( cat, Length( ObjectList( object_datum ) ) );
        
    end;
    
    object_datum := function ( cat, object )
      local add, ring_as_category, unique_object;
        
        add := ModelingCategory( cat );
        ring_as_category := UnderlyingCategory( add );
        
        unique_object := RingAsCategoryUniqueObject( ring_as_category );
        
        return AdditiveClosureObject( add, ListWithIdenticalEntries( RankOfObject( object ), unique_object ) );
        
    end;
    
    morphism_constructor := function ( cat, source, morphism_datum, range )
      local matrix_entries, homalg_matrix;
        
        matrix_entries := List( MorphismMatrix( morphism_datum ),
            row -> List( row,
                c -> UnderlyingRingElement( c )
            )
        );
        
        homalg_matrix := HomalgMatrixListList( matrix_entries, RankOfObject( source ), RankOfObject( range ), UnderlyingRing( cat ) );
        
        return CategoryOfRowsMorphism( cat, source, homalg_matrix, range );
        
    end;
    
    morphism_datum := function ( cat, morphism )
      local add, ring_as_category, unique_object, nr_rows, nr_cols, source, range, matrix_entries, listlist;
        
        add := ModelingCategory( cat );
        ring_as_category := UnderlyingCategory( add );
        
        unique_object := RingAsCategoryUniqueObject( ring_as_category );
        
        nr_rows := NrRows( UnderlyingMatrix( morphism ) );
        nr_cols := NrCols( UnderlyingMatrix( morphism ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, RankOfObject( Source( morphism ) ) = nr_rows );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, RankOfObject( Range( morphism ) ) = nr_cols );
        
        source := AdditiveClosureObject( add, ListWithIdenticalEntries( nr_rows, unique_object ) );
        range := AdditiveClosureObject( add, ListWithIdenticalEntries( nr_cols, unique_object ) );
        
        matrix_entries := EntriesOfHomalgMatrixAsListList( UnderlyingMatrix( morphism ) );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( matrix_entries ) = nr_rows );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( matrix_entries, row -> Length( row ) = nr_cols ) );
        
        listlist := List( matrix_entries,
            row -> List( row,
                c -> RingAsCategoryMorphism( ring_as_category, c )
            )
        );
        
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, Length( listlist ) = Length( ObjectList( source ) ) );
        #% CAP_JIT_DROP_NEXT_STATEMENT
        Assert( 0, ForAll( listlist, row -> Length( row ) = Length( ObjectList( range ) ) ) );
        
        return AdditiveClosureMorphism( add, source, listlist, range );
        
    end;
    
    if HasIsFieldForHomalg( homalg_ring ) and IsFieldForHomalg( homalg_ring ) then
        
        category_object_filter := IsCategoryOfRowsObject and HasIsProjective and IsProjective;
        
    else
        
        category_object_filter := IsCategoryOfRowsObject;
        
    fi;
    
    wrapper := WrapperCategory( add, rec(
        name := Concatenation( "Rows( ", RingName( homalg_ring )," )" ),
        category_filter := IsCategoryOfRows,
        category_object_filter := category_object_filter,
        category_morphism_filter := IsCategoryOfRowsMorphism and HasUnderlyingMatrix,
        object_constructor := object_constructor,
        object_datum := object_datum,
        morphism_constructor := morphism_constructor,
        morphism_datum := morphism_datum,
        only_primitive_operations := true,
    ) : FinalizeCategory := false );
    
    SetUnderlyingRing( wrapper, homalg_ring );
    
    wrapper!.compiler_hints.category_attribute_names := [
        "UnderlyingRing",
    ];
    wrapper!.compiler_hints.source_and_range_attributes_from_morphism_attribute := rec(
        object_attribute_name := "RankOfObject",
        morphism_attribute_name := "UnderlyingMatrix",
        source_attribute_getter_name := "NumberRows",
        range_attribute_getter_name := "NumberColumns",
    );
    
    if HasRangeCategoryOfHomomorphismStructure( ring_as_category ) then
        
        SetGeneratingSystemOfRingAsModuleInRangeCategoryOfHomomorphismStructure( wrapper, GeneratingSystemAsModuleInRangeCategoryOfHomomorphismStructure( ring_as_category ) );
        SetColumnVectorOfGeneratingSystemOfRingAsModuleInRangeCategoryOfHomomorphismStructure( wrapper, ColumnVectorOfGeneratingSystemAsModuleInRangeCategoryOfHomomorphismStructure( ring_as_category ) );
        SetRingInclusionForHomomorphismStructure( wrapper, RingInclusionForHomomorphismStructure( ring_as_category ) );
        
        Add( wrapper!.compiler_hints.category_attribute_names, "GeneratingSystemOfRingAsModuleInRangeCategoryOfHomomorphismStructure" );
        Add( wrapper!.compiler_hints.category_attribute_names, "ColumnVectorOfGeneratingSystemOfRingAsModuleInRangeCategoryOfHomomorphismStructure" );
        Add( wrapper!.compiler_hints.category_attribute_names, "RingInclusionForHomomorphismStructure" );
        
    fi;
    
    if HasHasInvariantBasisProperty( homalg_ring ) and HasInvariantBasisProperty( homalg_ring ) then
        
        SetIsSkeletalCategory( wrapper, true );
        
    fi;
    
    if HasIsFieldForHomalg( homalg_ring ) and IsFieldForHomalg( homalg_ring ) then
        
        SetIsAbelianCategory( wrapper, true );
        
    fi;

    # some manually precompiled functions
    
    ##
    AddZeroMorphism( wrapper,
      function( cat, source, range )
        
        return CategoryOfRowsMorphism( cat, source, HomalgMatrixListList( NullMatImmutable( RankOfObject( source ), RankOfObject( range ) ), RankOfObject( source ), RankOfObject( range ), homalg_ring ), range );
        
    end );
    
    ##
    AddDirectSum( wrapper,
      function( cat, object_list )
        local rank;
        
        rank := Sum( List( object_list, object -> RankOfObject( object ) ) );
        
        return CategoryOfRowsObject( cat, rank );
        
    end );
    
    Finalize( wrapper );
    
    return wrapper;
    
end );

InstallGlobalFunction( COMPILATION_HELPER_HomalgMatrixFromRingElement, function ( ring_element, ring )
    
    return HomalgMatrix( [ ring_element ], 1, 1, ring );
    
end );
