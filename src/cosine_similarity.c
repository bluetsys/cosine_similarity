#include <stdio.h>
#include <math.h>
#include <stdlib.h>

/**
 * 두 벡터 간의 코사인 유사도를 계산합니다.
 * 
 * @param vector_a 첫 번째 벡터
 * @param vector_b 두 번째 벡터
 * @param length 벡터의 길이
 * @return 코사인 유사도 값 (-1 ~ 1 사이), 오류 시 -999.0
 */
double cosine_similarity(const double *vector_a, const double *vector_b, int length) {
    if (length <= 0) {
        fprintf(stderr, "벡터의 길이가 같아야 합니다\n");
        return -999.0;
    }
    
    if (vector_a == NULL || vector_b == NULL) {
        fprintf(stderr, "벡터는 비어있을 수 없습니다\n");
        return -999.0;
    }
    
    double dot_product = 0.0;
    double magnitude_a = 0.0;
    double magnitude_b = 0.0;
    
    // 내적과 각 벡터의 크기 계산
    for (int i = 0; i < length; i++) {
        dot_product += vector_a[i] * vector_b[i];
        magnitude_a += vector_a[i] * vector_a[i];
        magnitude_b += vector_b[i] * vector_b[i];
    }
    
    // 벡터 크기 계산
    magnitude_a = sqrt(magnitude_a);
    magnitude_b = sqrt(magnitude_b);
    
    // 0으로 나누는 것을 방지
    if (magnitude_a == 0.0 || magnitude_b == 0.0) {
        fprintf(stderr, "벡터의 크기가 0일 수 없습니다\n");
        return -999.0;
    }
    
    // 코사인 유사도 반환
    return dot_product / (magnitude_a * magnitude_b);
}

/**
 * 벡터를 출력하는 헬퍼 함수
 */
void print_vector(const double *vector, int length, const char *name) {
    printf("%s = [", name);
    for (int i = 0; i < length; i++) {
        printf("%.1f", vector[i]);
        if (i < length - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}

int main() {
    // 예제 벡터들
    double vec1[] = {1.0, 2.0, 3.0, 4.0};
    double vec2[] = {2.0, 3.0, 4.0, 5.0};
    double vec3[] = {-1.0, -2.0, -3.0, -4.0};
    double vec4[] = {4.0, 3.0, 2.0, 1.0};
    
    int length = 4;
    
    printf("=== 코사인 유사도 계산 ===\n");
    printf("\n");
    
    // 벡터 출력
    print_vector(vec1, length, "vec1");
    print_vector(vec2, length, "vec2");
    print_vector(vec3, length, "vec3");
    print_vector(vec4, length, "vec4");
    printf("\n");
    
    // 유사도 계산
    double similarity;
    
    similarity = cosine_similarity(vec1, vec2, length);
    printf("vec1과 vec2의 유사도: %.4f\n", similarity);
    
    similarity = cosine_similarity(vec1, vec3, length);
    printf("vec1과 vec3의 유사도: %.4f (반대 방향)\n", similarity);
    
    similarity = cosine_similarity(vec1, vec1, length);
    printf("vec1과 vec1의 유사도: %.4f (동일 벡터)\n", similarity);
    
    similarity = cosine_similarity(vec1, vec4, length);
    printf("vec1과 vec4의 유사도: %.4f\n", similarity);
    
    // 직교 벡터 예제
    printf("\n");
    printf("=== 직교 벡터 (유사도 0) ===\n");
    double orthogonal1[] = {1.0, 0.0};
    double orthogonal2[] = {0.0, 1.0};
    print_vector(orthogonal1, 2, "orthogonal1");
    print_vector(orthogonal2, 2, "orthogonal2");
    similarity = cosine_similarity(orthogonal1, orthogonal2, 2);
    printf("직교 벡터의 유사도: %.4f\n", similarity);
    
    return 0;
}