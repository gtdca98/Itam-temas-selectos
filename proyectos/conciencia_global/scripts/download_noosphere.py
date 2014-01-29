import urllib
import sys
import time
import requests
from bs4 import BeautifulSoup


def main():
    #downloadNoosphere_eggsumary(sys.argv)
    downloadNoosphere(sys.argv)



def downloadNoosphere_eggsumary(parametros):

    urllib.urlretrieve('http://noosphere.princeton.edu/data/eggsummary/%s/summary-%s-%s-%s.html' % (parametros[3], parametros[3], parametros[2], parametros[1]), './eggsumary_%s%s%s' % (parametros[3], parametros[2], parametros[1]) )
    #loading the file
    f = open('./eggsumary_%s%s%s' % (parametros[3], parametros[2], parametros[1]) , 'r')
    htmlObject = f.read()
    f.close()
    soup = BeautifulSoup(htmlObject)
    print htmlObject


def  downloadNoosphere(parametros):
    #build the url to download data
    parameters = {'z': '1', 'year': parametros[3], 'month': parametros[2] , 'day': parametros[1] , 'stime': '00:00:00', 'etime': '00:03:00', 'gzip': 'Yes', 'idate': 'Yes' }
    r = requests.get('http://noosphere.princeton.edu/cgi-bin/eggdatareq.pl', params = parameters)

    timeD = time.strftime("%H%M%S")
    f = open('./noosphere_%s%s%s_%s' % (parametros[3], parametros[2], parametros[1], timeD), 'w')
    f.write(r.text)
    f.close()



if __name__ == "__main__":
    main()
