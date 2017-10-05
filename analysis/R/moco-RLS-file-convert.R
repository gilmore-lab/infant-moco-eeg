moco.RLS.file.convert <- function( dir=".", out.dir="~/csv-by-session", study="moco-inf-2pat-lamrad" )

# moco.RLS.file.convert( dir="~/", study="moco-inf-2pat-lamrad" )
#	Opens PowerDiva 3.4 RLS.txt data file, drops unnecessary variables,
#		creates new factors based on iCond numbers and study, 
#		then exports .csv file in the same directory. 
#		
#		Function returns the new, trimmed, data frame.
#
#		Used for Motion Coherence (MOCO) series of SSVEP Studies.
#
#	dir	    : directory to look for file, default is "."
# out.dir : directory to send output file
#	study   :	"moco-inf-2pat-lamrad"
#
#	To use, source("PATH2PROGRAM/moco-RLS-file-convert.R") at R command line.
#	Call using moco.RLS.file.convert()
#
#	Released under GPLv3 by Rick O. Gilmore, thatrickgilmore@gmail.com
#
#############################################################################

#############################################################################
#	History
#
#	2013-05-10-19:07	rog wrote
#	2013-05-13-22:05 	rog added read of SsnHeader.txt, CndParams*.txt
#	2013-05-14-07:55	rog fixed error in extracting condition, fname.out
#	2013-05-14-09:05 	rog added lines to export detailed condition info.
# 2015-12-09-08:55  ars begin updating for mofo
# 2016-03-02        rog modified.
# 2016-05-04-09:55  ars begin updating for moco inf 2pat lamrad

#############################################################################
#	Notes
#
#	2013-05-10-19:07	Needs better error checking. 
#	2013-05-10-19:07 	Change filename based on iSess


