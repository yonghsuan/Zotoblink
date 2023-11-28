> **开发者：YONGHSUAN**
> **开发时间：2023.11.27**
> **脚本名称： Zotoblink.m**

## 简介
Zotoblink 是一个用于将 Zotero 目录中的 PDF 文件读取并在 Obsidian 中生成 annotator 支持的 PDF 文档的 MATLAB 脚本。并在基础上，通过使用 Dataview 插件，可以在 Obsidian 中生成文献的目录，方便管理和阅读 Zotero 的文献。

本手册将为你提供详细的使用说明，帮助你正确配置和执行 Zotoblink 脚本，并了解其功能和用途。
## 实现的功能

> -  可以将Zotero中的文献自动转入Obsidian中，方便阅读和做笔记，并且考虑到了重复性，就算重复执行代码，也不会覆盖此前建立的Annotator支持的md文本。 
> -   除了可以在Zotero和Obsidian之间建立文献链接。实际上也可以管理电脑中的PDF或者EPUB文件，只需要在程序中修改 Path0 。并且通过Obsidian的dataview插件，可以实现书籍阅读的可视化管理。 

## 安装和配置

以下是你需要进行的步骤来安装和配置 Zotoblink：
### 1. 下载和安装 MATLAB

Zotoblink 是一个 MATLAB 脚本，因此你首先需要下载和安装 MATLAB 软件。你可以从 [MathWorks](https://ww2.mathworks.cn/products/matlab.html) 官方网站获取 MATLAB 的最新版本，并按照官方指南进行安装。

### 2. Obsidian需要的插件

Obsidian需要安装 [dataview](https://pkmer.cn/Pkmer-Docs/10-obsidian/obsidian%E7%A4%BE%E5%8C%BA%E6%8F%92%E4%BB%B6/dataview/dataview/) 插件来进行文献目录的管理，你可以点击该链接，并根据dataview安装指南来下载安装。其次还需要 [Annotator](https://pkmer.cn/Pkmer-Docs/10-obsidian/obsidian%E7%A4%BE%E5%8C%BA%E6%8F%92%E4%BB%B6/readme/obsidian-annotator_readme/) 插件来阅读PDF或EPUB文件。

### 2. 下载 Zotoblink 脚本

你可以从 GitHub 上的 [Zotoblink](https://github.com/yonghsuan/Zotoblink/tree/main)仓库中下载 Zotoblink 脚本文件，或者点击此链接[Zotoblink.m](https://www.yuque.com/attachments/yuque/0/2023/m/34455920/1701159119931-3ebef3b6-9251-439f-973d-a0633ad6cfa5.m?_lake_card=%7B%22src%22%3A%22https%3A%2F%2Fwww.yuque.com%2Fattachments%2Fyuque%2F0%2F2023%2Fm%2F34455920%2F1701159119931-3ebef3b6-9251-439f-973d-a0633ad6cfa5.m%22%2C%22name%22%3A%22Zotoblink.m%22%2C%22size%22%3A1908%2C%22ext%22%3A%22m%22%2C%22source%22%3A%22%22%2C%22status%22%3A%22done%22%2C%22download%22%3Atrue%2C%22taskId%22%3A%22u08d9d5ee-6cd0-40e3-923b-be37aeeac67%22%2C%22taskType%22%3A%22upload%22%2C%22type%22%3A%22%22%2C%22__spacing%22%3A%22both%22%2C%22mode%22%3A%22title%22%2C%22id%22%3A%22ighwS%22%2C%22margin%22%3A%7B%22top%22%3Atrue%2C%22bottom%22%3Atrue%7D%2C%22card%22%3A%22file%22%7D)来下载该脚本。请确保将脚本文件保存在你计算机上的任意位置。
### 3. 修改路径和文件格式设置
在MATLAB下打开 Zotoblink 脚本文件，在脚本的开头部分，你会看到以下代码段：

```matlab
path0='E:\BaiduSyncdisk\zotero\Attachments\'; % Zotero附件位置
path1='E:\BaiduSyncdisk\Obsidian\obsidian1\Attachment\annotator\zotero\'; % Obsidian存放annotaor支持的文件地址
fileform='pdf';% 文件格式设置，可修改为pdf或epub。
```

根据你的实际情况，修改以下变量：

- `path0`：Zotero 附件所在位置的路径。将其修改为你 Zotero 附件文件夹所在的路径。一般默认的地址为：C:\Users\user\Zotero\storage。部分用户安装了Zotfile可能造成位置迁移。你只需要打开Zotero，光标选择任意文献，右键打开文件位置，这时会弹出Zotero保存文件的路径。复制该路径到`Path0`即可，但要注意在路径结尾处添加'\'。如下图所示：

![Pasted image 20231128145128.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156746394-77b14220-96a0-4f36-a96e-d8876a34ad9b.png#averageHue=%23f5f3f1&clientId=u8c737e8b-d7d3-4&from=ui&id=udb9d07cf&originHeight=375&originWidth=948&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=58842&status=done&style=none&taskId=ub95dd136-027e-407e-856a-86b10ebd35d&title=)
![Pasted image 20231128145200.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156759383-3ad4a94c-3c5b-46ee-8bfd-2ee4562c35ea.png#averageHue=%23f7f5f4&clientId=u8c737e8b-d7d3-4&from=ui&id=u7cd4cc8e&originHeight=663&originWidth=1129&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=107981&status=done&style=none&taskId=u87cee6b5-a141-42b3-9c4f-81eac36652f&title=)

- `path1`：存放 Obsidian 中 annotator 支持的 PDF 或 EPUB 文件地址路径。将其修改为你希望保存的 Obsidian路径。如：E:\BaiduSyncdisk\Obsidian\obsidian1\Attachment\annotator\zotero\。此处也要注意要在结尾处添加'\'。


![Pasted image 20231128145318.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156776328-933b5874-75b1-4ac4-8e27-ad4c85790d77.png#averageHue=%23ebc688&clientId=u8c737e8b-d7d3-4&from=ui&id=u8f88be6f&originHeight=346&originWidth=693&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=18636&status=done&style=none&taskId=ue8ee7400-2268-4f13-bb05-ab96a6183e1&title=)

- `fileform`：文件格式设置。由于Annotator支持 `PDF` 或者 `EPUB` 格式，所以你可修改为 `pdf` 或 `epub`，这取决于你目前保存的文件类型。

请注意，在输入路径时，需要使用斜杠 `\` 而不是 `/`。

### 4. 保存并关闭脚本文件

在完成路径和文件格式的修改后，保存 Zotoblink 脚本文件并关闭编辑器。

## 执行 Zotoblink

在完成安装和配置后，你可以在MATLAB下按步骤执行 Zotoblink 脚本：

### 1. 打开 MATLAB

打开 MATLAB 软件，确保你已成功安装并启动了 MATLAB。

### 2. 打开Zotoblink脚本所在目录

在 MATLAB 中，你需要打开Zotoblink脚本所在路径。

### 3. 运行脚本

在MATLAB编译器窗口点击运行，即可运行Zotoblink脚本。如图：
![Pasted image 20231128151749.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156799390-23497976-d1b0-4177-925a-c5fe6be76435.png#averageHue=%23f3f2ea&clientId=u8c737e8b-d7d3-4&from=ui&id=u4e74fc45&originHeight=660&originWidth=1111&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=111441&status=done&style=none&taskId=u33e7d718-19a9-4707-8891-c64f5eabbd9&title=)

脚本开始执行后，它将遍历指定的 Zotero 附件路径，并生成 annotator 支持的 PDF 文档。在执行过程中，你可以看到脚本输出的信息，显示已存在的文件和生成的新文件。

### 4. 查看执行日志

在 Zotoblink 脚本执行完成后，你可以在 E 盘根目录下找到一个名为 `zotoblinklog.txt` 的执行日志文件。通过查看该日志文件，你可以了解生成的文档情况。如图

![Pasted image 20231128145828.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156813442-8be6c983-2d57-4940-bc72-12de35dfa001.png#averageHue=%23fdfdfd&clientId=u8c737e8b-d7d3-4&from=ui&id=u9e3c4997&originHeight=235&originWidth=1042&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=11094&status=done&style=none&taskId=u2c5f3e05-a137-43c9-bfc8-7006c1129e2&title=)
并且可以根据该日志文件，了解程序的执行情况。如图：

![Pasted image 20231128145911.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156824805-3db5c2f3-6869-4a5c-98ed-bee2cbe4c7f7.png#averageHue=%23edebe9&clientId=u8c737e8b-d7d3-4&from=ui&id=u1f014cbb&originHeight=423&originWidth=1105&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=74132&status=done&style=none&taskId=ue1dc7b6d-429b-49bb-8c88-6c554c27778&title=)
## 使用 Obsidian 和 Dataview

生成的 annotator 支持的 PDF 文档可供 Obsidian 使用。同时，你还可以使用 Dataview 插件在 Obsidian 中生成文献目录。

以下是如何在 Obsidian 中使用生成的文献目录：

1.  打开 Obsidian 软件，确保你已成功安装并启动 Obsidian。 
2.  在 Obsidian 中打开你的文献笔记本。 
3.  安装和启用 Dataview 插件。你可以在 Obsidian 的插件商店中搜索 Dataview 并进行安装。 
4.  在 Obsidian 中创建一个新的 Markdown 文件，并将文件名设置为你希望的文献目录名称。 
5.  在 Markdown 文件中，使用以下语法来生成文献目录： 

```markdown
		table file.folder,rating, status
		from "Attachment/annotator/zotero"
```

将 `Attachment/annotator/zotero` 替换为你生成的文献文件的实际路径。即Zotoblink脚本程序中的 `Path1` 。

6. 保存并刷新 Obsidian，你将在 Markdown 文件中看到自动生成的文献目录。如图：
![Pasted image 20231128150626.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156850643-69a191e1-dd66-4c31-8107-2a0641be3226.png#averageHue=%23f8f8f8&clientId=u8c737e8b-d7d3-4&from=ui&id=u36c94727&originHeight=343&originWidth=961&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=26513&status=done&style=none&taskId=u65b621f5-c0aa-495b-9b7c-e1621b14990&title=)

![Pasted image 20231128150658.png](https://cdn.nlark.com/yuque/0/2023/png/34455920/1701156862316-a86a4cb6-77a4-48b3-b6a5-bb47ec3d5d8e.png#averageHue=%23f5f5f5&clientId=u8c737e8b-d7d3-4&from=ui&id=ufd89c045&originHeight=447&originWidth=1152&originalType=binary&ratio=1.5&rotation=0&showTitle=false&size=102774&status=done&style=none&taskId=u4550b7e0-ddf6-4dda-9f25-777a4fb6561&title=)

通过以上步骤，你可以在 Obsidian 中方便地管理和阅读 Zotero 的文献。

## 改进计划： 将 MATLAB 代码转换成 Bat 脚本代码

下一步的改进计划是将 Zotoblink 的 MATLAB 脚本转换为 Bat 脚本代码。Bat 脚本不需要特定的 IDE 环境，可以在任何 Windows 电脑中执行。由于 MATLAB 和 Bat 脚本之间的语法和功能有所不同，需要进行一些修改和调整。在转换过程中，可能需要查阅 Bat 脚本的文档和参考资料，以了解可用的命令和语法。将 Zotoblink 的 MATLAB 脚本转换为 Bat 脚本代码，可以在任何 Windows 电脑中执行。这样做可以消除对 MATLAB 软件的依赖，提高脚本的可移植性和易用性。

## 程序源码

```matlab
%% 时间：2023.11.27
%% Author:YONGHSUAN
%% 目的：生成Markdown格式的Zotero目录文本。帮助Obsiandian更好的整理文献。
%% 脚本名字：Zotoblink
%% 该脚本在MATLAB下执行后，会在E盘根目录下生成执行日记，可以通过该日记查看，文件的生成情况。

%% 清空变量
clear all;clc
%% 读取路径，此处可修改
path0='E:\BaiduSyncdisk\zotero\Attachments\'; %Zotero附件位置
path1='E:\BaiduSyncdisk\Obsidian\obsidian1\Attachment\annotator\zotero\'; %Obsidian存放annotaor支持的文件地址
fileform='pdf';% 文件格式设置，可修改为pdf或epub。

%% 程序主体,以下不可修改
diary E:\zotoblinklog.txt; %记录pdf文档转化情况日记
filenameform=['\**\*.',fileform];
path=strcat(path0,filenameform);% 搜索路径文件格式为pdf文件
files_list = dir(path);% 遍历该目录下的pdf文件
len=length(files_list);% 目录下文件的数量
len1=length(path0)+1;% 路径的长度
mkdir(path1);% 给指定路径生成文件名
for i=1:len %遍历一遍，生成TXT文本格式
    str=files_list(i).folder;
    str1=[str,'\',files_list(i).name];
    str=str(len1:end);%二级菜单名
    str3=files_list(i).name;
    path2=[path1,str];
    mkdir(path2);% 给指定路径生成文件名
    path3=[path2,'\',str3,'.txt'];
    path4=[path2,'\',str3,'.md'];
    if exist(path4, 'file') == 2 % 判断该路径下是否存在文件
        disp(['已存在文件:',str3])
    else
        disp(['不存在文件：',str3])
        fid = fopen(path3,'w');
        str4=replace(str1,'\','//');
        contxt=['\n---\n','annotation-target: ',str4,'\n','type: pdf\n','status: uncompleted\n','rating: ??\n','---'];% 文本储存的信息
        fprintf(fid,contxt);
        fclose(fid);
    end
end

%% 修改文件后缀名为.md，此处不可修改
file_list1=dir(strcat(path1, '**\*.txt'));
for i = 1:length(file_list1)
    old_name = file_list1(i).name;
    new_name = strrep(old_name, '.txt', '.md');
    movefile(fullfile(file_list1(i).folder, old_name), fullfile(file_list1(i).folder, new_name));
end
diary off %关闭log日记
```

## 总结

Zotoblink 是一个便捷的工具，通过将 Zotero 目录中的 PDF 文件转换为 annotator 支持的格式，使得在 Obsidian 中管理和阅读文献变得更加容易。本手册提供了详细的安装、配置和使用说明，帮助你正确地使用 Zotoblink 脚本，并在 Obsidian 中生成文献目录。

如果你在使用过程中遇到任何问题或需要进一步的帮助，请随时向我们寻求支持。

祝你使用愉快！

_注意：在使用 Zotoblink 脚本时，请遵守相关法律法规并尊重版权。_
