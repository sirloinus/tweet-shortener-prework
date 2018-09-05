require "pry"

def dictionary
  dictionary = {
    'hello' => 'hi',
    'to' => '2',
    'two' => '2',
    'too' => '2',
    'for' => '4',
    'four' => '4',
    'be' => 'b',
    'you' => 'u',
    'at' => '@',
    'and' => '&'
  }
end

def word_substituter(tweet)
  tweet_as_array = tweet.split(' ')
  mapped_tweet = tweet_as_array.map do |word|
    if dictionary.keys.include?(word.downcase)  
              # ^^ downcase because keys in hash are all lowercase
       word = dictionary[word.downcase]      
              # ^^ replace word with value from dictionary hash
    else
      word
    end
  end.join(' ')     #then convert tweet_as_array back to a string
  return mapped_tweet      #return shortened tweet
end



# note on above: because the whole thing (tweet_as_array.map all the way to end) is a big method call that returns an array. Because the return value is an array, you can call join on the end of it

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end


def selective_tweet_shortener(tweet)
  if tweet.length > 140 
    word_substituter(tweet)
    #do substitutions
  else 
    tweet
  end
end


def shortened_tweet_truncator(tweet)
  subst_tweet = word_substituter("GUISEEEEE this is so fun! I'm tweeting 4 u guys & this tweet is SOOOO long it's gonna b way more than u would think twitter can handle, so shorten it up u know what I mean? I just can never tell how long 2 keep typing!")
  if subst_tweet.length > 140
    puts "#{subst_tweet[140]}..." 
  else
  subst_tweet
  end
end