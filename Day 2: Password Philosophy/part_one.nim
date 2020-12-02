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
    let counted = splited[2].count(look_char)

    if counted >= parseInt(nums[0]) and counted <= parseInt(nums[1]):
        good_code_counter.inc()

echo good_code_counter