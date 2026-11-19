Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EB9606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W7EE/FRO;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EsDyivMI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JprwgG+NEk2FTjcJI4t2Pw8Ze4AsYlSKIUip5mmZbJo=; b=W7EE/FROyFlapAcyiSVuoDyhGn
	wI96Qzq4GuW2EKJBQuKA9Y8x+24KAcZZRPYJREFvt6EOhkm/kYKH+3KvR5vjbUnJnbVX7LFM2wNY1
	T8nu67VBRXlnEtDovoxxEE9taeaDTf8eU5ge7pDvcrzIe5+dExGoFxo5bDdniuwY+BEb3hjY0MeQg
	dLKu+x34dphNZFqxmBC9SMehmYcfkqqdpeaw41pTmYl0TKovEiKMyRKCOATVs4lrWl6s21QBONrgR
	3+e62Hp7nCewvt6qaqwRWO33HRL90Q9WS4rC4iGItd55kEhX3ZIwacFHAFrif3kQDJ+ZCLwKwweZh
	ZLH+ipwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU613-0000000CqrD-2YBm;
	Thu, 19 Nov 2026 17:33:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU610-0000000CqqG-3GDP;
	Thu, 19 Nov 2026 17:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795109620;
	bh=WJPy40VEOSAO0GUwtc1nWihDuWaTTKs81lOLDgGBDV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EsDyivMIxIQS/u1BYCeSSWMLO+fK5dgZW4z+kYvbjIwLs1/GPp8/Slqmmg58aOoVs
	 Rk97I9AIs0FJAl26fg+50sjt12XWpn1QEuHHa0aT65sy0m4aWmxFnAI2hvBNbISHbp
	 CSgi3EQS7+umRAMGQ4oEwyJ0fVfvFQzV5DX/G9dRANRlkN0cl7OPg87Dr9cZCZN5M4
	 jUrC1GXyoojzN/k/VkuEaemTODn0CUOuyxtapU5EcmwyGzfu+g20o1cME7dFu3TYc0
	 +Iq9EamuQhxbL1izzxe/U4irHzf6NQvfCJjUspvIKZlFFgwj2p0SgG/tEzpfq8vuqZ
	 PeHia5coqZu6w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF7B017E0406;
	Thu, 19 Nov 2026 18:33:38 +0100 (CET)
Message-ID: <33293a67f1427fdca259fd58ebfb463836c4c2c3.camel@collabora.com>
Subject: Re: [PATCH v2 1/5] media: rkvdec: Keep RCB to the correct size
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 12:33:37 -0500
In-Reply-To: <20260810-rkvdec-multicore-v2-1-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
	 <20260810-rkvdec-multicore-v2-1-986f89d22cdc@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-432baZftEOgt8FKhQjyk"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_093342_972566_A2047E5E 
X-CRM114-Status: GOOD (  23.22  )
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

--=-432baZftEOgt8FKhQjyk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> Currently, if a video changes resolution, the RCB size might be too small
> and the HW could try to write out of the allocated buffer.
>=20
> To fix that, make sure that the RCB size is validated for each run and
> increase the buffer size when needed.
>=20
> Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    | 26 +++++++++++++++-=
--
>  .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |  3 ++-
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 31 +++++++++++-----=
------
>  3 files changed, 40 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> index fdcf1f177379..191f78278c01 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.c
> @@ -17,6 +17,8 @@
>  struct rkvdec_rcb_config {
>  =09struct rkvdec_aux_buf *rcb_bufs;
>  =09size_t rcb_count;
> +=09u32 width;
> +=09u32 height;
>  };
> =20
>  static size_t rkvdec_rcb_size(const struct rcb_size_info *size_info,
> @@ -40,6 +42,21 @@ int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx)
>  =09return ctx->rcb_config->rcb_count;
>  }
> =20
> +bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx)
> +{
> +=09struct rkvdec_rcb_config *cfg =3D ctx->rcb_config;
> +
> +=09bool ret =3D cfg && cfg->height >=3D ctx->decoded_fmt.fmt.pix_mp.heig=
ht &&
> +=09=09   cfg->width >=3D ctx->decoded_fmt.fmt.pix_mp.width;
> +
> +=09if (!ret && cfg) {
> +=09=09dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width, cf=
g->height,
> +=09=09=09ctx->decoded_fmt.fmt.pix_mp.width, ctx->decoded_fmt.fmt.pix_mp.=
height);
> +=09}

I'm not asking to respin for that, but it would be easier to review in this
form:

=09struct rkvdec_rcb_config *cfg =3D ctx->rcb_config;

=09if (!cfg)
=09=09return false;

=09if (cfg->height < ctx->decoded_fmt.fmt.pix_mp.height ||
=09=09   cfg->width < ctx->decoded_fmt.fmt.pix_mp.width) {
=09=09dev_dbg(ctx->dev->dev, "RCB size %ux%u -> %ux%u\n", cfg->width,
cfg->height,
=09=09=09ctx->decoded_fmt.fmt.pix_mp.width, ctx-
>decoded_fmt.fmt.pix_mp.height);
=09=09return false;
=09}

=09return true;

