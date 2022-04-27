function suggthr = wbmpen(c,l,sigma,alpha,arg)
//   Penalized threshold for wavelet 1-D or 2-D de-noising.
//   Calling Sequence
//   THR = wbmpen(C,L,SIGMA,ALPHA)
//   wbmpen(C,L,SIGMA,ALPHA,ARG)
//   Parameters
//   THR:   global threshold. THR is obtained by a wavelet   coefficients selection rule using a penalization   method provided by Birge-Massart.
//
//   [C,L]: is the wavelet decomposition structure of the signal or image to be de-noised.
//
//   SIGMA: is the standard deviation of the zero mean Gaussian   white noise in the de-noising model (see WNOISEST for more   information).
//
//   ALPHA: is a tuning parameter for the penalty term and it    must be a real number greater than 1. The sparsity of the   wavelet representation of the de-noised signal or image   grows with ALPHA. Typically ALPHA = 2.
//   
//   ARG: do some plotting
//   
//   Description
//   
//   THR minimizes the penalized criterion given by:
//   let t* be the minimizer of
//   crit(t) = -sum(c(k)^2,k<=t) + 2*SIGMA^2*t*(ALPHA + log(n/t))
//   where c(k) are the wavelet coefficients sorted in  
//   decreasing order of their absolute value and n is the number   
//   of coefficients; then THR = |c(t*)|.
//
//   
//   See also
//   wden
//   wdencmp
//   wnoisest



[nargout,nargin]=argn();

dim = 1;

if min(size(l))~=1, dim = 2; end

if dim==1 then
   last = l(1); 
else 
   last = prod(l(1,:)); 
end

nbcfs  = max(size(c));
c      = c(last+1:$);
thresh = mtlb_sort(abs(c));
thresh = thresh($:-1:1);
rl2scr = cumsum(thresh.^2);
xpen   = 1:max(size(thresh));

pen    = 2*sigma^2*xpen.*(alpha + log(nbcfs./xpen));
[tmp,indmin] = min(pen-rl2scr);
suggthr = thresh(indmin);

if nargin==5
    scf();clf();
    subplot(311),plot(xpen,pen),xlabel('pen')
    subplot(312),plot(xpen,rl2scr),xlabel('rl2scr')
    subplot(313),plot(xpen,pen-rl2scr),xlabel('crit')
end

endfunction