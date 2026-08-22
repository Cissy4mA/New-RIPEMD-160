%抗碰撞分析
filename = 'text.txt';

% 读取文本文件内容
fid = fopen(filename, 'r');
if fid == -1
    error('文件无法打开，请检查文件路径和名称是否正确。');
end
text = fread(fid, '*char')';
fclose(fid);

% 获取文本长度
numChars = numel(text);
% 假设 'text.txt' 是已经存在的文件，包含要处理的文本消息
filename = 'text.txt';

% 读取文本文件内容
fid = fopen(filename, 'r');
if fid == -1
    error('文件无法打开，请检查文件路径和名称是否正确。');
end
text = fread(fid, '*char')';
fclose(fid);

% 获取文本长度
numChars = numel(text);

n=2048;s=0;sq_B=[];sq_C=[];
for i = 1:n
% 随机选择一个起始位置，确保从该位置开始可以选取5个字符
startIndex = randi([1, numChars - 4],1,1);

% 选取5个连续字符作为一段明文
segment = text(startIndex : startIndex + 4);
%fprintf('原始文本: %s\n', segment);

% 指定文件名
filename = 'segment.txt';
% 打开文件用于写入
fid = fopen(filename, 'wt');
% 检查文件是否成功打开
if fid == -1
    error('文件无法打开，请检查文件路径和名称是否正确。');
end
% 写入文本
fprintf(fid, '%s', segment);
% 关闭文件
fclose(fid);
hash_segment=ripemd160('segment.txt');
%fprintf('hash原始文本：%s\n', hash_segment);

% 将文本字符串转换为 ASCII 码的向量
asciiValues = double(segment);
originbin=dec2bin(asciiValues);
%fprintf('二进制值: %s\n', originbin);

modifiedbin=originbin;
bit=randi([1,35],1,1);
if modifiedbin(bit)=='0'
    modifiedbin(bit)='1';
else
    modifiedbin(bit)='0';
end 
%fprintf('三进制值: %s\n', modifiedbin);%"三"进制值代表改变后的二进制值，为了对齐

decimalValue = bin2dec(modifiedbin);
% 将十进制整数转换为字符
asciiChar = char(decimalValue);
%fprintf('三进制文本: %s\n',asciiChar);

% 指定文件名
filename = 'asciiChar.txt';
% 打开文件用于写入
fid = fopen(filename, 'wt');
% 检查文件是否成功打开
if fid == -1
    error('文件无法打开，请检查文件路径和名称是否正确。');
end
% 写入文本
fprintf(fid, '%s', asciiChar);
% 关闭文件
fclose(fid);
hash_asciiChar=ripemd160('asciiChar.txt');
%fprintf('hash改后文本：%s\n', hash_asciiChar);

%disp([i,bit]);

% 40位十六进制转160位二进制
% hexString=hash_segment;%
% subStringLength = 8;
% subStrings = cell(1, length(hexString)/subStringLength);
% for i = 1:length(hexString)/subStringLength
%     subStrings{i} = hexString((i-1)*subStringLength+1:i*subStringLength);
% end
% 
% b1='';
% for i = 1:5
%     str=subStrings{i};
%     decimalNumber = str2num(['0x', str]);
%     binaryString = dec2bin(decimalNumber);
%     numberString = num2str(binaryString);
%     originalLength = length(numberString);
%     numZeros = 32 -originalLength;
%     paddedString = strcat(repmat('0', 1, numZeros), numberString);
%     b1= strcat(b1, paddedString);
% end
% %fprintf('b1:%s\n',b1);
% 
% hexString=hash_asciiChar;%
% subStringLength = 8;
% subStrings = cell(1, length(hexString)/subStringLength);
% for i = 1:length(hexString)/subStringLength
%     subStrings{i} = hexString((i-1)*subStringLength+1:i*subStringLength);
% end
% 
% b2='';
% for i = 1:5
%     str=subStrings{i};
%     decimalNumber = str2num(['0x', str]);
%     binaryString = dec2bin(decimalNumber);
%     numberString = num2str(binaryString);
%     originalLength = length(numberString);
%     numZeros = 32 -originalLength;
%     paddedString = strcat(repmat('0', 1, numZeros), numberString);
%     b2= strcat(b2, paddedString);
% end
%fprintf('b2:%s\n',b2);

% 遍历字符串的每个字符
% B=0;Average_B=0;
% for i = 1:length(b1)
%     % 比较对应位置上的字符
%     if b1(i) ~= b2(i)
%         B = B + 1;
%     end
% end

C=0;
for i = 1:length(hash_segment)
    % 比较对应位置上的字符
    if hash_segment(i) == hash_asciiChar(i)
        C = C + 1;
    end
end

% s=s+B;
% Average_B=s./n;
% sq_B = [sq_B, B]; % 将新元素添加到数组末尾
sq_C = [sq_C, C];

% 显示不同位数的数量
%fprintf('不同位数B：%d位\n', B);
%fprintf('平均B：%f\n',Average_B);
%fprintf("\n");

end

% sumB=sum((sq_B-Average_B).^2);
% P=Average_B./256;
% sumP=sum((sq_B/256-P).^2);
% Delta_B=(sumB/(n-1)).^(1/2);
% Delta_P=(sumP/(n-1)).^(1/2);

[counts, edges] = histcounts(sq_C, 'BinMethod', 'integers'); % 计算每个数字出现的次数
disp(sort(unique(sq_C)));
disp(counts);
fprintf('每个hash平均碰撞次数：%f\n',sum(sort(unique(sq_C)).*counts)/n);

x_c=[0:length(counts)-1];
y_c=[counts];
plot(x_c,y_c,'b-', 'MarkerSize',10, 'LineWidth', 1.5)
%xlim([1 n]);
%ylim([90 170]);
xlabel('碰撞次数')
ylabel('相同字符的个数')
hold on;
scatter(x_c, y_c, 100, 'r', '*','LineWidth', 1); % 指定点的大小为 50，颜色为红色
set(gcf,'Color','w');
set(gca,'FontSize',13);