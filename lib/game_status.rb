# Helper Method

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if board != [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   WIN_COMBINATIONS.each do |combo|
     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
       x_win = combo
     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
       o_win = combo
     end
     if x_win != false && o_win != false
       return false
   end
 end
end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == false
    return false
  elsif won?(board) != false
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
