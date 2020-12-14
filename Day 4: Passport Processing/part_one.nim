import strutils
import tables

let my_input = open("input", fmRead)
var passport = initTable[string, string]()
var legit_ones = 0


proc is_legit()=
    if passport.hasKey("byr") and passport.hasKey("iyr") and 
        passport.hasKey("eyr") and passport.hasKey("hgt") and 
        passport.hasKey("hcl") and passport.hasKey("ecl") and 
        passport.hasKey("pid"):
            legit_ones.inc()
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