import strutils
import tables
import re

let my_input = open("input", fmRead)
var passport = initTable[string, string]()
var legit_ones = 0


proc is_legit()=
    try:
        if passport.hasKey("byr") and passport.hasKey("iyr") and 
            passport.hasKey("eyr") and passport.hasKey("hgt") and 
            passport.hasKey("hcl") and passport.hasKey("ecl") and 
            passport.hasKey("pid") and 
            passport["byr"].parseInt in 1920..2002 and
            passport["iyr"].parseInt in 2010..2020 and
            passport["eyr"].parseInt in 2020..2030 and
            ( (passport["hgt"].endsWith("cm") and 
            passport["hgt"][0..2].parseInt in 150..193) or 
            (passport["hgt"].endsWith("in") and 
            passport["hgt"][0..1].parseInt in 59..76)
            ) and 
            passport["hcl"][0] == '#' and 
            passport["hcl"][1..6].match(re"^[0-9 a-f]*$",0) and
            passport["ecl"] in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"] and
            passport["pid"].len == 9 and passport["pid"].parseInt is int:
                legit_ones.inc()
    except:
        echo "bad"
    passport = initTable[string, string]()

while not my_input.endOfFile:
    let l = my_input.readLine()
    if l == "":
        is_legit()
    else:
        let spacesplit = l.split(Whitespace)
        for el in spacesplit:
            #now each elemt is split by :, ex iyr:2015
            let subsplit = el.split(':')
            passport[subsplit[0]] = subsplit[1]

#for last row
is_legit()
my_input.close()
echo legit_ones