##############################################################################################
##
## GradedModulePresentationsbyFreyd
##
## Copyright 2019,  Martin Bies,       ULB Brussels
##
## The CAP category of graded module presentations for CAP by use of Freyd categories
##
##############################################################################################


######################################
##
## Section CAP categories
##
######################################

# compute the category S-fpgrmod for a toric variety
InstallMethod( FpGradedLeftModules,
                " for graded rings ",
                [ IsHomalgGradedRing ],
  function( graded_ring )
    
    return FreydCategory( CAPCategoryOfGradedRows( graded_ring ) );
    
end );

##
InstallMethod( FreydCategory,
               [ IsCAPCategoryOfGradedRows ],
    function( underlying_category )
      local category, graded_ring;
      
      category := FREYD_CATEGORY( underlying_category );
      
      graded_ring := underlying_category!.homalg_graded_ring_for_category_of_graded_rows;
      
      category!.Name := Concatenation( "Category of graded left module presentations over ", RingName( graded_ring ) );
      
      SetFilterObj( category, IsFpGradedLeftModules );
      
      return category;
      
end );

# compute the category S-fpgrmod for a toric variety
InstallMethod( FpGradedRightModules,
                " for graded rings ",
                [ IsHomalgGradedRing ],
  function( graded_ring )
    
    return FreydCategory( CAPCategoryOfGradedColumns( graded_ring ) );
    
end );

##
InstallMethod( FreydCategory,
               [ IsCAPCategoryOfGradedColumns ],
    function( underlying_category )
      local category, graded_ring;
      
      category := FREYD_CATEGORY( underlying_category );
      
      graded_ring := underlying_category!.homalg_graded_ring_for_category_of_graded_columns;
      
      category!.Name := Concatenation( "Category of graded right module presentations over ", RingName( graded_ring ) );
      
      SetFilterObj( category, IsFpGradedRightModules );
      
      return category;
      
end );

######################################
##
## Section Specialised constructors
##
######################################

##
InstallMethod( FreydCategoryObject,
               [ IsGradedRowMorphism ],
  function( relation_morphism )
    local category, object, type;
    
    object := FREYD_CATEGORY_OBJECT( relation_morphism );
    
    SetFilterObj( object, IsFpGradedLeftModulesObject );
    
    return object;    
    
end );

##
InstallMethod( FreydCategoryObject,
               [ IsGradedColumnMorphism ],
  function( relation_morphism )
    local category, object, type;
    
    object := FREYD_CATEGORY_OBJECT( relation_morphism );
    
    SetFilterObj( object, IsFpGradedRightModulesObject );
    
    return object;    
    
end );

##
InstallMethod( FreydCategoryMorphism,
               [ IsFpGradedLeftModulesObject,
                 IsGradedRowMorphism,
                 IsFpGradedLeftModulesObject ],
  function( source, morphism_datum, range )
    local underlying_category, morphism, category, type;
    
    morphism := FREYD_CATEGORY_MORPHISM( source, morphism_datum, range );
    
    SetFilterObj( morphism, IsFpGradedLeftModulesMorphism );
    
    return morphism;

end );

##
InstallMethod( FreydCategoryMorphism,
               [ IsFpGradedRightModulesObject,
                 IsGradedColumnMorphism,
                 IsFpGradedRightModulesObject ],
  function( source, morphism_datum, range )
    local underlying_category, morphism, category, type;
    
    morphism := FREYD_CATEGORY_MORPHISM( source, morphism_datum, range );
    
    SetFilterObj( morphism, IsFpGradedRightModulesMorphism );
    
    return morphism;

end );
