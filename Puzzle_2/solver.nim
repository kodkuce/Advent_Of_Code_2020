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

        for j in 0..data.len():
            var j_asnum : int 
            try:
                j_asnum = parseInt(data[j])
            except:
                continue
            
            if y_asnum + x_asnum + j_asnum == 2020:
                echo "we got a winer, this loop getting biger and bigger, doom incoming xD"
                echo y_asnum*x_asnum*j_asnum
                quit(0)

