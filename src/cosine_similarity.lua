#!/usr/bin/env lua

function cosine_similarity(vector_a, vector_b)
    if #vector_a ~= #vector_b then
        error("벡터의 길이가 같아야 합니다")
    end
    
    if #vector_a == 0 then
        error("벡터는 비어있을 수 없습니다")
    end
    
    local dot_product = 0.0
    local magnitude_a = 0.0
    local magnitude_b = 0.0
    
    for i = 1, #vector_a do
        dot_product = dot_product + vector_a[i] * vector_b[i]
        magnitude_a = magnitude_a + vector_a[i] * vector_a[i]
        magnitude_b = magnitude_b + vector_b[i] * vector_b[i]
    end
    
    magnitude_a = math.sqrt(magnitude_a)
    magnitude_b = math.sqrt(magnitude_b)
    
    if magnitude_a == 0 or magnitude_b == 0 then
        error("벡터의 크기가 0일 수 없습니다")
    end
    
    return dot_product / (magnitude_a * magnitude_b)
end

function print_vector(vector, name)
    io.write(name .. " = [")
    for i = 1, #vector do
        io.write(string.format("%.1f", vector[i]))
        if i < #vector then
            io.write(", ")
        end
    end
    io.write("]\n")
end

-- 예제 벡터들
local vec1 = {1.0, 2.0, 3.0, 4.0}
local vec2 = {2.0, 3.0, 4.0, 5.0}
local vec3 = {-1.0, -2.0, -3.0, -4.0}
local vec4 = {4.0, 3.0, 2.0, 1.0}

print("=== 코사인 유사도 계산 ===")
print()

print_vector(vec1, "vec1")
print_vector(vec2, "vec2")
print_vector(vec3, "vec3")
print_vector(vec4, "vec4")
print()

local similarity

similarity = cosine_similarity(vec1, vec2)
print(string.format("vec1과 vec2의 유사도: %.4f", similarity))

similarity = cosine_similarity(vec1, vec3)
print(string.format("vec1과 vec3의 유사도: %.4f (반대 방향)", similarity))

similarity = cosine_similarity(vec1, vec1)
print(string.format("vec1과 vec1의 유사도: %.4f (동일 벡터)", similarity))

similarity = cosine_similarity(vec1, vec4)
print(string.format("vec1과 vec4의 유사도: %.4f", similarity))

print()
print("=== 직교 벡터 (유사도 0) ===")
local orthogonal1 = {1.0, 0.0}
local orthogonal2 = {0.0, 1.0}
print_vector(orthogonal1, "orthogonal1")
print_vector(orthogonal2, "orthogonal2")
similarity = cosine_similarity(orthogonal1, orthogonal2)
print(string.format("직교 벡터의 유사도: %.4f", similarity))