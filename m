Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0679606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L7KYmXqS;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pP0xXnt5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=duB+53Rzo/I6JCkMTJRwR1f6X11DgAhC6/nYlh9cR8c=; b=L7KYmXqSVG8pRPFO8icORjocZD
	YzPCnlbv/gTtWewka366fD/bhSRueJ1MKlVj/aea97CfSYiTzMbpXbASi9/tnTU2e5W1BqmnxlyTQ
	yAFYoPRTVyr23mTqDJw01P3Xvwd7Api2nexUJfsU4/Tc4iNMsxPf/2XOAcud5/baXxDLBMxjTGOR4
	jUU2IuLON94imgV6j0Ym/Iujp+QxilrFssWptxPEciMV2gDZsiEcSA5Y4dyZbNnx0TGHb/23EQQ3I
	hplKfMHyVvBnfaRpkaKHqsTMkUVqeJHtNVOAyMdomxs8At0aT6lChWCOQss4VsrPBRg6Ufszmh4aN
	4AE5YSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsnB-00000001jxU-177j;
	Mon, 16 Nov 2026 09:14:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsn8-00000001jx0-0LwG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 09:14:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so8466345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794820460; x=1795425260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=duB+53Rzo/I6JCkMTJRwR1f6X11DgAhC6/nYlh9cR8c=;
        b=pP0xXnt59Z0bceoPC46+98x7L+2PhrK3Z8dOcSLPqRiY+qYey4wYQAD7AaswqX75Sd
         ApBN51wri3lZjgjX9N6xj6QKjUmQqkKCATDHycGqJMv7tpCluk8C81aQf1dbdTQ+uch3
         aTrQbbGvt1GUCPYGHQNdkqbpG9p/o9ZmehRMpVkPsjsyC7LeFR4AVF9dqcZlRSqouoMp
         nD+fiGxKWL9tiDg4PnljDUhfTgd5JJDAsf4+4UYH6tKrKhdE63kr5vwliFkyXKXNW09/
         pdo+gji0K0x/6YEokNh97mTKO+9wUyvZm81ZEuqkC5dxgPdmhVFHcNkVetCorJ9BxqIh
         4kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794820460; x=1795425260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duB+53Rzo/I6JCkMTJRwR1f6X11DgAhC6/nYlh9cR8c=;
        b=Z2wjTKf7jAb/p7T6v3gqifHLcx+wmeIelF39MuWk9GVu+wvXBu1zPQeWc52ufcQxG3
         W5WhoPVJNJKgY0yzaQzdD2y92R5dmE7z15hXXArPxMvqcT1Y+zXXzGdxHUH5MrQuYuAH
         1O6j3wXIrf2YW6tZfgazvmNQ/kI+wJ2FHeL6JO/S8N7vCoBOoctKcKf73ATAp6TxSv2w
         t6N9g2NSi7ZxWCBDa1aB42PUpH7ZNxNoMG5PrWRvCIwTaSmq6fAlGItZO9oMKca9ttI0
         yig+CqfITTIdL9S7uKFJxDORUnbSQX0jvPHYZIL85jlrTY10cNZ5RzE3FbsZI4jWN8vf
         kfww==
X-Forwarded-Encrypted: i=1; AL+hErFmY3EpfKkm2QJQFaj31rFsCjwXPDNMuQdIzvyFfPneWOtUE8ZjkYyaYNecwC5Qjcg3ab0nRQCfy+CuQOsGqaWr@lists.infradead.org
X-Gm-Message-State: APuU4Z8uo3eF2OFHL9xbEHJ9sWzQb0aRoZa4yEwPMu5gsLbeCn9tRSeO
	T9Ikx0cistnJLVVwAwR235K8uuooIikconMmRgIM/d0h8JF7XeZBEL3wgCAmi24BlFE=
X-Gm-Gg: AYBFou1HZlZRHa8daofSqtww42SoSFEo7RxBKPyZPWIY3dW/vTO/ZTKlHSq/nfx9HG6
	uM2iVhqqx8iy7eoseAqq45ms4QA9ZH55zJgV3EpufxU7CCBxjHvplC51ildqNNOMj4ib8mCb/xH
	cpleCnnybfUJ25WU1eIA9SUSik7POiAQOvQhCrUgsDepqoVNCTW2hbah7E/swG2549JskE2xdw8
	nSx2NTZ4Q4zGNeJ4rmlAuCjLfjKQy67+PPitUUPVw3ifzGEGGmdfBEf10+RAau8/uYgurjOBGyA
	zitVi+OQXXXWF7V0M+jh2W7THeM8uPOivbqMDkceoZMp3hnctNY1t8J3WiLygpTm80PTHFpODxm
	+YRQqo73eu0f2a0JKWbdjsbi62SwMdPPXA6DqEhDLToko1uyN19mgadE54YC7LBtiJA+7sG+pgq
	2g+FYlLseJJPp2r/aJGS0AWk0gLp/LknSe87JXSFrljiJbjp8QyTFEPXZKWlv2aC2/4xlTGPplW
	dCzrxmJmPHdrP8dKdGJ/6GvEUDyJCMP8pi3B2pOmZ53GtSkQ5e/tmQj3IRYWuXcDjBZQzJt3Iu2
	Li4qxUSdpNUnLS0NrlNLJBtG4gbvON/wcqSrvk/2DYHJ4pPOuUk8hdXdClVXa2NZCAE5iAbI/pW
	V5CJt3VMD7Dki1JI9nw==
