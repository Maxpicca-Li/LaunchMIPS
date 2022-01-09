# LaunchMIPS

> LaunchMIPS 🐛🐛🐛

---

2021年龙芯作品

- 五级流水线MIPS+写直达cache+axi接口
  - 已通过功能、性能的仿真测试，上板测试
  - 功能分：85，性能分：13.056 
- 五级流水线MIPS+二路写回cache+axi接口
  - 已通过功能、性能的仿真测试

---



## TODO

- [x] 实现顺序双发射的CPU逻辑，完成功能仿真（2021.01.01~2021.01.07）
- [ ] 优化cache，添加axi-burst接口，完成性能仿真（2021.01）
- [ ] 其他
  - [ ] 系统测试
  - [ ] CPU提频

## 文档学习

[重庆大学硬件综合设计实验文档 (cqu.ai)](https://colabdocs.cqu.ai/)

## 参考资料

- 2019NSCSCC[trivialmips/nontrivial-mips: NonTrivial-MIPS is a synthesizable superscalar MIPS processor with branch prediction and FPU support, and it is capable of booting linux. (github.com)](https://github.com/trivialmips/nontrivial-mips)
- 2019NSCSCC [name1e5s/Sirius: Asymmetric dual issue in-order microprocessor. (github.com)](https://github.com/name1e5s/Sirius)
- 2020NSCSCC [SocialistDalao/UltraMIPS_NSCSCC: UltraMIPS SoC composed of dual-issue cpu, pipeline Cache and systematic peripheral. (github.com)](https://github.com/SocialistDalao/UltraMIPS_NSCSCC)

