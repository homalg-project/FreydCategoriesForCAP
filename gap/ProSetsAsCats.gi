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

## TODO: create a meaningful sanity check
InstallGlobalFunction( PRO_SET_AS_CATEGORY_SANITY_CHECK,
  function( incidence_matrix )
    local l, i, sqr;

    l := Length(incidence_matrix);

    #the following checks if the trace is l. If the list given as incidence_matrix
    #is not a square matrix then TraceMat will yeld an error
    if not TraceMat(incidence_matrix) = l then
      return [ false, "the trace is not what it should be" ];
    fi;

    sqr := incidence_matrix^2;

    for i in [1..l] do
      if not IsSubset([0, 1], Set(incidence_matrix[i])) then
        return [ false, "Incidence matrix must have entries in {0, 1}" ];
      fi;

      if not IsSubset(Set(Positions(sqr[i], 0)), Set(Positions(incidence_matrix[i], 0))) then
        return [  false, "Incidence matrix must define transitive relation"];
      fi;
    od;
    return  [ true ];

end );

##
InstallMethod( ProSetAsCategory,
               [ IsList ],

  function( incidence_matrix )
    local category, check;

    check := PRO_SET_AS_CATEGORY_SANITY_CHECK( incidence_matrix );

    if not check[1] then

        Error( check[2] );

    fi;

    category := CreateCapCategory( "ProSet" : overhead := false );

    SetFilterObj( category, IsProSetAsCategory );

    SetIncidenceMatrix( category, incidence_matrix );

    AddObjectRepresentation( category, IsProSetAsCategoryObject );

    AddMorphismRepresentation( category, IsProSetAsCategoryMorphism );

    SetRangeCategoryOfHomomorphismStructure( category, FREYD_CATEGORIES_SkeletalFinSets );

    INSTALL_FUNCTIONS_FOR_PROSET_AS_CATEGORY( category );

    Finalize( category );

    return category;

end );

##
InstallMethod( Size,
               [ IsProSetAsCategory ],

  function( category )

    return Size( IncidenceMatrix( category ) );

end );

##
InstallMethod( ProSetAsCategoryObject,
               [ IsInt, IsProSetAsCategory ],

  function( number_object, category )
    ## TODO: sanity check: is number_object in the range [ 1 .. n ]?

    return ObjectifyObjectForCAPWithAttributes( rec( ), category,
                                                UnderlyingInteger, number_object
    );

end );

InstallMethod( ProSetAsCategoryMorphism,
               [ IsProSetAsCategoryObject, IsProSetAsCategoryObject ],

  function( source, range )
    local category;

    category := CapCategory( source );

    return ObjectifyMorphismWithSourceAndRangeForCAPWithAttributes(
                             rec( ), category,
                             source,
                             range
    );

end );

##
InstallMethod( ProSetAsCategoryMorphism,
               [ IsInt, IsInt, IsProSetAsCategory ],

  function( int_source, int_range, category )

    return ProSetAsCategoryMorphism(
        ProSetAsCategoryObject( int_source, category ),
        ProSetAsCategoryObject( int_range, category )
    );

end );

