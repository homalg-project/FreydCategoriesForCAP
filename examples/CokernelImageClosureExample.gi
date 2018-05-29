#! @Chapter Examples and Tests

#! @Section Cokernel image closure 

LoadPackage( "FreydCategoriesForCAP" );;
LoadPackage( "RingsForHomalg" );

#! @Example
R := HomalgFieldOfRationalsInSingular() * "x,y,z";
RowsR := CategoryOfRows( R );
m := AsCategoryOfRowsMorphism( 
    HomalgMatrix( "[[x],[y],[z]]", 3, 1, R )
);
mu := AsCokernelImageClosureMorphism( m );

n := AsCategoryOfRowsMorphism( 
    HomalgMatrix( "[[x,y],[y^2,z]]", 2, 2, R )
);
nu := AsCokernelImageClosureMorphism( n );
nu2 := PreCompose( nu, nu );
IsWellDefined( nu2 );
IsCongruentForMorphisms( nu, nu2 );
nu + nu;
nu2 - nu;
cat := CapCategory( nu );
ZeroObject( cat );
ZeroMorphism( Source( nu ), Source( mu ) );
UniversalMorphismIntoZeroObject( Source( nu ) );
UniversalMorphismFromZeroObject( Source( nu ) );
# true

#! @EndExample