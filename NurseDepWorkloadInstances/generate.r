# author: Gilles Pesant gilles.pesant@polymtl.ca  
# adapted for oncology/surgery and with nurse-dependent acuities
# single zone; ~30 patients; 5 nurses; 5 patient types

nbNurses = 5                                                                       
nbPatientTypes = 5
minNbPatients = 4
maxNbPatients = 8

generate<-function(filename){

        meanLoads = c( 8, 11, 17, 27, 31 )                                                 
        patientCount = rpois(nbPatientTypes,3.8)+2                                           
        nbPatients = sum( patientCount )                                                   
        typeLoads = matrix( NA, nbNurses, nbPatientTypes )                                 
        for(i in 1:nbPatientTypes)                                                         
          typeLoads[ ,i] = floor(rnorm(nbNurses,meanLoads[i],2.5))  

	write(c( nbNurses, nbPatients, nbPatientTypes ),  file = filename, sep = " ")
	write(c( minNbPatients, maxNbPatients ),  file = filename, sep = " ", append = TRUE)
	write("", file = filename, append = TRUE)
	write( patientCount, file = filename, sep = " ", append = TRUE)
	write("", file = filename, append = TRUE)
	write(t(typeLoads), file = filename,
              ncolumns = nbPatientTypes,
              sep = " ", append = TRUE)

}

for(i in 0:9){
	a=paste(nbNurses,"nurse",nbPatientTypes,"patientType",i,".txt",sep="")
	generate(a)
}

