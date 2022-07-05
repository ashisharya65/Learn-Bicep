
# Understand parameters

- With <b><i>Parameters</i></b>, you can provide information to Bicep template at deployment time.
- You can make Bicep template flexible and reusable by declaring parameters withing you template.
- <b><i>Decorators</i></b> provide a way to attach constraints and metadata to a parameter, which helps anyone using your templates to understand what information they need to provide.

## Declare a parameter

- In a Bicep template, you can declare the parmeter using <b><i>param</i></b> keyword.
- You can put these declarations anywhere in the template but it's usually a good idea to put them at the top of the file so your Bicep code is easy to read.

    Here's how you declare a parameter:

        param environmentName string

- Let's look at how each part works:

    * <b><i>param</i></b> indicates to Bicep that you're declaring a parameter.
    * <b><i>environmentName</i></b> refers to the name of the parameter. Although the parameter name can be anything, you should make the name clear and understandable for the template users. Within the same template, you can also refer to the parameter by using its name. Parameter names must be unique. They can't have the same name as a variable or a resource in the same Bicep file.
    * <b><i>string</i></b> refers to the type of the parameter.

## Add a default value

- You can assign default values to parameters in your templates. 
- By assigning a default value, you're making the parameter optional. If the template is deployed without a specified value for the parameter, the default value is assigned.

    Here's how you add a default value:

        param environmentName string = 'dev'

- You can use expressions as default values. Here's an example of a string parameter named location with a default value set to the location of the current resource group:

        param location string = resourceGroup().location


## Understand parameter types




