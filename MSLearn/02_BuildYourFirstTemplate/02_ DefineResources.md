# Define resources

The main thing you'll do with Bicep templates is define your Azure resources. Here's an example of what a typical resource definition looks like in Bicep. This example creates a storage account named toylaunchstorage.

        resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01' = {
        name: 'toylaunchstorage'
        location: 'westus3'
        sku: {
            name: 'Standard_LRS'
        }
        kind: 'StorageV2'
        properties: {
            accessTier: 'Hot'
        }
        }

Let's look closely at some key parts of this resource definition:

- The <b>resource</b> keyword at the start tells Bicep that you're about to define a resource.
- Next, you give the resource a symbolic name. In the example, the resource's symbolic name is <b>storageAccount</b>. Symbolic names are used within Bicep to refer to the resource, but they won't ever show up in Azure.
- Microsoft.Storage/storageAccounts@2021-08-01 is the resource type and API version of the resource. Microsoft.Storage/storageAccounts tells Bicep that you're declaring an Azure storage account. 2021-08-01 is the version of the Azure Storage API that Bicep will use when it creates the resource.
- You have to declare a resource name, which is the name the storage account will be assigned in Azure. You'll set a resource name using the <b>name</b> keyword.
- You'll then set other details of the resource, such as its location, SKU (pricing tier), and kind. There are also properties you can define that are different for each resource type. Different API versions might introduce different properties, too. In this example, we're setting the storage account's access tier to <b>Hot</b>.


## What happens when resources depend on each other?

- Bicep template includes several resources. 
- These resources often has dependencies on another resource.
- Here you need to extract some information from one resource to be able to define another.

- For example in our case, we have to deploy an App Service app for the template that will help launch the toy product. But to create an App Service app, you first need to create an App Service plan. The App Service plan represents the server-hosting resources, and it's declared like this example:

        resource appServicePlan 'Microsoft.Web/serverFarms@2021-03-01' = {
        name: 'toy-product-launch-plan'
        location: 'westus3'
        sku: {
            name: 'F1'
        }
        }

- This resource definition is telling Bicep you want to deploy an App Service plan that has the resource type <b>Microsoft.Web/serverFarms</b>.The plan resource is named <b>toy-product-launch-plan</b>, and it's deployed into the West US 3 region. It uses a pricing SKU of F1, which is the free tier of App Service.

- Now that you've declared the App Service plan, the next step is to declare the app:

        resource appServiceApp 'Microsoft.Web/sites@2021-03-01' = {
        name: 'toy-product-launch-1'
        location: 'westus3'
        properties: {
            serverFarmId: appServicePlan.id
            httpsOnly: true
        }
        }

    This template instructs Azure to host the app on the plan you created. Notice that the definition of the plan includes the symbolic name of the App Service plan on this line:<b>serverFarmId: appServicePlan.id</b>. This line means that Bicep will get the plan's resource ID using the <b>.id</b> property. It's effectively saying, "This app's server farm ID is the ID of the App Service plan defined earlier."


- By declaring the app resource with a property that references the symbolic name of the plan, Azure understands the <i>implicit dependency</i> between the App Service app and the plan. When it deploys the resources, Azure will make sure it fully deploys the plan before it starts to deploy the app.


