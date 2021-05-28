import os
import time
import sys

# clang_path = sys.argv[1]
filename = sys.argv[1]
func_name = sys.argv[2]
imp_variable = sys.argv[3]

#declare variables
clang_path = "/home/shakti/Downloads/llvm-3.3.src/Release+Asserts/bin/clang"
executable = filename.split('.')[0]


#generate executable and dump
os.system('gcc -g '+filename + ' -o '+executable)
time.sleep(0.05)
os.system(clang_path + ' -emit-llvm -S -g -O0 -c ' + filename + ' -o ' + executable + '.ll')
os.system('python graph-llvm-ir/graph-llvm-ir ./' +executable + '.ll')
os.system('objdump -d ' + executable + ' >temp.dump')

time.sleep(0.05)

# get return address of function
ff = open('temp.dump')
lines = ff.readlines()
line_addr = None
for i,line in enumerate(lines) :
    if '<' + func_name +'>:' in line :
        while 1 :
            i += 1
            line = lines[i]
            if 'retq' in line :
                temp = line.split(':')
                line_addr = temp[0]
                break
    if line_addr is not None :
        break
        
ff.close()
# print(line_addr)
#find line number of that using addr2line
open('addr2line.txt', 'w').close()
os.system('addr2line -e '+executable + ' '+line_addr + ' >addr2line.txt')
ff = open('addr2line.txt')
lines = ff.readlines()
st = lines[0].replace('\n','')
st = st.split(':')
ret_line = st[-1]
ff.close()


#use gdb to find local variables
code = "b " + func_name + '\n'
code += "set logging file gdb_run.txt\n"
code += "set logging on\n"
code += "run\n"
code += "p \"here\"\n"
code += "info locals\n"
code += "p \"done\"\n"
code += "c\nq\ny\n"

with open("cmd.txt", "w") as text_file:
    text_file.write(code)

open('gdb_run.txt', 'w').close()
os.system('gdb --command=cmd.txt ./'+executable + '>/dev/null 2>&1')
time.sleep(0.05)
out = open('gdb_run.txt')
li = out.readlines()
i = 0
variables = []
while 1 :
    l = li[i]
    if 'here' in l :
        i += 1
        while 1 :
            l = li[i]
            if 'done' in l :
                break
            else :
                temp = l.split(' ')
                if temp[0]!= '' :
                    variables.append(temp[0])
            i+=1
        break
    i += 1
    if i>=len(li) :
        break
        

out.close()

print("Locals : ",variables)
encrypt_path = func_name + '.dot'

file = open(encrypt_path)
lines = file.readlines()
adj = {}
labels = {}
rev_adj = {}
for line in lines:
  
   if 'color=red' not in line and '->' in line:
      a,b = line.split('->')
      a = a[1:-2]
      b = b[2:-2]
      line = line.replace('"','')
      lists = line.split(' ')
      if 'i32' not in lists and 'i8' not in lists and 'i16' not in lists and 'i64' not in lists :
        adj[a] = adj.get(a,[])+[b]
        rev_adj[b] = rev_adj.get(b,[])+[a]
  
   if  'color=red' not in line and '" [label=' in line:
      key,label = line.split('" [label=')
      label = label[3:-3]
      labels[key[1:]] = label
      
file.close()

graph = adj
graph_rev = rev_adj

types = labels

S = []
visited = {}
def dfs(root,is_prev) :
    # print(root)
    if visited.get(root,False) :
      return
    visited[root] = True
    if root in variables :
        S.append(root)

    if is_prev and "getelementptr inbounds" in types.get(root,""):
        
        label_val = types[root].split(',')[0].split('%')[-1]
        # print("Found a label_val:",label_val)
        if label_val in variables :
           dfs(label_val,False)


    if "store" in types.get(root,"") :
        for k in graph_rev[root] :
            dfs(k,True)
            
    for x in graph.get(root,[]) :
        dfs(x,False)
    
        
dfs(imp_variable,False)
            
print("Variables to check ",S)
print('')
vars = S


code = "b " + filename + ":" +ret_line + '\n'
code += "set logging file gdb_run.txt\n"
code += "set logging on\n"
code += "run\n"
for var in vars :
    code += "print "+var+'\n'
    
code += "c\nq\ny\n"

with open("cmd.txt", "w") as text_file:
    text_file.write(code)

open('gdb_run.txt', 'w').close()
os.system('gdb --command=cmd.txt ./'+executable + '>/dev/null 2>&1')
time.sleep(0.05)
out = open('gdb_run.txt')
li = out.readlines()

for l in li :
    if l[0] == '$' :
        j = l.split('=')
        ind = int(j[0][1:-1])
        print("final value of "+vars[ind-1] + " is"+j[1])
        
