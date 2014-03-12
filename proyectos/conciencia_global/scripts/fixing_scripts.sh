#!/bin/bash
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11)/7 } }' noosphere_19981016_200000 > noosphere_19981016_200000_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10)/6 } }' noosphere_19981120_200156 > noosphere_19981120_200156_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26)/22 } }' noosphere_1999121_200520 > noosphere_1999121_200520_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32)/28 } }' noosphere_19991231_201129 > noosphere_19991231_201129_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17)/13 } }' noosphere_1999420_195812 > noosphere_1999420_195812_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33)/29 } }' noosphere_2000310_202220 > noosphere_2000310_202220_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43)/39 } }' noosphere_20011026_210130 > noosphere_20011026_210130_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42)/38 } }' noosphere_2001107_205033 > noosphere_2001107_205033_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41)/37 } }' noosphere_200132_203445 > noosphere_200132_203445_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41)/37 } }' noosphere_2001911_203950 > noosphere_2001911_203950_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40)/36 } }' noosphere_2001918_204725 > noosphere_2001918_204725_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52)/48 } }' noosphere_200226_210802 > noosphere_200226_210802_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58)/54 } }' noosphere_200321_211349 > noosphere_200321_211349_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56)/52 } }' noosphere_2003312_211635 > noosphere_2003312_211635_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57)/53 } }' noosphere_2003320_212006 > noosphere_2003320_212006_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70)/66 } }' noosphere_20041111_213555 > noosphere_20041111_213555_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70)/66 } }' noosphere_2004112_213212 > noosphere_2004112_213212_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71)/67 } }' noosphere_20041226_214054 > noosphere_20041226_214054_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61)/57 } }' noosphere_200413_212330 > noosphere_200413_212330_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67)/63 } }' noosphere_200441_212806 > noosphere_200441_212806_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69)/65 } }' noosphere_2005101_221036 > noosphere_2005101_221036_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70)/66 } }' noosphere_200542_214558 > noosphere_200542_214558_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72)/68 } }' noosphere_200549_214952 > noosphere_200549_214952_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71)/67 } }' noosphere_2005530_215433 > noosphere_2005530_215433_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73)/69 } }' noosphere_200567_215927 > noosphere_200567_215927_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_2005829_220316 > noosphere_2005829_220316_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69)/65 } }' noosphere_2005930_220655 > noosphere_2005930_220655_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74)/70 } }' noosphere_2006115_221922 > noosphere_2006115_221922_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75)/71 } }' noosphere_2006824_221428 > noosphere_2006824_221428_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76)/72 } }' noosphere_200711_222406 > noosphere_200711_222406_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67)/63 } }' noosphere_20071227_222734 > noosphere_20071227_222734_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_2008103_232506 > noosphere_2008103_232506_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68)/64 } }' noosphere_2008109_233014 > noosphere_2008109_233014_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_20081126_233756 > noosphere_20081126_233756_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_2008117_233432 > noosphere_2008117_233432_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_20081211_234108 > noosphere_20081211_234108_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68)/64 } }' noosphere_2008121_223050 > noosphere_2008121_223050_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_2008219_223421 > noosphere_2008219_223421_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2008314_224954 > noosphere_2008314_224954_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67)/63 } }' noosphere_200872_225323 > noosphere_200872_225323_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2008817_230155 > noosphere_2008817_230155_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_2008822_230834 > noosphere_2008822_230834_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_2008824_231418 > noosphere_2008824_231418_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_200888_225731 > noosphere_200888_225731_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68)/64 } }' noosphere_2008915_231812 > noosphere_2008915_231812_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67)/63 } }' noosphere_2008916_232120 > noosphere_2008916_232120_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69)/65 } }' noosphere_2009120_234459 > noosphere_2009120_234459_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75)/71 } }' noosphere_2009430_235416 > noosphere_2009430_235416_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73)/69 } }' noosphere_200947_234902 > noosphere_200947_234902_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76)/72 } }' noosphere_2009611_235913 > noosphere_2009611_235913_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79)/75 } }' noosphere_2009625_000529 > noosphere_2009625_000529_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79)/75 } }' noosphere_20101128_005121 > noosphere_20101128_005121_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80)/76 } }' noosphere_2010112_001301 > noosphere_2010112_001301_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80)/76 } }' noosphere_20101217_005524 > noosphere_20101217_005524_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80)/76 } }' noosphere_2010227_001801 > noosphere_2010227_001801_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80+$81+$82)/78 } }' noosphere_2010420_002331 > noosphere_2010420_002331_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80+$81)/77 } }' noosphere_2010427_002840 > noosphere_2010427_002840_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80)/76 } }' noosphere_201055_003636 > noosphere_201055_003636_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77)/73 } }' noosphere_2010725_004248 > noosphere_2010725_004248_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76)/72 } }' noosphere_2010822_004708 > noosphere_2010822_004708_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72)/68 } }' noosphere_20111020_013425 > noosphere_20111020_013425_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77)/73 } }' noosphere_2011105_013037 > noosphere_2011105_013037_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72)/68 } }' noosphere_20111217_013834 > noosphere_20111217_013834_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78)/74 } }' noosphere_2011125_005947 > noosphere_2011125_005947_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79)/75 } }' noosphere_2011311_010827 > noosphere_2011311_010827_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79)/75 } }' noosphere_2011315_011802 > noosphere_2011315_011802_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80+$81)/77 } }' noosphere_2011320_010329 > noosphere_2011320_010329_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80+$81)/77 } }' noosphere_2011429_011323 > noosphere_2011429_011323_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76+$77+$78+$79+$80)/76 } }' noosphere_201151_012236 > noosphere_201151_012236_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73+$74+$75+$76)/72 } }' noosphere_201185_012622 > noosphere_201185_012622_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64)/60 } }' noosphere_2012109_015110 > noosphere_2012109_015110_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67)/63 } }' noosphere_20121221_015533 > noosphere_20121221_015533_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68)/64 } }' noosphere_20121229_020001 > noosphere_20121229_020001_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70)/66 } }' noosphere_201226_003217 > noosphere_201226_003217_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66+$67+$68+$69+$70+$71+$72+$73)/69 } }' noosphere_201262_014709 > noosphere_201262_014709_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_201286_014143 > noosphere_201286_014143_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58)/54 } }' noosphere_2013101_024050 > noosphere_2013101_024050_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57)/53 } }' noosphere_20131128_024647 > noosphere_20131128_024647_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56)/52 } }' noosphere_2013118_024400 > noosphere_2013118_024400_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56)/52 } }' noosphere_20131211_025719 > noosphere_20131211_025719_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54)/50 } }' noosphere_20131214_030128 > noosphere_20131214_030128_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57)/53 } }' noosphere_2013123_025031 > noosphere_2013123_025031_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57)/53 } }' noosphere_2013125_025358 > noosphere_2013125_025358_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2013211_020334 > noosphere_2013211_020334_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2013313_020737 > noosphere_2013313_020737_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2013314_021143 > noosphere_2013314_021143_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2013329_021540 > noosphere_2013329_021540_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65+$66)/62 } }' noosphere_201335_104909 > noosphere_201335_104909_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63+$64+$65)/61 } }' noosphere_2013415_022229 > noosphere_2013415_022229_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62+$63)/59 } }' noosphere_201365_022522 > noosphere_201365_022522_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59)/55 } }' noosphere_2013722_023227 > noosphere_2013722_023227_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61)/57 } }' noosphere_2013724_023520 > noosphere_2013724_023520_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58+$59+$60+$61+$62)/58 } }' noosphere_201376_022836 > noosphere_201376_022836_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56+$57+$58)/54 } }' noosphere_2013927_023813 > noosphere_2013927_023813_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49+$50+$51+$52+$53+$54+$55+$56)/52 } }' noosphere_201416_030424 > noosphere_201416_030424_fixed.csv
awk -F',' '{ if(NR > 9) {print $2 "," $3 "," ($4+$5+$6+$7+$8+$9+$10+$11+$12+$13+$14+$15+$16+$17+$18+$19+$20+$21+$22+$23+$24+$25+$26+$27+$28+$29+$30+$31+$32+$33+$34+$35+$36+$37+$38+$39+$40+$41+$42+$43+$44+$45+$46+$47+$48+$49)/45 } }' noosphere_201424_030646 > noosphere_201424_030646_fixed.csv