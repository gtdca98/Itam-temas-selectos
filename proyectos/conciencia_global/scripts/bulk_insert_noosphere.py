import csv
import os

__author__ = 'Lili'

import psycopg2
import glob


def main():
    conn = psycopg2.connect(database='noosphere', user='liliana', password='l1l14n4', host='54.213.182.5')
    cur = conn.cursor()

    rootPath = '/Users/Lili/PyCharmProjects/temas_selectos_estadistica/noosphere/'
    #for filename in glob.iglob(os.path.join('noosphere', '*', '*_fixed.csv')):
    for root, dirs, files in os.walk('./noosphere'):
        i = 1;
        for file in files:
            if file.endswith('_fixed.csv'):
                print i
                fileToUpload = file

                f = open(rootPath + fileToUpload, 'r')
                cur.copy_from(f, 'datos_noosphere', sep=',', columns=('id','datetime','avg_ones'))
                conn.commit()
                f.close()

                #print cur.execute("select * from datos_noosphere limit 5")
                #cur.fetchall()

                i = i+1

    cur.close()
    conn.close()


if __name__ == "__main__":
    main()