> +
> +=09return ret;
> +}
> +
>  void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
>  {
>  =09struct rkvdec_dev *dev =3D ctx->dev;
> @@ -77,14 +94,15 @@ void rkvdec_free_rcb(struct rkvdec_ctx *ctx)
>  =09=09devm_kfree(dev->dev, cfg->rcb_bufs);
> =20
>  =09devm_kfree(dev->dev, cfg);
> +
> +=09ctx->rcb_config =3D NULL;

nit: Just conceptually, I'd do that before free, not after (no need to resp=
in
either).

>  }
> =20
> -int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
> +int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
>  =09=09=09const struct rcb_size_info *size_info,
>  =09=09=09size_t rcb_count)
>  {
>  =09int ret, i;
> -=09u32 width, height;
>  =09struct rkvdec_dev *rkvdec =3D ctx->dev;
>  =09struct rkvdec_rcb_config *cfg;
> =20
> @@ -105,8 +123,8 @@ int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
>  =09=09goto err_alloc;
>  =09}
> =20
> -=09width =3D ctx->decoded_fmt.fmt.pix_mp.width;
> -=09height =3D ctx->decoded_fmt.fmt.pix_mp.height;
> +=09cfg->width =3D width;
> +=09cfg->height =3D height;
> =20
>  =09for (i =3D 0; i < rcb_count; i++) {
>  =09=09void *cpu =3D NULL;
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> index 30e8002555c8..0662a4359bdf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-rcb.h
> @@ -20,10 +20,11 @@ struct rcb_size_info {
>  =09enum rcb_axis axis;
>  };
> =20
> -int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx,
> +int rkvdec_allocate_rcb(struct rkvdec_ctx *ctx, u32 width, u32 height,
>  =09=09=09const struct rcb_size_info *size_info,
>  =09=09=09size_t rcb_count);
>  dma_addr_t rkvdec_rcb_buf_dma_addr(struct rkvdec_ctx *ctx, int id);
>  size_t rkvdec_rcb_buf_size(struct rkvdec_ctx *ctx, int id);
>  int rkvdec_rcb_buf_count(struct rkvdec_ctx *ctx);
> +bool rkvdec_rcb_buf_validate_size(struct rkvdec_ctx *ctx);
>  void rkvdec_free_rcb(struct rkvdec_ctx *ctx);
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e9..31ddfcc58894 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -978,8 +978,7 @@ static int rkvdec_start_streaming(struct vb2_queue *q=
, unsigned int count)
>  {
>  =09struct rkvdec_ctx *ctx =3D vb2_get_drv_priv(q);
>  =09const struct rkvdec_coded_fmt_desc *desc;
> -=09const struct rkvdec_variant *variant =3D ctx->dev->variant;
> -=09int ret;
> +=09int ret =3D 0;
> =20
>  =09if (V4L2_TYPE_IS_CAPTURE(q->type))
>  =09=09return 0;
> @@ -988,20 +987,8 @@ static int rkvdec_start_streaming(struct vb2_queue *=
q, unsigned int count)
>  =09if (WARN_ON(!desc))
>  =09=09return -EINVAL;
> =20
> -=09ret =3D rkvdec_allocate_rcb(ctx, variant->rcb_sizes, variant->num_rcb=
_sizes);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09if (desc->ops->start) {
> +=09if (desc->ops->start)
>  =09=09ret =3D desc->ops->start(ctx);
> -=09=09if (ret)
> -=09=09=09goto err_ops_start;
> -=09}
> -
> -=09return 0;
> -
> -err_ops_start:
> -=09rkvdec_free_rcb(ctx);
> =20
>  =09return ret;
>  }
> @@ -1174,6 +1161,20 @@ static void rkvdec_device_run(void *priv)
>  =09=09return;
>  =09}
> =20
> +=09if (!rkvdec_rcb_buf_validate_size(ctx)) {
> +=09=09rkvdec_free_rcb(ctx);
> +
> +=09=09ret =3D rkvdec_allocate_rcb(ctx,
> +=09=09=09=09=09  ctx->decoded_fmt.fmt.pix_mp.width,
> +=09=09=09=09=09  ctx->decoded_fmt.fmt.pix_mp.height,
> +=09=09=09=09=09  ctx->dev->variant->rcb_sizes,
> +=09=09=09=09=09  ctx->dev->variant->num_rcb_sizes);
> +=09=09if (ret) {
> +=09=09=09rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +=09=09=09return;
> +=09=09}
> +=09}
> +
>  =09ret =3D desc->ops->run(ctx);
>  =09if (ret)
>  =09=09rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);

So unless there is things to fix on other patches (or someone else oppose),=
 you
can leave it like that:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-432baZftEOgt8FKhQjyk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav8y8QAKCRDZQZRRKWBy
9BumAPkB2HVLDgFsxDKB+7JkBx8lf7USZ7kCrTz7L/IsFzQ4jgD5ARqICVVK2JNX
L2aZh2zt+ABHCAb19y0Lttaq5+ZVfwA=
=lbTL
-----END PGP SIGNATURE-----

--=-432baZftEOgt8FKhQjyk--

