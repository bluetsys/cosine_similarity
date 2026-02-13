#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig;

sub cosine_similarity {
    my ($vector_a, $vector_b) = @_;
    
    if (scalar(@$vector_a) != scalar(@$vector_b)) {
        die "벡터의 길이가 같아야 합니다\n";
    }
    
    if (scalar(@$vector_a) == 0) {
        die "벡터는 비어있을 수 없습니다\n";
    }
    
    my $dot_product = 0.0;
    my $magnitude_a = 0.0;
    my $magnitude_b = 0.0;
    
    for (my $i = 0; $i < scalar(@$vector_a); $i++) {
        $dot_product += $vector_a->[$i] * $vector_b->[$i];
        $magnitude_a += $vector_a->[$i] * $vector_a->[$i];
        $magnitude_b += $vector_b->[$i] * $vector_b->[$i];
    }
    
    $magnitude_a = sqrt($magnitude_a);
    $magnitude_b = sqrt($magnitude_b);
    
    if ($magnitude_a == 0 || $magnitude_b == 0) {
        die "벡터의 크기가 0일 수 없습니다\n";
    }
    
    return $dot_product / ($magnitude_a * $magnitude_b);
}

sub print_vector {
    my ($vector, $name) = @_;
    print "$name = [";
    for (my $i = 0; $i < scalar(@$vector); $i++) {
        printf("%.1f", $vector->[$i]);
        if ($i < scalar(@$vector) - 1) {
            print ", ";
        }
    }
    print "]\n";
}

# 예제 벡터들
my @vec1 = (1.0, 2.0, 3.0, 4.0);
my @vec2 = (2.0, 3.0, 4.0, 5.0);
my @vec3 = (-1.0, -2.0, -3.0, -4.0);
my @vec4 = (4.0, 3.0, 2.0, 1.0);

print "=== 코사인 유사도 계산 ===\n";
print "\n";

print_vector(\@vec1, "vec1");
print_vector(\@vec2, "vec2");
print_vector(\@vec3, "vec3");
print_vector(\@vec4, "vec4");
print "\n";

my $similarity;

$similarity = cosine_similarity(\@vec1, \@vec2);
printf("vec1과 vec2의 유사도: %.4f\n", $similarity);

$similarity = cosine_similarity(\@vec1, \@vec3);
printf("vec1과 vec3의 유사도: %.4f (반대 방향)\n", $similarity);

$similarity = cosine_similarity(\@vec1, \@vec1);
printf("vec1과 vec1의 유사도: %.4f (동일 벡터)\n", $similarity);

$similarity = cosine_similarity(\@vec1, \@vec4);
printf("vec1과 vec4의 유사도: %.4f\n", $similarity);

print "\n";
print "=== 직교 벡터 (유사도 0) ===\n";
my @orthogonal1 = (1.0, 0.0);
my @orthogonal2 = (0.0, 1.0);
print_vector(\@orthogonal1, "orthogonal1");
print_vector(\@orthogonal2, "orthogonal2");
$similarity = cosine_similarity(\@orthogonal1, \@orthogonal2);
printf("직교 벡터의 유사도: %.4f\n", $similarity);