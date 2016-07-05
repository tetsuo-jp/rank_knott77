require 'spec_helper'

describe Rank do
  include Rank

  it 'returns the correct Catalan numbers' do
    expect(b(0)).to eq 1
    expect(b(1)).to eq 1
    expect(b(2)).to eq 2
    expect(b(3)).to eq 5
    expect(b(4)).to eq 14
    expect(b(5)).to eq 42
    expect(b(6)).to eq 132
    expect(b(7)).to eq 429
    expect(b(8)).to eq 1430
  end

  it 'returns the correct rank value' do
    expect(r([6, 2, 1, 3, 4, 5, 8, 7, 9], 3, 7, 6)).to eq 3

    expect(rank([1],1)).to eq 1
    expect(rank([1,2],2)).to eq 1
    expect(rank([2,1],2)).to eq 2
    expect(rank([1,2,3,4],4)).to eq 1
    expect(rank([1,2,4,3],4)).to eq 2
    expect(rank([1,3,2,4],4)).to eq 3
    expect(rank([1,4,2,3],4)).to eq 4
    expect(rank([1,4,3,2],4)).to eq 5
    expect(rank([2,1,3,4],4)).to eq 6
    expect(rank([2,1,4,3],4)).to eq 7
    expect(rank([3,1,2,4],4)).to eq 8
    expect(rank([3,2,1,4],4)).to eq 9
    expect(rank([4,1,2,3],4)).to eq 10
    expect(rank([4,1,3,2],4)).to eq 11
    expect(rank([4,2,1,3],4)).to eq 12
    expect(rank([4,3,1,2],4)).to eq 13
    expect(rank([4,3,2,1],4)).to eq 14
    expect(rank([6,2,1,3,4,5,8,7,9],9)).to eq 2602
  end

  it 'returns the correct permutation' do
    expect(rankinverse(Array.new(1),1,1)).to eq [1]
    expect(rankinverse(Array.new(4),1,4)).to eq [1, 2, 3, 4]
    expect(rankinverse(Array.new(4),2,4)).to eq [1, 2, 4, 3]
    expect(rankinverse(Array.new(4),3,4)).to eq [1, 3, 2, 4]
    expect(rankinverse(Array.new(4),4,4)).to eq [1, 4, 2, 3]
    expect(rankinverse(Array.new(4),5,4)).to eq [1, 4, 3, 2]
    expect(rankinverse(Array.new(4),6,4)).to eq [2, 1, 3, 4]
    expect(rankinverse(Array.new(4),7,4)).to eq [2, 1, 4, 3]
    expect(rankinverse(Array.new(4),8,4)).to eq [3, 1, 2, 4]
    expect(rankinverse(Array.new(4),9,4)).to eq [3, 2, 1, 4]
    expect(rankinverse(Array.new(4),10,4)).to eq [4, 1, 2, 3]
    expect(rankinverse(Array.new(4),11,4)).to eq [4, 1, 3, 2]
    expect(rankinverse(Array.new(4),12,4)).to eq [4, 2, 1, 3]
    expect(rankinverse(Array.new(4),13,4)).to eq [4, 3, 1, 2]
    expect(rankinverse(Array.new(4),14,4)).to eq [4, 3, 2, 1]
    expect(rankinverse(Array.new(9),2602,9)).to eq [6,2,1,3,4,5,8,7,9]
  end
end
