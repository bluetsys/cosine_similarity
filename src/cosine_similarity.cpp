#include <iostream>
#include <vector>
#include <cmath>
#include <stdexcept>
#include <iomanip>

double cosineSimilarity(const std::vector<double>& vectorA, const std::vector<double>& vectorB) {
    if (vectorA.size() != vectorB.size()) {
        throw std::invalid_argument("벡터의 길이가 같아야 합니다");
    }
    
    if (vectorA.empty()) {
        throw std::invalid_argument("벡터는 비어있을 수 없습니다");
    }
    
    double dotProduct = 0.0;
    double magnitudeA = 0.0;
    double magnitudeB = 0.0;
    
    for (size_t i = 0; i < vectorA.size(); i++) {
        dotProduct += vectorA[i] * vectorB[i];
        magnitudeA += vectorA[i] * vectorA[i];
        magnitudeB += vectorB[i] * vectorB[i];
    }
    
    magnitudeA = std::sqrt(magnitudeA);
    magnitudeB = std::sqrt(magnitudeB);
    
    if (magnitudeA == 0.0 || magnitudeB == 0.0) {
        throw std::invalid_argument("벡터의 크기가 0일 수 없습니다");
    }
    
    return dotProduct / (magnitudeA * magnitudeB);
}

void printVector(const std::vector<double>& vector, const std::string& name) {
    std::cout << name << " = [";
    for (size_t i = 0; i < vector.size(); i++) {
        std::cout << std::fixed << std::setprecision(1) << vector[i];
        if (i < vector.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << "]" << std::endl;
}

int main() {
    // 예제 벡터들
    std::vector<double> vec1 = {1.0, 2.0, 3.0, 4.0};
    std::vector<double> vec2 = {2.0, 3.0, 4.0, 5.0};
    std::vector<double> vec3 = {-1.0, -2.0, -3.0, -4.0};
    std::vector<double> vec4 = {4.0, 3.0, 2.0, 1.0};
    
    std::cout << "=== 코사인 유사도 계산 ===" << std::endl;
    std::cout << std::endl;
    
    printVector(vec1, "vec1");
    printVector(vec2, "vec2");
    printVector(vec3, "vec3");
    printVector(vec4, "vec4");
    std::cout << std::endl;
    
    double similarity;
    
    similarity = cosineSimilarity(vec1, vec2);
    std::cout << std::fixed << std::setprecision(4);
    std::cout << "vec1과 vec2의 유사도: " << similarity << std::endl;
    
    similarity = cosineSimilarity(vec1, vec3);
    std::cout << "vec1과 vec3의 유사도: " << similarity << " (반대 방향)" << std::endl;
    
    similarity = cosineSimilarity(vec1, vec1);
    std::cout << "vec1과 vec1의 유사도: " << similarity << " (동일 벡터)" << std::endl;
    
    similarity = cosineSimilarity(vec1, vec4);
    std::cout << "vec1과 vec4의 유사도: " << similarity << std::endl;
    
    std::cout << std::endl;
    std::cout << "=== 직교 벡터 (유사도 0) ===" << std::endl;
    std::vector<double> orthogonal1 = {1.0, 0.0};
    std::vector<double> orthogonal2 = {0.0, 1.0};
    printVector(orthogonal1, "orthogonal1");
    printVector(orthogonal2, "orthogonal2");
    similarity = cosineSimilarity(orthogonal1, orthogonal2);

    std::cout << std::fixed << std::setprecision(4);
    std::cout << "직교 벡터의 유사도: " << similarity << std::endl;
    
    return 0;
}