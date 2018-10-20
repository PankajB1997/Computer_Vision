Iin = imread('images\test3.bmp');
Iin = Iin(:);
SpecialPercentile(Iin, 20)
SpecialPercentile(Iin, 40)
SpecialPercentile(Iin, 60)
SpecialPercentile(Iin, 80)
SpecialPercentile(Iin, 100)
SpecialPercentile(Iin, 1)

function val = SpecialPercentile(arr, pct)
    len = length(arr);
    ind = floor(pct/100*len);
    newarr = sort(arr);
    val = newarr(ind);
end