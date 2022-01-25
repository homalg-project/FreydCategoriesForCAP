# SPDX-License-Identifier: GPL-2.0-or-later
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# Implementations
#

Add( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_FILTERS, IsHomalgRing );
Add( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_FILTERS, IsHomalgRingElement );
Add( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_FILTERS, IsHomalgMatrix );
Add( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_FILTERS, IsHomalgRingMap );
Add( CAP_JIT_INTERNAL_GLOBAL_VARIABLE_FILTERS, IsRingAsCategoryObject );

# Objectify*ForCAPWithAttributes
CapJitAddTypeSignature( "ObjectifyObjectForCAPWithAttributes", [ IsRecord, IsCapCategory, IsFunction, IsObject ], function ( args, func_stack )
    
    return rec( args := args, output_type := rec( filter := args.2.data_type.category!.object_representation, category := args.2.data_type.category ) );
    
end );

CapJitAddTypeSignature( "ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes", [ IsRecord, IsCapCategory, IsCapCategoryObject, IsCapCategoryObject, IsFunction, IsObject ], function ( args, func_stack )
    
    return rec( args := args, output_type := rec( filter := args.2.data_type.category!.morphism_representation, category := args.2.data_type.category ) );
    
end );

# object and morphism attributes
CapJitAddTypeSignature( "Source", [ IsCapCategoryMorphism ], function ( args, func_stack )
    
    return rec( args := args, output_type := rec( filter := args.1.data_type.category!.object_representation, category := args.1.data_type.category ) );
    
end );

CapJitAddTypeSignature( "Range", [ IsCapCategoryMorphism ], function ( args, func_stack )
    
    return rec( args := args, output_type := rec( filter := args.1.data_type.category!.object_representation, category := args.1.data_type.category ) );
    
end );

CapJitAddTypeSignature( "RankOfObject", [ IsCategoryOfRowsObject ], IsInt );
CapJitAddTypeSignature( "UnderlyingMatrix", [ IsCategoryOfRowsMorphism ], IsHomalgMatrix );

CapJitAddTypeSignature( "UnderlyingRingElement", [ IsRingAsCategoryMorphism ], IsHomalgRingElement );

CapJitAddTypeSignature( "ObjectList", [ IsAdditiveClosureObject ], function ( args, func_stack )
    
    Assert( 0, IsAdditiveClosureCategory( args.1.data_type.category ) );
    
    return rec( args := args, output_type := rec( filter := IsList, element_type := rec( filter := UnderlyingCategory( args.1.data_type.category )!.object_representation, category := UnderlyingCategory( args.1.data_type.category ) ) ) );
    
end );

CapJitAddTypeSignature( "MorphismMatrix", [ IsAdditiveClosureMorphism ], function ( args, func_stack )
    
    Assert( 0, IsAdditiveClosureCategory( args.1.data_type.category ) );
    
    return rec( args := args, output_type := rec( filter := IsList, element_type := rec( filter := IsList, element_type := rec( filter := UnderlyingCategory( args.1.data_type.category )!.morphism_representation, category := UnderlyingCategory( args.1.data_type.category ) ) ) ) );
    
end );

CapJitAddTypeSignature( "MatElm", [ IsAdditiveClosureMorphism, IsInt, IsInt ], function ( args, func_stack )
    
    Assert( 0, IsAdditiveClosureCategory( args.1.data_type.category ) );
    
    return rec( args := args, output_type := rec( filter := UnderlyingCategory( args.1.data_type.category )!.morphism_representation, category := UnderlyingCategory( args.1.data_type.category ) ) );
    
end );

# GAP operations
CapJitAddTypeSignature( "Length", [ IsList ], IsInt );
CapJitAddTypeSignature( "+", [ IsInt, IsInt ], IsInt );
CapJitAddTypeSignature( "-", [ IsInt, IsInt ], IsInt );
CapJitAddTypeSignature( "*", [ IsInt, IsInt ], IsInt );

CapJitAddTypeSignature( "ListWithIdenticalEntries", [ IsInt, IsObject ], function ( args, func_stack )
    
    return rec( args := args, output_type := rec( filter := IsList, element_type := args.2.data_type ) );
    
end );

CapJitAddTypeSignature( "Concatenation", [ IsList ], function ( args, func_stack )
    
    Assert( 0, args.1.data_type.element_type.filter = IsList );
    
    return rec( args := args, output_type := rec( filter := IsList, element_type := args.1.data_type.element_type.element_type ) );
    
end );

