Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92D606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n/Ol62cW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=QzIvBgdd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qtXRWZX8lyyUjDUIPQ2a+6/ACkXeGDBsZspX2iINCgA=; b=n/Ol62cWEykvgPIyFs+R7/fu9t
	23kdPpqKMfvSuJ/fLh++Y554qs6FpTXdeW6bBYuQc04VJOgZEcBAFC+wMqqxijvWYVhI0mgd4Tckr
	wpZvebECVR4hUVNE+KnFyBKj5WBq10EpnZYh4Pc/hUXPegbrT0Qt60WTz+IvmPua/FrnX/WsOZfbm
	J52OmuMDgeMqyW/XrsnQ+bwh1YDy0iHYstVFkokujninJn0TZHQxSDXNKCz/Qsmgo52piA8GXkPUZ
	hxp/A43JQjY8oOpnUjyFbPsbpLRgHpw9JnC51JcNsP3CLnMi+BA6+pjuumrNa60OohSYR7smldlHB
	2a0NcOJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwZu-0000000E524-3IkT;
	Fri, 13 Nov 2026 19:04:50 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwZn-0000000E4zT-2HeV;
	Fri, 13 Nov 2026 19:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794596673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LiRpgm1CauBflaOZwu/xXvDklze2ptyVaSygIeLvrFJAq6glWLqzwkYTbG9vhxsKSvkO/frJKcG0bx7ZrbeGD7bo3pzSntrOmzAQ5/59jTACROROHWhy+W9TBh4CQeR3ZSE+p+ibrcr5D1GeYvjrwIXCQxCPWt2soU18b4hz8yk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794596673; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qtXRWZX8lyyUjDUIPQ2a+6/ACkXeGDBsZspX2iINCgA=; 
	b=nl9kpIEy78p9NEYSa80+HxRL6PUCPbA8QS/DUzlv8xSOlKcDopyAc0BcSvyEm4QCFf13NI2KKb0GDjGxz5j4nvozhCvAWvLGe15f+Vt2a8WzvPEAJGKRF27dQQrXcA/9qCFPdk0CC/F/f1yDH/OUyn+iNtlNQsEBPVFbCWY0Z4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=QzIvBgddWuS6SrqUXrHqdqu6eG5mcK1OiWNvVcuHVyV/8uF6TG1Ek1hecXLfQOwPO1jokoxSEeIrZFLqlY2ynwumTESc6PusEYcCoujmaN6qkReLM1aCfo5iW7RjqFM6zj1wO7MGfcnVQIXbCAmCA8lmfq4T0bYUronxgwlfvH4=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=qtXRWZX8lyyUjDUIPQ2a+6/ACkXeGDBsZspX2iINCgA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794596671066492.48212326178293;
	Fri, 13 Nov 2026 11:04:31 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 6638318040C; Fri, 13 Nov 2026 20:04:27 +0100 (CET)
Date: Fri, 13 Nov 2026 20:04:27 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de, 
	Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v2 6/6] spi: rockchip: Add an atomic transfer function
Message-ID: <avddeGqlBywKn53D@venus>
References: <20261113135017.1047959-1-heiko@sntech.de>
 <20261113135017.1047959-7-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4xnodbjf6ofm7xh"
Content-Disposition: inline
In-Reply-To: <20261113135017.1047959-7-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.590.96
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110443_657993_2273791E 
X-CRM114-Status: GOOD (  18.01  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--p4xnodbjf6ofm7xh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/6] spi: rockchip: Add an atomic transfer function
MIME-Version: 1.0

Hi,

On Fri, Nov 13, 2026 at 02:50:17PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> Rockchip SPI controllers are often used to handle SPI connected PMICs that
> also handle system power-off events, like the RK806.
>=20
> When the kernel signals the power-off, all the interrupts are already
> disabled, so regular SPI with its mutexes and DMA transfers does not
> work anymore.
>=20
> Implement an atomic transfer function that does SPI transfers polling the
> controller in a loop without any DMA or IRQ.
>=20
> This can successfully handle the power-off command to RK806, but also
> read back the 2 chip-id registers just fine before that, as a test.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
> [...]
> +static int rockchip_spi_transfer_atomic(struct spi_device *spi, struct s=
pi_message *msg)
> +{
> +	struct spi_controller *ctlr =3D spi->controller;
> +	struct rockchip_spi *rs =3D spi_controller_get_devdata(ctlr);
> +	struct spi_transfer *xfer;
> +	int ret =3D 0;
> +
> +	spi_set_cs(spi, true, false);

I think it's sensible to avoid SErrors in case something went wrong
with the preparation:

if (!pm_runtime_active(rs->dev)) {
    dev_err(rs->dev, "Failed to do atomic SPI transfer due to runtime suspe=
nd\n");
    ret =3D -EIO;
    goto out;
}

> +
> +	/* make sure all interrupts are masked and status cleared */
> +	writel_relaxed(0, rs->regs + ROCKCHIP_SPI_IMR);
> +	writel_relaxed(0xffffffff, rs->regs + ROCKCHIP_SPI_ICR);
>
> [...]

Greetings,=20

-- Sebastian

--p4xnodbjf6ofm7xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr3XzAACgkQ2O7X88g7
+pqr1hAAm0ee/gMQJyENpJ51cAGCGYlcvGb5uhlcnCQO7cZUgNbg8dH/LNlGSecx
ShFkrb4mOhElluGZ4ux/ZR0AthXbo/UHCjkn4U0+AfYIJyEEl5D5gj3BSRtoRfwV
RbI6cott2k4EK77FnlnfqW4ImcSG8aMynnl6oJznDd1QZ7xSvUHuAmEoBXIr+HSB
LuWp2ofCdbf5Sh/RPJ55zlYZw3ybQKt+kHOqR6Sa50uBRoL4e+uwVpCpNS7YvDoG
PND7G0riiU0Ux3G7RG9YqN5VePSTK55+NPBZO8fMR/aUeqxJhZvniVpRm/V0XWz6
nsZl2Qk27zi/0p3WIGgpabyMUtRdUcrQTIUkHw/8z2DA7cbqK4RNmE7QY+jotUho
SKdrdMnREHBRQbWQwTvqIS7eB4q+xM/T5LlMUUya+kNE3YHpPflwXq5lLr9Ti58x
NwWnwoFOj93xqhjZbzmZXCuozkmNBn+HH1w8R2lu6jXxfBfPv2udmP6/L9ZwDM6P
k/vVQCULbpXFQHXVMyo5y0JPz7LRgHtKvUFdgHUH8qdtwh8Gf/hQ6yHJLQhcqxIB
wQzs4kNZdtG2WFvNnFqZ8UoCaYQDXnipIUtD+8045hNz60p4n0eFGw5Wc63ZroiW
Fl1xW5kPhuM7X4RS5K1LFXPxe9VBjB8oU6sNDVmGHz8utu8avpM=
=2Pc0
-----END PGP SIGNATURE-----

--p4xnodbjf6ofm7xh--

