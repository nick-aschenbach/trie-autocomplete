class TrieNode
  def initialize(decoration = '.')
    @decoration = decoration
    @children = {}
  end

  def addLetters(letters)
    addLettersRecursively(letters, letters)
  end

  def findNode(letters)
    return self if letters.size == 0

    return @children[letters[0]].findNode(letters[1..-1]) if @children.has_key?(letters[0])
    nil
  end

  def children
    @children.values
  end

  def word
    @full_word
  end

  protected

  def addLettersRecursively(letters, full_word)
    @full_word = full_word and return if letters.size == 0

    first_letter = letters[0]
    @children[first_letter] = TrieNode.new(first_letter) unless @children.has_key?(first_letter)
    @children[first_letter].addLettersRecursively(letters[1..-1], full_word)
  end
end

class Trie
  def initialize(words = [])
    @root_node = TrieNode.new
    words.each { |word| @root_node.addLetters(word) }
  end

  def insert(word)
    @root_node.addLetters(word)
  end

  def contains?(word)
    node = @root_node.findNode(word)

    return true if node and node.word
    false
  end

  def search(letters = '')
    words = []
    queue = []
    node = @root_node.findNode(letters)
    return [] if node.nil?
    words << node.word if node.word
    queue << node
    until queue.size == 0 do
      node = queue.shift
      node.children.each do |child_node|
        word = child_node.word
        words << word unless word.nil?
        queue << child_node
      end
    end
    words
  end
end