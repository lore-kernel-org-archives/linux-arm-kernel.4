Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B11606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fzxAimeN;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=mfLkeLyp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5hBiRR3uvhlqcGyHW7g80rM4DQMM7cCTGVY4OSFhmyo=; b=fzxAimeNhWazB86EPYc6o3BZix
	51mJWgrV0opQJ1c6EfjDc0EaRhx2aIXh2qDVAmkgBVj2v/gBGpdjven0+y1hmiO2IYkclo3JWthO9
	Ul9j+RLxrBQ8kkeRhE2BPRae/W7C1pNkdpWJdO+1Rzg14oQzQkyynwzXdffFqpxqDV7+6ZREte1bA
	C26nHJjntSoNQ2qxUPnEG9tMWIicri8LYHhXxHWPYsTpl03F/PE4VL/dKnlgfNhg1DQFk/8e8lCMq
	C5W6TZocD0rJCxCaxwO/1dwxKtJHStcA6HCeCZlXdR/9IbLR6NXB4RffpqaHEZXWTvUKibkF/w8MR
	GFlpxPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6yl-0000000D1QY-2zGG;
	Thu, 19 Nov 2026 18:35:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6yi-0000000D1Pe-3vPC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795113322;
	bh=PtkjMJxHJnazgCHS2pnc/zi0BG90FbjTzcafaQp3k/g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mfLkeLypR+LQoCVSxoXfM7L6HGYOOKdDfv4CkkBaVejLFDifoR4yaSPwg638W/Ftp
	 MC7VhltkNZPC2Gv6//sMXHz9ziRkLeNYXTsZGW4wnZDD4/lHzNZhUxqCI6OzCiyXeb
	 lsQ/OejEfa1FhAY6HgNEI6t3+o0kaKwHchWo80qVricLa594YxS33h1pjEgYoF4/+p
	 wXr6zyM/OKtUTP/NWmvWlZ/A261Z4a7D67XUfitb8F7p+dk24S54a8qlFqVr7P7y5O
	 5V/X5yxk7JcfAFM0VAix5TwKJfuwseFvPwGOmDmy+uKtnsZ0sqx/EIN81OZ2jaui8a
	 QVO6xEJ3ebQEA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7AEC717E052F;
	Thu, 19 Nov 2026 19:35:20 +0100 (CET)
Message-ID: <e323dfe8a9b848833332599d6d5df6d302b5fd20.camel@collabora.com>
Subject: Re: [PATCH 3/3] media: mediatek: jpeg: cancel job timeout work
 before m2m release
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Shengzhuo Wei <me@cherr.cc>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Ming Qian <ming.qian@nxp.com>,  Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, irui
 wang <irui.wang@mediatek.com>,  kyrie wu <kyrie.wu@mediatek.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Date: Thu, 19 Nov 2026 13:35:18 -0500
In-Reply-To: <20260825-media-timeout-work-v1-3-ebfebbeb6c31@cherr.cc>
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
	 <20260825-media-timeout-work-v1-3-ebfebbeb6c31@cherr.cc>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rr4R+OXCofjTXy4WSX5A"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_103525_134859_EE249129 
X-CRM114-Status: GOOD (  17.49  )
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

--=-rr4R+OXCofjTXy4WSX5A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 25 ao=C3=BBt 2026 =C3=A0 03:34 +0800, Shengzhuo Wei a =C3=A9crit=
=C2=A0:
> Each job arms jpeg->job_timeout_work, cancelled only by the IRQ
> completion path. If a job stalls, mtk_jpeg_remove() frees
> jpeg->m2m_dev via v4l2_m2m_release() with the timeout still pending,
> and mtk_jpeg_job_timeout_work() then dereferences the freed m2m_dev
> and the stale ctx it returns -- a use-after-free.
>=20
> Drain the work before the m2m device is released. The device-level
> job_timeout_work was missed by the earlier fix for ctx->jpeg_work.
>=20
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec48308110ae8520662e182dc0445447d8d0..f0fe14e83d515f5011cbfe051=
abbf565568013d0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1405,6 +1405,7 @@ static void mtk_jpeg_remove(struct platform_device =
*pdev)
> =20
>  =09pm_runtime_disable(&pdev->dev);
>  =09video_unregister_device(jpeg->vdev);
> +=09cancel_delayed_work_sync(&jpeg->job_timeout_work);

A similar fix was made by Fan We, instead of doing it in remove, it actuall=
y
sync on the delayed work in stop streaming:

https://lore.kernel.org/lkml/20260623103031.3051-1-fanwu01@zju.edu.cn/

This way, whatever gets added in the timeout later won't possibly outlive t=
he
instance. Might be just extra cautious for this specific driver, but I'd ra=
ther
fix it once, then having this fixed again later.

In some ways, your Sashiko review tends to verbosely lean toward this.

Nicolas

>  =09v4l2_m2m_release(jpeg->m2m_dev);
>  =09v4l2_device_unregister(&jpeg->v4l2_dev);
>  }

--=-rr4R+OXCofjTXy4WSX5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9BZgAKCRDZQZRRKWBy
9GVlAQCOGnpSOIJSn4V/Ho12zuZ5598wym0rXnC1VlAS9AoqvQEAsOTBEYfjI0RJ
PU17Ybkq4kAlomadhU0ku0C5hgSy+g4=
=Kc9h
-----END PGP SIGNATURE-----

--=-rr4R+OXCofjTXy4WSX5A--