{

fname.rls = file.path( dir, "RLS.txt")
fname.ssn = file.path( dir, "SsnHeader.txt")
fname.cndParams = file.path( dir, "CndParams_MOCO_v7.txt")
#fname.out = file.path( dir, "RLS-merged")

# nCond = 4
# nHarm = 12
# NCh = 128
# nDataPts = nHarm * NCh * nCond

# List of variables to drop from exported data frame
drops.rls = c("iTrial", "iCh", "iFr", "AF", "xF1", "xF2", "FK_Cond", "iBin", "SweepVal", "LSB", "RSB", "UserSc", "Thresh", "ThrBin", "Slope", "ThrInRange", "MaxSNR")

drops.cndParams = c("iSess")

#### Reads tab-delimited data file from file name, assumes header, fills in blank variables

msg = sprintf("Reading file %s into data frame.", fname.rls)
cat( msg, "\n", sep="" )
rls.data.df = read.delim( fname.rls, header=TRUE, sep="\t", fill=TRUE)
cat("\tData frame read.\n")

#### Open SsnHeader.txt file

msg = sprintf("Reading file %s into data frame.", fname.ssn)
cat( msg, "\n", sep="" )
ssn.df = read.delim( fname.ssn, header=TRUE, sep="\t", fill=TRUE )
cat("\tData frame read.\n")
this.sess <- ssn.df$iSess
fname.out = paste(out.dir, this.sess, sep="/")

#### Open CndParams.txt file

msg = sprintf("Reading file %s into data frame.", fname.cndParams )
cat( msg, "\n", sep="" )
cndParams.df = read.delim( fname.cndParams, header=TRUE, sep="\t", fill=TRUE )
cat("\tData frame read.\n")

#### Extract session variables from files

NCh = max( ssn.df$NChan )
nCond = max( cndParams.df$iCond )
nHarm = length( levels( rls.data.df$Harm ) )
nDataPts = nHarm * NCh * nCond

msg = sprintf("Session has %d channels * %d conditions * %d harmonics = %d data points.\n", NCh, nCond, nHarm, nDataPts )
cat( msg, sep="" )

#### PowerDiva 3.4 duplicates data in RLS.txt output, so take only first half

#cat("Trimming duplicate entries.\n")
#nrows = length( rls.data.df$iSess )
#halfnrows = nrows/2
#rls.trimmed.df = rls.data.df[1:halfnrows,]
#cndParams.df = cndParams.df[1:nCond,]
#ssn.df = ssn.df[1,]

#### Remove original frame to save memory
#rm( rls.data.df )

#### Recode iCond variable 

# If moco-3-pattern-adult, rad = iCond 1..3, rot = iCond 4..6, trans = iCond 7..9

msg = sprintf("This is a %s study. Making Speed and Direction factors.", study)
cat(msg, "\n", sep="")

if( study == 'moco-inf-2pat-lamrad') 
{
  #	iCond	Pattern	Speed
  #	1		trans		2 deg/s
  #	2		trans		8 deg/s
  #	3		rad	    2 deg/s
  #	4		rad		  8 deg/s

  
  Pattern = factor( rep( c(1,2), each=(2*nHarm*NCh)) , labels=c("trans", "radial") )
  
  Speed = factor( rep( rep( c(1, 2), each=(nHarm*NCh) ), times=2), labels=c("2 deg/s", "8 deg/s"), ordered=TRUE)
}

# How to create new factors from iCond
# dens <- rep(c("10-10", "10-10", "10-10", "10-10", "10-0"), 2)
# df.agg$Density = factor(df.agg$iCond, levels=dens)

####	Fix iCh labels to remove hc and -Avg text for readability

Channel = factor( rls.data.df$iCh, labels=1:NCh )

####	Rename frequency channel for readability

cat("Renaming data frame variables for readability.\n")
Hz = rls.data.df$AF

#### 	Create channel group variable

#### Create "blank" factor
ChanGroup = rep( "other", nDataPts )

l.lat = ( Channel == 47 ) |
		( Channel == 51 ) |
		( Channel == 52 ) |
		( Channel == 58 ) |
		( Channel == 59 ) |
		( Channel == 64 ) |
		( Channel == 68 )

l.med = ( Channel == 60 ) |
		( Channel == 65 ) |
		( Channel == 66 ) |
		( Channel == 67 ) |
		( Channel == 69 ) |
		( Channel == 70 ) |
		( Channel == 73 )

med   = ( Channel == 71 ) |
		( Channel == 72 ) |
		( Channel == 74 ) |
		( Channel == 75 ) |
		( Channel == 76 ) |
		( Channel == 81 ) |
		( Channel == 82 )

r.med = ( Channel == 77 ) |
		( Channel == 83 ) |
		( Channel == 84 ) |
		( Channel == 85 ) |
		( Channel == 88 ) |
		( Channel == 89 ) |
		( Channel == 90 )

r.lat = ( Channel == 91 ) |
		( Channel == 92 ) |
		( Channel == 94 ) |
		( Channel == 95 ) |
		( Channel == 96 ) |
		( Channel == 97 ) |
		( Channel == 98 )

ChanGroup[ l.lat ] = "l.lat"
ChanGroup[ l.med ] = "l.med"
ChanGroup[ med ]   = "med"
ChanGroup[ r.med ] = "r.med"
ChanGroup[ r.lat ] = "r.lat"

ChanGroup = factor( ChanGroup )

####	Create new data frame with core variables
cat("Creating new data frame.\n")

# Copy rls.data.df to output frame, but drop unneeded variables
moco.df = rls.data.df[, !names(rls.data.df) %in% drops.rls ]

# Add newly defined variables
moco.df$Pattern = Pattern
moco.df$Speed = Speed
moco.df$Channel = Channel
moco.df$ChanGroup = ChanGroup
moco.df$Hz = Hz
moco.df$Study = rep( study, nDataPts)

# moco.df$iSessID = lis

# from SsnHeader and CndParam files
moco.df$DaqRateHz = rep( ssn.df$DaqRateHz, nDataPts )
moco.df$ViewDist = cndParams.df$ViewDist[ moco.df$iCond ]
moco.df$MeanLum = cndParams.df$MeanLum[ moco.df$iCond ]
moco.df$Contrast = cndParams.df$Contrast[ moco.df$iCond ]
moco.df$Field.Diam= cndParams.df$Field.Diam[ moco.df$iCond ]
moco.df$FieldMask = cndParams.df$FieldMask[ moco.df$iCond ]
moco.df$LoopType = cndParams.df$LoopType[ moco.df$iCond ]
moco.df$Density = cndParams.df$Density[ moco.df$iCond ]
moco.df$ModType = cndParams.df$ModType[ moco.df$iCond ]
moco.df$AminPerUpdate = cndParams.df$ModInfo[ moco.df$iCond ]

#moco.df$Operator = rep( ssn.df$Operator, nDataPts )
moco.df$Sex = rep( ssn.df$Sex, nDataPts )
#moco.df$BirthDate = rep( ssn.df$BirthDate, nDataPts )
#moco.df$DueDate = rep( ssn.df$DueDate, nDataPts )
moco.df$AgeDays = rep( ssn.df$DayAge, nDataPts )

# from CndParam file

moco.df$Temp.Freq1 = cndParams.df$Temp.Freq1[ moco.df$iCond ]
moco.df$Pix.Size.HV1 = cndParams.df$Pix.Size.HV1[ moco.df$iCond ]
moco.df$Dir.Mean1 = cndParams.df$Dir.Mean1[ moco.df$iCond ]
moco.df$Dir.Range1 = cndParams.df$Dir.Range1[ moco.df$iCond ]
moco.df$Lifetime1 = cndParams.df$Lifetime1[ moco.df$iCond ]
moco.df$Bidirectional1 = cndParams.df$Bidirectional1[ moco.df$iCond ]
moco.df$Radial1 = cndParams.df$Radial1[ moco.df$iCond ]
moco.df$Mot.Coher1 = cndParams.df$Mot.Coher1[ moco.df$iCond ]

moco.df$Temp.Freq2 = cndParams.df$Temp.Freq2[ moco.df$iCond ]
moco.df$Pix.Size.HV2 = cndParams.df$Pix.Size.HV2[ moco.df$iCond ]
moco.df$Dir.Mean2 = cndParams.df$Dir.Mean2[ moco.df$iCond ]
moco.df$Dir.Range2 = cndParams.df$Dir.Range2[ moco.df$iCond ]
moco.df$Lifetime2 = cndParams.df$Lifetime2[ moco.df$iCond ]
moco.df$Bidirectional2 = cndParams.df$Bidirectional1[ moco.df$iCond ]
moco.df$Radial2 = cndParams.df$Radial2[ moco.df$iCond ]
moco.df$Mot.Coher2 = cndParams.df$Mot.Coher2[ moco.df$iCond ]

#### Export data

msg = sprintf( "Exporting R data to %s.", paste( fname.out,".Rdata", sep="") )
cat( msg, sep="" )
save( moco.df, file=paste( fname.out,".Rdata", sep="") )

msg = sprintf( "Exporting CSV data to %s.", paste(fname.out, ".csv", sep="") )
cat("\n", msg, sep="" )
write.table( moco.df, file=paste(fname.out, ".csv", sep=""), sep=",", row.names=FALSE)

return=moco.df

}
