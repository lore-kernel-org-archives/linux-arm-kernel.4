Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05CD606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0iDRT/U/;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g2iKII+b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e8Blj43ZVaPOaqcnMOVJqCW/8Qzp9ZvOc8qZIEBidFs=; b=0iDRT/U/c+Hwo91mSTmCRs2rfa
	Fim4Ku4Izr/rGH3ZtzAozNuUOJTKsywM4rbdbd9Uk/8NcvSA3hDjEUYNQJmiazW5+TIXMMJ6pGNch
	MVKQMdtdadKh8ymLZFUerNJhwb5yuesVcVNv0suXcoLqwWoJO/bOupAC8+Ye1Qt3Rf0N3K9WhQp2m
	7c+zowCRJFVeJUx5nxt/G/dgSfenFEbM86mXVnmIa3FSfTRoHhsxWWLplOQVwdsu5sqtuOB4tYxvx
	X3n0BmwwTXrH+tUeMU/4UCi95ekL/8oqJf7PYsBt3WwWwboklVVm4DZzBx1KmqHNPbhDWqrz1V55B
	t+yRcBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsU6-00000004z5r-19BY;
	Tue, 10 Nov 2026 20:30:26 +0000
Received: from mail-vs1-xe62.google.com ([2607:f8b0:4864:20::e62])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQsU1-00000004z4J-2huo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 20:30:25 +0000
Received: by mail-vs1-xe62.google.com with SMTP id ada2fe7eead31-7d2d95c5d81so1675056137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342619; x=1794947419;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8Blj43ZVaPOaqcnMOVJqCW/8Qzp9ZvOc8qZIEBidFs=;
        b=WH/D0FYs/32rD2Cjq7VAoKKDRQ7dPpIasc3jSG9j0nk5ej1NISHcD0NIdISIPskyfC
         XI0HhEjpAd03uOEEff6Fw8PCMMOgJECOaQpVE5YJlvMSMY4HtZwd46kGGboUdn5yxotJ
         MtTAc6d6h6JyzAIfdjkwQX0uSs5fPeo05w7O/al3bhe9S4jGJCnGPa/VgREUVJB2mN5U
         pk9AK5HRWWUqCv9xlcNp9GX2lmHZLdpO1pZHKQIRejSXCYpkMBh7r3ro0tZq/uXRDhnG
         LVUF9Gzohr91g5G1u8Yrt+7pek4RHlH69EmSHJCVNaa4Orw3bFFMmtTaE+0fYVipdTzi
         k8lQ==
X-Forwarded-Encrypted: i=1; AL+hErEqkXpY5eOjVTeUKKYnGeXk/ymCLoTKieYg9SA6QLA0WPbpdx/uF25Qn3y9vwvUCHWXfsj+n+YZRgpOgzcDV7Cc@lists.infradead.org
X-Gm-Message-State: APuU4Z9QlljEws03AWlAMgdeTTlgtE2GybaivN4jfbz7d5H4wOyiHGwq
	ULZxWwOVglMxCKGD/0p5pkfb7v2/G8OpvBf9Bv1P3Ll69BN9+783FzYb8t72uGsFx9x8JRTmQuN
	4/pmobFAI5CCfJkBs2YN/NMNgkae8MTKlSHY6M98d7bfCko+1TEOGrCvfsFF1LKMujGkObcWxXa
	HNC/BDHujndwQQOkZ7VdYBHg82zR2X3Api8RgtZiry+EcSQS2byo3ZoXAvaaVqc7byqujGD+vbj
	eSl/LZEibnTOfpuoy5/0tAgeZ+tkto=
X-Gm-Gg: AYBFou3S3yePfH32yQB+LzQikPXnrHxqapEtfGo3HdNzkDfJfiYE22YgpGs1KjkBTXh
	B3RVBikspKT8HrC6Wy5+5ib1YCJQ1LO/Sreztx0upAMkC57pdc05XZlbKwQ+QdRkqqk1c5UF6ZD
	XdIdirF6Q4Ge/GEWAmrr/WOtDDB17olNdPEDWITDTO+H+eUQcLU2YK3knce7Act+jD0DTAP/Ti4
	3WW8dSa9OFPTazQIUY42Tl0Dnh1YEwz7aBgiAwBKPG4P3lLcAKarZFq9pdYErpJBsa6uMnAuYc3
	jldRkEoMGXcg1DDmMoG1Exw1K58yPa/oPDQaqGtKVkVTCAiYikdgSQSIiXU2fkpPeJ4j75b2J6I
	kS82XcBcNMIq8lpu1iAxcGl4Qi//95AXgewGlbd0KG/mYS0j9zjQl+qD8uGoWirc39EAoEF23og
	hMBzh0K6FEXrpzwGRzwbX+1vGs8FzIfHOSdxeB
