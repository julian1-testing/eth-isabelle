#! /usr/bin/ruby


input = ARGF.read

if input[/^0x/]
  input = input[2..-1]
end


i = 0

while i + 2 <= input.size
  byte = input[i, 2]
  i = i + 2

  case byte
  when "00"
    puts "Misc STOP #"
  when "01"
    puts "Arith ADD #"
  when "02"
    puts "Arith MUL #"
  when "03"
    puts "Arith SUB #"
  when "04"
    puts "Arith DIV #"
  when "05"
    puts "Sarith SDIV #"
  when "06"
    puts "Arith MOD #"
  when "07"
    puts "Sarith SMOD #"
  when "08"
    puts "Arith ADDMOD #"
  when "09"
    puts "Arith MULMOD #"
  when "0a"
    puts "Arith EXP #"
  when "0b"
    puts "Sarith SIGNEXTEND #"
  when "10"
    puts "Arith inst_LT #"
  when "11"
    puts "Arith inst_GT #"
  when "12"
    puts "Sarith SLT #"
  when "13"
    puts "Sarith SGT #"
  when "14"
    puts "Arith inst_EQ #"
  when "15"
    puts "Arith ISZERO #"
  when "16"
    puts "Bits inst_AND #"
  when "17"
    puts "Bits inst_OR #"
  when "18"
    puts "Bits inst_XOR #"
  when "19"
    puts "Bits inst_NOT #"
  when "1a"
    puts "Bits BYTE #"
  when "20"
    puts "Arith SHA3 #"
  when "30"
    puts "Info ADDRESS #"
  when "31"
    puts "Info BALANCE #"
  when "32"
    puts "Info ORIGIN #"
  when "33"
    puts "Info CALLER #"
  when "34"
    puts "Info CALLVALUE #"
  when "35"
    puts "Stack CALLDATALOAD #"
  when "36"
    puts "Info CALLDATASIZE #"
  when "37"
    puts "Memory CALLDATACOPY #"
  when "38"
    puts "Info CODESIZE #"
  when "39"
    puts "Memory CODECOPY #"
  when "3a"
    puts "Info GASPRICE #"
  when "3b"
    puts "Info EXTCODESIZE #"
  when "3c"
    puts "Memory EXTCODECOPY #"
  when "40"
    puts "Info BLOCKHASH #"
  when "41"
    puts "Info COINBASE #"
  when "42"
    puts "Info TIMESTAMP #"
  when "43"
    puts "Info NUMBER #"
  when "44"
    puts "Info DIFFICULTY #"
  when "45"
    puts "Info GASLIMIT #"
  when "50"
    puts "Stack POP #"
  when "51"
    puts "Memory MLOAD #"
  when "52"
    puts "Memory MSTORE #"
  when "53"
    puts "Memory MSTORE8 #"
  when "54"
    puts "Storage SLOAD #"
  when "55"
    puts "Storage SSTORE #"
  when "56"
    puts "Pc JUMP #"
  when "57"
    puts "Pc JUMPI #"
  when "58"
    puts "Pc PC #"
  when "59"
    puts "Memory MSIZE #"
  when "5a"
    puts "Info GAS #"
  when "5b"
    puts "Pc JUMPDEST #"
  when "60".."69", "6a".."6f", "70".."79", "7a".."7f"
    size = byte.hex - "60".hex + 1
    print "Stack (PUSH_N ["
    while size > 0
      byte = input[i, 2]
      if size == 1
        print "0x#{byte}"
      else
        print "0x#{byte}, "
      end
      i = i + 2
      size = size - 1
    end
    puts "]) #"
  when "80".."89", "8a".."8f"
    num = byte[1].hex + 1
    puts "Dup #{num} #"
  when "90".."99", "9a".."9f"
    num = byte[1].hex
    puts "Swap #{num} #"
  when "a0"
    puts "Log LOG0 #"
  when "a1"
    puts "Log LOG1 #"
  when "a2"
    puts "Log LOG2 #"
  when "a3"
    puts "Log LOG3 #"
  when "a4"
    puts "Log LOG4 #"
  when "f0"
    puts "Misc CREATE #"
  when "f1"
    puts "Misc CALL #"
  when "f2"
    puts "Misc CALLCODE #"
  when "f3"
    puts "Misc RETURN #"
  when "f4"
    puts "Misc DELEGATECALL #"
  when "ff"
    puts "Misc SUICIDE #"
  end
end


puts "[]"
