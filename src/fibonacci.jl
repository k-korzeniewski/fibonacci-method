module fibonacci
using Printf
export fibonacci_minim


function fibonacci_num(n) #generate fibonacci n-th number (recursive)
    return n < 2 ? n : fibonacci_num(n-1) + fibonacci_num(n-2)
end # function fibonacci_num

"""
    Method that find minimum of one argument function
    Arguments:
        f - function that we like to find minimum (ex. f(x) = x^2 - 2)
        a,b - interval beetwen we are looking for result
        tol - result tolerance
"""
function fibonacci_minim(f,a,b,tol=0.1)
    # 1 step - fiding n (number of iterations)
    n = 2
    nval = nval = (b-a)/fibonacci_num(n) # helper value for n calculation
    xres = 0 # result of calculation (x point)
    while nval >= (2*tol)
        nval = (b-a)/fibonacci_num(n)
        n+=1
    end # while
    while true
        # caclulate x1,x2 initial values
        x1 = b - ((fibonacci_num(n-1) * (b-a))/fibonacci_num(n))
        x2 = a + ((fibonacci_num(n-1) * (b-a))/fibonacci_num(n))
        # calculate values of function in x1,x2
        f1 = f(x1)
        f2 = f(x2)
        # eliminating areas
        if f1 < f2
            b = x2
            x2 = x1
            n = n - 1
            x1 = b - ((fibonacci_num(n-1) * (b-a))/fibonacci_num(n))
            xres = x1
        else
            a = x1
            x1 = x2
            n = n - 1
            x2 = a + ((fibonacci_num(n-1) * (b-a))/fibonacci_num(n))
            xres = x2
        end #if
        @printf("x1:%f - x2:%f \n",x1,x2)
        if abs(x2-x1) <= tol || n <= 2
            yres = f(xres)
            result = (xres,yres) # result as tuple
            return result # end of our function
        end # if
    end # while

end # function fibonacci
end # module
