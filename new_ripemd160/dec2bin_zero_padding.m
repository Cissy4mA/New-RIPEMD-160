% 自定义函数，将十进制数转换为固定长度的二进制字符串
function binary_str = dec2bin_zero_padding(num, bit_length)
    if num < 0 || num > 255
        error('输入的数值必须在0到255之间。');
    end
    % 使用 sprintf 函数来添加前导零
    binary_str = sprintf('%0*b', bit_length, num);
end
