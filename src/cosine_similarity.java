public class cosine_similarity {
    
    public static double cosineSimilarity(double[] vectorA, double[] vectorB) {
        if (vectorA.length != vectorB.length) {
            throw new IllegalArgumentException("벡터의 길이가 같아야 합니다");
        }
        
        if (vectorA.length == 0) {
            throw new IllegalArgumentException("벡터는 비어있을 수 없습니다");
        }
        
        double dotProduct = 0.0;
        double magnitudeA = 0.0;
        double magnitudeB = 0.0;
        
        for (int i = 0; i < vectorA.length; i++) {
            dotProduct += vectorA[i] * vectorB[i];
            magnitudeA += vectorA[i] * vectorA[i];
            magnitudeB += vectorB[i] * vectorB[i];
        }
        
        magnitudeA = Math.sqrt(magnitudeA);
        magnitudeB = Math.sqrt(magnitudeB);
        
        if (magnitudeA == 0 || magnitudeB == 0) {
            throw new IllegalArgumentException("벡터의 크기가 0일 수 없습니다");
        }
        
        return dotProduct / (magnitudeA * magnitudeB);
    }
    
    public static void printVector(double[] vector, String name) {
        System.out.print(name + " = [");
        for (int i = 0; i < vector.length; i++) {
            System.out.printf("%.1f", vector[i]);
            if (i < vector.length - 1) {
                System.out.print(", ");
            }
        }
        System.out.println("]");
    }
    
    public static void main(String[] args) {
        // 예제 벡터들
        double[] vec1 = {1.0, 2.0, 3.0, 4.0};
        double[] vec2 = {2.0, 3.0, 4.0, 5.0};
        double[] vec3 = {-1.0, -2.0, -3.0, -4.0};
        double[] vec4 = {4.0, 3.0, 2.0, 1.0};
        
        System.out.println("=== 코사인 유사도 계산 ===");
        System.out.println();
        
        printVector(vec1, "vec1");
        printVector(vec2, "vec2");
        printVector(vec3, "vec3");
        printVector(vec4, "vec4");
        System.out.println();
        
        double similarity;
        
        similarity = cosineSimilarity(vec1, vec2);
        System.out.printf("vec1과 vec2의 유사도: %.4f\n", similarity);
        
        similarity = cosineSimilarity(vec1, vec3);
        System.out.printf("vec1과 vec3의 유사도: %.4f (반대 방향)\n", similarity);
        
        similarity = cosineSimilarity(vec1, vec1);
        System.out.printf("vec1과 vec1의 유사도: %.4f (동일 벡터)\n", similarity);
        
        similarity = cosineSimilarity(vec1, vec4);
        System.out.printf("vec1과 vec4의 유사도: %.4f\n", similarity);
        
        System.out.println();
        System.out.println("=== 직교 벡터 (유사도 0) ===");
        double[] orthogonal1 = {1.0, 0.0};
        double[] orthogonal2 = {0.0, 1.0};
        printVector(orthogonal1, "orthogonal1");
        printVector(orthogonal2, "orthogonal2");
        similarity = cosineSimilarity(orthogonal1, orthogonal2);
        System.out.printf("직교 벡터의 유사도: %.4f\n", similarity);
    }
}