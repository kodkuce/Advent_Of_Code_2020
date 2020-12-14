import strutils

let my_input = open("input")
let data = my_input.readAll().split(Newlines)
my_input.close()


proc calc_per( even_only:bool, offset:int):int=
    var tree_counter = 0
    var pos = 0
    var width = data[0].len
    var debug = 0

    for drow in 1..data.high:
        if data[drow] == "":
            break

        if even_only and drow mod 2 != 0:
            continue

        pos = pos + offset
        if pos > 30:
            pos = pos - 31
        if data[drow][pos] == '#':
            tree_counter.inc()
    result = tree_counter


var ammount  = calc_per(false,1) * calc_per(false,3) *
 calc_per(false,5) * calc_per(false,7) * calc_per(true, 1)
echo ammount