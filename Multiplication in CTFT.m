t=0:0.001:100
x=exp(-(t.^2)); w=cos(t);  % signals

% multiply then take fft
temp1=fftshift(fft(w.*x, 1000));
r1=conj(temp1).*temp1; 

% take fft then do convolution
X=fftshift(fft(x, 1000)); 
W=fftshift(fft(w, 1000)); 
temp2=conv(X,W,'same'); 
r2=conj(temp2).*temp2;

% plots
subplot(211); 
plot(pow2db(r1))
subplot(212); 
plot(pow2db(r2))
