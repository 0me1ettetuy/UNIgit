#include <iostream>
#include <fstream>

int main(){
    std::ifstream in_file;
    in_file.open("inputkkk.txt");
    int n;

    if(in_file.is_open()){
        in_file >> n;
        int a[n][n];
        int b[n][n];

        for (int i = 0; i < n; i++){
            for (int j = 0; j < n; j++){
                in_file >> a[i][j];
                b[j][n-1-i] = a[i][j];
            }
            
        }
        for (int i = 0; i < n; i++){
            for (int j = 0; j < n; j++){
                std::cout << b[i][j] << " ";
            }
            std::cout << std::endl;
        }

    }else{
        std::cout << "Error: file was not opened!" << std::endl;
    }
}