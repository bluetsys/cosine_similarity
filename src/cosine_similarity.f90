program cosine_similarity_program
    implicit none
    
    ! 변수 선언
    real(8), dimension(4) :: vec1, vec2, vec3, vec4
    real(8), dimension(2) :: orthogonal1, orthogonal2
    real(8) :: similarity
    character(len=32) :: s
    
    ! 예제 벡터들
    vec1 = (/1.0d0, 2.0d0, 3.0d0, 4.0d0/)
    vec2 = (/2.0d0, 3.0d0, 4.0d0, 5.0d0/)
    vec3 = (/-1.0d0, -2.0d0, -3.0d0, -4.0d0/)
    vec4 = (/4.0d0, 3.0d0, 2.0d0, 1.0d0/)
    
    write(*, '(A)') '=== 코사인 유사도 계산 ==='
    print *

    call print_vector(vec1, 4, 'vec1')
    call print_vector(vec2, 4, 'vec2')
    call print_vector(vec3, 4, 'vec3')
    call print_vector(vec4, 4, 'vec4')
    print *

    similarity = cosine_similarity(vec1, vec2, 4)
    s = fmt4(similarity)
    write(*, '(A, A)') 'vec1과 vec2의 유사도: ', trim(s)

    similarity = cosine_similarity(vec1, vec3, 4)
    s = fmt4(similarity)
    write(*, '(A, A, A)') 'vec1과 vec3의 유사도: ', trim(s), ' (반대 방향)'

    similarity = cosine_similarity(vec1, vec1, 4)
    s = fmt4(similarity)
    write(*, '(A, A, A)') 'vec1과 vec1의 유사도: ', trim(s), ' (동일 벡터)'

    similarity = cosine_similarity(vec1, vec4, 4)
    s = fmt4(similarity)
    write(*, '(A, A)') 'vec1과 vec4의 유사도: ', trim(s)

    print *
    write(*, '(A)') '=== 직교 벡터 (유사도 0) ==='
    orthogonal1 = (/1.0d0, 0.0d0/)
    orthogonal2 = (/0.0d0, 1.0d0/)
    call print_vector(orthogonal1, 2, 'orthogonal1')
    call print_vector(orthogonal2, 2, 'orthogonal2')
    similarity = cosine_similarity(orthogonal1, orthogonal2, 2)
    s = fmt4(similarity)
    write(*, '(A, A)') '직교 벡터의 유사도: ', trim(s)
    
contains

    subroutine print_vector(vector, n, name)
        implicit none
        integer, intent(in) :: n
        real(8), dimension(n), intent(in) :: vector
        character(len=*), intent(in) :: name
        integer :: i
        character(len=32) :: t

        write(*, '(A, A)', advance='no') trim(name), ' = ['
        do i = 1, n
            t = fmt1(vector(i))
            write(*, '(A)', advance='no') trim(t)
            if (i < n) then
                write(*, '(A)', advance='no') ', '
            end if
        end do
        write(*, '(A)') ']'
    end subroutine print_vector

    ! Helper: format number with 1 decimal, ensure leading zero (e.g. ".0" -> "0.0")
    function fmt1(val) result(str)
        implicit none
        real(8), intent(in) :: val
        character(len=32) :: tmp, str

        write(tmp, '(F6.1)') val
        tmp = adjustl(tmp)
        tmp = trim(tmp)
        if (len_trim(tmp) > 0 .and. tmp(1:1) == '.') then
            str = '0'//tmp
        else
            str = tmp
        end if
    end function fmt1

    ! Helper: format number with 4 decimals, ensure leading zero
    function fmt4(val) result(str)
        implicit none
        real(8), intent(in) :: val
        character(len=32) :: tmp, str

        write(tmp, '(F8.4)') val
        tmp = adjustl(tmp)
        tmp = trim(tmp)
        if (len_trim(tmp) > 0 .and. tmp(1:1) == '.') then
            str = '0'//tmp
        else
            str = tmp
        end if
    end function fmt4

    function cosine_similarity(vector_a, vector_b, n) result(similarity)
        implicit none
        integer, intent(in) :: n
        real(8), dimension(n), intent(in) :: vector_a, vector_b
        real(8) :: similarity
        real(8) :: dot_product, magnitude_a, magnitude_b
        integer :: i

        dot_product = 0.0d0
        magnitude_a = 0.0d0
        magnitude_b = 0.0d0

        do i = 1, n
            dot_product = dot_product + vector_a(i) * vector_b(i)
            magnitude_a = magnitude_a + vector_a(i) * vector_a(i)
            magnitude_b = magnitude_b + vector_b(i) * vector_b(i)
        end do

        magnitude_a = sqrt(magnitude_a)
        magnitude_b = sqrt(magnitude_b)

        if (magnitude_a == 0.0d0 .or. magnitude_b == 0.0d0) then
            stop 'Error: 벡터의 크기가 0일 수 없습니다'
        end if

        similarity = dot_product / (magnitude_a * magnitude_b)
    end function cosine_similarity

end program cosine_similarity_program