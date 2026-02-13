package main

import (
	"fmt"
	"math"
)

// CosineSimilarity 두 벡터 간의 코사인 유사도를 계산합니다.
func CosineSimilarity(vectorA, vectorB []float64) (float64, error) {
	if len(vectorA) != len(vectorB) {
		return 0, fmt.Errorf("벡터의 길이가 같아야 합니다")
	}
	
	if len(vectorA) == 0 {
		return 0, fmt.Errorf("벡터는 비어있을 수 없습니다")
	}
	
	var dotProduct float64
	var magnitudeA float64
	var magnitudeB float64
	
	// 내적과 각 벡터의 크기 계산
	for i := 0; i < len(vectorA); i++ {
		dotProduct += vectorA[i] * vectorB[i]
		magnitudeA += vectorA[i] * vectorA[i]
		magnitudeB += vectorB[i] * vectorB[i]
	}
	
	// 벡터 크기 계산
	magnitudeA = math.Sqrt(magnitudeA)
	magnitudeB = math.Sqrt(magnitudeB)
	
	// 0으로 나누는 것을 방지
	if magnitudeA == 0 || magnitudeB == 0 {
		return 0, fmt.Errorf("벡터의 크기가 0일 수 없습니다")
	}
	
	// 코사인 유사도 반환
	return dotProduct / (magnitudeA * magnitudeB), nil
}

// printVector 벡터를 출력하는 헬퍼 함수
func printVector(vector []float64, name string) {
	fmt.Printf("%s = [", name)
	for i, v := range vector {
		fmt.Printf("%.1f", v)
		if i < len(vector)-1 {
			fmt.Print(", ")
		}
	}
	fmt.Println("]")
}

func main() {
	// 예제 벡터들
	vec1 := []float64{1.0, 2.0, 3.0, 4.0}
	vec2 := []float64{2.0, 3.0, 4.0, 5.0}
	vec3 := []float64{-1.0, -2.0, -3.0, -4.0}
	vec4 := []float64{4.0, 3.0, 2.0, 1.0}
	
	fmt.Println("=== 코사인 유사도 계산 ===")
	fmt.Println()
	
	// 벡터 출력
	printVector(vec1, "vec1")
	printVector(vec2, "vec2")
	printVector(vec3, "vec3")
	printVector(vec4, "vec4")
	fmt.Println()
	
	// 유사도 계산
	var similarity float64
	var err error
	
	similarity, err = CosineSimilarity(vec1, vec2)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}
	fmt.Printf("vec1과 vec2의 유사도: %.4f\n", similarity)
	
	similarity, err = CosineSimilarity(vec1, vec3)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}
	fmt.Printf("vec1과 vec3의 유사도: %.4f (반대 방향)\n", similarity)
	
	similarity, err = CosineSimilarity(vec1, vec1)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}
	fmt.Printf("vec1과 vec1의 유사도: %.4f (동일 벡터)\n", similarity)
	
	similarity, err = CosineSimilarity(vec1, vec4)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}
	fmt.Printf("vec1과 vec4의 유사도: %.4f\n", similarity)
	
	// 직교 벡터 예제
	fmt.Println()
	fmt.Println("=== 직교 벡터 (유사도 0) ===")
	orthogonal1 := []float64{1.0, 0.0}
	orthogonal2 := []float64{0.0, 1.0}
	printVector(orthogonal1, "orthogonal1")
	printVector(orthogonal2, "orthogonal2")
	similarity, err = CosineSimilarity(orthogonal1, orthogonal2)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
		return
	}
	fmt.Printf("직교 벡터의 유사도: %.4f\n", similarity)
}