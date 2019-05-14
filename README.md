# RTL_Code
论文中的RTL_Code
#所有的RTL代码都在这里了，这里以LSE_Bagging为例，如何进行仿真和验证

1：cd /baggingDemo1126/sim
2: vim Makefile #对Makefile中的文件进行编辑
  在makefile中可以看到48行,为相应的工艺库文件地址，修改地址到自己的库文件，本文中的工艺使用了65nsCMOS工艺
  
 /baggingDemo1126/src 给出了所有相应的模块代码
 其中BaggingDemo.v为基分类器计算模块，TopBagging.v为顶层模块的RTL代码，Weight_memory.v为参数存储模块的RTL代码，TopBaggingTest.v为顶层模块的TestBench，其余剩下的txt文件为模块中预处理的参数文件，在上电阶段由TestBench代码中的读入进入测试模块。
 
 逻辑仿真验证：
 1：cd /baggingDemo1126/sim
 
 2: make comp
 
 3: make elab
 
 4: make gui
 
综合阶段：
1：cd /baggingDemo1126/sythensis/scripts 	
2: vim syn_RISC.scr
修改频率信息和工艺库地址等

综合后仿真阶段：
1：cd /baggingDemo1126/sim
2：make comp_synth
3: make elab_synth
4: make gui_synth
 
