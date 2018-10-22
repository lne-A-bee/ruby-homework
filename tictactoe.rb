def igrac(tictac,i)
  if i%2==0
    player='O'
    sign='circle'
  else
    player='X'
    sign='cross'
  end

  puts "player #{player} move"
  print "where do you want to put a #{sign} [0-8]? "
  pick=gets.to_i
  while tictac[pick]=='X' || tictac[pick]=='O' do
    print "Wrong input!!! Where do you want to put a #{sign} [0-8]? "
    pick=gets.to_i
  end
  #unless tictac[pick]=='X' || tictac[pick]=='O' # staviti da ponovno unese
  tictac[pick]=player


end

tictac=['0','1','2','3','4','5','6','7','8']

def polje(tictac)
  puts "[#{tictac[0]}] [#{tictac[1]}] [#{tictac[2]}]"
  puts "[#{tictac[3]}] [#{tictac[4]}] [#{tictac[5]}]"
  puts "[#{tictac[6]}] [#{tictac[7]}] [#{tictac[8]}]"

end


polje(tictac)

i=0
while i<9 do
  igrac(tictac,i)
  polje(tictac)
  i+=1
end


