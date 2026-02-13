import math
from typing import List, Union

def cosine_similarity(vector_a: List[Union[int, float]], vector_b: List[Union[int, float]]) -> float:
    """
    두 벡터 간의 코사인 유사도를 계산합니다.
    
    Args:
        vector_a: 첫 번째 벡터
        vector_b: 두 번째 벡터
    
    Returns:
        코사인 유사도 값 (-1 ~ 1 사이)
    
    Raises:
        ValueError: 벡터의 길이가 다르거나 0인 경우
    """
    if len(vector_a) != len(vector_b):
        raise ValueError("벡터의 길이가 같아야 합니다.")
    
    if len(vector_a) == 0:
        raise ValueError("벡터는 비어있을 수 없습니다.")
    
    # 내적(dot product) 계산
    dot_product = sum(a * b for a, b in zip(vector_a, vector_b))
    
    # 각 벡터의 크기(magnitude) 계산
    magnitude_a = math.sqrt(sum(a * a for a in vector_a))
    magnitude_b = math.sqrt(sum(b * b for b in vector_b))
    
    # 0으로 나누는 것을 방지
    if magnitude_a == 0 or magnitude_b == 0:
        raise ValueError("벡터의 크기가 0일 수 없습니다.")
    
    # 코사인 유사도 계산
    return dot_product / (magnitude_a * magnitude_b)


def print_vector(vector: List[Union[int, float]], name: str):
    """벡터를 출력하는 헬퍼 함수"""
    vec_str = ", ".join(f"{v:.1f}" for v in vector)
    print(f"{name} = [{vec_str}]")


# 사용 예제
if __name__ == "__main__":
    # 예제 벡터들
    vec1 = [1.0, 2.0, 3.0, 4.0]
    vec2 = [2.0, 3.0, 4.0, 5.0]
    vec3 = [-1.0, -2.0, -3.0, -4.0]
    vec4 = [4.0, 3.0, 2.0, 1.0]
    
    print("=== 코사인 유사도 계산 ===")
    print()
    
    # 벡터 출력
    print_vector(vec1, "vec1")
    print_vector(vec2, "vec2")
    print_vector(vec3, "vec3")
    print_vector(vec4, "vec4")
    print()
    
    # 유사도 계산
    similarity = cosine_similarity(vec1, vec2)
    print(f"vec1과 vec2의 유사도: {similarity:.4f}")
    
    similarity = cosine_similarity(vec1, vec3)
    print(f"vec1과 vec3의 유사도: {similarity:.4f} (반대 방향)")
    
    similarity = cosine_similarity(vec1, vec1)
    print(f"vec1과 vec1의 유사도: {similarity:.4f} (동일 벡터)")
    
    similarity = cosine_similarity(vec1, vec4)
    print(f"vec1과 vec4의 유사도: {similarity:.4f}")
    
    # 직교 벡터 예제
    print()
    print("=== 직교 벡터 (유사도 0) ===")
    orthogonal1 = [1.0, 0.0]
    orthogonal2 = [0.0, 1.0]
    print_vector(orthogonal1, "orthogonal1")
    print_vector(orthogonal2, "orthogonal2")
    similarity = cosine_similarity(orthogonal1, orthogonal2)
    print(f"직교 벡터의 유사도: {similarity:.4f}")