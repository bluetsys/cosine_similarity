cosine_similarity <- function(vector_a, vector_b) {
    if (length(vector_a) != length(vector_b)) {
        stop("벡터의 길이가 같아야 합니다")
    }
    
    if (length(vector_a) == 0) {
        stop("벡터는 비어있을 수 없습니다")
    }
    
    dot_product <- sum(vector_a * vector_b)
    magnitude_a <- sqrt(sum(vector_a * vector_a))
    magnitude_b <- sqrt(sum(vector_b * vector_b))
    
    if (magnitude_a == 0 || magnitude_b == 0) {
        stop("벡터의 크기가 0일 수 없습니다")
    }
    
    return(dot_product / (magnitude_a * magnitude_b))
}

print_vector <- function(vector, name) {
    values <- paste(sprintf("%.1f", vector), collapse = ", ")
    cat(sprintf("%s = [%s]\n", name, values))
}

# 예제 벡터들
vec1 <- c(1.0, 2.0, 3.0, 4.0)
vec2 <- c(2.0, 3.0, 4.0, 5.0)
vec3 <- c(-1.0, -2.0, -3.0, -4.0)
vec4 <- c(4.0, 3.0, 2.0, 1.0)

cat("=== 코사인 유사도 계산 ===\n")
cat("\n")

print_vector(vec1, "vec1")
print_vector(vec2, "vec2")
print_vector(vec3, "vec3")
print_vector(vec4, "vec4")
cat("\n")

similarity <- cosine_similarity(vec1, vec2)
cat(sprintf("vec1과 vec2의 유사도: %.4f\n", similarity))

similarity <- cosine_similarity(vec1, vec3)
cat(sprintf("vec1과 vec3의 유사도: %.4f (반대 방향)\n", similarity))

similarity <- cosine_similarity(vec1, vec1)
cat(sprintf("vec1과 vec1의 유사도: %.4f (동일 벡터)\n", similarity))

similarity <- cosine_similarity(vec1, vec4)
cat(sprintf("vec1과 vec4의 유사도: %.4f\n", similarity))

cat("\n")
cat("=== 직교 벡터 (유사도 0) ===\n")
orthogonal1 <- c(1.0, 0.0)
orthogonal2 <- c(0.0, 1.0)
print_vector(orthogonal1, "orthogonal1")
print_vector(orthogonal2, "orthogonal2")
similarity <- cosine_similarity(orthogonal1, orthogonal2)
cat(sprintf("직교 벡터의 유사도: %.4f\n", similarity))