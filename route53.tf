data "aws_route53_zone" "bdnetlabs" {
  name = "aws.bdnetlabs.com"
}

# resource "aws_route53_record" "ecr-repo" {
#   zone_id = "${data.aws_route53_zone.bdnetlabs.zone_id}"
#   name    = "ecr-repo"
#   type    = "CNAME"
#   ttl     = 60

#   records = [aws_ecrpublic_repository.network_lab_ecr_repo.repository_uri]

# }

resource "aws_route53_record" "ecr-repo" {
  zone_id = "${data.aws_route53_zone.bdnetlabs.zone_id}"
  name    = "ecr-repo"
  type    = "A"
  ttl     = 300
  records = [aws_ecrpublic_repository.network_lab_ecr_repo.repository_uri]
}