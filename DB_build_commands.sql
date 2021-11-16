CREATE TABLE "Flutes" (
"IDNFluteID" INTEGER,
"CTXfindingCountry" TEXT CHECK(length(CTXfindingCountry) <= 25),
"CTXfindingLocation" TEXT CHECK(length(CTXfindingLocation) <= 60),
"CTXfindingContextLIST" TEXT CHECK(CTXfindingContextLIST in ('burial','crafting','housing','military','ritual','single','waste','out')),
"CTXpreservationLocation" TEXT CHECK(length(CTXpreservationLocation) <= 60),
"CTXdatationMethodLIST" TEXT CHECK(CTXdatationMethodLIST in ('layer','c14','expertise')),
"CTXdatationMin" TEXT CHECK(length(CTXdatationMin) <= 60),
"CTXdatationMax" TEXT CHECK(length(CTXdatationMax) <= 60),
"CTXboneTypeLIST" TEXT CHECK(CTXboneTypeLIST in ('femur','humerus','metacarpal','metatarsal','phalange','radius','tibia','ulna')),
"CTXboneSpecie" TEXT CHECK(length(CTXboneSpecie) <= 100),
"CTXdecorationDESC" TEXT CHECK(length(CTXdecorationDESC) <= 200),
"CTXnotesAboutArchaeologicalDataDESC" TEXT CHECK(length(CTXnotesAboutArchaeologicalDataDESC) <= 400),
"ASPpreservationMouthPieceLIST" TEXT NOT NULL CHECK(ASPpreservationMouthPieceLIST in ('broken','vestigial','lacunar','preserved','NI')),
"ASPpreservationCentralPartLIST" TEXT NOT NULL CHECK(ASPpreservationCentralPartLIST in ('broken','vestigial','lacunar','preserved','NI')),
"ASPpreservationEndLIST" TEXT NOT NULL CHECK(ASPpreservationEndLIST in ('broken','vestigial','lacunar','preserved','NI')),
"ASPtotalLength" REAL CHECK(ASPtotalLength = ROUND(ASPtotalLength,1)),
"ASPproximalWidth" REAL CHECK(ASPproximalWidth = ROUND(ASPproximalWidth,1)),
"ASPcentralWidth" REAL CHECK(ASPcentralWidth = ROUND(ASPcentralWidth,1)),
"ASPdistalWidth" REAL CHECK(ASPdistalWidth = ROUND(ASPdistalWidth,1)),
"ASPnotesAboutPreservationStateDESC" TEXT CHECK(length(ASPnotesAboutPreservationStateDESC) <= 400),
"ORGhsSystemCODE" TEXT CHECK(
    ORGhsSystemCODE LIKE '___.___.__'
    OR ORGhsSystemCODE LIKE '___.___._'
    OR ORGhsSystemCODE LIKE '___.___.'
    OR ORGhsSystemCODE LIKE '___.__'
    OR ORGhsSystemCODE LIKE '___._'
    OR ORGhsSystemCODE LIKE '___.'
    ),
"ORGholeNumberOnTheFace" INTEGER DEFAULT 0,
"ORGholeNumberOnTheBack" INTEGER DEFAULT 0,
"ORGholeNumberOthers" INTEGER DEFAULT 0,
"ORGholeNumberTotalGEN" INTEGER GENERATED ALWAYS AS (ORGholeNumberOnTheFace + ORGholeNumberOnTheBack + ORGholeNumberOthers) STORED,
"ORGblockIfPreservedDESC" TEXT CHECK(length(CTXdecorationDESC) <= 200),
"ORGnotesAboutOrganologicalIdDESC" TEXT CHECK(length(ORGnotesAboutOrganologicalIdDESC) <= 400),
"EMBlengthToCliff" REAL CHECK(EMBlengthToCliff = ROUND(EMBlengthToCliff,1)),
"EMBlengthToEdge" REAL CHECK(EMBlengthToEdge = ROUND(EMBlengthToEdge,1)),
"EMBholeWidth" REAL CHECK(EMBholeWidth = ROUND(EMBholeWidth,1)),
"EMBholeShapeLIST" TEXT CHECK(EMBholeShapeLIST in ('O','V','U','D','n','R','r','X')),
"EMBductTypeLIST" TEXT CHECK(EMBductTypeLIST in ('carved','sliced')),
"EMBarchShapeLIST" TEXT CHECK(EMBarchShapeLIST in ('aligned','independent')),
"EMBductChamferYN" INTEGER CHECK(EMBductChamferYN in (0,1)),
"EMBcliffCoveringHoleLIST" TEXT CHECK(EMBcliffCoveringHoleLIST in ('chamfered','orthogonal','covering')),
"EMBcliffPerpendicularToAxisYN" INTEGER CHECK(EMBcliffPerpendicularToAxisYN in (0,1)),
"EMBcliffTaperedYN" INTEGER CHECK(EMBcliffTaperedYN in (0,1)),
"EMBfinsToEmbouchureHoleLIST" TEXT CHECK(EMBfinsToEmbouchureHoleLIST in ('chamfered','orthogonal','covering')),
"EMBfinsZenithalShapeLIST" TEXT CHECK (EMBfinsZenithalShapeLIST in ('consistent','trapezoidal')),
"EMBfinsToDuctLIST" TEXT CHECK(EMBfinsToDuctLIST in ('aligned','independent')),
"EMBedgeThicknessLIST" TEXT CHECK(EMBedgeThicknessLIST in ('sharp','medium','organic')),
"EMBedgeAngleSameThroughWidthYN" INTEGER CHECK(EMBedgeAngleSameThroughWidthYN in (0,1)),
"EMBnotesAboutEmbouchureDESC" TEXT CHECK(length(EMBnotesAboutEmbouchureDESC) <= 400),
"BODlengthAirColumnTotalGEN" REAL GENERATED ALWAYS AS (ASPtotalLength - EMBlengthToEdge) STORED,
"BODnotesAboutBodyDESC" TEXT CHECK(length(ENDnotesAboutDistalEndDESC) <= 400),
"ENDepiphysisPreservedYN" INTEGER CHECK(ENDepiphysisPreservedYN in (0,1)),
"ENDopeningLIST" TEXT CHECK(ENDopeningLIST in ('axis','lateral')),
"ENDTrabecularBoneStatusLIST" TEXT CHECK(ENDTrabecularBoneStatusLIST in ('stripped','carved','untouched')),
"ENDnotesAboutDistalEndDESC" TEXT CHECK(length(ENDnotesAboutDistalEndDESC) <= 400),
PRIMARY KEY ("IDNFluteID" AUTOINCREMENT)
);

