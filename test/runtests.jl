using fibonacci, Test

@testset "fibonacci_minim" begin
    a,b,f = -5, 5, x -> x^2 + sin(x)
    @test fibonacci_minim(f,a,b) == (-0.5056179775280898,-0.22869864686617875)
    a,b,f = -6, 6, x -> (x-5)^2 - 1
    @test fibonacci_minim(f,a,b) == (5.166666666666666,-0.9722222222222224)
end
