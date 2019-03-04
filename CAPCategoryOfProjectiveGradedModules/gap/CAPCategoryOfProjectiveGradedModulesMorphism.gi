#############################################################################
##
## CAPCategoryOfProjectiveGradedModules package
##
## Copyright 2019, Martin Bies,       ULB Brussels
##
## Chapter Morphisms
##
#############################################################################

####################################
##
## GAP Category
##
####################################

DeclareRepresentation( "IsCAPCategoryOfProjectiveGradedLeftModulesMorphismRep",
                       IsCAPCategoryOfProjectiveGradedLeftModulesMorphism and IsAttributeStoringRep,
                       [ ] );

BindGlobal( "TheFamilyOfCAPCategoryOfProjectiveGradedLeftModulesMorphisms",
        NewFamily( "TheFamilyOfCAPCategoryOfProjectiveGradedLeftModulesMorphisms" ) );

BindGlobal( "TheTypeOfCAPCategoryOfProjectiveGradedLeftModulesMorphisms",
        NewType( TheFamilyOfCAPCategoryOfProjectiveGradedLeftModulesMorphisms,
                IsCAPCategoryOfProjectiveGradedLeftModulesMorphismRep ) );

DeclareRepresentation( "IsCAPCategoryOfProjectiveGradedRightModulesMorphismRep",
                       IsCAPCategoryOfProjectiveGradedRightModulesMorphism and IsAttributeStoringRep,
                       [ ] );

BindGlobal( "TheFamilyOfCAPCategoryOfProjectiveGradedRightModulesMorphisms",
        NewFamily( "TheFamilyOfCAPCategoryOfProjectiveGradedRightModulesMorphisms" ) );

BindGlobal( "TheTypeOfCAPCategoryOfProjectiveGradedRightModulesMorphisms",
        NewType( TheFamilyOfCAPCategoryOfProjectiveGradedRightModulesMorphisms,
                IsCAPCategoryOfProjectiveGradedRightModulesMorphismRep ) );

####################################
##
## Constructors
##
####################################

##
InstallMethod( CAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism,
               [ IsCAPCategoryOfProjectiveGradedLeftOrRightModulesObject, IsHomalgMatrix, 
                                                                      IsCAPCategoryOfProjectiveGradedLeftOrRightModulesObject ],
  function( source, homalg_matrix, range )
    local cap_category_of_projective_graded_modules_morphism, homalg_graded_ring, category, left, type;
    
    # get category of source
    category := CapCategory( source );
    
    # check that source and range are objects in the same category
    if not IsIdenticalObj( category, CapCategory( range ) ) then
      
      Error( "Source and range are not defined over identical categories" );
      return;

    fi;
    
    # extract the homalg_graded_ring
    homalg_graded_ring := HomalgRing( homalg_matrix );
    
    # make a number of sanity tests (for left presentations actually!)
    if not IsIdenticalObj( homalg_graded_ring, UnderlyingHomalgGradedRing( source ) ) then
      
      Error( "The matrix is defined over a different ring than the objects" );
      return;

    fi;

    # work out if we are considering left or right presentations
    left := IsCAPCategoryOfProjectiveGradedLeftModulesObject( source );
    
    # and correspondingly check the dimensions of the matrix
    if left then
      
      if NrRows( homalg_matrix ) <> Rank( source ) then
          
          Error( "The number of rows of the given matrix is incorrect" );
          return;

      fi;
      
      if NrColumns( homalg_matrix ) <> Rank( range ) then
        
        Error( "The number of columns of the given matrix is incorrect" );
        return;
        
      fi;
      
    else
      
      if NrColumns( homalg_matrix ) <> Rank( source ) then
        
        Error( "The number of columns of the given matrix is incorrect" );
        return;
        
      fi;
      
      if NrRows( homalg_matrix ) <> Rank( range ) then
        
        Error( "The number of rows of the given matrix is incorrect" );
        return;
        
      fi;
      
    fi;
    
    # now create the morphism
    cap_category_of_projective_graded_modules_morphism := rec( );

    # define the type
    if left then
        type := TheTypeOfCAPCategoryOfProjectiveGradedLeftModulesMorphisms;
    else
        type := TheTypeOfCAPCategoryOfProjectiveGradedRightModulesMorphisms;
    fi;
    
    ObjectifyWithAttributes( cap_category_of_projective_graded_modules_morphism, type, 
                             Source, source,
                             Range, range,
                             UnderlyingHomalgGradedRing, homalg_graded_ring,
                             UnderlyingHomalgMatrix, homalg_matrix
    );

    # add the morphism to the category
    Add( category, cap_category_of_projective_graded_modules_morphism );
    
    # and return the morphism
    return cap_category_of_projective_graded_modules_morphism;
    
end );