X-Received: by 2002:a05:600c:1d10:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb55a65ea5mr192703955e9.5.1794820459865;
        Mon, 16 Nov 2026 01:14:19 -0800 (PST)
Received: from localhost (p200300f65f19a9042c263c0c153a4e28.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2c26:3c0c:153a:4e28])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb5faf05f8sm159998655e9.10.2026.11.16.01.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:14:19 -0800 (PST)
Date: Mon, 16 Nov 2026 10:14:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, kernel@pengutronix.de, 
	linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
Message-ID: <avrHkaYw-De6nv8B@monoceros>
References: <20261114-fix-device_get_match_data-v1-0-2d82025e9646@pengutronix.de>
 <20261114-fix-device_get_match_data-v1-2-2d82025e9646@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3kbn6dvhzgm4gtvf"
Content-Disposition: inline
In-Reply-To: <20261114-fix-device_get_match_data-v1-2-2d82025e9646@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_011422_168783_BB0726C4 
X-CRM114-Status: GOOD (  25.76  )
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


--3kbn6dvhzgm4gtvf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH can 2/4] can: flexcan: flexcan_probe(): fix probing for
 m68k/coldfire and reject devices without match data
MIME-Version: 1.0

Hello Marc,

On Sat, Nov 14, 2026 at 01:56:15PM +0100, Marc Kleine-Budde wrote:
> When determining the device details was reworked in commit 5e6c3454b405
> ("net: can: Use device_get_match_data()") there was no replacement for the
> previous handling of non-of instantiated devices via the device's id_entry
> which then results in a NULL pointer exception. The only in-tree provider
> of such a device is arch/m68k/coldfire/device.c.
>=20
> Restore retrieving the devtype_data via platform_get_device_id().
>=20
> Also a device bound through driver_override need not match an entry in
> of_match_table or id_table. In that case device_get_match_data() returns
> NULL, but flexcan_probe() dereferences the result.
>=20
> Reject devices without match data before continuing probe.
>=20
> Fixes: 5e6c3454b405 ("net: can: Use device_get_match_data()")
> Cc: stable@vger.kernel.org
> Reported-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Closes: https://lore.kernel.org/all/20260618140147.142489-2-u.kleine-koen=
ig@baylibre.com/
> Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
> Closes: https://lore.kernel.org/all/20260528-fluorescent-sage-ladybug-432=
61b-mkl@pengutronix.de/
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index 86b40abe9e76..2bb9e4184eb5 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -2148,6 +2148,11 @@ static int flexcan_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(regs);
> =20
>  	devtype_data =3D device_get_match_data(&pdev->dev);
> +	if (!devtype_data && platform_get_device_id(pdev))
> +		devtype_data =3D (struct flexcan_devtype_data *)
> +			platform_get_device_id(pdev)->driver_data;
> +	if (!devtype_data)
> +		return -ENODEV;

My stance is that the ability to bind an "unexpected" device via
driver_override is something that should be handled in the core, see
https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.179061=
2298.git.u.kleine-koenig@baylibre.com/
for the latest patch to address this. I'll work on this patch to
hopefully get it into v7.5-rc1. IMHO it's ok to not fix this in a driver
specific way now. (And then my patch referenced above in the first
Closes:-trailer is IMHO better than this patch.)

Best regards
Uwe

--3kbn6dvhzgm4gtvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr6yV8ACgkQj4D7WH0S
/k4KnAf+I1gQa7nnydreBqpl18qr3bjlMpNbM/wcIEtGP3xMBPkpDX2yJFljOI8k
9TayfHIOvCINmFKVvL4sioue78+dQP56QUAmZGMHZNnQd4W/38CNi+PxKIqgsV74
yoJHlZhYsHSMLMsf8oAIKAGhkVtpziLJ88i2Yc2ghjZ7erYkKrSuBc+jFTFzI4tM
OknkKdfObSLN1TAr5lJYpnpvCn6HNJOkz//vLAgu6wAYdV9WtAd0wrkm/4tFcfir
MpB/Cw/PNtHNAZWiKPL50rum+ferNUNUzHrRAEx38UA5Sj1Nz4MQonl0UUVFoPIr
tgcOC5iCUQKdoIJu+AnDEx5AuRV1Dw==
=98Fb
-----END PGP SIGNATURE-----

--3kbn6dvhzgm4gtvf--

