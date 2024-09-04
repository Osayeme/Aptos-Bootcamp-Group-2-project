import {AptosClient} from "aptos";
const moveModule = "0x7e074fb2793130b69a03bb6c551a8e69495744017618a6463c09da721a9d2d38"
const client = new AptosClient("https://fullnode.devnet.aptoslabs.com/v1");

async function fetchResources() {
    try {
      // Get the account resource from the Aptos blockchain
      const resources = await client.getAccountResources(moveModule);
      const resourceType = `${moveModule}::counter::CountHolder`
      const resource = resources.find((el => el.type === resourceType));
  
      // Log the resources to the console
      document.getElementById('info').textContent = resource.data.count;
      console.log(resource);
    } catch (error) {
      // Log any errors that occur during the API call
      console.error("Error fetching resources:", error);
    }
  }

fetchResources();