CapJitAddTypeSignature( "Sum", [ IsList ], function ( args, func_stack )
    
    return rec( args := args, output_type := args.1.data_type.element_type );
    
end );

CapJitAddTypeSignature( "[]", [ IsList, IsInt ], function ( args, func_stack )
    
    return rec( args := args, output_type := args.1.data_type.element_type );
    
end );

CapJitAddTypeSignature( "{}", [ IsList, IsList ], function ( args, func_stack )
    
    return rec( args := args, output_type := args.1.data_type );
    
end );

CapJitAddTypeSignature( "MatElm", [ IsList, IsInt, IsInt ], function ( args, func_stack )
    
    Assert( 0, args.1.data_type.element_type.filter = IsList );
    
    return rec( args := args, output_type := args.1.data_type.element_type.element_type );
    
end );

CapJitAddTypeSignature( "List", [ IsList, IsFunction ], function ( args, func_stack )
    
    args := ShallowCopy( args );
    
    args.2 := CAP_JIT_INTERNAL_INFERRED_DATA_TYPES_OF_FUNCTION_BY_ARGUMENTS_TYPES( args.2, [ args.1.data_type.element_type ], func_stack );
    
    if args.2 = fail then
        
        #Error( "could not determine output type" );
        return fail;
        
    fi;
    
    return rec( args := args, output_type := rec( filter := IsList, element_type := args.2.data_type.signature[2] ) );
    
end );

CapJitAddTypeSignature( "ListN", [ IsList, IsList, IsFunction ], function ( args, func_stack )
    
    args := ShallowCopy( args );
    
    args.3 := CAP_JIT_INTERNAL_INFERRED_DATA_TYPES_OF_FUNCTION_BY_ARGUMENTS_TYPES( args.3, [ args.1.data_type.element_type, args.2.data_type.element_type ], func_stack );
    
    if args.3 = fail then
        
        #Error( "could not determine output type" );
        return fail;
        
    fi;
    
    return rec( args := args, output_type := rec( filter := IsList, element_type := args.3.data_type.signature[2] ) );
    
end );

CapJitAddTypeSignature( "Sum", [ IsList, IsFunction ], function ( args, func_stack )
    
    args := ShallowCopy( args );
    
    args.2 := CAP_JIT_INTERNAL_INFERRED_DATA_TYPES_OF_FUNCTION_BY_ARGUMENTS_TYPES( args.2, [ args.1.data_type.element_type ], func_stack );
    
    if args.2 = fail then
        
        #Error( "could not determine output type" );
        return fail;
        
    fi;
    
    return rec( args := args, output_type := args.2.data_type.signature[2] );
    
end );

CapJitAddTypeSignature( "Iterated", [ IsList, IsFunction ], function ( args, func_stack )
    args := ShallowCopy( args );
    
    args.2 := CAP_JIT_INTERNAL_INFERRED_DATA_TYPES_OF_FUNCTION_BY_ARGUMENTS_TYPES( args.2, [ args.1.data_type.element_type, args.1.data_type.element_type ], func_stack );
    
    if args.2 = fail then
        
        #Error( "could not determine output type" );
        return fail;
        
    fi;
    
    return rec( args := args, output_type := args.2.data_type.signature[2] );
    
end );

