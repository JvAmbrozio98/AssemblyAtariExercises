var lengthOfLongestSubstring = function(s) {
    let max = 0;
    let start = 0;
    const map = {};
    for (let i = 0; i < s.length; i++) {
      let nextCharacter = s[i];
      map[nextCharacter] = map[nextCharacter] + 1 || 1;
    }
  
    while (map[nextCharacter] > 1) {
      let previousCharacter = s[start];
      if (map[nextCharacter] > 1) {
        map[previousCharacter]--;
      } else {
        delete map[previousCharacter];
      }
      start++;
    }
    max = Math.max(max, (start - i) + 1);
  
 
  
  };
  