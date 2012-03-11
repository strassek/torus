 color mydiffuse(normal N; float fact) 
{ 
	color C = 0;	   
	illuminance( P, N, PI ) {
		C = Cl;
		C += (Cl * normalize(L).N)*fact; 
	}
	return C; 
} 

surface matte (float Ka = 1,
							Kd = 1, 
							Ks = 1,
							roughness = .1, 
							lfact = 0.25,
							maxsolidangle=0.05;
							string filename="";
)
{
	normal Nf = faceforward(normalize(N),I);
	Oi = Os;
	Ci = Os * Cs * (Ka * ambient() + Kd * mydiffuse(Nf, lfact)) + Ks*specular(Nf,-normalize(I),roughness);
}
