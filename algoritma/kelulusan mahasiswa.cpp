#include <iostream>
using namespace std;

int main ()
{
	int jml_lulus;
	int jml_ngulang;
	int a[10];
	cout <<"/Masukan 10 nilai ujian mahasiswa(skala 0 - 100) :"<<endl ;
	
	for(int i=0; i<10; i++){
		cin >> a[i];
		if (a[i]>80)
		{jml_lulus++;}	
		else
		{jml_ngulang++;}
	}
	cout << "Jumlah mahasiswa yang lulus : " << jml_lulus;
	cout <<endl;
	cout << "Jumlah mahasiswa yang ngulang kelas : " << jml_ngulang;
}
