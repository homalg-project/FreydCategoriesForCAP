#
# FreydCategoriesForCAP: Freyd categories - Formal (co)kernels for additive categories
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "FreydCategoriesForCAP",
Subtitle := "Freyd categories - Formal (co)kernels for additive categories",
Version := Maximum( [
  "2019.03.04", ## Martin's version
  ## this line prevents merge conflicts
  "2020.09.17", ## Sepp's version
  ## this line prevents merge conflicts
  "2020.05.17", ## Mohamed's version
  ## this line prevents merge conflicts
  "2019.08.07", ## Fabian's version
  ## this line prevents merge conflicts
  "2020.04.18", ## Kamal's version
] ),
Date := Concatenation( ~.Version{[ 9, 10 ]}, "/", ~.Version{[ 6, 7 ]}, "/", ~.Version{[ 1 .. 4 ]} ),
License := "GPL-2.0-or-later",


Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Sebastian",
    LastName := "Posur",
    WWWHome := "https://sebastianpos.github.io",
    Email := "sebastian.posur@uni-siegen.de",
    PostalAddress := Concatenation(
               "Department Mathematik\n",
               "Universität Siegen\n",
               "Walter-Flex-Straße 3\n",
               "57068 Siegen\n",
               "Germany" ),
    Place := "Siegen",
    Institution := "University of Siegen",
  ),
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Martin",
    LastName := "Bies",
    WWWHome := "https://www.ulb.ac.be/sciences/ptm/pmif/people.html",
    Email := "martin.bies@alumni.uni-heidelberg.de",
    PostalAddress := Concatenation(
                 "Physique Théorique et Mathématique \n",
                 "Université Libre de Bruxelles \n",
                 "Campus Plaine - CP 231 \n",
                 "Building NO - Level 6 - Office O.6.111 \n",
                 "1050 Brussels \n",
                 "Belgium" ), 
    Place := "Brussels",
    Institution := "ULB Brussels",
  ),
],

# BEGIN URLS
SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/homalg-project/CAP_project",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://github.com/homalg-project/CAP_project/tree/master/FreydCategoriesForCAP",
PackageInfoURL  := "https://raw.githubusercontent.com/homalg-project/CAP_project/master/FreydCategoriesForCAP/PackageInfo.g",
README_URL      := "https://raw.githubusercontent.com/homalg-project/CAP_project/master/FreydCategoriesForCAP/README.md",
ArchiveURL      := Concatenation( "https://github.com/homalg-project/CAP_project/releases/download/FreydCategoriesForCAP-", ~.Version, "/FreydCategoriesForCAP-", ~.Version ),
# END URLS

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "FreydCategoriesForCAP",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Freyd categories - Formal (co)kernels for additive categories",
),

Dependencies := rec(
  GAP := ">= 4.8",
  NeededOtherPackages := [ [ "GAPDoc", ">= 1.5" ],
                           [ "CAP", ">= 2020.05.16" ],
                           [ "MatricesForHomalg", ">= 2020.09.06" ],
                           [ "GradedRingForHomalg", ">=2019.08.07" ],
                           [ "LinearAlgebraForCAP", ">= 2020.05.16" ],
                           [ "GeneralizedMorphismsForCAP", ">= 2018.06.15" ]
                         ],
  SuggestedOtherPackages := [
    [ "QPA", ">= 2.0" ],
    [ "FinSetsForCAP", ">= 2019.10.30" ]
   ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
        return true;
    end,
#Keywords := [ "TODO" ],

));
