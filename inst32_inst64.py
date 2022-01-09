import tqdm
i = 0
with open("inst_ram_64.coe","w") as wf:
    with open("inst_ram.coe","r") as rf:   
        for line in tqdm.tqdm(rf):
            i+=1
            if i<=2:
                wf.write(line)
            else:
                if i%2==1:
                    wf.write(line.strip())
                else:
                    wf.write(line)
    if i%2==1:
        wf.write("00000000\n")