<?php

function cosineSimilarity($vectorA, $vectorB) {
    if (count($vectorA) !== count($vectorB)) {
        throw new Exception("벡터의 길이가 같아야 합니다");
    }
    
    if (count($vectorA) === 0) {
        throw new Exception("벡터는 비어있을 수 없습니다");
    }
    
    $dotProduct = 0.0;
    $magnitudeA = 0.0;
    $magnitudeB = 0.0;
    
    for ($i = 0; $i < count($vectorA); $i++) {
        $dotProduct += $vectorA[$i] * $vectorB[$i];
        $magnitudeA += $vectorA[$i] * $vectorA[$i];
        $magnitudeB += $vectorB[$i] * $vectorB[$i];
    }
    
    $magnitudeA = sqrt($magnitudeA);
    $magnitudeB = sqrt($magnitudeB);
    
    if ($magnitudeA == 0 || $magnitudeB == 0) {
        throw new Exception("벡터의 크기가 0일 수 없습니다");
    }
    
    return $dotProduct / ($magnitudeA * $magnitudeB);
}

function printVector($vector, $name) {
    echo $name . " = [";
    for ($i = 0; $i < count($vector); $i++) {
        printf("%.1f", $vector[$i]);
        if ($i < count($vector) - 1) {
            echo ", ";
        }
    }
    echo "]\n";
}

// 예제 벡터들
$vec1 = [1.0, 2.0, 3.0, 4.0];
$vec2 = [2.0, 3.0, 4.0, 5.0];
$vec3 = [-1.0, -2.0, -3.0, -4.0];
$vec4 = [4.0, 3.0, 2.0, 1.0];

echo "=== 코사인 유사도 계산 ===\n";
echo "\n";

printVector($vec1, "vec1");
printVector($vec2, "vec2");
printVector($vec3, "vec3");
printVector($vec4, "vec4");
echo "\n";

$similarity = cosineSimilarity($vec1, $vec2);
printf("vec1과 vec2의 유사도: %.4f\n", $similarity);

$similarity = cosineSimilarity($vec1, $vec3);
printf("vec1과 vec3의 유사도: %.4f (반대 방향)\n", $similarity);

$similarity = cosineSimilarity($vec1, $vec1);
printf("vec1과 vec1의 유사도: %.4f (동일 벡터)\n", $similarity);

$similarity = cosineSimilarity($vec1, $vec4);
printf("vec1과 vec4의 유사도: %.4f\n", $similarity);

echo "\n";
echo "=== 직교 벡터 (유사도 0) ===\n";
$orthogonal1 = [1.0, 0.0];
$orthogonal2 = [0.0, 1.0];
printVector($orthogonal1, "orthogonal1");
printVector($orthogonal2, "orthogonal2");
$similarity = cosineSimilarity($orthogonal1, $orthogonal2);
printf("직교 벡터의 유사도: %.4f\n", $similarity);

?>