# How Bicep works

- When you deploy a resource or series of resources to Azure, you submit the Bicep template to Resource Manager, which still requires JSON templates. 
- The tooling that's built into Bicep converts your Bicep template into a JSON template. This process is known as <b>transpilation</b>, which essentially treats the ARM template as an intermediate language. 
- The conversion happens automatically when you submit your deployment, or you can do it manually.


<img src="https://docs.microsoft.com/en-us/learn/modules/includes/media/bicep-to-json.png" alt="BicepWork" style="text-align:center: 10px;" />
    

        Note:

        Transpilation is the process of converting source code written in one language into another language.


- The latest versions of the Azure CLI and the Azure PowerShell module have built-in Bicep support. You can use the same deployment commands to deploy Bicep and JSON templates. For example, the following command deploys a Bicep template to a resource group named storage-resource-group:

        Azure CLI

        az deployment group create --template-file ./main.bicep --resource-group storage-resource-group


- After this deployment is submitted, Resource Manager looks at what is already deployed in Azure. It then looks at what you're trying to deploy, and it sets up a sequence of steps to achieve this state. All these activities involve invoking the Resource Manager API.


- You can view the JSON template that's submitted to Resource Manager by using the bicep build command. In the next example, a Bicep template is converted into its corresponding JSON template:

        bicep build ./main.bicep


    Note: To view equivalent JSON and Bicep files side by side, see [Bicep Playground.](https://aka.ms/bicepdemo/)
