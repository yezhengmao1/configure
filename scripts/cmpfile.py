filea=input()
fileb=input()

row=0

for linea,lineb in zip(open(filea),open(fileb)):
    row+=1
    if not linea==lineb:
        col=0
        for chara,charb in zip(linea,lineb):
            col+=1
            if not chara==charb:
                print("Diff in row:%d col:%d"%(row,col))
                break
