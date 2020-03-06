环境配置：https://zhuanlan.zhihu.com/p/37056659

## Bugs & Fixes

1. 对于一些需要导入整个文件来说，使用函数load会出错，网友Louis Christopher的博客中提到使用函数Require可解决。使用示例：
   （#%require “需要导入的文件”），并在被导入文件的末尾添加“(provide (all-defined-out))”，该文件的预处理器需要是”#lang racket“。（原文链接：[https://louischristopher.me/setting-up-drracket-for-sicp](https://link.zhihu.com/?target=https%3A//louischristopher.me/setting-up-drracket-for-sicp) ）