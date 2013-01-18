HelloWorld
==========

This workspace includes a number of projects which show how you can progress from a simple application that displays Hello World on a label, to an application that will read a name from a text field and use it as part of the message. 

1. HelloWorldLabel - No code. This is a default project with an extra label.
2. HelloWorldSetLabel - A bit of code. The text for a label is set by code. 
3. HelloWorldWithButton - A bit of code. A button is used to trigger an update to a label.
4. HelloWorldWithTextField - A bit more code. A text field contains the text to be used as part of the Hello message. 

HelloWorldLabel
---------------

This is the initial version of the project. This project is a Single View application. The view 
has the default files that Xcode creates. The only addition is that a UILabel has been 
dropped onto the view in the Storyboard. The text of the UILabel has been changed to "Hello World". 
No further changes are necessary.


HelloWorldSetLabel
------------------

The next version shows how to set the text value for a label in code. A UILabel is shown in the interface. A link is provided between the UILabel and the code via an IBOutlet property. In HelloWorldSetLabelViewController.m, the viewDidLoad method sets the text value.


HelloWorldWithButton
--------------------

The next version shows how to respond to an event from a button press. When pressed, the text value for a label is set from the code. A UILabel and a UIButton are shown in the interface. A link is provided between the UILabel and the code via an IBOutlet property. In HelloWorldWithButtonlViewController.m, the sayHello method sets the text value.

HelloWorldWithTextField
-----------------------

The next version shows how to set read a value from a text field and use this as part of the message displayed in a label. A UILabel, a UITextField and UIButton are shown in the interface. A link is provided between the code and the UILabel and UITextField via IBOutlet properties. In HelloWorldWithTextFieldViewController.m, the sayHello method sets the text value. The class is also used to handle the return key on the keyboard. When this is detected, the keyboard is removed from the screen. 
