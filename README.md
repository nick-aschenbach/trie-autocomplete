trie-autocomplete
=================

A small autocomplete example using a Trie data structure. This project contains a dictionary with approximately 210K words and allows search using a web interface.

First install required gems from the command line:

```
bundle install
```

Then to run the sinatra app:

```
ruby autocomplete.rb
```

Then open up a browser to `http://localhost:4567`

This uses jQuery's UI autocomplete widget. The Trie data structure code is located in the `lib` directory
