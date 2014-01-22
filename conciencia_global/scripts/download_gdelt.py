import urllib, time


def main():
    downloadGDELT()


def downloadGDELT():
    #modify the url for getting GDELT ...
    dateD = time.strftime("%d%m%Y_%H%M%S")
    print dateD
    urllib.urlretrieve('ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chrY.fa.gz', './gdelt_%s' % dateD)

if __name__ == "__main__":
    main()
