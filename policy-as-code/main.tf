provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name = "nginx"
    namespace = "test"
    labels = {
      "app.kubernetes.io/name"       = "nginx"
      "app.kubernetes.io/created-by" = "tf2project"
      "app.kubernetes.io/env"        = "development"
    }
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        "app.kubernetes.io/name"       = "nginx"
        "app.kubernetes.io/created-by" = "tf2project"
        "app.kubernetes.io/env"        = "development"
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"       = "nginx"
          "app.kubernetes.io/created-by" = "tf2project"
          "app.kubernetes.io/env"        = "development"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:v1"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

