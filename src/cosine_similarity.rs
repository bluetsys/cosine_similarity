fn cosine_similarity(vector_a: &[f64], vector_b: &[f64]) -> Result<f64, String> {
    if vector_a.len() != vector_b.len() {
        return Err("벡터의 길이가 같아야 합니다".to_string());
    }
    
    if vector_a.is_empty() {
        return Err("벡터는 비어있을 수 없습니다".to_string());
    }
    
    let mut dot_product = 0.0;
    let mut magnitude_a = 0.0;
    let mut magnitude_b = 0.0;
    
    for i in 0..vector_a.len() {
        dot_product += vector_a[i] * vector_b[i];
        magnitude_a += vector_a[i] * vector_a[i];
        magnitude_b += vector_b[i] * vector_b[i];
    }
    
    magnitude_a = magnitude_a.sqrt();
    magnitude_b = magnitude_b.sqrt();
    
    if magnitude_a == 0.0 || magnitude_b == 0.0 {
        return Err("벡터의 크기가 0일 수 없습니다".to_string());
    }
    
    Ok(dot_product / (magnitude_a * magnitude_b))
}

fn print_vector(vector: &[f64], name: &str) {
    print!("{} = [", name);
    for (i, v) in vector.iter().enumerate() {
        print!("{:.1}", v);
        if i < vector.len() - 1 {
            print!(", ");
        }
    }
    println!("]");
}

fn main() {
    let vec1 = vec![1.0, 2.0, 3.0, 4.0];
    let vec2 = vec![2.0, 3.0, 4.0, 5.0];
    let vec3 = vec![-1.0, -2.0, -3.0, -4.0];
    let vec4 = vec![4.0, 3.0, 2.0, 1.0];
    
    println!("=== 코사인 유사도 계산 ===");
    println!();
    
    print_vector(&vec1, "vec1");
    print_vector(&vec2, "vec2");
    print_vector(&vec3, "vec3");
    print_vector(&vec4, "vec4");
    println!();
    
    match cosine_similarity(&vec1, &vec2) {
        Ok(similarity) => println!("vec1과 vec2의 유사도: {:.4}", similarity),
        Err(e) => eprintln!("Error: {}", e),
    }
    
    match cosine_similarity(&vec1, &vec3) {
        Ok(similarity) => println!("vec1과 vec3의 유사도: {:.4} (반대 방향)", similarity),
        Err(e) => eprintln!("Error: {}", e),
    }
    
    match cosine_similarity(&vec1, &vec1) {
        Ok(similarity) => println!("vec1과 vec1의 유사도: {:.4} (동일 벡터)", similarity),
        Err(e) => eprintln!("Error: {}", e),
    }
    
    match cosine_similarity(&vec1, &vec4) {
        Ok(similarity) => println!("vec1과 vec4의 유사도: {:.4}", similarity),
        Err(e) => eprintln!("Error: {}", e),
    }
    
    println!();
    println!("=== 직교 벡터 (유사도 0) ===");
    let orthogonal1 = vec![1.0, 0.0];
    let orthogonal2 = vec![0.0, 1.0];
    print_vector(&orthogonal1, "orthogonal1");
    print_vector(&orthogonal2, "orthogonal2");
    match cosine_similarity(&orthogonal1, &orthogonal2) {
        Ok(similarity) => println!("직교 벡터의 유사도: {:.4}", similarity),
        Err(e) => eprintln!("Error: {}", e),
    }
}