##
InstallGlobalFunction( INSTALL_FUNCTIONS_FOR_PROSET_AS_CATEGORY,



  function( category )
    local emptySet, OneElementSet;

    emptySet := InitialObject( FREYD_CATEGORIES_SkeletalFinSets );
    OneElementSet := TerminalObject( FREYD_CATEGORIES_SkeletalFinSets );
    ##
    AddIsEqualForObjects( category,
        function( a, b )

            return UnderlyingInteger( a ) = UnderlyingInteger( b );

    end );

    ##
    AddIsEqualForMorphisms( category, ReturnTrue );

    ##
    AddIsCongruentForMorphisms( category, ReturnTrue );

    ##
    AddIsWellDefinedForObjects( category,
      function( obj )

        return UnderlyingInteger( obj ) in [1 .. Size( category )];
    end );

    ##
    AddIsWellDefinedForMorphisms( category,
      function( alpha )

        ## tests if the morphism satisfies our specification
        local m;
        m := IncidenceMatrix( category );



        return m[UnderlyingInteger(Source(alpha))][UnderlyingInteger(Range(alpha))] = 1;

    end );

    ##
    AddPreCompose( category,
      function( alpha, beta )

        ## a -- alpha --> b -- beta --> c
        return ProSetAsCategoryMorphism( Source( alpha ), Range( beta ) );

    end );

    ##
    AddIdentityMorphism( category,
      function( obj )

        ## Id( obj )
        return ProSetAsCategoryMorphism( obj , obj );

    end );

    ##
    AddInverse( category,
      function( alpha )

         return ProSetAsCategoryMorphism(Range(alpha), Source(alpha));


  end );

    ##
    AddIsIsomorphism( category,
      function( alpha )
        local m, s, r;
          ## check if inverse exists
          m := IncidenceMatrix(category);
          s := UnderlyingInteger(Source(alpha));
          r := UnderlyingInteger(Range(alpha));

          if m[r][s] = 1 then
            return true;
          else return false;
          fi;


    end );

    ##
    AddIsEpimorphism( category, ReturnTrue );

    ##
    AddIsMonomorphism( category,ReturnTrue);

    ##
    AddIsLiftable( category,
      function( alpha, beta )

      ## decision: if the lift exists
      local s_alpha, s_beta;
      s_alpha := UnderlyingInteger( Source( alpha ) );
      s_beta := UnderlyingInteger( Source( beta ) );
      return IncidenceMatrix( category )[ s_alpha ][s_beta] = 1;

    end );

    ##
    AddIsColiftable( category, function( alpha, beta )

      ## decision: if the colift exists
      local r_alpha, r_beta;
      r_alpha := UnderlyingInteger( Range( alpha ) );
      r_beta := UnderlyingInteger( Range( beta ) );
      return IncidenceMatrix( category )[ r_alpha ][r_beta] = 1;

    end );

    ##
    AddLift( category,
        function( alpha, beta )

      ## decision: if the lift exists

      ##  if it exists -> output the lift
      if IsLiftable(alpha, beta) then
        return ProSetAsCategoryMorphism( Source( alpha ) , Source( beta ) );
      ## if it does not exist -> fail
      else return fail;
      fi;

    end );

    ##
    AddColift( category,
        function( alpha, beta )

      ## decision: if the colift exists

      ##  if it exists -> output the colift
      if IsColiftable(alpha, beta) then
        return ProSetAsCategoryMorphism( Range( alpha ) , Range( beta ) );
      ## if it does not exist -> fail
      else return fail;
      fi;

    end );

    ## Homomorphism structure
    AddHomomorphismStructureOnObjects( category,
      function( a, b )
        local m;

        m := IncidenceMatrix(category);
        if m[ UnderlyingInteger( a ) ][ UnderlyingInteger( b ) ] = 1 then
          return OneElementSet;
        else return emptySet;
        fi;

    end );

    ##
    AddHomomorphismStructureOnMorphismsWithGivenObjects( category,
      function( source, alpha, beta, range )
        if IsEqualForObjects(source, OneElementSet )then
          return IdentityMorphism( source );

        else return UniversalMorphismFromInitialObject( range );
        fi;
    end );

    ##
    AddDistinguishedObjectOfHomomorphismStructure( category,
      function()
        return OneElementSet;
    end );

    ##
    AddInterpretMorphismAsMorphismFromDistinguishedObjectToHomomorphismStructure( category,
      function( alpha )
        return IdentityMorphism( OneElementSet );

    end );

    ##
    AddInterpretMorphismFromDistinguishedObjectToHomomorphismStructureAsMorphism( category,
      function( a, b, mor )
          return ProSetAsCategoryMorphism( a, b );
    end );

end );



####################################
##
## View
##
####################################

# ##
# InstallMethod( ViewString,
#                [ IsProSetAsCategoryMorphism ],

#     function( alpha )

#         return Concatenation( "<", ViewString( UnderlyingProSetElement( alpha ) ), ">" );

# end );

##
InstallMethod( ViewString,
               [ IsProSetAsCategoryObject ],

  function( obj )

    return String( UnderlyingInteger( obj ) );

end );

##
# InstallMethod( ViewObj,
#                [ IsProSetAsCategoryMorphism ],

#     function( alpha )

#         Print( ViewString( alpha ) );

# end );

##
InstallMethod( ViewObj,
               [ IsProSetAsCategoryObject ],

    function( obj )

        Print( ViewString( obj ) );

end );

####################################
##
## Down
##
####################################

##
InstallMethod( Down,
               [ IsProSetAsCategoryObject ],
               UnderlyingInteger );

##
InstallMethod( DownOnlyMorphismData,
               [ IsProSetAsCategoryMorphism ],
  function( mor )

    return "->";

end );


InstallMethod(\*,
              [ IsProSetAsCategoryMorphism, IsProSetAsCategoryMorphism ],
  function( alpha , beta )

    return PreCompose( alpha , beta ) ;

end );

InstallMethod(\/,
              [ IsInt, IsProSetAsCategory ],
  function( n, C )

    return ProSetAsCategoryObject( n , C ) ;

end );
