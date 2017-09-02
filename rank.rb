##############################################################################
# Ranking binary trees and its inverse from [1]
#
# [1] Knott, G. D. (1977). A numbering system for binary trees. Commun. ACM,
# 20(2), 113-115. doi:10.1145/359423.359434

module Rank

  # compute Catalan numbers. not optimized.
  # @param [int] n
  # @return [int] n-th Catalan number https://en.wikipedia.org/wiki/Catalan_number
  def b(n)
    if n==1 || n==0
      1
    else
      4 * b(n-1) - 6 * b(n-1) / (n+1)
    end
  end

  # compute the rank of the tree permutation defined by (p[a]-s, p[a+1]-s, ..., p[a+n-1]-s)
  # @param [array] p: tree permutation
  # @param [int] n: size of the tree permutation p
  # @param [int] a
  # @return [int] rank value
  def r(p,n,a,s)
    j = p[a-1] - s - 1
    v = 0
    i = 0
    for i in 0..(j-1) do
      v += b(i) * b(n-i-1)
    end
    v +
      (j <= 1 ? 0 : b(n-j-1) * (r(p,j,a+1,s) - 1)) +
      (n-j-1 <= 1 ? 1 : r(p,n-j-1,a+j+1,s+j+1))
  end

  # compute the rank of the tree permutation defined by (p[0], p[1], ..., p[n-1])
  # @param [array] p
  # @param [int] n
  # @return [int] rank value
  def rank(p,n)
    r(p,n,1,0)
  end

  # set p[a-1:a+n-2] to rank^-1(i,n) + (s,s,...,s)
  # @param [array] p
  # @param [int] i
  # @param [int] n
  # @param [int] a
  # @param [int] s
  # @return [void]
  def ri(p,i,n,a,s)
    j = 0
    v = nil
    h = nil
    k = nil
    while i > 0
      k = n-j-1
      h = b(k)
      v = b(j) * h
      i -= v
      j += 1
    end
    i += v
    j -= 1
    p[a-1] = j + 1 + s
    y = (i-1-((i-1)/h)*h) + 1
    w = (i-y) / h + 1

    if j > 1
      ri(p,w,j,a+1,s) 
    elsif j == 1
      p[a] = s+1
    end

    if k > 1
      ri(p,y,k,a+j+1,s+j+1)
    elsif k==1
      p[a+j] = s+j+2
    end
  end

  # return in p[0:n-1] the n-element tree permutation corresponding to
  # the n-node binary tree of rank i
  # @param [array] p
  # @param [int] i
  # @param [int] n
  # @return [array] p
  def rankinverse(p,i,n)
    ri(p,i,n,1,0)
    return p
  end
end
