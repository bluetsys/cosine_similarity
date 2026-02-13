using System;

double CosineSimilarity(double[] vectorA, double[] vectorB)
{
    if (vectorA.Length != vectorB.Length)
        throw new ArgumentException("벡터의 길이가 같아야 합니다");
    
    if (vectorA.Length == 0)
        throw new ArgumentException("벡터는 비어있을 수 없습니다");
    
    double dotProduct = 0.0;
    double magnitudeA = 0.0;
    double magnitudeB = 0.0;
    
    for (int i = 0; i < vectorA.Length; i++)
    {
        dotProduct += vectorA[i] * vectorB[i];
        magnitudeA += vectorA[i] * vectorA[i];
        magnitudeB += vectorB[i] * vectorB[i];
    }
    
    magnitudeA = Math.Sqrt(magnitudeA);
    magnitudeB = Math.Sqrt(magnitudeB);
    
    if (magnitudeA == 0 || magnitudeB == 0)
        throw new ArgumentException("벡터의 크기가 0일 수 없습니다");
    
    return dotProduct / (magnitudeA * magnitudeB);
}

void PrintVector(double[] vector, string name)
{
    Console.Write($"{name} = [");
    for (int i = 0; i < vector.Length; i++)
    {
        Console.Write($"{vector[i]:F1}");
        if (i < vector.Length - 1)
            Console.Write(", ");
    }
    Console.WriteLine("]");
}

// 예제 벡터들
double[] vec1 = { 1.0, 2.0, 3.0, 4.0 };
double[] vec2 = { 2.0, 3.0, 4.0, 5.0 };
double[] vec3 = { -1.0, -2.0, -3.0, -4.0 };
double[] vec4 = { 4.0, 3.0, 2.0, 1.0 };

Console.WriteLine("=== 코사인 유사도 계산 ===");
Console.WriteLine();

PrintVector(vec1, "vec1");
PrintVector(vec2, "vec2");
PrintVector(vec3, "vec3");
PrintVector(vec4, "vec4");
Console.WriteLine();

double similarity;

similarity = CosineSimilarity(vec1, vec2);
Console.WriteLine($"vec1과 vec2의 유사도: {similarity:F4}");

similarity = CosineSimilarity(vec1, vec3);
Console.WriteLine($"vec1과 vec3의 유사도: {similarity:F4} (반대 방향)");

similarity = CosineSimilarity(vec1, vec1);
Console.WriteLine($"vec1과 vec1의 유사도: {similarity:F4} (동일 벡터)");

similarity = CosineSimilarity(vec1, vec4);
Console.WriteLine($"vec1과 vec4의 유사도: {similarity:F4}");

Console.WriteLine();
Console.WriteLine("=== 직교 벡터 (유사도 0) ===");
double[] orthogonal1 = { 1.0, 0.0 };
double[] orthogonal2 = { 0.0, 1.0 };
PrintVector(orthogonal1, "orthogonal1");
PrintVector(orthogonal2, "orthogonal2");
similarity = CosineSimilarity(orthogonal1, orthogonal2);
Console.WriteLine($"직교 벡터의 유사도: {similarity:F4}");