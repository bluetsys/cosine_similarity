function cosineSimilarity(vectorA, vectorB) {
    if (vectorA.length !== vectorB.length) {
        throw new Error("벡터의 길이가 같아야 합니다");
    }

    if (vectorA.length === 0) {
        throw new Error("벡터는 비어있을 수 없습니다");
    }

    var dotProduct = 0.0;
    var magnitudeA = 0.0;
    var magnitudeB = 0.0;

    for (var i = 0; i < vectorA.length; i++) {
        dotProduct += vectorA[i] * vectorB[i];
        magnitudeA += vectorA[i] * vectorA[i];
        magnitudeB += vectorB[i] * vectorB[i];
    }

    magnitudeA = Math.sqrt(magnitudeA);
    magnitudeB = Math.sqrt(magnitudeB);

    if (magnitudeA === 0 || magnitudeB === 0) {
        throw new Error("벡터의 크기가 0일 수 없습니다");
    }

    return dotProduct / (magnitudeA * magnitudeB);
}

function printVector(vector, name) {
    var values = vector.map(v => v.toFixed(1)).join(", ");
    console.log(`${name} = [${values}]`);
}

// 예제 벡터들
var vec1 = [1.0, 2.0, 3.0, 4.0];
var vec2 = [2.0, 3.0, 4.0, 5.0];
var vec3 = [-1.0, -2.0, -3.0, -4.0];
var vec4 = [4.0, 3.0, 2.0, 1.0];

console.log("=== 코사인 유사도 계산 ===");
console.log();

printVector(vec1, "vec1");
printVector(vec2, "vec2");
printVector(vec3, "vec3");
printVector(vec4, "vec4");
console.log();

var similarity;

similarity = cosineSimilarity(vec1, vec2);
console.log(`vec1과 vec2의 유사도: ${similarity.toFixed(4)}`);

similarity = cosineSimilarity(vec1, vec3);
console.log(`vec1과 vec3의 유사도: ${similarity.toFixed(4)} (반대 방향)`);

similarity = cosineSimilarity(vec1, vec1);
console.log(`vec1과 vec1의 유사도: ${similarity.toFixed(4)} (동일 벡터)`);

similarity = cosineSimilarity(vec1, vec4);
console.log(`vec1과 vec4의 유사도: ${similarity.toFixed(4)}`);

console.log();
console.log("=== 직교 벡터 (유사도 0) ===");
var orthogonal1 = [1.0, 0.0];
var orthogonal2 = [0.0, 1.0];
printVector(orthogonal1, "orthogonal1");
printVector(orthogonal2, "orthogonal2");
similarity = cosineSimilarity(orthogonal1, orthogonal2);
console.log(`직교 벡터의 유사도: ${similarity.toFixed(4)}`);