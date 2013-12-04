#ifndef STATICVEC_H
#define STATICVEC_H

struct Vector3{
    Vector3(float initCoords) : Coords(initCoords){}
    Vector3 operator + (float modCoords){
        Vector3 out;
        out.Coords += modCoords;
        return out;
    }
    float getCoords(){return Coords;}
    float modCoords(float mod){Coords += mod;}

    //Structure constant vectors
    const float one = {1,1,1};
    const float zero = {0,0,0};
    const float forward = {1,0,0};
    const float up = {0,1,0};
    const float right = {0,0,1};

private:
    float Coords = new float[3];
};

struct Vector5{
    Vector5(float initCoords) : Coords(initCoords){}
    Vector5 operator + (float modCoords){
        Vector5 out;
        out.Coords += modCoords;
        return out;
    }
    float getCoords(){return Coords;}
    float modCoords(float mod){Coords += mod;}
private:
    float Coords = new float[5];
};

struct Quaternion{
    Quaternion(float initCoords) : Coords(initCoords){}
    Quaternion operator + (float modCoords){
        Quaternion out;
        out.Coords += modCoords;
        return out;
    }
    float getQuaternion(){return Coords;}
    float modQuaternion(float mod){Coords += mod;}
private:
    float Coords = new float[4];
};

struct Matrix{
    Matrix(int dimX, int dimY) : row(dimX), col(dimY){}
    Matrix(int dimX, int dimY, elements) : row(dimX), col(dimY), contents(elements){}
    Matrix operator + (Matrix modMat){
        Matrix result;
        for(int i=0;i<dimX;i++){
            for(int j=0;j<dimY;j++){
                result[i,j] += modMat[i,j];
            }
        }
        return result;
    }
    Matrix setRow(int row, float elements){
        for(int i=0;i<dimY;i++){
            Matrix[row,i] = elements[i];
        }
    }
    Matrix setCol(int col, float elements){
        for(int i=0;i<dimX;i++){
            Matrix[i,col] = elements[i];
        }
    }
    Matrix setElement(int row, int col, float element){
        Matrix[row,col] = element;
    }

private:
    int row, col;
    float *contents = new float[row,col];
};

#endif // STATICVEC_H