CREATE TABLE "Holes" (
"IDNholeID" INTEGER,
"IDNholeNumberFromBottom" INTEGER,
"IDNbelongsToFluteLINK" INTEGER,
"VOLholeTypeLIST" TEXT CHECK(VOLholeTypeLIST in ('playing','tuning','hanging')),
"VOLwhichSideLIST" TEXT CHECK(VOLwhichSideLIST in ('font','back','side')),
"VOLdistanceToE1" REAL CHECK(VOLdistanceToE1 = ROUND(VOLdistanceToE1,1)),
"VOLheight" REAL CHECK(VOLheight = ROUND(VOLheight,1)),
"VOLwidth" REAL CHECK(VOLwidth = ROUND(VOLwidth,1)),
"VOLshapeLIST" TEXT CHECK(VOLshapeLIST in ('circular','subcircular','square','irregular')),
"VOLexternalChamferYN" INTEGER CHECK(VOLexternalChamferYN in (0,1)),
"VOLinnerChamferYN" INTEGER CHECK(VOLinnerChamferYN in (0,1)),
"VOLnotesAboutThisHoleDESC" TEXT CHECK(length(VOLnotesAboutThisHoleDESC) <= 400),
PRIMARY KEY ("IDNholeID" AUTOINCREMENT),
FOREIGN KEY ("IDNbelongsToFluteLINK") REFERENCES Flutes (IDNFluteID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE "SoundStudies"(
"IDNsoundStudyID" INTEGER,
"IDNstudiedFluteLINK" INTEGER,
"IDNreferenceBibtexLINK" TEXT,
"SNDmethodLIST" TEXT CHECK(SNDmethodLIST in ('playing original','printed tomography','HD printed tomography','handcrafting','calculation','acoustical computation')),
"SNDsampleYN" INTEGER CHECK(SNDsampleYN in (0,1)),
"SNDaimScalesYN" INTEGER CHECK(SNDaimScalesYN in (0,1)),
"SNDaimFrequenciesYN" INTEGER CHECK(SNDaimFrequenciesYN in (0,1)),
"SNDaimSpectrographyYN" INTEGER CHECK(SNDaimSpectrographyYN in (0,1)),
"SNDnotesAboutThisSoundStudyDESC" TEXT CHECK(length(SNDnotesAboutThisSoundStudyDESC) <= 400),
PRIMARY KEY ("IDNsoundStudyID" AUTOINCREMENT),
FOREIGN KEY ("IDNstudiedFluteLINK") REFERENCES Flutes (IDNFluteID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY ("IDNreferenceBibtexLINK") REFERENCES BibReferences (IDNbibtexKey) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE "BibReferences" (
"IDNbibtexKeyID" TEXT,
"REFauthor" TEXT,
"REFyear" INTEGER CHECK(length(REFyear) = 4),
"REFtitle" TEXT CHECK(length(REFtitle) <= 200),
PRIMARY KEY ("IDNbibtexKeyID")
);


CREATE TABLE "BibReferences_Flutes"(
"FluteIDLINK" INTEGER NOT NULL,
"BibtexKeyLINK" TEXT NOT NULL,
FOREIGN KEY ("FluteIDLINK") REFERENCES Flutes (IDNFluteID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY ("BibtexKeyLINK") REFERENCES BibReferences (IDNbibtexKey) ON UPDATE CASCADE ON DELETE CASCADE
);