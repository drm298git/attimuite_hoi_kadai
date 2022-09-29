def main
    #勝敗が決まらない限り続ける 
    while !game_ended()
    end
end

#じゃんけん 
def JankenResult
    print "じゃんけん…\n"
    choices = ["グー", "チョキ", "パー", "終了"]
    start_message(choices)

    player_hand = gets.to_i
    cpu_hand = rand(3)
    choice_info(choices[player_hand], choices[cpu_hand])

    result = 0 #負け :0, 勝ち:1, あいこ:2
    
    if player_hand == cpu_hand
        result = 2
    elsif ((player_hand == 0 && cpu_hand == 1) || (player_hand == 1 && cpu_hand == 2) || (player_hand == 2 && cpu_hand == 0))
        result = 1
    elsif
        player_hand == 3
        print "勝負から逃げるのか！ 卑怯者め！\n"
        exit
    end
    
    return result
end


def game_ended
    janken_result = JankenResult()

    if janken_result == 2
        puts "あいこで…"
        return false
    end

    if !IsAttiDecided()
        puts "じゃんけん…"
        return false
    end

    if janken_result == 1
        puts "あなたの勝ち!"
    else
        puts "残念…CPUの勝ち!"
    end

    return true
end

#あっち向いてホイ 
def IsAttiDecided
    puts "あっち向いて〜"
    choices = ["上", "下", "左", "右"]
    start_message(choices)

    player_direction = gets.to_i
    cpu_direction = rand(choices.size)
    choice_info(choices[player_direction], choices[cpu_direction])

    return (player_direction == cpu_direction)
end

def start_message(choices)
    numChoices = choices.size
    
    for i in 0..(numChoices-1) do
        puts i.to_s + "(" + choices[i] + ")"
    end
end



def choice_info(player_choiceString, cpu_choiceString)
    puts "ホイ！"
    separator = "------------------------"
    puts separator
    puts "あなた:#{player_choiceString}"
    puts "CPU:#{cpu_choiceString}"
    puts separator
end

main()