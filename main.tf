provider "digitalocean" {  
    token = "${var.do_token}"
}

resource "digitalocean_droplet" "slack" {  
    image = "docker"
    name = "slack-git"
    region = "fra1"
    size = "512mb"
    ssh_keys = [
    	"${var.ssh_fingerprint}"
    ]
    connection {
        user = "root"
        key_file = "${var.key_path}"
    }
    provisioner "remote-exec" {
        inline = [
           "docker run -d --name slack-command -p 80:8080 furikuri/slack-git-command",
        ]
    }
}

resource "digitalocean_record" "slack-record" {
    domain = "furikuri.net"
    type = "A"
    name = "slack"
    value = "${digitalocean_droplet.slack.ipv4_address}"
}