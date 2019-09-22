## Native Julia noteworthy differences from MATLAB

This package tries to minimize the differences between Julia and Matlab. However, for the record, these points are worth considering.

From: https://docs.julialang.org/en/v1/manual/noteworthy-differences/index.html

Although MATLAB users may find Julia's syntax familiar, Julia is not a MATLAB clone. There are
major syntactic and functional differences. The following are some noteworthy differences that
may trip up Julia users accustomed to MATLAB:

### Julia Arrays:
  * Julia arrays are indexed with square brackets, `A[i,j]`.

  * Julia has true one-dimensional arrays. Column vectors are of size `N`, not `Nx1`. For example,
    [`rand(N)`](@ref) makes a 1-dimensional array.

  * In Julia, to make an one-dimensional arrays,
    - Use `;` or `,` for concatenation. You can think of this as "one-dimensional arrays in Julia are like vertical arrays in MATLAB". So using `;` is more intuitive.
    - Don't use space ` ` for concatenation, as spaces make two-dimensional arrays.
    ```julia
    [1; 2; 3]
    [1, 2, 3]
    ```
    give one-dimensional arrays (think of it as vertical array in MATLAB):
    ```julia
    3-element Array{Int64,1}:
     1
     2
     3
    ```
    And,
    ```julia
    [1 2 3]
    ```
    gives a two-dimensional array (horizontal):
    ```julia
    1×3 Array{Int64,2}:
     1  2  3
    ```
  * In Julia, for multi-dimensional arrays
    - Use space ` ` between elements for horizontal concatenation.
    - Don't use `,` for horizontal concatenation!
    - Use `;` for vertical concatenation.

  * In Julia, `[x,y,z]` will always construct a 3-element array containing `x`, `y` and `z`.
    - To concatenate in the first ("vertical") dimension use either [`vcat(x,y,z)`](@ref) or separate
      with semicolons (`[x; y; z]`).
    - To concatenate in the second ("horizontal") dimension use either [`hcat(x,y,z)`](@ref) or separate
      with spaces (`[x y z]`).
    - To construct block matrices (concatenating in the first two dimensions), use either [`hvcat`](@ref)
      or combine spaces and semicolons (`[a b; c d]`).


  
  * Julia arrays are not copied when assigned to another variable. After `A = B`, changing elements of `B` will modify `A`
    as well.
  * Julia values are not copied when passed to a function. If a function modifies an array, the changes
    will be visible in the caller.
  * Julia does not automatically grow arrays in an assignment statement. Whereas in MATLAB `a(4) = 3.2`
    can create the array `a = [0 0 0 3.2]` and `a(5) = 7` can grow it into `a = [0 0 0 3.2 7]`, the
    corresponding Julia statement `a[5] = 7` throws an error if the length of `a` is less than 5 or
    if this statement is the first use of the identifier `a`. Julia has [`push!`](@ref) and [`append!`](@ref),
    which grow `Vector`s much more efficiently than MATLAB's `a(end+1) = val`.
  * The imaginary unit `sqrt(-1)` is represented in Julia as [`im`](@ref), not `i` or `j` as in MATLAB.
  * In Julia, literal numbers without a decimal point (such as `42`) create integers instead of floating
    point numbers. As a result, some operations can throw
    a domain error if they expect a float; for example, `julia> a = -1; 2^a` throws a domain error, as the
    result is not an integer (see [the FAQ entry on domain errors](@ref faq-domain-errors) for details).
  * In Julia, multiple values are returned and assigned as tuples, e.g. `(a, b) = (1, 2)` or `a, b = 1, 2`.
    MATLAB's `nargout`, which is often used in MATLAB to do optional work based on the number of returned
    values, does not exist in Julia. Instead, users can use optional and keyword arguments to achieve
    similar capabilities.
  * In Julia, `a:b` and `a:b:c` construct `AbstractRange` objects. To construct a full vector like in MATLAB,
    use [`collect(a:b)`](@ref). Generally, there is no need to call `collect` though. An `AbstractRange` object will
    act like a normal array in most cases but is more efficient because it lazily computes its values.
    This pattern of creating specialized objects instead of full arrays is used frequently, and is
    also seen in functions such as [`range`](@ref), or with iterators such as `enumerate`, and
    `zip`. The special objects can mostly be used as if they were normal arrays.
  * Functions in Julia return values from their last expression or the `return` keyword instead of
    listing the names of variables to return in the function definition (see [The return Keyword](@ref)
    for details).
  * A Julia script may contain any number of functions, and all definitions will be externally visible
    when the file is loaded. Function definitions can be loaded from files outside the current working
    directory.
  * In Julia, reductions such as [`sum`](@ref), [`prod`](@ref), and [`max`](@ref) are performed
    over every element of an array when called with a single argument, as in `sum(A)`, even if `A`
    has more than one dimension.
  * In Julia, parentheses must be used to call a function with zero arguments, like in [`rand()`](@ref).
  * Julia discourages the use of semicolons to end statements. The results of statements are not
    automatically printed (except at the interactive prompt), and lines of code do not need to end
    with semicolons. [`println`](@ref) or [`@printf`](@ref) can be used to print specific output.
  * In Julia, if `A` and `B` are arrays, logical comparison operations like `A == B` do not return
    an array of booleans. Instead, use `A .== B`, and similarly for the other boolean operators like
    [`<`](@ref), [`>`](@ref).
  * In Julia, the operators [`&`](@ref), [`|`](@ref), and [`⊻`](@ref xor) ([`xor`](@ref)) perform the
    bitwise operations equivalent to `and`, `or`, and `xor` respectively in MATLAB, and have precedence
    similar to Python's bitwise operators (unlike C). They can operate on scalars or element-wise
    across arrays and can be used to combine logical arrays, but note the difference in order of operations:
    parentheses may be required (e.g., to select elements of `A` equal to 1 or 2 use `(A .== 1) .| (A .== 2)`).
  * In Julia, the elements of a collection can be passed as arguments to a function using the splat
    operator `...`, as in `xs=[1,2]; f(xs...)`.
  * Julia's [`svd`](@ref) returns singular values as a vector instead of as a dense diagonal matrix.
  * In Julia, `...` is not used to continue lines of code. Instead, incomplete expressions automatically
    continue onto the next line.
  * In both Julia and MATLAB, the variable `ans` is set to the value of the last expression issued
    in an interactive session. In Julia, unlike MATLAB, `ans` is not set when Julia code is run in
    non-interactive mode.
  * Julia's `struct`s do not support dynamically adding fields at runtime, unlike MATLAB's `class`es.
    Instead, use a [`Dict`](@ref).
  * In Julia each module has its own global scope/namespace, whereas in MATLAB there is just one global
    scope.
  * In MATLAB, an idiomatic way to remove unwanted values is to use logical indexing, like in the
    expression `x(x>3)` or in the statement `x(x>3) = []` to modify `x` in-place. In contrast, Julia
    provides the higher order functions [`filter`](@ref) and [`filter!`](@ref), allowing users
    to write `filter(z->z>3, x)` and `filter!(z->z>3, x)` as alternatives to the corresponding transliterations
    `x[x.>3]` and `x = x[x.>3]`. Using [`filter!`](@ref) reduces the use of temporary arrays.
  * The analogue of extracting (or "dereferencing") all elements of a cell array, e.g. in `vertcat(A{:})`
    in MATLAB, is written using the splat operator in Julia, e.g. as `vcat(A...)`.
