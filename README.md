![Søren Kierkegaard](https://i.imgur.com/OW6bGAy.png "Søren Kierkegaard")

# What is Søren?
Søren removes nil returns from instance and class methods.

# Why would you want to do that?
Any method that returns or accepts nil is headed for conditional town,
a suburb of terriblecodesville, which as part of the greater
youdonthaveajob metro area.

## What?

It's hard for a whole team of coders to remember to write nil guards (if object.nil? ? do this : do other thing)
in all needed cases, leading to the ever popular "NoMethodError: undefined method 'whatever' for nil:NilClass"

But in the best case scenario, where a team is diligent about checking
for nil, they still end up with a mess of conditionals.

That means extra lines of code that aren't expressive. nil guards in code and tests can only ever reflect the implementation.
As business logic changes, these pieces of code that are inline and without decent labels are more resistant to change.

Refactoring by creating small, composable objects and methods is
antithetical to an inlined, conditional-heavy style.

For many types conditional statements, it's easy to wrap up the condition into
objects. "Telling not asking," is easy with something like this:

    if (animal.type == "dog")
        animal.dosomething
    else if (animal.type == "cat")
        animal.dosomethingelse
    # etc.
    end

It can be as simple as subclassing animal for each type, reimplementing the
a dosomething method on each subclass. Those can use expressive names
and be tested in isolation.

Sometimes you'd prefer something like a state machine that could define
methods on the fly. Sometimes you'd want to "favor composition to
inheritence" by using mixins instead of subclassing. And there are
dozens of patterns that help to solve the problem of not "reaching into"
a class when you don't need to.

Many of these techniques are well understood and implemented through
other mechanisms in ruby. However, the ubiquity of nil checks and
"undefined method 'x' for nil:NilClass" in production code demonstrate a
need for some other approach.

If for no other reason, using NullObjects with Søren prevents if statements
from attracting more if statements.

Guarding against nil will lead to more if statements. Following a
"broken windows" strategy to code quality demands that nil guards aren't
used.

It is annoying to define a Null version of every class. This is
compounded when using a large library like Rails where programmers may
not feel that they really own a class implementation.

For these reasons, Søren deals exclusively with what seems to be the most
common special case of conditionals: refactoring nil checks.

This is so you can have actual objects to reflect that special case of
something not being there. Actual objects means actual methods. Actual
methods mean actual tests. Actual tests mean actual behavior that you
want out of your program.

https://en.wikipedia.org/wiki/Null_Object_pattern

# How does it work?
You simply add a prepend statement like this:

    class SomeClass
        # methods go here, above the prepend statement
        prepend Soren
    end

Now, SomeClass won't return nil anymore. If the class is already
written, that code will still work. It simply opens it back up and
overwrites the methods as it would before.

# Why is it called Søren?
It's named after [Søren Kierkegaard](https://en.wikipedia.org/wiki/S%C3%B8ren_Kierkegaard). He's the anti-nihilism guy.

# TODO
* dynamically defined methods - dirty flag as class variable?  Resorenifying?
* Class hierarchy for NullX types.
* keeping history of messages sent to object - Always instantiate null object?
* Support for ActiveModel
* Gemify it
