resource "rafay_eks_cluster" "ekscluster-advanced" {
  cluster {
    kind = "Cluster"
    metadata {
      name    = var.cluster_name # name of your cluster
      project = var.project_name # project to be used for the cluster
    }
    spec {
      type              = "eks"
      blueprint         = "default"
      blueprint_version = "Latest"
      cloud_provider    = "abhinav1rafayeks" # Cloud Credentials, as mentioned in Rafay UI
      cni_provider      = "aws-cni"
      proxy_config      = {}
    }
  }
  cluster_config {
    apiversion = "rafay.io/v1alpha5"
    kind       = "ClusterConfig"
    metadata {
      name    = var.cluster_name       # Should be same as your cluster name
      region  = var.availability_zones # AWS region
      version = "1.28"                 # Cluster k8s version
      tags = {
        "demo"  = "true"
        "email" = "abhinav@rafay.co"
        "env"   = "cs-team"
      }
    }
    vpc {
      cluster_endpoints {
        private_access = true
        public_access  = false
      }
    }
    managed_nodegroups {
      name               = "managed-ng-1" # Node Group name
      ami_family         = "AmazonLinux2"
      instance_type      = "t3.xlarge" # AWS instance type
      desired_capacity   = 1
      min_size           = 1
      max_size           = 2
      max_pods_per_node  = 50
      version            = "1.28"
      volume_size        = 80
      volume_type        = "gp3"
      volume_iops        = 3000
      volume_throughput  = 125
      private_networking = true
      ssh {
        allow = true
        enable_ssm = true
        public_key_name = "Abhinav-cluatercraft-dev"
      }
      tags = {
        "email" = "abhinav@rafay.co"
        "env"   = "cs-team"
      }
    }
    # node_groups {
    #   name       = "ng-1"
    #   ami_family = "AmazonLinux2"
    #   taints {
    #     key    = "test-taint"
    #     value  = "one"
    #     effect = "PreferNoSchedule"
    #   }
    #   instance_type      = "t2.medium"
    #   desired_capacity   = 1
    #   min_size           = 1
    #   max_size           = 2
    #   max_pods_per_node  = 50
    #   version            = "1.22"
    #   volume_size        = 80
    #   volume_type        = "gp3"
    #   private_networking = true
    #   availability_zones = var.availability_zones
    # }
  }
}









































































