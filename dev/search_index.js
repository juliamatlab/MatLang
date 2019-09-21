var documenterSearchIndex = {"docs":
[{"location":"functions/#Functions-1","page":"Functions","title":"Functions","text":"","category":"section"},{"location":"functions/#List-of-implemented-Functions-1","page":"Functions","title":"List of implemented Functions","text":"","category":"section"},{"location":"functions/#Language_Fundamentals-:-1","page":"Functions","title":"Language_Fundamentals :","text":"","category":"section"},{"location":"functions/#","page":"Functions","title":"Functions","text":"<table>\n    <tr>\n        <td></td>\n        <td>Sub Package</td>\n        <td></td>\n    </tr>\n    <tr>\n        <td>1</td>\n        <td>Entering_Commands</td>\n        <td>clcM</td>\n    </tr>\n    <tr>\n        <td>2</td>\n        <td>Matrices_and_Arrays</td>\n        <td>zerosM, onesM, randM, eyeM, diagM, catM, horzcatM, vertcatM, squeezeM</td>\n    </tr>\n</table>","category":"page"},{"location":"functions/#","page":"Functions","title":"Functions","text":"","category":"page"},{"location":"functions/#","page":"Functions","title":"Functions","text":"To see the full progress see this link: https://github.com/juliamatlab/MatLang/projects","category":"page"},{"location":"functions/#","page":"Functions","title":"Functions","text":"The full list of the functions that will be implemented in the future can be found Here","category":"page"},{"location":"functions/#Functions-Explanation-and-Examples-1","page":"Functions","title":"Functions Explanation and Examples","text":"","category":"section"},{"location":"functions/#Language-Fundamentals-1","page":"Functions","title":"Language Fundamentals","text":"","category":"section"},{"location":"functions/#Entering_Commands-1","page":"Functions","title":"Entering_Commands","text":"","category":"section"},{"location":"functions/#","page":"Functions","title":"Functions","text":"Modules = [MatLang]\nPages   = [\"Entering_Commands.jl\"]","category":"page"},{"location":"functions/#MatLang.clcM-Tuple{}","page":"Functions","title":"MatLang.clcM","text":"clcM()\n\nClear Command Window for Juno or Atom IDE\n\n\n\n\n\n","category":"method"},{"location":"functions/#Matrices-and-Arrays-1","page":"Functions","title":"Matrices and Arrays","text":"","category":"section"},{"location":"functions/#","page":"Functions","title":"Functions","text":"Modules = [MatLang]\nPages   = [\"Matrices_and_Arrays.jl\"]","category":"page"},{"location":"functions/#MatLang.blkdiagM-Tuple","page":"Functions","title":"MatLang.blkdiagM","text":"blkdiagM(A1,A2,...)\n\nCreates a square matrix with A1,A2,... on the diagonal and the rest of the elements being 0. Works for both square and non-square matrices.\n\nblkdiagM(A1,A2,..., :obj)\n\nReturns the object itself if you want to use BlockDiagonals methods. use collect(obj) to get the array.\n\nExamples\n\n1 = 3 * ones(2, 2);\nA2 = 4 * ones(2, 2);\nA3 = rand(3, 3);\nmBlkdiag1 = blkdiagM(A1, A2, A3)\n\nmBlkdiag2 = blkdiagM(ones(2, 2), 2 * ones(2, 2)) # [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]\n\nA1 = ones(2, 4);\nA2 = 2 * ones(3, 2);\nmBlkdiag3 = blkdiagM(A1, A2) # [ones(2,4) zeros(2,2); zeros(3,4) 2*ones(3,2)]\n\nmBlkdiag1obj = blkdiagM(:obj, A1, A2, A3)\n\nmBlkdiag2obj = blkdiagM(:obj, ones(2, 2), 2 * ones(2, 2)) # Block Diagonal object for [ones(2, 2) zeros(2, 2); zeros(2, 2)  2 * ones(2, 2)]\n\n\n\n\n\n","category":"method"},{"location":"functions/#MatLang.catM-Tuple{Integer,Vararg{Any,N} where N}","page":"Functions","title":"MatLang.catM","text":"catM(dim, A1, A2, ...)\n\nconcatenates A1, A2, … , An along dimension dim.\n\nExamples\n\nmCat1 = catM(1, ones(3, 3), zeros(3, 3)) # [ones(3, 3); zeros(3, 3)]\n\nmCat2 = catM(2, ones(3, 3), zeros(3, 3)) # [ones(3, 3) zeros(3, 3)]\n\nmCat3 = catM(1, ones(3, 3), zeros(3, 3), 2 * ones(3, 3)) # [ones(3, 3); zeros(3, 3); 2 * ones(3, 3)]\n\nmCat4 = catM(3, ones(2, 2, 2), zeros(2, 2, 2)) # [ones(2, 2, 2) zeros(2, 2, 2)]\n\n\n\n\n\n","category":"method"},{"location":"functions/#MatLang.eyeM-Tuple{Type,Integer,Integer}","page":"Functions","title":"MatLang.eyeM","text":"eyeM(dim)         # square dim*dim matrix\neyeM(Type, dim)    # square dim*dim matrix\neyeM(dim, like = anArray) # to make an array with similar type of anArray\neyeM(dim1, dim2)   # giving size as a separate input numbers\neyeM(Type, dim1, dim2)   # giving size as a separate input numbers\neyeM(dim1, dim2, like = anArray) # to make an array with similar type of anArray\neyeM(sizeAsTuple) # giving size as a Tuple\neyeM(Type, sizeAsTuple) # giving size as a Tuple\neyeM(sizeAsTuple, like = anArray) # to make an array with similar type of anArray\neyeM(sizeAsArray) # non-efficient Matlab way\neyeM(Type, sizeAsArray) # non-efficient Matlab way\neyeM(sizeAsArray, like = anArray) # to make an array with similar type of anArray\n\nCreates 2D Identity matrix (can be non-square matrix).\n\nOnly 2 dimensions should be supplied othetwise you will receive an error.\n\nExamples\n\nmEye0=eyeM(2); # [1 0 0; 0 1 0]\n\nmEye1=eyeM(2,3); # [1 0 0; 0 1 0]\n\nmEye2=eyeM(Int32,2,3); # [1 0 0; 0 1 0]\n\nmEye3=eyeM(2,3, like = zerosM(Int8,2,2) )\n\nmEye4=eyeM((2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]\n\nmEye5=eyeM(Int32,(2,2))  # giving size as a Tuple. In Julia we use (2,2) instead of giving it as [2,2]\n\nmEye6=eyeM([2,2]) # non-efficient Matlab way\n\nmEye7=eyeM(Int32,[2,2]) # non-efficient Matlab way\n\ns1=size(ones(2,3)) # getting size from another matrix or calculation\nmEye8=eyeM(s1)  # giving size as a variable (Tuple).\n\n\n\n\n\n","category":"method"},{"location":"functions/#MatLang.horzcatM","page":"Functions","title":"MatLang.horzcatM","text":"horzcatM(A1, A2, …)\n\nConcatenate arrays horizontally\n\nExamples\n\nmHCat1 = horzcatM(ones(3, 3), zeros(3, 3)) # [ones(3, 3) zeros(3, 3)]\n\n\n\n\n\n","category":"function"},{"location":"functions/#MatLang.onesM-Tuple","page":"Functions","title":"MatLang.onesM","text":"onesM(dim)         # square dim*dim matrix\nonesM(Type, dim)    # square dim*dim matrix\nonesM(dim, like = anArray) # to make an array with similar type of anArray\nonesM(sizeAsArray) # non-efficient Matlab way\nonesM(Type, sizeAsArray) # non-efficient Matlab way\nonesM(sizeAsArray, like = anArray) # to make an array with similar type of anArray\n\nExamples\n\nmOnes0=onesM(2) # same as ones(2,2)\n\nmOnes1 = onesM(2, like = zerosM(Int32,2,2) )\n\nmOnes2=onesM(2,2) # same as ones(2,2)\n\nmOnes3=onesM(Int32,2,2) # same as ones(Int32,2,2)\n\nmOnes4=onesM((2,2)) # giving size as Tuple\n\nmOnes5=onesM(Int32,(2,2)) # giving size as Tuple and also the Int32 type\n\nmOnes6=onesM([2,2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.\n\nmOnes7=onesM(Int32,[2,2]) # giving size as Array, non-efficient Matlab way\n\n\n\n\n\n","category":"method"},{"location":"functions/#MatLang.randM-Tuple","page":"Functions","title":"MatLang.randM","text":"randM(dim)         # square dim*dim matrix\nrandM(Type, dim)    # square dim*dim matrix\nrandM(dim, like = anArray) # to make an array with similar type of anArray\nrandM(sizeAsArray) # non-efficient Matlab way\nrandM(Type, sizeAsArray) # non-efficient Matlab way\nrandM(sizeAsArray, like = anArray) # to make an array with similar type of anArray\n\nExamples\n\nmRand0=randM(2) # same as rand(2,2)\n\nmRand1 = randM(2, like = zerosM(Int32,2,2) )\n\nmRand2=randM(2,2) # same as rand(2,2)\n\nmRand3=randM(Int32,2,2) # same as rand(Int32,2,2)\n\nmRand4=randM((2,2)) # giving size as Tuple\n\nmRand5=randM(Int32,(2,2)) # giving size as Tuple and also the Int32 type\n\nmRand6=randM([2,2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.\n\nmRand7=randM(Int32,[2,2]) # giving size as Array, non-efficient Matlab way\n\n\n\n\n\n","category":"method"},{"location":"functions/#MatLang.squeezeM-Tuple{AbstractArray}","page":"Functions","title":"MatLang.squeezeM","text":"squeezeM(A)\n\nDrops all of the singleton dimensions of A (dimensions that are 1). If A contains only one element (i.e., all of its dimensions are singletons) then the output will be a zero-dimensional array.\n\nIf you know the dimension that you want to drop, use dropdims(A ; dims= dimensionsToRemove).\n\nOnly use this function if you don't know the dimensions that you want to remove, and you are sure that you are not removing important dimensions, and if you don't care about type stability.\n\nReturns an array containing the same data as A but with no singleton dimensions; note that arr is NOT a copy of A, i.e., modifying the contents of arr will modify the contents of A. To get a copy use copy(arr).\n\nExamples\n\nA1 = ones(2, 1, 2); # 3 dimensional\nmSqueeze1 = squeezeM(A1) # [1 1; 1 1]\n\nA2 = zeros(1, 4, 1);\nA2[:, 1:4, ] = [5; 3; 6; 0]\nmSqueeze2 = squeezeM(A2) # When it gets one dimensional, it is vertical.\n\nmSqueeze2 == [5; 3; 6; 0] # true\nmSqueeze2 == [5 3 6 0] # false\n\n\n\n\n\n","category":"method"},{"location":"functions/#MatLang.vertcatM","page":"Functions","title":"MatLang.vertcatM","text":"vertcatM(A1, A2, …)\n\nConcatenate arrays vertically\n\nExamples\n\nmVCat1 = vertcatM(ones(3, 3), zeros(3, 3)) # [ones(3, 3); zeros(3, 3)]\n\n\n\n\n\n","category":"function"},{"location":"functions/#MatLang.zerosM-Tuple","page":"Functions","title":"MatLang.zerosM","text":"zerosM(dim)         # square dim*dim matrix\nzerosM(Type,dim)    # square dim*dim matrix\nzerosM(dim, like=anArray) # to make an array with similar type of anArray\nzerosM(sizeAsArray) # non-efficient Matlab way\nzerosM(Type, sizeAsArray) # non-efficient Matlab way\nzerosM(sizeAsArray, like=anArray) # to make an array with similar type of anArray\n\nExamples\n\nmZeros0=zerosM(2) # same as zeros(2,2)\n\nmZeros1 = zerosM(2, like = zerosM(Int32,2,2) ) # like method\n\nmZeros2=zerosM(2,2) # same as zeros(2,2)\n\nmZeros3=zerosM(Int32,2,2) # same as zeros(Int32,2,2)\n\nmZeros4=zerosM((2,2)) # giving size as Tuple\n\nmZeros5=zerosM(Int32,(2,2)) # giving size as Tuple and also the Int32 type\n\nmZeros6=zerosM([2,2]) # giving size as an Array, non-efficient Matlab way. Array should be Integer otherwise you will get errors.\n\nmZeros7=zerosM(Int32,[2,2]) # giving size as Array, non-efficient Matlab way\n\n\n\n\n\n","category":"method"},{"location":"juliavsmatlab/#","page":"Native Julia noteworthy differences from MATLAB","title":"Native Julia noteworthy differences from MATLAB","text":"##Native Julia noteworthy differences from MATLAB","category":"page"},{"location":"juliavsmatlab/#","page":"Native Julia noteworthy differences from MATLAB","title":"Native Julia noteworthy differences from MATLAB","text":"This package tries to minimize the differences between Julia and Matlab. However, for the record, these points are worth considering.","category":"page"},{"location":"juliavsmatlab/#","page":"Native Julia noteworthy differences from MATLAB","title":"Native Julia noteworthy differences from MATLAB","text":"From: https://docs.julialang.org/en/v1/manual/noteworthy-differences/index.html","category":"page"},{"location":"juliavsmatlab/#","page":"Native Julia noteworthy differences from MATLAB","title":"Native Julia noteworthy differences from MATLAB","text":"Although MATLAB users may find Julia's syntax familiar, Julia is not a MATLAB clone. There are major syntactic and functional differences. The following are some noteworthy differences that may trip up Julia users accustomed to MATLAB:","category":"page"},{"location":"juliavsmatlab/#","page":"Native Julia noteworthy differences from MATLAB","title":"Native Julia noteworthy differences from MATLAB","text":"Julia arrays are indexed with square brackets, A[i,j].\nJulia arrays are not copied when assigned to another variable. After A = B, changing elements of B will modify A as well.\nJulia values are not copied when passed to a function. If a function modifies an array, the changes will be visible in the caller.\nJulia does not automatically grow arrays in an assignment statement. Whereas in MATLAB a(4) = 3.2 can create the array a = [0 0 0 3.2] and a(5) = 7 can grow it into a = [0 0 0 3.2 7], the corresponding Julia statement a[5] = 7 throws an error if the length of a is less than 5 or if this statement is the first use of the identifier a. Julia has push! and append!, which grow Vectors much more efficiently than MATLAB's a(end+1) = val.\nThe imaginary unit sqrt(-1) is represented in Julia as im, not i or j as in MATLAB.\nIn Julia, literal numbers without a decimal point (such as 42) create integers instead of floating point numbers. As a result, some operations can throw a domain error if they expect a float; for example, julia> a = -1; 2^a throws a domain error, as the result is not an integer (see the FAQ entry on domain errors for details).\nIn Julia, multiple values are returned and assigned as tuples, e.g. (a, b) = (1, 2) or a, b = 1, 2. MATLAB's nargout, which is often used in MATLAB to do optional work based on the number of returned values, does not exist in Julia. Instead, users can use optional and keyword arguments to achieve similar capabilities.\nJulia has true one-dimensional arrays. Column vectors are of size N, not Nx1. For example, rand(N) makes a 1-dimensional array.\nIn Julia, [x,y,z] will always construct a 3-element array containing x, y and z.\nTo concatenate in the first (\"vertical\") dimension use either vcat(x,y,z) or separate with semicolons ([x; y; z]).\nTo concatenate in the second (\"horizontal\") dimension use either hcat(x,y,z) or separate with spaces ([x y z]).\nTo construct block matrices (concatenating in the first two dimensions), use either hvcat or combine spaces and semicolons ([a b; c d]).\nIn Julia, a:b and a:b:c construct AbstractRange objects. To construct a full vector like in MATLAB, use collect(a:b). Generally, there is no need to call collect though. An AbstractRange object will act like a normal array in most cases but is more efficient because it lazily computes its values. This pattern of creating specialized objects instead of full arrays is used frequently, and is also seen in functions such as range, or with iterators such as enumerate, and zip. The special objects can mostly be used as if they were normal arrays.\nFunctions in Julia return values from their last expression or the return keyword instead of listing the names of variables to return in the function definition (see The return Keyword for details).\nA Julia script may contain any number of functions, and all definitions will be externally visible when the file is loaded. Function definitions can be loaded from files outside the current working directory.\nIn Julia, reductions such as sum, prod, and max are performed over every element of an array when called with a single argument, as in sum(A), even if A has more than one dimension.\nIn Julia, parentheses must be used to call a function with zero arguments, like in rand().\nJulia discourages the use of semicolons to end statements. The results of statements are not automatically printed (except at the interactive prompt), and lines of code do not need to end with semicolons. println or @printf can be used to print specific output.\nIn Julia, if A and B are arrays, logical comparison operations like A == B do not return an array of booleans. Instead, use A .== B, and similarly for the other boolean operators like <, >.\nIn Julia, the operators &, |, and ⊻ (xor) perform the bitwise operations equivalent to and, or, and xor respectively in MATLAB, and have precedence similar to Python's bitwise operators (unlike C). They can operate on scalars or element-wise across arrays and can be used to combine logical arrays, but note the difference in order of operations: parentheses may be required (e.g., to select elements of A equal to 1 or 2 use (A .== 1) .| (A .== 2)).\nIn Julia, the elements of a collection can be passed as arguments to a function using the splat operator ..., as in xs=[1,2]; f(xs...).\nJulia's svd returns singular values as a vector instead of as a dense diagonal matrix.\nIn Julia, ... is not used to continue lines of code. Instead, incomplete expressions automatically continue onto the next line.\nIn both Julia and MATLAB, the variable ans is set to the value of the last expression issued in an interactive session. In Julia, unlike MATLAB, ans is not set when Julia code is run in non-interactive mode.\nJulia's structs do not support dynamically adding fields at runtime, unlike MATLAB's classes. Instead, use a Dict.\nIn Julia each module has its own global scope/namespace, whereas in MATLAB there is just one global scope.\nIn MATLAB, an idiomatic way to remove unwanted values is to use logical indexing, like in the expression x(x>3) or in the statement x(x>3) = [] to modify x in-place. In contrast, Julia provides the higher order functions filter and filter!, allowing users to write filter(z->z>3, x) and filter!(z->z>3, x) as alternatives to the corresponding transliterations x[x.>3] and x = x[x.>3]. Using filter! reduces the use of temporary arrays.\nThe analogue of extracting (or \"dereferencing\") all elements of a cell array, e.g. in vertcat(A{:}) in MATLAB, is written using the splat operator in Julia, e.g. as vcat(A...).","category":"page"},{"location":"development/#Development-1","page":"Development - Contribution","title":"Development","text":"","category":"section"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"clone the project in your usual way, or using the following command which clones the project in .julia\\dev\\MatLang","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"] dev https://github.com/juliamatlab/MatLang","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"cd to cloned package. if you used dev command, run the following:","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"cd(\"$(homedir())\\\\.julia\\\\dev\\\\MatLang\")","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"Activate the package:","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"] activate .","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"Set developing variable to true in the files in test and usage folder.","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"developing = true","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"Set developing variable to false before committing (for a successful CI build).","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"The package uses Revise for quick testing without the need for restarting.","category":"page"},{"location":"development/#Contribution-Coding-Standard-1","page":"Development - Contribution","title":"Contribution - Coding Standard","text":"","category":"section"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"For coding standard please refer to Coding Standard. Feel free to contribute to this multi-field project. We need developers from different backgrounds to provide Matlab friendly API and wrappers.","category":"page"},{"location":"development/#","page":"Development - Contribution","title":"Development - Contribution","text":"Separate repositories are created for each toolbox. To provide fast and efficient wrappers please follow: https://docs.julialang.org/en/v1/manual/performance-tips/#Write-%22type-stable%22-functions-1","category":"page"},{"location":"#","page":"Home","title":"Home","text":"# Information for Documenter\nCurrentModule = MatLang","category":"page"},{"location":"#MatLang-Documentation-1","page":"Home","title":"MatLang Documentation","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"API for Matlab's language core functions","category":"page"},{"location":"#","page":"Home","title":"Home","text":"MatLang GitHub Repository Link: ","category":"page"},{"location":"#","page":"Home","title":"Home","text":"MatLang","category":"page"},{"location":"#","page":"Home","title":"Home","text":"JuliaMatlab GitHub Repository Link: ","category":"page"},{"location":"#","page":"Home","title":"Home","text":"JuliaMatlab   ","category":"page"},{"location":"#","page":"Home","title":"Home","text":"Master Repo","category":"page"},{"location":"#","page":"Home","title":"Home","text":"(Image: Dev Doc) (Image: Project Status: Active – The project has reached a stable, usable state and is being actively developed.) (Image: Build Status) (Image: Build status) (Image: codecov)","category":"page"},{"location":"#Installation-1","page":"Home","title":"Installation","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Add the package","category":"page"},{"location":"#","page":"Home","title":"Home","text":"]add https://github.com/juliamatlab/MatLang","category":"page"},{"location":"#Usage-1","page":"Home","title":"Usage","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Use the package:","category":"page"},{"location":"#","page":"Home","title":"Home","text":"using MatLang","category":"page"},{"location":"#Table-of-contents-1","page":"Home","title":"Table of contents","text":"","category":"section"},{"location":"#","page":"Home","title":"Home","text":"Pages = [\"index.md\", \"functions.md\", \"development.md\", \"juliavsmatlab.md\"]","category":"page"}]
}
