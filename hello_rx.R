

library(stringr)
airlineDataDirPATH = "airlineData"
csvFilesPATH <- file.path("./",airlineDataDirPATH,grep("csv$",list.files(file.path("./",airlineDataDirPATH)),value = T))
xdfFilesPATH <- str_replace_all(csvFilesPATH,"csv","xdf")


AirlineXdf = xdfFilesPATH[20]
AirlineXdf
rxGetInfo(data = AirlineXdf, getVarInfo = TRUE, varsToKeep = c("ArrDelay",
                                                               "DepDelay", "Distance"))

rxSummary(~DepDelay + Distance, data = AirlineXdf)
rxHistogram(~DepDelay, data = AirlineXdf)

rxHistogram(~DepDelay, data = AirlineXdf, xAxisMinMax = c(-50, 250),
            numBreaks = 500, xNumTicks = 10)

rxGetVarInfo(AirlineXdf)

rxHistogram(~DepDelay|Origin , data = AirlineXdf, xNumTicks = 10)
