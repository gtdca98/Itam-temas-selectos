__author__ = 'Lili'
import os

def main():
    data_files = []
    for x in os.walk('/Users/Lili/PycharmProjects/temas_selectos_estadistica/noosphere'):
        data_files.append(x[2])

    eggsList = []
    for i in range(1, len(data_files[0])):
        #print data_files[0][i]
        f = open('/Users/Lili/PycharmProjects/temas_selectos_estadistica/noosphere/%s' % data_files[0][i], 'r')
        lines = f.readlines()
        line = lines[4]
        elementsInLine = line.split(",")
        eggsList.append([data_files[0][i], int(elementsInLine[2])])

    #print eggsList

    scriptFile = []
    for j in range(len(eggsList)):
        awkScript = "awk -F',' '{ if(NR > 9) {print $2 \",\" $3 \",\" ($4"
        for k in range(5, eggsList[j][1]+5):
            awkScript += '+'
            awkScript += "$" + str(k)
            #print awkScript
        awkScript += ")/" + str(eggsList[j][1]) + " } }' " + eggsList[j][0] + " > " + eggsList[j][0] + "_fixed.csv"
        #print awkScript
        scriptFile.append(awkScript)


    f = open("/Users/Lili/PycharmProjects/temas_selectos_estadistica/noosphere/fixing_scripts.sh" , "w")
    f.write("#!/bin/bash")
    f.write("\n")
    for l in range(len(scriptFile)):
        f.write(scriptFile[l])
        f.write("\n")

    f.close()
    #print scriptFile


if __name__ == "__main__":
    main()