# homalg operations
CapJitAddTypeSignature( "HomalgMatrix", [ IsList, IsInt, IsInt, IsHomalgRing ], IsHomalgMatrix );
CapJitAddTypeSignature( "HomalgMatrixListList", [ IsList, IsInt, IsInt, IsHomalgRing ], IsHomalgMatrix );
CapJitAddTypeSignature( "HomalgIdentityMatrix", [ IsInt, IsHomalgRing ], IsHomalgMatrix );
CapJitAddTypeSignature( "HomalgZeroMatrix", [ IsInt, IsInt, IsHomalgRing ], IsHomalgMatrix );
CapJitAddTypeSignature( "ConvertRowToMatrix", [ IsHomalgMatrix, IsInt, IsInt ], IsHomalgMatrix );
CapJitAddTypeSignature( "ConvertColumnToMatrix", [ IsHomalgMatrix, IsInt, IsInt ], IsHomalgMatrix );
CapJitAddTypeSignature( "ConvertMatrixToRow", [ IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "ConvertMatrixToColumn", [ IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "CertainRows", [ IsHomalgMatrix, IsList ], IsHomalgMatrix );
CapJitAddTypeSignature( "CertainColumns", [ IsHomalgMatrix, IsList ], IsHomalgMatrix );
CapJitAddTypeSignature( "KroneckerMat", [ IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "DualKroneckerMat", [ IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "LeftDivide", [ IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "RightDivide", [ IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "SyzygiesOfRows", [ IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "SyzygiesOfColumns", [ IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "NumberRows", [ IsHomalgMatrix ], IsInt );
CapJitAddTypeSignature( "NumberColumns", [ IsHomalgMatrix ], IsInt );
CapJitAddTypeSignature( "RowRankOfMatrix", [ IsHomalgMatrix ], IsInt );
CapJitAddTypeSignature( "ColumnRankOfMatrix", [ IsHomalgMatrix ], IsInt );
CapJitAddTypeSignature( "UnionOfRows", [ IsHomalgRing, IsInt, IsList ], IsHomalgMatrix );
CapJitAddTypeSignature( "UnionOfColumns", [ IsHomalgRing, IsInt, IsList ], IsHomalgMatrix );
CapJitAddTypeSignature( "UnionOfRows", [ IsHomalgMatrix, IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "UnionOfColumns", [ IsHomalgMatrix, IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "DiagMat", [ IsHomalgRing, IsList ], IsHomalgMatrix );
CapJitAddTypeSignature( "TransposedMatrix", [ IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "CoefficientsWithGivenMonomials", [ IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "CoefficientsWithGivenMonomials", [ IsHomalgRingElement, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "CoercedMatrix", [ IsHomalgRing, IsHomalgRing, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "CoercedMatrix", [ IsHomalgRing, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "Pullback", [ IsHomalgRingMap, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "EntriesOfHomalgMatrix", [ IsHomalgMatrix ], rec( filter := IsList, element_type := rec( filter := IsHomalgRingElement ) ) );
CapJitAddTypeSignature( "EntriesOfHomalgMatrixAsListList", [ IsHomalgMatrix ], rec( filter := IsList, element_type := rec( filter := IsList, element_type := rec( filter := IsHomalgRingElement ) ) ) );

CapJitAddTypeSignature( "*", [ IsHomalgRingElement, IsHomalgRingElement ], IsHomalgRingElement );
CapJitAddTypeSignature( "*", [ IsHomalgRingElement, IsHomalgMatrix ], IsHomalgMatrix );
CapJitAddTypeSignature( "*", [ IsHomalgMatrix, IsHomalgRingElement ], IsHomalgMatrix );
CapJitAddTypeSignature( "*", [ IsHomalgMatrix, IsHomalgMatrix ], IsHomalgMatrix );

CapJitAddTypeSignature( "MatElm", [ IsHomalgMatrix, IsInt, IsInt ], function ( args, func_stack )
    
    return rec( args := args, output_type := rec( filter := IsHomalgRingElement ) );
    
end );

# logic
CapJitAddLogicFunction( function( tree, jit_args )
  local pre_func, additional_arguments_func;
    
    Info( InfoCapJit, 1, "####" );
    Info( InfoCapJit, 1, "Apply logic for HomalgMatrix." );
    
    pre_func := function( tree, func_stack )
      local args, list, func_id, ring_element, condition_func, right;
        
        # find HomalgMatrix( ... )
        if CapJitIsCallToGlobalFunction( tree, "HomalgMatrix" ) then
            
            args := tree.args;
            
            # check if ... = [ [ ... ], ... ]
            if args.1.type = "EXPR_LIST" then
                
                list := args.1.list;
                
                func_id := Last( func_stack ).id;
                
                # check if all elements of the matrix are multiplied by the same ring element from the left
                if list.length > 0 and ForAll( list, l -> CapJitIsCallToGlobalFunction( l, "*" ) and l.args.1 = list.1.args.1 ) then
                    
                    ring_element := list.1.args.1;
                    
                    # check if ring_element is independent of local variables
                    condition_func := function( tree, path )
                        
                        if PositionSublist( tree.type, "FVAR" ) <> fail and tree.func_id = func_id then
                            
                            return true;
                            
                        fi;
                        
                        return false;
                        
                    end;
                    
                    if CapJitFindNodeDeep( ring_element, condition_func ) = fail then
                        
                        tree := rec(
                            type := "EXPR_FUNCCALL",
                            funcref := rec(
                                type := "EXPR_REF_GVAR",
                                gvar := "*",
                            ),
                            args := AsSyntaxTreeList( [
                                ring_element,
                                StructuralCopy( tree ),
                            ] ),
                        );
                        
                        tree.args.2.args.1.list := List( list, l -> l.args.2 );
                        
                        return tree;
                        
                    fi;
                    
                fi;
                
                # check if all elements of the matrix are multiplied by the same ring element from the right
                if list.length > 0 and ForAll( list, l -> CapJitIsCallToGlobalFunction( l, "*" ) and l.args.2 = list.1.args.2 ) then
                    
                    ring_element := list.1.args.2;
                    
                    # check if ring_element is independent of local variables
                    condition_func := function( tree, path )
                        
                        if PositionSublist( tree.type, "FVAR" ) <> fail and tree.func_id = func_id then
                            
                            return true;
                            
                        fi;
                        
                        return false;
                        
                    end;
                    
                    if CapJitFindNodeDeep( ring_element, condition_func ) = fail then
                        
                        tree := rec(
                            type := "EXPR_FUNCCALL",
                            funcref := rec(
                                type := "EXPR_REF_GVAR",
                                gvar := "*",
                            ),
                            args := AsSyntaxTreeList( [
                                StructuralCopy( tree ),
                                ring_element,
                            ] ),
                        );
                        
                        tree.args.1.args.1.list := List( list, l -> l.args.1 );
                        
                        return tree;
                        
                    fi;
                    
                fi;
                
            fi;
            
        fi;
        
        return tree;
        
    end;
    
    additional_arguments_func := function( tree, key, func_stack )
        
        if tree.type = "EXPR_DECLARATIVE_FUNC" then
            
            Assert( 0, IsBound( tree.id ) );
            
            return Concatenation( func_stack, [ tree ] );
            
        else
            
            return func_stack;
            
        fi;
        
    end;
    
    return CapJitIterateOverTree( tree, pre_func, CapJitResultFuncCombineChildren, additional_arguments_func, [] );
    
end );

# additive_closure_morphism[i, j] => MorphismMatrix( additive_closure_morphism )[i, j]
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "additive_closure_morphism", "row", "column" ],
        variable_filters := [ IsAdditiveClosureMorphism, IsInt, IsInt ],
        src_template := "additive_closure_morphism[row, column]",
        dst_template := "MorphismMatrix( additive_closure_morphism )[row][column]",
        returns_value := true,
    )
);

# Length( ListWithIdenticalEntries( number, obj ) ) => number
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "obj" ],
        src_template := "Length( ListWithIdenticalEntries( number, obj ) )",
        dst_template := "number",
        returns_value := true,
    )
);

# List( ListWithIdenticalEntries( number, obj ), func ) => ListWithIdenticalEntries( number, func( obj ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "number", "obj", "func" ],
        src_template := "List( ListWithIdenticalEntries( number, obj ), func )",
        dst_template := "ListWithIdenticalEntries( number, func( obj ) )",
        returns_value := true,
    )
);

# List( L, x -> x ) => L
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "list" ],
        src_template := "List( list, x -> x )",
        dst_template := "list",
        returns_value := true,
    )
);

# EntriesOfHomalgMatrixAsListList( matrix )[row][col] => matrix[row][col]
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "matrix", "row", "col" ],
        src_template := "EntriesOfHomalgMatrixAsListList( matrix )[row][col]",
        dst_template := "matrix[row, col]",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( CoercedMatrix( R, S, M ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring2", "nr_cols", "list", "ring1", "matrix" ],
        src_template := "UnionOfRows( ring2, nr_cols, List( list, l -> CoercedMatrix( ring1, ring2, matrix ) ) )",
        dst_template := "CoercedMatrix( ring1, ring2, UnionOfRows( ring1, nr_cols, List( list, l -> matrix ) ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( CoercedMatrix( R, S, M ) )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring2", "nr_rows", "list", "ring1", "matrix" ],
        src_template := "UnionOfColumns( ring2, nr_rows, List( list, l -> CoercedMatrix( ring1, ring2, matrix ) ) )",
        dst_template := "CoercedMatrix( ring1, ring2, UnionOfColumns( ring1, nr_rows, List( list, l -> matrix ) ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( CoefficientsWithGivenMonomials )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "list", "matrix", "monomials" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := "UnionOfRows( ring, nr_cols, List( list, l -> CoefficientsWithGivenMonomials( matrix, monomials ) ) )",
        dst_template := "CoefficientsWithGivenMonomials( UnionOfRows( ring, NumberColumns( monomials ), List( list, l -> matrix ) ), monomials )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( CoefficientsWithGivenMonomials )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_rows", "list", "matrix", "monomials" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := "UnionOfColumns( ring, nr_rows, List( list, l -> CoefficientsWithGivenMonomials( matrix, monomials ) ) )",
        dst_template := "CoefficientsWithGivenMonomials( UnionOfColumns( ring, nr_rows, List( list, l -> matrix ) ), DiagMat( ring, List( list, x -> monomials ) ) )",
        new_funcs := [ [ "x" ] ],
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( a * B ) => a * UnionOfRows( B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_cols", "list", "ring_element", "matrix" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgRingElement", "IsHomalgMatrix" ],
        src_template := "UnionOfRows( homalg_ring, nr_cols, List( list, l -> ring_element * matrix ) )",
        dst_template := "ring_element * UnionOfRows( homalg_ring, nr_cols, List( list, l -> matrix ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfRows( A * b ) => UnionOfRows( A ) * b
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_cols", "list", "matrix", "ring_element" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgRingElement" ],
        src_template := "UnionOfRows( homalg_ring, nr_cols, List( list, l -> matrix * ring_element ) )",
        dst_template := "UnionOfRows( homalg_ring, nr_cols, List( list, l -> matrix ) ) * ring_element",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( a * B ) => a * UnionOfColumns( B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_rows", "list", "ring_element", "matrix" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgRingElement", "IsHomalgMatrix" ],
        src_template := "UnionOfColumns( homalg_ring, nr_rows, List( list, l -> ring_element * matrix ) )",
        dst_template := "ring_element * UnionOfColumns( homalg_ring, nr_rows, List( list, l -> matrix ) )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# UnionOfColumns( A * b ) => UnionOfColumns( A ) * b
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "homalg_ring", "nr_rows", "list", "matrix", "ring_element" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgRingElement" ],
        src_template := "UnionOfColumns( homalg_ring, nr_rows, List( list, l -> matrix * ring_element ) )",
        dst_template := "UnionOfColumns( homalg_ring, nr_rows, List( list, l -> matrix ) ) * ring_element",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# DualKroneckerMat( A, B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "nr_rows", "matrix1", "matrix2" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := """
            UnionOfRows( ring, nr_cols, List( [ 1 .. NrRows( matrix2 ) ], i ->
                UnionOfColumns( ring, nr_rows, List( [ 1 .. NrColumns( matrix2 ) ], j ->
                    matrix1 * matrix2[i,j]
                ) )
            ) )
        """,
        dst_template := "DualKroneckerMat( matrix1, matrix2 )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.06.27" ] ],
    )
);

# KroneckerMat( TransposedMatrix( A ), B )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_cols", "nr_rows", "matrix1", "matrix2" ],
        variable_filters := [ IsObject, IsObject, IsObject, "IsHomalgMatrix", "IsHomalgMatrix" ],
        src_template := """
            UnionOfRows( ring, nr_cols, List( [ 1 .. NrColumns( matrix1 ) ], j ->
                UnionOfColumns( ring, nr_rows, List( [ 1 .. NrRows( matrix1 ) ], i ->
                    matrix1[i,j] * matrix2
                ) )
            ) )
        """,
        dst_template := "KroneckerMat( TransposedMatrix( matrix1 ), matrix2 )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.05.19" ] ],
    )
);

# ConvertMatrixToRow( M )
CapJitAddLogicTemplate(
    rec(
        variable_names := [ "ring", "nr_rows", "matrix" ],
        variable_filters := [ "IsHomalgRing", "IsInt", "IsHomalgMatrix" ],
        src_template := """
            UnionOfColumns( ring, nr_rows, List( [ 1 .. NrRows( matrix ) ], i ->
                UnionOfColumns( ring, nr_rows, List( [ 1 .. NrColumns( matrix ) ], j ->
                    HomalgMatrix( [ matrix[i, j] ], 1, 1, ring )
                ) )
            ) )
        """,
        dst_template := "ConvertMatrixToRow( matrix )",
        returns_value := true,
        needed_packages := [ [ "MatricesForHomalg", ">= 2020.06.27" ] ],
    )
);
