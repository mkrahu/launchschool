# encrypted_pioneers.rb

names = ['Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu']



def rot13(character)
  case character
  when 'a'..'m', 'A'..'M' then (character.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (character.ord - 13).chr
  else character
  end
end

def decrypt(name)
    decrypted = name.chars.map do |char|
      rot13(char)
    end
    decrypted.join
end


names.each { |name| puts decrypt(name) }