## 文件目录说明
2021-CquCOlab-src
│  inst32_inst64.py             将32bit的inst_sram.coe转为64bit的inst_sram_64.coe
|  inst_sram_64.xci             inst_sram_64配置
│  readme.txt                   文件目录说明
│  
├─rtl
│  │  soc_lite_top.v            顶层文件，修改cpu_inst_wen、cpu_inst_wdata、cpu_inst_rdata的位宽
│  │  
│  └─myCPU                      myCPU源代码文件
│          alu_master.v         master分支的alu
│          alu_slave.sv         slave分支的alu
│          branch_judge.sv      分支判断逻辑
│          cp0_reg.sv           CP0寄存器
│          datapath.v           数据通路
│          decoder.sv           译码
│          defines.vh           宏定义
│          div.v                除法模块
│          exception.sv         异常因素解析
│          flopenr.v            触发器
│          forward_mux.sv       前推选择
│          forward_top.sv       前推顶层
│          hazard.v             控制冒险处理
│          hilo_reg.v           hilo寄存器
│          instdec.v            指令ascii编码
│          inst_diff.sv         2条指令读取控制
│          inst_fifo.sv         指令fifo控制数据通路F阶段
│          issue_ctrl.sv        2条指令发射控制
│          mem_access.sv        访存转换
│          mycpu_top.v          cpu顶层
│          pc_reg.sv            pc寄存器
│          regfile.sv           通用寄存器堆
│          
└─testbench
        mycpu_tb.v              测试文件，修改测试的clk边沿触发
