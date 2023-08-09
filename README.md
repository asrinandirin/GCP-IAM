# Service Account

### First login to the GCP

---

```bash
gcloud auth application-default login
```

### Then you are ready to go

```bash
module "service-account-module" {

      source= "github.com/asrinandirin/GCP-IAM/Service-Account/Service-Account-With-Roles-V1"
      
      service_account_name          = ""      // Give a valid service account name. 
      project_id                    = ""      // Your Project ID.
      roles                         = ["",""] //Fill with desired roles. 

    }
```

### Outputs

- Service Account Name
- Project ID
- Binded Roles

<aside>
💡 If you only want to create a service account, you can leave the role line blank. (It may throw a trivial error.)

</aside>