##
InstallMethod( CAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism,
               [ IsCAPCategoryOfProjectiveGradedLeftOrRightModulesObject, IsHomalgMatrix, 
                                                            IsCAPCategoryOfProjectiveGradedLeftOrRightModulesObject, IsBool ],
  function( source, homalg_matrix, range, checks_wished )
    local cap_category_of_projective_graded_modules_morphism, homalg_graded_ring, category, left, type;
    
    # if checks are wished, hand the input to the method above
    if checks_wished then
      return CAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism( source, homalg_matrix, range );
    fi;
    
    # checks not wished, so continue here and collect necessary data
    category := CapCategory( source );
    homalg_graded_ring := HomalgRing( homalg_matrix );
    left := IsCAPCategoryOfProjectiveGradedLeftModulesObject( source );
    
    # define the type
    if left then
        type := TheTypeOfCAPCategoryOfProjectiveGradedLeftModulesMorphisms;
    else
        type := TheTypeOfCAPCategoryOfProjectiveGradedRightModulesMorphisms;
    fi;

    # construct the morphism
    cap_category_of_projective_graded_modules_morphism := rec( );
    ObjectifyWithAttributes( cap_category_of_projective_graded_modules_morphism, type, 
                             Source, source,
                             Range, range,
                             UnderlyingHomalgGradedRing, homalg_graded_ring,
                             UnderlyingHomalgMatrix, homalg_matrix
    );

    # and add it to the category
    Add( category, cap_category_of_projective_graded_modules_morphism );
    
    # finally return the morphism
    return cap_category_of_projective_graded_modules_morphism;

end );



####################################
##
## String
##
####################################

##
InstallMethod( String,
               [ IsCAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism ],
               999, # FIX ME FIX ME FIX ME!!!
  function( cap_category_of_projective_graded_modules_morphism )

    if IsCAPCategoryOfProjectiveGradedLeftModulesMorphism( cap_category_of_projective_graded_modules_morphism ) then

      return Concatenation( "A morphism in the category of projective graded left modules over ",
                            RingName( UnderlyingHomalgGradedRing( cap_category_of_projective_graded_modules_morphism ) ) );

    else

      return Concatenation( "A morphism in the category of projective graded right modules over ",
                            RingName( UnderlyingHomalgGradedRing( cap_category_of_projective_graded_modules_morphism ) ) );

    fi;

end );



####################################
##
## Display
##
####################################

InstallMethod( Display,
               [ IsCAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism ], 
               999, # FIX ME FIX ME
  function( cap_category_of_projective_graded_modules_morphism )

    if IsCAPCategoryOfProjectiveGradedLeftModulesMorphism( cap_category_of_projective_graded_modules_morphism ) then

      Print( "A morphism in the category of projective graded left modules over ", 
                                   RingName( UnderlyingHomalgGradedRing( cap_category_of_projective_graded_modules_morphism ) ),
                                   " with matrix: \n" );

      Display( UnderlyingHomalgMatrix( cap_category_of_projective_graded_modules_morphism ) );

    else

      Print( "A morphism in the category of projective graded right modules over ", 
                                   RingName( UnderlyingHomalgGradedRing( cap_category_of_projective_graded_modules_morphism ) ),
                                   " with matrix: \n" );

      Display( UnderlyingHomalgMatrix( cap_category_of_projective_graded_modules_morphism ) );

    fi;

end );



####################################
##
## View
##
####################################

##
InstallMethod( ViewObj,
               [ IsCAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism ], 
               999, # FIX ME FIX ME FIX ME!!!
function( cap_category_of_projective_graded_modules_morphism )

      Print( Concatenation( "<", String( cap_category_of_projective_graded_modules_morphism ), ">" ) );

end );



#######################################
##
## FullInformationMethod about morphism
##
#######################################

InstallMethod( FullInformation,
               [ IsCAPCategoryOfProjectiveGradedLeftOrRightModulesMorphism ],
  function( morphism )

    Print( "\n" );
    Print( "================================================================================= \n \n" );
    
    # Display Source
    Print( "Source: \n" );
    Print( "------- \n" );
    Display( Source( morphism ) );
    Print( "\n" );
    Print( "\n" );
    Print( "--------------------------------------------------------------------------------- \n \n" );
    
    # Display the mapping matrix
    Print( "Mapping matrix: \n" );
    Print( "--------------- \n" );
    Display( UnderlyingHomalgMatrix( morphism ) );
    Print( "\n" );
    
    Print( "--------------------------------------------------------------------------------- \n \n" );
    
    # Display the range"
    Print( "Range: \n" );
    Print( "------ \n" );
    Display( Range( morphism ) );
    Print( "\n \n" );
    Print( "================================================================================= \n \n" );
    
end );