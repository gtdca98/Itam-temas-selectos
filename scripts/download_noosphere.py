import urllib
import sys
import time
import requests
#from bs4 import BeautifulSoup


def main():
    #downloadNoosphere_eggsumary(sys.argv)
    downloadNoosphere(sys.argv)



def downloadNoosphere_eggsumary(parametros):

    urllib.urlretrieve('http://noosphere.princeton.edu/data/eggsummary/%s/summary-%s-%s-%s.html' % (parametros[3], parametros[3], parametros[2], parametros[1]), './eggsumary_%s%s%s' % (parametros[3], parametros[2], parametros[1]) )
    #loading the file
    f = open('./eggsumary_%s%s%s' % (parametros[3], parametros[2], parametros[1]) , 'r')
    htmlObject = f.read()
    f.close()
    #soup = BeautifulSoup(htmlObject)
    print htmlObject


def  downloadNoosphere(parametros):
    #build the url to download data
    #dates = [(26, 10, 2001),(6,2,2002),(1,2,2003),(12,3,2003),(20,3,2003),(3,1,2004),(1,4,2004),(2,11,2004),(11,11,2004),(26,12,2004),(2,4,2005),(9,4,2005),(30,5,2005),(7,6,2005),(29,8,2005),(30,9,2005),(1,10,2005),(24,8,2006),(5,11,2006),(1,1,2007),(27,12,2007),(21,1,2008),(19,2,2008)]
    #dates = [(14,3,2008),(2,7,2008),(8,8,2008),(17,8,2008),(22,8,2008),(24,8,2008),(15,9,2008),(16,9,2008),(3,10,2008),(9,10,2008),
    #    (7,11,2008),(26,11,2008),(11,12,2008),(20,1,2009),(7,4,2009),(30,4,2009),(11,6,2009),(25,6,2009),(12,1,2010),(27,2,2010),
    #    (20,4,2010),(27,4,2010),(6,2,2012),(5,5,2010),(25,7,2010),(22,8,2010),(28,11,2010),(17,12,2010),(25,1,2011),(20,3,2011),
    #    (11,3,2011),(29,4,2011),(15,3,2011),(1,5,2011),(5,8,2011),(5,10,2011),(20,10,2011),(17,12,2011),(6,8,2012),(2,6,2012),
    #    (9,10,2012),(21,12,2012),(29,12,2012),(11,2,2013),(13,3,2013),(14,3,2013),(29,3,2013),(15,4,2013),(5,6,2013),(6,7,2013),
    #    (22,7,2013),(24,7,2013),(27,9,2013),(1,10,2013),(8,11,2013),(28,11,2013),(3,12,2013),(5,12,2013),(11,12,2013),(14,12,2013),
    #    (6,1,2014),(4,2,2014)]
    dates = [(5,3,2013)]
    for i in range(len(dates)):
        parameters = {'z': '1', 'year': dates[i][2], 'month': dates[i][1] , 'day': dates[i][0] , 'stime': '00:00:00', 'etime': '23:59:59', 'gzip': 'Yes', 'idate': 'Yes' }
        print parameters
        r = requests.get('http://noosphere.princeton.edu/cgi-bin/eggdatareq.pl', params = parameters)

        timeD = time.strftime("%H%M%S")
        f = open('./noosphere_%s%s%s_%s' % (dates[i][2], dates[i][1], dates[i][0], timeD), 'w')
        f.write(r.text)
        f.close()



if __name__ == "__main__":
    main()