#!/usr/bin/python

import os
objects = [\
 'ALU',\
 'IPU',\
 'NLU',\
 'RF'\
] 
funcs_elements = [\
 'Identity',\
 'Add',\
 'Max',\
 'Accumulate'\
] 
nl_elements = [\
 'Identity',\
 'Relu'\
]
def gen_func(l):
  funcs = []
  for num in range(1, len(l)+1):
    for i in range(0, len(l) - num + 1):
      func = ''
      for j in range(0, num):
        if(func == ''):
          func = l[i+j]
        else:
          func = func + '/' + l[i+j]
      funcs.append(func)
  return funcs

def argv_gen(test):
  argv = {'ALU':[], 'IPU':[], 'NLU':[], 'RF':[]}
  if(test):
    argv['ALU'].append('4 Add/Accumulate')
    argv['IPU'].append('1 4 4 None')
    argv['NLU'].append('8 8 ReLu')
    argv['RF'].append('1 1 1 1 5 8 Soft')
    return argv
  ## ALU
  #print gen_func(funcs_elements)
  for datawidth in [2,4,8,16]:
    for func in gen_func(funcs_elements):
      argv['ALU'].append(str(datawidth) + ' ' + func)
  ## IPU
  for width in [1,8,16]:
    for inBitWidth in [2,4,8,16]:
      for outBitWidth in [2*inBitWidth, 2*inBitWidth+width]:
        for bypass in ['None', 'Firm']:
          argv['IPU'].append(str(width) + ' ' + str(inBitWidth) + ' ' + str(outBitWidth) + ' ' + bypass)
  ## NLU
  #print gen_func(nl_elements)
  for inBitWidth in [2,4,8,16]:
    for outBitWidth in [inBitWidth]:
      for fenc in gen_func(nl_elements):
        argv['NLU'].append(str(inBitWidth) + ' ' + str(outBitWidth) + ' ' + func)
  ## RF 
  for numInInputs in [1,2,4]:
    for numExInputs in [numInInputs]:
      for numInOutput in [1,2,4]:
        for numExOutput in [numInOutput]:
          for addrWidth in [0,2,4,6]:
            for dataWidth in [2,4,8,16]:
              for bypass in ['None', 'Soft', 'Firm']:
                if(bypass == 'Firm' and addrWidth != 0):
                  continue
                argv['RF'].append(str(numInInputs) + ' ' + str(numExInputs) + ' ' + str(numInOutput) + ' ' + str(numExOutput) + ' ' + str(addrWidth) + ' ' + str(dataWidth) + ' ' + bypass) 
  return argv

def fir_gen(test):
  argvs = argv_gen(test)
  #argvs = argv_gen(False)
  for obj in argvs.keys():
    print obj
    print(len(argvs[obj]))
    for argv in argvs[obj]:
      print("sbt \"test:runMain pe.Test " + obj + " " + argv + " -td ./results/" + obj + "_" + argv.replace(' ', '_').replace('/', '_') + "/\"")
      os.system("sbt \"test:runMain pe.Test " + obj + " " + argv + " -td ./results/" + obj + "_" + argv.replace(' ', '_').replace('/', '_') + "/\"")

  
def verilog_gen():
  os.chdir("./results/")
  subdir = os.listdir("./")
  for path in subdir:
    assert os.path.isdir("./" + path), "path error"
    os.chdir("./" + path)
    firdir = os.listdir("./")
    assert len(firdir) == 1, "need clean first"
    os.system("firrtl -i ./" + firdir[0] + "/*.fir -o dut.v -X verilog")
    os.chdir("../")
  os.chdir("../")
  os.system("chown -R 3713:1002 ./results/")

def run_dc():
  os.chdir("./results/")
  subdir = os.listdir("./")
  for path in subdir:
    assert os.path.isdir("./" + path), "path error"
    os.chdir("./" + path)
    print("=e====================================================")
    print("Run Synthesis with Design Compiler for <" + path + ">...")
    print("======================================================")
    os.system("mkdir -p result")
    os.system("mkdir -p synthesis")
    os.chdir("./synthesis")
    os.system("dc_shell -x \"set top_module \\\"" + path.split('_')[0] + "\\\"\" -f ../../../my_scripts/design_compiler.tcl | tee \"run.log\"")
    os.chdir("../../")
    print("======================================================")
    print("         <" + path + "> Synthesis Done.")
    print("======================================================")
  os.chdir("../")
  
def clean_dc():
  print "Clean All Design Compiler Results ..."
  os.chdir("./results/")
  subdir = os.listdir("./")
  for path in subdir:
    assert os.path.isdir("./" + path), "path error"
    os.chdir("./" + path)
    print("  >deleting syn for " + path + "...")
    os.system("rm -rf result")
    os.system("rm -rf synthesis")
    os.system("rm -f *.log *.mr *.svf *.pvl *.syn")
    os.chdir("../")
  os.chdir("../")

def clean_verilog():
  print "Clean All Chisel Results ..."
  os.system("rm -rf ./results/*")
  
def parser():
  os.chdir("./results/")
  subdir = os.listdir("./")
  result = {'ALU':[], 'IPU':[], 'NLU':[], 'RF':[]}
  for path in subdir:
    assert os.path.isdir("./" + path), "path error"
    os.chdir("./" + path + "/result/")
    os.system("pwd")
    fp = open("./Report_area.txt", 'r')
    for line in fp:
      if(line.split(':')[0] == 'Total cell area'):
        area_cell = line.split(':')[1].split()[0]
      elif(line.split(':')[0] == 'Net Interconnect area'):
        area_wire = line.split(':')[1].split()[0]
      elif(line.split(':')[0] == 'Combinational area'):
        area_combine = line.split(':')[1].split()[0]
    fp.close()
    fp = open("./Report_power.txt", 'r')
    for line in fp:
      if(line.split() == []):
        continue
      if(len(line.split()) > 5 and line.split()[0] == path.split('_')[0]):
        power = line.split()[4]
        leakage = line.split()[3]
    fp.close()
    fp = open("./Report_timing_2.txt", 'r')
    for line in fp:
      if(line.split() == []):
        continue
      if(line.split()[0] == 'data' and line.split()[1] == 'arrival' and line.split()[2] == 'time'):
        latency = line.split()[3] 
    fp.close()
    os.chdir("../../")
    result[path.split('_')[0]].append({'config':path,\
'area.cell':area_cell, 'area.wire':area_wire, 'area.combine':area_combine,\
'power':power, 'leakage':leakage,\
'latency':latency})
  os.chdir("../")
  for obj in result.keys():
    print "============================================="
    print "        " + obj
    print "============================================="
    fp = open(obj + '.cvs', 'w')
    for item in result[obj]:
      for arg in item['config'].split('_'):
        print arg + ',',
        fp.write(arg + ', ')
      print item['latency'] + ', ' + item['power'] + ', ' + item['leakage'] + ', ' + item['area.combine'] + ', ' + item['area.wire'] + ', ' + item['area.cell']
      fp.write(item['latency'] + ', ' + item['power'] + ', ' + item['leakage'] + ', ' + item['area.combine'] + ', ' + item['area.wire'] + ', ' + item['area.cell'])
      fp.write('\n')
    fp.close()  


    
def main():
  test = False
  #clean_verilog()
  #clean_dc()
  #fir_gen(test)
  #verilog_gen()
  #run_dc()
  parser()
  
if __name__ == "__main__":
    main()  
