%Hash值对消息明文的敏感性分析
%m1将首字母改成A，m2将10改成20，m3将is（generated）改成was，m4将（trade）.改成；，m5将risks后加一个空格
%哈希值比较
m1='4D3DB2C2C65036019634DB7B37518666BC53EFCE';
m2='DFBC8FA2892FB25E8BC01695EBA9CE1755F9F1BA';
m3='9817B3298BC5BFA6EA0ED4B244DD8F514C8240B5';
m4='12F77D3186AAEF931932C8C3835D634BA325EC61';
m5='6029C0086E31EC5F03BA3F96ECE0DA10C299E60D';
hexString = m5;
subStringLength = 8;
subStrings = cell(1, length(hexString)/subStringLength);
for i = 1:length(hexString)/subStringLength
    subStrings{i} = hexString((i-1)*subStringLength+1:i*subStringLength);
end

b='';
for i = 1:5 %
    str=subStrings{i};
    decimalNumber = str2num(['0x', str]);
    binaryString = dec2bin(decimalNumber);
    numberString = num2str(binaryString);
    originalLength = length(numberString);
    numZeros = 32 -originalLength;
    paddedString = strcat(repmat('0', 1, numZeros), numberString);
    b = strcat(b, paddedString);
end
disp(b)
disp(length(b))

binaryMatrix = zeros(1, length(b));
for i = 1:length(b)
    binaryMatrix(i) = str2num(b(i));
end
x=[1:160];
y5=[binaryMatrix];

subplot(5,1,1);
plot(x,y1,'b','LineWidth',1)
xlim([0, 165]);
ylabel('m1')

subplot(5,1,2);
plot(x,y2,'b','LineWidth',1)
xlim([0, 165]);
ylabel('m2')

subplot(5,1,3);
plot(x,y3,'b','LineWidth',1)
xlim([0, 165]);
ylabel('m3')

subplot(5,1,4);
plot(x,y4,'b','LineWidth',1)
xlim([0, 165]);
ylabel('m4')

subplot(5,1,5);
plot(x,y5,'b','LineWidth',1)
xlim([0, 165]);
xlabel('160bit hash值')
ylabel('m5')
set(gcf,'Color','w');