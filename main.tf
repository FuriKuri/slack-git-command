provider "digitalocean" {  
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "docker" {  
    image = "docker"
    name = "docker"
    region = "fra1"
    size = "1gb"
    ssh_keys = [
    	"${var.ssh_fingerprint}"
    ]
    connection {
        user = "root"
        key_file = "${var.key_path}"
    }
    provisioner "remote-exec" {
        inline = [
           "docker run -d --name world furikuri/terra-world",
           "docker run -d -p 8080:8080 --name hello --link world:world furikuri/terra-hello",
        ]
    }
}

resource "digitalocean_record" "terra" {
    domain = "furikuri.net"
    type = "A"
    name = "terra"
    value = "${digitalocean_droplet.docker.ipv4_address}"
}