**《Face The Wall加密系统使用说明》**

1. 程序的运行方式：

          解压Face The Wall3.0.0压缩包。在提取后的文件中打开Face the wall.exe文件即可运行，无需安装。

1. 加密系统简介：

          本加密系统可以对文本以及文件的加密、解密。该程序有程序小巧，界面简洁，安装以及卸载方便、操作简便以及安全性较高（详见安全性测试说明）的特点。

1. 加密系统的使用：

          整个软件分为4个模块，分别是：加密文字、解密文字、加密文件、解密文件。主界面见图1.

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/1.png)

图1：主界面

          加密文字：将需要加密的文字段（大小限制：64K）输入或复制到文本框内，在密钥处输入您想使用的密钥。与AES类似，密码有3种长度可选，分别是128Bit、192Bit、256Bit。同时还可以勾选&quot;十六进制&quot;和&quot;终端字体&quot;选项。点击加密文字在文本框内获得密文（可多次加密）。

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/2.png)

图2：文字加密界面

          解密文字：与加密文字类似，将密文输入或复制到文本框内，密钥以及密钥长度与该密文加密时的密钥以及密钥长度一致，点击解密文字即可在文本框内获得明文。

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/3.png)

图3：解密文字界面

          加密文件：先填写好您想使用的密钥以及密钥长度，点击加密文件，将会弹出如图5 的文件选择框。选择您需要加密的文件（文件大小限制：1.2GB），然后选择您想把加密后的文件保存位置后（图6），程序就会对文件开始进行加密，加密过程如图7 ，请耐心等待。加密速度与CPU主频频率成正比关系。加密后的文件将以后缀名为.ftw的文件格式存在（图8）。以下列出5种不同CPU的加密速度。

| CPU型号及信息 | 测试的理论速度 |
| --- | --- |
| Intel i7 7700K@OC 4.8Ghz | 25MB/S |
| Intel i7 6700K@OC 4.5Ghz | 23MB/S |
| Intel i5 6500  @     3.2Ghz | 16MB/S |
| Intel i7 6700HQ @ 2.6Ghz | 13MB/S |
| Intel i5 6300HQ @ 2.3Ghz | 11MB/S |

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/4.png)

图4：加密文件界面

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/5.png)

图5：选择需要加密的文件

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/6.png)

图6：选择加密后文件的保存地址

在文件加密过程中，程序会有如下显示： ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/7.png)

图7：正在进行加密

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/8.png)

图8：完成加密的文件后缀为.ftw

          解密文件：方式与解密文字类似，步骤与加密文件类似（图9）。选择的文件只能为进过次程序加密过的.ftw后缀文件。解密文件速度与加密文件速度几乎无差距。

 ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/9.png)

图9：解密文件

1. 算法的可靠性：

          为了证实改加密算法有着一定的可靠性，本人在申请到的神威太湖之光上进行了可靠性测试，利用C语言编写适用于神威太湖之光的编译环境的暴力破解代码进行破解。详情如下。

| 系统环境 | Raise OS2.0.5 |
| --- | --- |
| CPU型号 | 申威26010众核处理器 |
| CPU数量 | 64颗 |
| 计算速度峰值 | 148.8Gflops |
| 明文长度 | 1KB |
| 破解时间 | 11H 28M 10S |

          ![](https://github.com/CcgcChen/FTW-encryption-software-based-on-AES-/blob/master/screenshots/10.png)

图10：暴力破解

由于本人的技术有限，在神威太湖之光上所运行的暴力破解源码可能不能使理论计算能力达到峰值，所以破解时间并不完全代表该算法的可靠性。

1. 总结

由于相关技术有限，Face The Wall加密系统难免出现大大小小的一些BUG，希望得到大家的宝贵意见。





         Ccgc Chen
