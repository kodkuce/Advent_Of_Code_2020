import strutils

let my_input = open("input")
let data = my_input.readAll().split(Newlines)
my_input.close()

var good_code_counter:int = 0

for x in 0..data.high:
    let splited = data[x].split(" ")
    if splited.len < 2:
        continue
    let nums = splited[0].split("-")
    let look_char:char = splited[1][0]

    let pos_1 = parseInt(nums[0])-1
    let pos_2 = parseInt(nums[1])-1

    if splited[2][pos_1] == look_char and splited[2][pos_2] != look_char:
        good_code_counter.inc()
    if splited[2][pos_2] == look_char and splited[2][pos_1] != look_char:
        good_code_counter.inc()

echo good_code_counter