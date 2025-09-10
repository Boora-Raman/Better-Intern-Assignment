terraform { 
  cloud { 
    
    organization = "Raman-Boora" 

    workspaces { 
      name = "ECS-Infrastructre" 
    } 
  } 
}