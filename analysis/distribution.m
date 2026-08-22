%%
%Hash值的分布分析
%散点分布
m='Nowadays, on average, one person is rewarded with bitcoin every 10 minutes, which attracts many people to "mine" this virtual currency and want to "get rich overnight", but they don t know how it works, how it is generated and how it is traded. What is its value, and what are the risks associated with its existence? Based on this phenomenon, we need to understand how it works, analyze its value and risks.';
x0=[1:408];
y=[abs(m)];
plot(x0,y,'bo','MarkerFaceColor','b')
xlim([0, 420]);
xlabel('字符')
ylabel('ASCII值')
set(gcf,'Color','w');
set(gca,'FontSize',13);
%%
%Hash值的分布分析
%ripemd160
m0='C674B25A275C0B295D5A6800C2B1CB22559C5973';
hexString=m0;
decimalMatrix = zeros(1, length(hexString));
for i = 1:length(hexString)
    decimalMatrix(i) = hexCharToDecimal(hexString(i));
end
x0=[1:40];
y=[decimalMatrix];
plot(x0,y,'bo','MarkerFaceColor','b')
xlim([0, 41]);
xlabel('40位十六进制码序列号')
ylabel('十六进制值')
set(gcf,'Color','w');
set(gca,'FontSize',13);
