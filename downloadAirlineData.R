
airlineDataDirPATH = "airlineData"
urls <- sprintf("http://stat-computing.org/dataexpo/2009/%s.csv.bz2",1987:2008)
urlsAndFilename <- cbind(url=urls,filename=sapply(strsplit(urls,split = "/"), function(xx) sprintf("./%s/%s",airlineDataDirPATH,xx[6])))
apply(urlsAndFilename, 1, function(row) download.file(row[1],row[2]))
