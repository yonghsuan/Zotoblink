%% ʱ�䣺2023.11.27
%% Author:YONGHSUAN
%% Ŀ�ģ�����Markdown��ʽ��ZoteroĿ¼�ı�������Obsiandian���õ��������ס�
%% �ű����֣�Zotoblink
%% �ýű���MATLAB��ִ�к󣬻���E�̸�Ŀ¼������ִ���ռǣ�����ͨ�����ռǲ鿴�ļ������������

%% ��ձ���
clear all;clc
%% ��ȡ·�����˴����޸�
path0='E:\BaiduSyncdisk\zotero\Attachments\'; %Zotero����λ��
path1='E:\BaiduSyncdisk\Obsidian\obsidian1\Attachment\annotator\zotero\'; %Obsidian���annotaor֧�ֵ��ļ���ַ
fileform='epub';% �ļ���ʽ���ã����޸�Ϊpdf��epub��

%% ��������,���²����޸�
diary E:\zotoblinklog.txt; %��¼pdf�ĵ�ת������ռ�
filenameform=['\**\*.',fileform];
path=strcat(path0,filenameform);% ����·���ļ���ʽΪpdf�ļ�
files_list = dir(path);% ������Ŀ¼�µ�pdf�ļ�
len=length(files_list);% Ŀ¼���ļ�������
len1=length(path0)+1;% ·���ĳ���
mkdir(path1);% ��ָ��·�������ļ���
for i=1:len %����һ�飬����TXT�ı���ʽ
    str=files_list(i).folder;
    str1=[str,'\',files_list(i).name];
    str=str(len1:end);%�����˵���
    str3=files_list(i).name;
    path2=[path1,str];
    mkdir(path2);% ��ָ��·�������ļ���
    path3=[path2,'\',str3,'.txt'];
    path4=[path2,'\',str3,'.md'];
    if exist(path4, 'file') == 2 % �жϸ�·�����Ƿ�����ļ�
        disp(['�Ѵ����ļ�:',str3])
    else
        disp(['�������ļ���',str3])
        fid = fopen(path3,'w');
        str4=replace(str1,'\','//');
        contxt=['\n---\n','annotation-target: ',str4,'\n','type: pdf\n','status: uncompleted\n','rating: ??\n','---'];% �ı��������Ϣ
        fprintf(fid,contxt);
        fclose(fid);
    end
end

%% �޸��ļ���׺��Ϊ.md���˴������޸�
file_list1=dir(strcat(path1, '**\*.txt'));
for i = 1:length(file_list1)
    old_name = file_list1(i).name;
    new_name = strrep(old_name, '.txt', '.md');
    movefile(fullfile(file_list1(i).folder, old_name), fullfile(file_list1(i).folder, new_name));
end
diary off %�ر�log�ռ