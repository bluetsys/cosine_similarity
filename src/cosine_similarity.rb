#!/usr/bin/env ruby

def cosine_similarity(vector_a, vector_b)
  if vector_a.length != vector_b.length
    raise ArgumentError, "벡터의 길이가 같아야 합니다"
  end
  
  if vector_a.empty?
    raise ArgumentError, "벡터는 비어있을 수 없습니다"
  end
  
  dot_product = 0.0
  magnitude_a = 0.0
  magnitude_b = 0.0
  
  vector_a.length.times do |i|
    dot_product += vector_a[i] * vector_b[i]
    magnitude_a += vector_a[i] * vector_a[i]
    magnitude_b += vector_b[i] * vector_b[i]
  end
  
  magnitude_a = Math.sqrt(magnitude_a)
  magnitude_b = Math.sqrt(magnitude_b)
  
  if magnitude_a == 0.0 || magnitude_b == 0.0
    raise ArgumentError, "벡터의 크기가 0일 수 없습니다"
  end
  
  dot_product / (magnitude_a * magnitude_b)
end

def print_vector(vector, name)
  values = vector.map { |v| format("%.1f", v) }.join(", ")
  puts "#{name} = [#{values}]"
end

# 예제 벡터들
vec1 = [1.0, 2.0, 3.0, 4.0]
vec2 = [2.0, 3.0, 4.0, 5.0]
vec3 = [-1.0, -2.0, -3.0, -4.0]
vec4 = [4.0, 3.0, 2.0, 1.0]

puts "=== 코사인 유사도 계산 ==="
puts

print_vector(vec1, "vec1")
print_vector(vec2, "vec2")
print_vector(vec3, "vec3")
print_vector(vec4, "vec4")
puts

similarity = cosine_similarity(vec1, vec2)
puts format("vec1과 vec2의 유사도: %.4f", similarity)

similarity = cosine_similarity(vec1, vec3)
puts format("vec1과 vec3의 유사도: %.4f (반대 방향)", similarity)

similarity = cosine_similarity(vec1, vec1)
puts format("vec1과 vec1의 유사도: %.4f (동일 벡터)", similarity)

similarity = cosine_similarity(vec1, vec4)
puts format("vec1과 vec4의 유사도: %.4f", similarity)

puts
puts "=== 직교 벡터 (유사도 0) ==="
orthogonal1 = [1.0, 0.0]
orthogonal2 = [0.0, 1.0]
print_vector(orthogonal1, "orthogonal1")
print_vector(orthogonal2, "orthogonal2")
similarity = cosine_similarity(orthogonal1, orthogonal2)
puts format("직교 벡터의 유사도: %.4f", similarity)