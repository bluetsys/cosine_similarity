# Cosine Similarity - 다중 언어 구현

코사인 유사도(Cosine Similarity)를 계산하는 프로그램을 여러 프로그래밍 언어로 구현한 프로젝트입니다.

## 지원 언어

이 프로젝트는 다음 15개 언어를 지원합니다:

- **Assembly** (x86-64 NASM)
- **C**
- **C++**
- **C#**
- **Fortran**
- **Go**
- **Java**
- **JavaScript** (Node.js)
- **Lua**
- **Perl**
- **PHP**
- **Python**
- **R**
- **Ruby**
- **Rust**
- **TypeScript**

## 코사인 유사도란?

코사인 유사도는 두 벡터 간의 코사인 각도를 이용하여 유사도를 측정하는 방법입니다. 값의 범위는 -1에서 1까지이며:

- **1.0**: 완전히 동일한 방향 (동일 벡터)
- **0.0**: 직교 (관련 없음)
- **-1.0**: 완전히 반대 방향

공식:
```
cosine_similarity = (A · B) / (||A|| × ||B||)
```

여기서:
- `A · B`는 두 벡터의 내적(dot product)
- `||A||`, `||B||`는 각 벡터의 크기(magnitude)

## 요구 사항

### 필수 도구
- `make` (빌드 자동화)
- `gcc` 또는 `clang` (C/C++ 컴파일러)
- `nasm` (Assembly 어셈블러)

### 각 언어별 설치

각 언어의 런타임 및 컴파일러는 사용자가 직접 설치해야 합니다.

- **Assembly**: NASM 설치 필요
- **C**: GCC 또는 Clang 설치 필요
- **C++**: G++ 또는 Clang++ 설치 필요
- **C#**: .NET SDK 설치 필요
- **Fortran**: GFortran 설치 필요
- **Go**: Go 컴파일러 설치 필요
- **Java**: JDK 설치 필요
- **JavaScript**: Node.js 설치 필요
- **Lua**: Lua 인터프리터 설치 필요
- **Perl**: Perl 인터프리터 설치 필요
- **PHP**: PHP CLI 설치 필요
- **Python**: Python 3 설치 필요
- **R**: R 인터프리터 설치 필요
- **Ruby**: Ruby 인터프리터 설치 필요
- **Rust**: Rust 컴파일러 (rustc) 설치 필요
- **TypeScript**: TypeScript 컴파일러 및 ts-node 설치 필요

> **참고**: 각 언어의 설치 방법은 해당 언어의 공식 웹사이트를 참조하시기 바랍니다.

## 빌드

모든 언어의 프로그램을 한 번에 빌드하려면:

```bash
make all
```

빌드된 실행 파일은 `build/` 디렉터리에 생성됩니다.

## 실행

### 모든 언어 실행

```bash
make run
```

### 개별 언어 실행

각 언어별로 개별 실행이 가능합니다:

```bash
make run-python      # Python
make run-c           # C
make run-cpp         # C++
make run-fortran     # Fortran
make run-go          # Go
make run-csharp      # C#
make run-rust        # Rust
make run-node        # JavaScript (Node.js)
make run-typescript  # TypeScript
make run-java        # Java
make run-php         # PHP
make run-r           # R
make run-perl        # Perl
make run-ruby        # Ruby
make run-lua         # Lua
make run-asm         # Assembly
```

## 정리

빌드된 파일을 모두 삭제하려면:

```bash
make clean
```

## 출력 예시

```
=== 코사인 유사도 계산 ===

vec1 = [1.0, 2.0, 3.0, 4.0]
vec2 = [2.0, 3.0, 4.0, 5.0]
vec3 = [-1.0, -2.0, -3.0, -4.0]
vec4 = [4.0, 3.0, 2.0, 1.0]

vec1과 vec2의 유사도: 0.9689
vec1과 vec3의 유사도: -1.0000 (반대 방향)
vec1과 vec1의 유사도: 1.0000 (동일 벡터)
vec1과 vec4의 유사도: 0.8000

=== 직교 벡터 (유사도 0) ===
orthogonal1 = [1.0, 0.0]
orthogonal2 = [0.0, 1.0]
직교 벡터의 유사도: 0.0000
```

## 프로젝트 구조

```
.
├── Makefile                    # 빌드 자동화 파일
├── README.md                   # 프로젝트 설명 파일
├── build/                      # 빌드 결과물 디렉터리
├── cosine_similarity.asm       # Assembly 구현
├── cosine_similarity.c         # C 구현
├── cosine_similarity.cpp       # C++ 구현
├── cosine_similarity.cs        # C# 구현
├── cosine_similarity.f90       # Fortran 구현
├── cosine_similarity.go        # Go 구현
├── cosine_similarity.java      # Java 구현
├── cosine_similarity.js        # JavaScript 구현
├── cosine_similarity.lua       # Lua 구현
├── cosine_similarity.php       # PHP 구현
├── cosine_similarity.pl        # Perl 구현
├── cosine_similarity.py        # Python 구현
├── cosine_similarity.R         # R 구현
├── cosine_similarity.rb        # Ruby 구현
├── cosine_similarity.rs        # Rust 구현
└── cosine_similarity.ts        # TypeScript 구현
```

## 기여

버그 리포트나 개선 사항은 이슈로 등록해주세요.

---

**참고**: 모든 구현은 동일한 알고리즘과 테스트 데이터를 사용하여 일관된 결과를 출력합니다.