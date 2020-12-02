import strutils

let my_input = open("input")
let data = my_input.readAll().split(Newlines)
my_input.close()


for x in 0..data.len():
    var x_asnum : int
    try:
        x_asnum = parseInt(data[x])
    except:
        continue

    for y in 0..data.len():
        var y_asnum : int 
        try:
            y_asnum = parseInt(data[y])
        except:
            continue
        
        if y_asnum + x_asnum == 2020:
            echo "we got a winer"
            echo y_asnum*x_asnum
            quit(0)

