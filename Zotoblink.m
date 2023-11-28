%% 时间：2023.11.27
%% Author:YONGHSUAN
%% 目的：生成Markdown格式的Zotero目录文本。帮助Obsiandian更好的整理文献。
%% 脚本名字：Zotoblink
%% 该脚本在MATLAB下执行后，会在E盘根目录下生成执行日记，可以通过该日记查看文件的生成情况。

%% 清空变量
clear all;clc
%% 读取路径，此处可修改
path0='E:\BaiduSyncdisk\zotero\Attachments\'; %Zotero附件位置
path1='E:\BaiduSyncdisk\Obsidian\obsidian1\Attachment\annotator\zotero\'; %Obsidian存放annotaor支持的文件地址
fileform='epub';% 文件格式设置，可修改为pdf或epub。

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