X-Received: by 2002:a05:6102:5113:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d50619f519mr24703137.14.1794342619164;
        Tue, 10 Nov 2026 12:30:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7d302338fddsm28021137.9.2026.11.10.12.30.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 12:30:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo3574902b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 12:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794342618; x=1794947418; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8Blj43ZVaPOaqcnMOVJqCW/8Qzp9ZvOc8qZIEBidFs=;
        b=g2iKII+b/nODdme69Aw3L/cuQbm20dtJTa6fagFLx4/b+jCazTj/8wxf6o0nrPvXEw
         yAj5dV3+Y+5xFQJW3YPd8H6OQpstx92M0eSx+1HkQ9wx1P2fupso24oTqJlT0M/NwCJb
         UD4SrSxWRj7f9wiSsdkU5vTrPnAVKAEeQTtGo=
X-Forwarded-Encrypted: i=1; AL+hErESfFBMmnW5zQGOvTC6htyQ5N+cezyKKaqK5vo1mYvfGKRYVVsYTuVBuCvoByR7vIsT9r7hqNnsTF3gdKum3wc8@lists.infradead.org
X-Received: by 2002:a05:6808:1b25:b0:495:f8a5:8797 with SMTP id 5614622812f47-56866c26ee0mr1910150b6e.0.1794342618180;
        Tue, 10 Nov 2026 12:30:18 -0800 (PST)
X-Received: by 2002:a05:6808:1b25:b0:495:f8a5:8797 with SMTP id
 5614622812f47-56866c26ee0mr1910115b6e.0.1794342617599; Tue, 10 Nov 2026
 12:30:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110233450305Smji446Uhvoxa7r8SHEgl@zte.com.cn> <20261110233459277eFsXn1VXUPZl1EA9CCa5Q@zte.com.cn>
In-Reply-To: <20261110233459277eFsXn1VXUPZl1EA9CCa5Q@zte.com.cn>
From: William Zhang <william.zhang@broadcom.com>
Date: Tue, 10 Nov 2026 12:30:05 -0800
X-Gm-Features: AclHuK_JleX22zVRIqA91EWx7AC2g9xfD0FqItQwFTVyAjuP5RyQh16KDzAl-TY
Message-ID: <CAHi4H7GHGO27Q=O8Upfds8jk-ujSHU5h91hCZw6qjftNX7a2Ng@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] spi: bcmbca-hsspi: fix division by zero for
 devices without a max speed
To: shao.mingyin@zte.com.cn
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, pjw@kernel.org, 
	samuel.holland@sifive.com, kursad.oney@broadcom.com, jonas.gorski@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, anand.gore@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, 
	linux-arm-kernel@lists.infradead.org, sven@kernel.org, j@jannau.net, 
	neal@gompa.dev, asahi@lists.linux.dev, ryan.wanner@microchip.com, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000624029065ff1f2d1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_123021_733605_19F6CFEE 
