provider "kubernetes" {
    config_context = "kubernetes-admin@kubernetes"
}

resource "kubernetes_namespace" "my-ns" {
    metadata {
        name = "arh"
    }
}


resource "kubernets_presistent_volume" "pv" {
    metadata {
        name = "arhpv"
    }
    spec {
            capacity = {
                storage = "1Gi"
            }
            access_modes = ["ReadWriteMany"]
            persistent_volume_source{
                host_path{
                    path = "/tmp/pv-demo"
                    type = "DirectoryOrCreate"
                }
            } 
    }
}


resource "kubernetes_persistent_volume_claim" "pvc" {
    metadata {
        name = "pvc" 
    }
    spec {
        volume_name = kubernetes_presistent_volume.pv.metadata.0.name
        access_mode = ["ReadWriteMany"]
        resources {
            requests = {
                storage = ".5Gi"
            }
        }
    }
}

resource "kubernetes_deployment" "my-deploy" {
    metadata {
        name = "my-deploy"
        namespace = kubernetes_namespace.my-ns.metadata.0.name
        labels = {
            test = "my-deploy"
        }
    }

    spec {
        replicas = 2

        selector {
            match_labels = {
                test = "my-deploy"
            }
        }

        template {
            metadata {
                labels = {
                    test = "my-deploy"
                }
            }

            spec {
                container {
                    image = "nginx:1.7.8"
                    name = "nginx"
                }
            }
        }
    }
}