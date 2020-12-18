resource "aws_route53_zone" "osayd_io_domain" {
  name = "osayd.io"
}

resource "aws_route53_record" "osaydio_a_record" {
  zone_id = aws_route53_zone.osayd_io_domain.id
  name    = "osayd.io"
  type    = "A"
  ttl     = "86400"
  records = [aws_eip.osaydio_eip.public_ip]
}

resource "aws_route53_record" "osaydio_NS_record" {
  zone_id = aws_route53_zone.osayd_io_domain.id
  name    = "osayd.io"
  type    = "NS"
  ttl     = "172800"
  records = var.osayd_io_ns_records
}

resource "aws_route53_record" "osaydio_SOA_record" {
  zone_id = aws_route53_zone.osayd_io_domain.id
  name    = "osayd.io"
  type    = "SOA"
  ttl     = "900"
  records = [var.osayd_io_soa_records]
}


resource "aws_route53_record" "upspin_osaydio_txt_record" {
  zone_id = aws_route53_zone.osayd_io_domain.id
  name    = "osayd.io"
  type    = "TXT"
  ttl     = "900"
  records = [var.upspin_osayd_io_txt_record]
}

resource "aws_route53_record" "upspin_osaydio_a_record" {
  zone_id = aws_route53_zone.osayd_io_domain.id
  name    = "upspin.osayd.io"
  type    = "A"
  ttl     = "300"
  records = [aws_eip.osaydio_eip.public_ip]
}



