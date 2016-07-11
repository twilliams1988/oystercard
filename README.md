# Oystercard

Rspec error occuring and stack trace:

```
/home/ubuntu/workspace/spec/oystercard_spec.rb:1:in `<top (required)>': uninitialized constant Oystercard (NameError)
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/configuration.rb:1435:in `load'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/configuration.rb:1435:in `block in load_spec_files'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/configuration.rb:1433:in `each'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/configuration.rb:1433:in `load_spec_files'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/runner.rb:100:in `setup'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/runner.rb:86:in `run'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/runner.rb:71:in `run'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/lib/rspec/core/runner.rb:45:in `invoke'
        from /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.1/exe/rspec:4:in `<top (required)>'
        from /usr/local/rvm/gems/ruby-2.3.0/bin/rspec:23:in `load'
        from /usr/local/rvm/gems/ruby-2.3.0/bin/rspec:23:in `<main>'
        from /usr/local/rvm/gems/ruby-2.3.0/bin/ruby_executable_hooks:15:in `eval'
        from /usr/local/rvm/gems/ruby-2.3.0/bin/ruby_executable_hooks:15:in `<main>'
```

The true stack trace error is:
```
/home/ubuntu/workspace/spec/oystercard_spec.rb:1:in `<top (required)>': uninitialized constant Oystercard (NameError)
```
Line error occuring in : ```/home/ubuntu/workspace/spec/oystercard_spec.rb:1:``` 

Error solution:

create a class in oystercard.rb :
```
class Oystercard 
end
```

```Primary Object → Reference Object → Message```
**Q.1**
|Objects|Messages|
|-:|:-:|
|Customer||
|Card|balance|
**Q.2**
|Objects|Messages|
|-:|:-:|
|Customer||
|Card|top_up|




