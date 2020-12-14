import strutils

let my_input = open("input")
let data = my_input.readAll().split(Newlines)
my_input.close()


var tree_counter = 0
var pos = 0
var width = data[0].len

for drow in 1..data.high:
    if data[drow] == "":
        break

    pos = pos + 3
    if pos > 30:
        pos = pos - 31
    if data[drow][pos] == '#':
        tree_counter.inc()

echo tree_counter