X-CRM114-Status: GOOD (  20.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000624029065ff1f2d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mingyin,

On Tue, Nov 10, 2026 at 7:35=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:
>
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> A SPI device whose max_speed_hz is zero (no spi-max-frequency property,
> or created through the spidev sysfs new_device interface without a
> speed) leaves the transfer speed at zero.  spi_setup() would only clamp
> it if host->max_speed_hz was set, which this driver does not do, so
> bcmbca_hsspi_set_clk() divides by zero in DIV_ROUND_UP().
>
> On arm64 the division returns zero instead of trapping: the inner
> DIV_ROUND_UP() yields zero, which is then used as the divisor of the
> outer one, so the clock control register is programmed with a
> meaningless value.
>
> Clamp the requested rate to 1 Hz before computing the divider.
>
> Fixes: a38a2233f23b ("spi: bcmbca-hsspi: Add driver for newer HSSPI contr=
oller")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> ---
>
> diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hssp=
i.c
> index 8c01475886e8..84015110557a 100644
> --- a/drivers/spi/spi-bcmbca-hsspi.c
> +++ b/drivers/spi/spi-bcmbca-hsspi.c
> @@ -196,6 +196,9 @@ static void bcmbca_hsspi_set_clk(struct bcmbca_hsspi =
*bs,
>         unsigned int profile =3D spi_get_chipselect(spi, 0);
>         u32 reg;
>
> +       /* A device with max_speed_hz =3D=3D 0 must not divide by zero */
> +       hz =3D max_t(int, hz, 1);
> +
>         reg =3D DIV_ROUND_UP(2048, DIV_ROUND_UP(bs->speed_hz, hz));
The bs->speed_hz is typcially 200MHz,  reg(Frequency Control Word)
will be zero when hz clamp to 1.  It is not a valid reg setting.  FCW
must be 1 or larger.
The same applies to bcm63xx-hsspi driver.

However IMHO the upper layer should fail the new SPI device request
when its max_speed_hz is set to zero or maybe the spi core should set
it the max clock that the spi conroller can support rather than having
the controller driver to override with a risky 1Hz clock.

>         __raw_writel(CLK_CTRL_ACCUM_RST_ON_LOOP | reg,
>                      bs->regs + HSSPI_PROFILE_CLK_CTRL_REG(profile));

--000000000000624029065ff1f2d1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
PRi27wH/XHTDMdyL0Org+kxniXue6MSNJvcQwaLO/UQrmgTygBlVGa+Qg9ZFfS00xvuqeYH7tImO
48WiXeu9rgn5KTH0IWP1+R74KIgxJQ+65la+caZvxwC9V3ik5p/LOGA2qS4GEjGuaYF8QKhRTR4h
/QBSktqZLbzVxpjJXrqFTA2BLlYRp9hPhqNxbn46WuLufpMWhFtjUoQi/8fRRWRsMAY0o1J0f+kB
6EI8FoxPTOpvuLRonqHIWMHk5YRnDdqJ3G5Oc8zmV+UCAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEad2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFHjI7pbQZurVKsSRE/a9
7gUEyVCkMA0GCSqGSIb3DQEBCwUAA4ICAQCFA4fU1GnG8sY7kyUXp5tle+VeWveoWb272jPauU5R
w+udkhVXmnR0Kg7RgkCD00PLTKHNRyegXXDMArs3N9NhO3s9eSp9KjDh+h3WuQWCJH3QBHLGW0qE
fyV87wUtBIy/QsHwO4S8OlOZiXECR7V1EGIF6t3s0W+3UzgYeHL+Ttuhda+2wIVY0EbS0eNH9Vob
4YG17VTBBe7hyobXFpd9d1JGENFzIWncPUshOE0Wv7KlkrRc6aBOpL4p5xO1pHi9h9w8utyHkMoV
nefXixkn5YVHnuV/jbSF/IM4Mlqt0E+n/TRp2c0eR+1AauZKENV2syNBo4aMa0BkmikBjLSnDjt/
TYQdwHNWdV495n71idvueWwTFUhUsnudYcnh42eZENopBOYjVu2WhsffyrNz0hsuR85LriqSuBbf
drd9DMo3DgtfJ7hh4sEAhSw/x/Br86rfLBftZMU02htlnkOI9Tp1QuDsr9+MsqY6AjKeXAy67m7H
TVAZ9uyO9N20yU0p7igESOWKR1ccL1TPA1jrSHK18Y75ot5199FNWeE/UKoDKSML39iPZho9XPh/
/RlsfRFiVOPrI5Gwi4YfIfi0jjEWf310/CYEmA5jrp5gUQSdo/+FgfXLKDFiEHCf5b3B1l70r6bR
WkDCNNacYJWZtSp87i6jmw+l5xx7OkEJ9DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDD2ooFIye/WiO3KgZTANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
tXjb5BYFZKNuMImlxmOlyD3AkKTSJRueJMdv5b3HJxswGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYxMTEwMjAzMDE4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAUp5BS0Y7+m5dxAIkx44eESSHl2P1Upqj4zQM
lL3kE1eq+Cx0SmOPOxyUI4pyyXj92mqsA044dI/StZU6lfdIiwiD6KYLWkFthPxKO0Trmq4FVImK
o58QitCfUyyIDDIUdbJqxaNR6IuCRar+qAZNwh/5ghFmYYDInEW40aMWQULfCkA8djWsljbJWq/c
No3X+E9NTO2wMKtsJrLHLwljZsVPz6nCBKj12Hr2EhKWK2y/QVWNvrsXY8HWMKcdJvxhLcYFsg+H
gNpMu2LHh/vzwy9+xjI/QvuE6iPAhT6KqmWYa0Vjtt8RL+5/9w17ZQudpuuHySyNWC8p0MxpVnmV
ug==
--000000000000624029065ff1f2d1--

