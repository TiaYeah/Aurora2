#include "matrix.h"

Matrix::Matrix(QObject *parent) : QObject(parent)
{
    for(int i = 0; i < 8; i++) {
        for(int j = 0; j < 8; j++) {
            if(i == 0 || i == 7 || j == 0 || j == 7) {
                setEl(i, j, 1);
            } else {
                matrix[i][j] = 0;
            }
        }
    }
    matrix[3][7] = 0;
}

int Matrix::getEl(int x, int y) {
    return matrix[x][y];
}

void Matrix::setEl(int x, int y, int value) {
    matrix[x][y] = value;
}
