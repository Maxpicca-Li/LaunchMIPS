## �ļ�Ŀ¼˵��
2021-CquCOlab-src
��  inst32_inst64.py             ��32bit��inst_sram.coeתΪ64bit��inst_sram_64.coe
|  inst_sram_64.xci             inst_sram_64����
��  readme.txt                   �ļ�Ŀ¼˵��
��  
����rtl
��  ��  soc_lite_top.v            �����ļ����޸�cpu_inst_wen��cpu_inst_wdata��cpu_inst_rdata��λ��
��  ��  
��  ����myCPU                      myCPUԴ�����ļ�
��          alu_master.v         master��֧��alu
��          alu_slave.sv         slave��֧��alu
��          branch_judge.sv      ��֧�ж��߼�
��          cp0_reg.sv           CP0�Ĵ���
��          datapath.v           ����ͨ·
��          decoder.sv           ����
��          defines.vh           �궨��
��          div.v                ����ģ��
��          exception.sv         �쳣���ؽ���
��          flopenr.v            ������
��          forward_mux.sv       ǰ��ѡ��
��          forward_top.sv       ǰ�ƶ���
��          hazard.v             ����ð�մ���
��          hilo_reg.v           hilo�Ĵ���
��          instdec.v            ָ��ascii����
��          inst_diff.sv         2��ָ���ȡ����
��          inst_fifo.sv         ָ��fifo��������ͨ·F�׶�
��          issue_ctrl.sv        2��ָ������
��          mem_access.sv        �ô�ת��
��          mycpu_top.v          cpu����
��          pc_reg.sv            pc�Ĵ���
��          regfile.sv           ͨ�üĴ�����
��          
����testbench
        mycpu_tb.v              �����ļ����޸Ĳ��Ե�clk���س���