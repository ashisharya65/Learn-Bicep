
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

- When you declare a parameter, you need to tell Bicep what type of information the parameter will contain. 

- Bicep will ensure that the value assigned to the parameter is compatible with the parameter type.

- Parameters in Bicep can be one of the following types:

    * string, which lets you enter arbitrary text.
    * int, which lets you enter a number.
    * bool, which represents a Boolean (true or false) value.
    * object and array, which represent structured data and lists.


### Objects

- You can use <b><i>Object</i></b> parameters to combine structured data together in one place.
- An object can have multiple properties of different types.
- You can use objects within resource definitions, within variables, or within expressions in your Bicep file.

    Here's an example of an object:

        param appServicePlanSku object = {
            name: 'F1'
            tier: 'Free'
            capacity: 1
        }
- This parameter is an object with two string properties, <b><i>name</i></b> and <b><i>tier</i></b>, and an integer property, capacity. Notice that each of the properties is on its own line.

- When you reference the parameter in the template, you can select the individual properties of the object by using a dot followed by the name of the property, like in this example:

        resource appServicePlan 'Microsoft.Web/serverFarms@2020-06-01' = {
            name: appServicePlanName
            location: location
            sku: {
                name: appServicePlanSku.name
                tier: appServicePlanSku.tier
                capacity: appServicePlanSku.capacity
            }
        }

- Another example of where you might use an object parameter is for specifying resource tags. 
- You can attach custom tag metadata to the resources that you deploy, which you can use to identify important information about a resource.
- Tags are useful for scenarios like tracking which team owns a resource, or when a resource belongs to a production or non-production environment. Typically, you'll use different tags for each environment, but you'll want to reuse the same tag values on all the resources within your template. For this reason, resource tags are a good use for an object parameter, like in this example:

        param resourceTags object = {
            EnvironmentName: 'Test'
            CostCenter: '1000100'
            Team: 'Human Resources'
        }

- Whenever you define a resource in your Bicep file, you can reuse it wherever you define the tags property:

        resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
            name: appServicePlanName
            location: location
            tags: resourceTags
            sku: {
                name: 'S1'
            }
        }

        resource appServiceApp 'Microsoft.Web/sites@2020-06-01' = {
            name: appServiceAppName
            location: location
            tags: resourceTags
            kind: 'app'
            properties: {
                serverFarmId: appServicePlan.id
            }
        }

### Arrays

