clear all;
close all;
clc;
tic;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%  INFORME A VARIAVEL TIPO, USANDO:
% 1 - PARA ESORSÃO
% 2 - PARA DILATAÇÃO
tipo=2;
 
imagen = imread('faixa.png');
 
b=zeros(1,5);
larg = size(imagen,2)-1 ;
alt  = size(imagen,1)-1 ;
res = zeros(alt+1,larg+1);
 
if ( tipo == 1 )
c = 300;
d = 0;
end
 
if ( tipo == 2 ) 
c = 0;
d = 0;
end
 
	for i = 2 : alt
		for j = 2 : larg
		b(1)=imagen(i-1,j);
		b(2)=imagen(i,j);
		b(3)=imagen(i,j-1);
		b(4)=imagen(i,j+1);
		b(5)=imagen(i+1,j);
 
			if ( tipo == 1 )
			for k=1 : 5
				if ( b(k) < c )
				d=b(k);
				c=d;
				end
			end
				res(i,j) = d;
				c = 300;
				d = 0;
			end
 
			if ( tipo == 2 ) 
			for k=1 : 5
				if ( b(k) > c )
				d=b(k);
				c=d;
				end
			end
				res(i,j) = d;
				c = 0;
				d = 0;
			end
		end
	end
	subplot(1,2,1); imshow(imagen);
	subplot(1,2,2); imshow(res,[0 255]);
	drawnow;
 
time=toc;
time
