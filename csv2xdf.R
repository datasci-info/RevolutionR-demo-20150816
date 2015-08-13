
library(stringr)
airlineDataDirPATH = "airlineData"
csvFilesPATH <- file.path("./",airlineDataDirPATH,grep("csv$",list.files(file.path("./",airlineDataDirPATH)),value = T))
xdfFilesPATH <- str_replace_all(csvFilesPATH,"csv","xdf")

filePairs = cbind(csv=csvFilesPATH,xdf=xdfFilesPATH)

apply(filePairs , 1, function(p){
  rxImport(inData = p[1],outFile = p[2], overwrite = T)
})