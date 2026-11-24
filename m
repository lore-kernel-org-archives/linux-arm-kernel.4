Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F3606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vc3lA/6h;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FHduV5Tc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z+py48lalXA1WDHXuBsD9SSl+W/lJz5GxTkb9bOKUJA=; b=Vc3lA/6hA0EuwYEd5zf5k+WtHH
	Woeu4Ua0Uvx9Y8DhYGRENTfQbxYi7G8tDe+IA9ze8Yc8nSc8BOlYeK1SfNE5ypJOUfO3JANxTRosa
	uuMJhhumzFVSJPv39jZw2mhGazWBrZdnU1A68pQHLkDu3CrArkvSUVFBybXxLFiKRBSDDfgVFQ6C4
	432g8qat+5/ao8HaUdFB1a3P/mTIaD+bHcAREpYeJpe/mHDrVljB4m3kk5gZkaoPktyn8jMHW4UHD
	x6hFrxkaCuvB4QTsr/zRgeb+5VInspk8833UKjyNwStYy/idk7TngljDqaDKGR5ZBevoeMq7FvWY9
	FVSkwN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxsP-00000007q0v-0Ceu;
	Tue, 24 Nov 2026 21:16:33 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxsJ-00000007pye-0o7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:16:28 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-94961bfe1a0so330793885a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554986; x=1796159786; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+py48lalXA1WDHXuBsD9SSl+W/lJz5GxTkb9bOKUJA=;
        b=FHduV5TcdCw14UwgHAtmtSksLKol0o3kmolTOqs0O3dGBcrZH3nK/SEtrpOJd3vz/I
         +I9of88JdswLJ8d85UiSzIfoN8tT34MXpo+VR4rVxsASmOcArd6YUhIAHWyqYu/56Dzy
         J0+ggQg6dORCMmgpg0IkhU/GRgtUaBzI2xReX4mr1bwShYGLdKYMYr24nlg3PkXlvGT2
         WEhqFfKdb2enwl51eaKw4Gi8pyWLPPyvKQC94bh8PxKXGGgzA4xFQJjUbkU1st5OPWeR
         RDytsBLwj7Fx5SHr7Gn8EyVl89N6n4tx2ThpsBqgtvjcHbgFLs67eOalJ7dvBH7jyJsf
         NpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554986; x=1796159786;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+py48lalXA1WDHXuBsD9SSl+W/lJz5GxTkb9bOKUJA=;
        b=gVv7EjjZIM5bnNWkfaKruJxy6OFWhaA9h/d3KVRBwHAVJp66Vskf5WKYXxjBsJ9PMI
         kdFCSaanECFHVngYEvgmlWrU4bF65yMA+IO0iyec6dl3xMGx8lTJFFFAHfeTelLr8uVF
         ZcfIZ9J3ieW5kgbBkDnPseFYAg2OUgGoCgC8aLxF0ISAViPSrLyth0WIiIcLHBuddBMg
         +fR/DKhtWdkO2jzHeS721QXP1DhWfPdCfqmnwVKjQsxJwDX29QbLOyD9sw4rQIKJdEkO
         95TJiC2RqaGiBXN+Da71GfYo+lO2E33CY0FRLkc/fogVbKi3nO5BqLxNDqpVFTSw7aMa
         bUww==
X-Forwarded-Encrypted: i=1; AL+hErFKAQX1GL1XrN6h70SdSSEOZ5+nBy2UDqnzUgVo79FRO7cm612ZmiiSeRXc19ztLX+WkVPFsd02ZizYg4HXzNhs@lists.infradead.org
X-Gm-Message-State: APuU4Z89QKGWMnpsL6Vd/7F3yPKhpGreobHXgHGQSgV4617b/8D867nq
	I3YNFmqcxwoXRIoB1QCV4P2Z68BMIrtsj265BD0VU5rmckh8ykySQ3UA3d7g29TV5X0=
X-Gm-Gg: AZFdTZesI5srKzzycUHPY0VsMF0A8yC2/HzV0mqrfTGMwHrSqg+DWZWr9iIV1TD0cCx
	8tr4tH/Ca4onX4iOP6JAEDtw73cPvqBj3oU7adU3bgJShNmyDl7StLpKtS/gRzRl0paF4BsiGjy
	KhWI25VI7eNE8z2HoaAsnRNu9/FoOKZ/8e8dZwo9r4rxl5t171yrvbNsqnr2TH3UGoQF/Sul2+K
	KE/nHNUjqv3ZrM07ai3k+6PDKOSL+sAD0vSOpRKhEfLc5bvRqlsDBYII71F71rUvV3o8tplE78/
	5tP49DeHCi0icbq/Rr/C1bgGsYBXUnB9vV+J0HwzFbr9MYhBC2hKWqsV8gGde5LmdeGd8fWRbJ9
	M+AsVqAGms6DMOh1LtXJ7OjYeeE/y7A9l/5ouAChi+Q6OjHhq1RkcpimuNeoEzOXFULvClu8iZw
	b833+KQnbSvFcVOkHCcgy2q02R6NYdeLnDm9j2qGeeZrTwxFYmBSdsROM4YL4FoYFLu6HYjKyXo
	rrrQrJ+arFKX1s+EH78Od2ZBROxoGIScs8OiS0P1SYUOfO8FvFgwgO4FdGuOAY+T53OzHEjuOqE
	zvW2DnuUqTuvVys6YGwZIva26K+6vQaml9Efo3T9Tsd4qUIqIekRep4=
X-Received: by 2002:a05:620a:4714:b0:949:60f3:1cdc with SMTP id af79cd13be357-949ba8260e7mr3044605585a.10.1795554985695;
        Tue, 24 Nov 2026 13:16:25 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca846322sm960970785a.34.2026.11.24.13.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:16:25 -0800 (PST)
Message-ID: <952785d9eeadbd0f5d448a264ec0438a71f8d8bd.camel@ndufresne.ca>
Subject: Re: [PATCH v2 10/17] media: rockchip: rga: add rga_core structure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 16:16:24 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-10-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-10-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LUk+buoFZ9npV6snsjJ6"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131627_321807_A1F3E36B 
X-CRM114-Status: GOOD (  23.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-LUk+buoFZ9npV6snsjJ6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Add a rga_core structure to separate the core specific data from the
> m2m device. This is done in preparation for multi-core support, where
> multiple identical cores are exposed as a single m2m device to the
> user-space.
>=20
> Allocation related calls are explicitly done on the first core, as the
> scheduling decisions will be made on demand after the buffers have been
> allocated and filled.
>=20
> In preparation of storing the rockchip_rga struct on a dedicated master
> platform device, the rga_core struct is allocated on it's own and only a
> pointer is saved in the rockchip_rga struct.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v2:
> - fixed NULL pointer dereference of devm_kzalloc (pointed out by Sashiko
>   and Nicolas)
> - removed unintended whitespace deletion
> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c |   4 +-
>  drivers/media/platform/rockchip/rga/rga-hw.c  |  32 ++++----
>  drivers/media/platform/rockchip/rga/rga.c     | 105 +++++++++++++++-----=
------
>  drivers/media/platform/rockchip/rga/rga.h     |  38 ++++++----
>  drivers/media/platform/rockchip/rga/rga3-hw.c |  24 +++---
>  5 files changed, 110 insertions(+), 93 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index 3f7c3c68e0cb8..47a8d5a4500a3 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -93,7 +93,7 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  =09n_desc =3D DIV_ROUND_UP(size, PAGE_SIZE);
> =20
>  =09rbuf->n_desc =3D n_desc;
> -=09rbuf->dma_desc =3D dma_alloc_coherent(rga->dev,
> +=09rbuf->dma_desc =3D dma_alloc_coherent(rga->cores[0]->dev,
>  =09=09=09=09=09    rbuf->n_desc * sizeof(*rbuf->dma_desc),
>  =09=09=09=09=09    &rbuf->dma_desc_pa, GFP_KERNEL);
>  =09if (!rbuf->dma_desc)
> @@ -191,7 +191,7 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
>  =09if (!rga_has_internal_iommu(rga))
>  =09=09return;
> =20
> -=09dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc),
> +=09dma_free_coherent(rga->cores[0]->dev, rbuf->n_desc * sizeof(*rbuf->dm=
a_desc),
>  =09=09=09  rbuf->dma_desc, rbuf->dma_desc_pa);
>  }
> =20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index 190104f3b2954..9a5da4e1716ca 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -417,10 +417,10 @@ static void rga_cmd_set_mode(struct rga_ctx *ctx)
>  =09dest[(RGA_MODE_CTRL - RGA_MODE_BASE_REG) >> 2] =3D mode.val;
>  }
> =20
> -static void rga_cmd_set(struct rga_ctx *ctx,
> +static void rga_cmd_set(struct rga_core *core,
>  =09=09=09struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
>  {
> -=09struct rockchip_rga *rga =3D ctx->rga;
> +=09struct rga_ctx *ctx =3D core->curr;
> =20
>  =09rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>  =09/*
> @@ -434,10 +434,10 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>  =09rga_cmd_set_src_info(ctx, &src->dma_addrs);
>  =09rga_cmd_set_dst_info(ctx, &dst->dma_addrs);
> =20
> -=09rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> +=09rga_write(core, RGA_CMD_BASE, ctx->cmdbuf_phy);
> =20
>  =09/* sync CMD buf for RGA */
> -=09dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +=09dma_sync_single_for_device(core->rga->cores[0]->dev, ctx->cmdbuf_phy,
>  =09=09=09=09   PAGE_SIZE, DMA_BIDIRECTIONAL);
>  }
> =20
> @@ -447,36 +447,34 @@ static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx=
)
>  =09rga_cmd_set_trans_info(ctx);
>  }
> =20
> -static void rga_hw_start(struct rockchip_rga *rga,
> +static void rga_hw_start(struct rga_core *core,
>  =09=09=09 struct rga_vb_buffer *src,  struct rga_vb_buffer *dst)
>  {
> -=09struct rga_ctx *ctx =3D rga->curr;
> -
> -=09rga_cmd_set(ctx, src, dst);
> +=09rga_cmd_set(core, src, dst);
> =20
> -=09rga_write(rga, RGA_SYS_CTRL, 0x00);
> +=09rga_write(core, RGA_SYS_CTRL, 0x00);
> =20
> -=09rga_write(rga, RGA_SYS_CTRL, 0x22);
> +=09rga_write(core, RGA_SYS_CTRL, 0x22);
> =20
> -=09rga_write(rga, RGA_INT, 0x600);
> +=09rga_write(core, RGA_INT, 0x600);
> =20
> -=09rga_write(rga, RGA_CMD_CTRL, 0x1);
> +=09rga_write(core, RGA_CMD_CTRL, 0x1);
>  }
> =20
> -static bool rga_handle_irq(struct rockchip_rga *rga)
> +static bool rga_handle_irq(struct rga_core *core)
>  {
>  =09int intr;
> =20
> -=09intr =3D rga_read(rga, RGA_INT) & 0xf;
> +=09intr =3D rga_read(core, RGA_INT) & 0xf;
> =20
> -=09rga_mod(rga, RGA_INT, intr << 4, 0xf << 4);
> +=09rga_mod(core, RGA_INT, intr << 4, 0xf << 4);
> =20
>  =09return intr & RGA_INT_COMMAND_FINISHED;
>  }
> =20
> -static struct rockchip_rga_version rga_get_version(struct rockchip_rga *=
rga)
> +static struct rockchip_rga_version rga_get_version(struct rga_core *core=
)
>  {
> -=09u32 version =3D rga_read(rga, RGA_VERSION_INFO);
> +=09u32 version =3D rga_read(core, RGA_VERSION_INFO);
> =20
>  =09return (struct rockchip_rga_version) {
>  =09=09.major =3D (version >> 24) & 0xFF,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 2107d0f4a1659..bcfc19d29af74 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -11,6 +11,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/sched.h>
> @@ -35,11 +36,12 @@ static void device_run(void *prv)
>  {
>  =09struct rga_ctx *ctx =3D prv;
>  =09struct rockchip_rga *rga =3D ctx->rga;
> +=09struct rga_core *core =3D rga->cores[0];
>  =09struct vb2_v4l2_buffer *src, *dst;
>  =09unsigned long flags;
>  =09int ret;
> =20
> -=09ret =3D pm_runtime_resume_and_get(rga->dev);
> +=09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0) {
>  =09=09v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
>  =09=09=09=09=09=09 VB2_BUF_STATE_ERROR);
> @@ -54,27 +56,28 @@ static void device_run(void *prv)
>  =09}
>  =09spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> =20
> -=09rga->curr =3D ctx;
> +=09core->curr =3D ctx;
> =20
>  =09src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  =09src->sequence =3D ctx->osequence++;
> =20
>  =09dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> =20
> -=09rga->hw->start(rga, vb_to_rga(src), vb_to_rga(dst));
> +=09rga->hw->start(core, vb_to_rga(src), vb_to_rga(dst));
>  }
> =20
>  static irqreturn_t rga_isr(int irq, void *prv)
>  {
> -=09struct rockchip_rga *rga =3D prv;
> +=09struct rga_core *core =3D prv;
> +=09struct rockchip_rga *rga =3D core->rga;
> =20
> -=09if (rga->hw->handle_irq(rga)) {
> +=09if (rga->hw->handle_irq(core)) {
>  =09=09struct vb2_v4l2_buffer *src, *dst;
> -=09=09struct rga_ctx *ctx =3D rga->curr;
> +=09=09struct rga_ctx *ctx =3D core->curr;
> =20
>  =09=09WARN_ON(!ctx);
> =20
> -=09=09rga->curr =3D NULL;
> +=09=09core->curr =3D NULL;
> =20
>  =09=09src =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  =09=09dst =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> @@ -90,7 +93,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  =09=09v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
>  =09=09v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
> =20
> -=09=09pm_runtime_put_autosuspend(rga->dev);
> +=09=09pm_runtime_put_autosuspend(core->dev);
>  =09}
> =20
>  =09return IRQ_HANDLED;
> @@ -118,7 +121,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, stru=
ct vb2_queue *dst_vq)
>  =09src_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
>  =09src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  =09src_vq->lock =3D &ctx->rga->mutex;
> -=09src_vq->dev =3D ctx->rga->v4l2_dev.dev;
> +=09src_vq->dev =3D ctx->rga->cores[0]->dev;
> =20
>  =09ret =3D vb2_queue_init(src_vq);
>  =09if (ret)
> @@ -136,7 +139,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, stru=
ct vb2_queue *dst_vq)
>  =09dst_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
>  =09dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  =09dst_vq->lock =3D &ctx->rga->mutex;
> -=09dst_vq->dev =3D ctx->rga->v4l2_dev.dev;
> +=09dst_vq->dev =3D ctx->rga->cores[0]->dev;
> =20
>  =09return vb2_queue_init(dst_vq);
>  }
> @@ -275,7 +278,7 @@ static int rga_open(struct file *file)
>  =09=09return -ENOMEM;
> =20
>  =09/* Create CMD buffer */
> -=09ctx->cmdbuf_virt =3D dma_alloc_attrs(rga->dev, rga->hw->cmdbuf_size,
> +=09ctx->cmdbuf_virt =3D dma_alloc_attrs(rga->cores[0]->dev, rga->hw->cmd=
buf_size,
>  =09=09=09=09=09   &ctx->cmdbuf_phy, GFP_KERNEL,
>  =09=09=09=09=09   DMA_ATTR_WRITE_COMBINE);
>  =09if (!ctx->cmdbuf_virt) {
> @@ -322,7 +325,7 @@ static int rga_open(struct file *file)
>  unlock_mutex:
>  =09mutex_unlock(&rga->mutex);
>  rel_cmdbuf:
> -=09dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +=09dma_free_attrs(rga->cores[0]->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_=
virt,
>  =09=09       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>  rel_ctx:
>  =09kfree(ctx);
> @@ -342,7 +345,7 @@ static int rga_release(struct file *file)
>  =09v4l2_fh_del(&ctx->fh, file);
>  =09v4l2_fh_exit(&ctx->fh);
> =20
> -=09dma_free_attrs(rga->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_virt,
> +=09dma_free_attrs(rga->cores[0]->dev, rga->hw->cmdbuf_size, ctx->cmdbuf_=
virt,
>  =09=09       ctx->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
> =20
>  =09kfree(ctx);
> @@ -689,26 +692,26 @@ static const struct video_device rga_videodev =3D {
>  =09.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
>  };
> =20
> -static int rga_parse_dt(struct rockchip_rga *rga)
> +static int rga_parse_dt(struct rga_core *core)
>  {
>  =09struct reset_control *core_rst, *axi_rst, *ahb_rst;
>  =09int ret;
> =20
> -=09core_rst =3D devm_reset_control_get(rga->dev, "core");
> +=09core_rst =3D devm_reset_control_get(core->dev, "core");
>  =09if (IS_ERR(core_rst)) {
> -=09=09dev_err(rga->dev, "failed to get core reset controller\n");
> +=09=09dev_err(core->dev, "failed to get core reset controller\n");
>  =09=09return PTR_ERR(core_rst);
>  =09}
> =20
> -=09axi_rst =3D devm_reset_control_get(rga->dev, "axi");
> +=09axi_rst =3D devm_reset_control_get(core->dev, "axi");
>  =09if (IS_ERR(axi_rst)) {
> -=09=09dev_err(rga->dev, "failed to get axi reset controller\n");
> +=09=09dev_err(core->dev, "failed to get axi reset controller\n");
>  =09=09return PTR_ERR(axi_rst);
>  =09}
> =20
> -=09ahb_rst =3D devm_reset_control_get(rga->dev, "ahb");
> +=09ahb_rst =3D devm_reset_control_get(core->dev, "ahb");
>  =09if (IS_ERR(ahb_rst)) {
> -=09=09dev_err(rga->dev, "failed to get ahb reset controller\n");
> +=09=09dev_err(core->dev, "failed to get ahb reset controller\n");
>  =09=09return PTR_ERR(ahb_rst);
>  =09}
> =20
> @@ -724,12 +727,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
>  =09udelay(1);
>  =09reset_control_deassert(ahb_rst);
> =20
> -=09ret =3D devm_clk_bulk_get_all(rga->dev, &rga->clks);
> +=09ret =3D devm_clk_bulk_get_all(core->dev, &core->clks);
>  =09if (ret < 0) {
> -=09=09dev_err(rga->dev, "failed to get clocks\n");
> +=09=09dev_err(core->dev, "failed to get clocks\n");
>  =09=09return ret;
>  =09}
> -=09rga->num_clks =3D ret;
> +=09core->num_clks =3D ret;
> =20
>  =09return 0;
>  }
> @@ -780,6 +783,7 @@ static int rga_disable_multicore(struct device *dev)
>  static int rga_probe(struct platform_device *pdev)
>  {
>  =09struct rockchip_rga *rga;
> +=09struct rga_core *core;
>  =09struct video_device *vfd;
>  =09int ret =3D 0;
>  =09int irq;
> @@ -791,7 +795,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga), GFP_KERNEL);
> +=09rga =3D devm_kzalloc(&pdev->dev, sizeof(*rga) + 1 * sizeof(*rga->core=
s), GFP_KERNEL);
>  =09if (!rga)
>  =09=09return -ENOMEM;
> =20
> @@ -799,38 +803,46 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (!rga->hw)
>  =09=09return dev_err_probe(&pdev->dev, -ENODEV, "failed to get match dat=
a\n");
> =20
> -=09rga->dev =3D &pdev->dev;
>  =09spin_lock_init(&rga->ctrl_lock);
>  =09mutex_init(&rga->mutex);
> =20
> -=09ret =3D rga_parse_dt(rga);
> +=09core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +=09if (!core)
> +=09=09return -ENOMEM;
> +
> +=09core->rga =3D rga;
> +=09core->dev =3D &pdev->dev;
> +
> +=09rga->cores[0] =3D core;
> +
> +=09ret =3D rga_parse_dt(core);
>  =09if (ret)
>  =09=09return dev_err_probe(&pdev->dev, ret, "Unable to parse OF data\n")=
;
> =20
> -=09ret =3D devm_pm_runtime_enable(rga->dev);
> +=09ret =3D devm_pm_runtime_enable(core->dev);
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09pm_runtime_set_autosuspend_delay(rga->dev, 50);
> -=09pm_runtime_use_autosuspend(rga->dev);
> +=09pm_runtime_set_autosuspend_delay(core->dev, 50);
> +=09pm_runtime_use_autosuspend(core->dev);
> =20
> -=09rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -=09if (IS_ERR(rga->regs))
> -=09=09return PTR_ERR(rga->regs);
> +=09core->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +=09if (IS_ERR(core->regs))
> +=09=09return PTR_ERR(core->regs);
> =20
>  =09irq =3D platform_get_irq(pdev, 0);
>  =09if (irq < 0)
>  =09=09return irq;
> =20
> -=09ret =3D devm_request_irq(rga->dev, irq, rga_isr,
> +=09ret =3D devm_request_irq(core->dev, irq, rga_isr,
>  =09=09=09       rga_has_internal_iommu(rga) ? 0 : IRQF_SHARED,
> -=09=09=09       dev_name(rga->dev), rga);
> +=09=09=09       dev_name(core->dev), core);
>  =09if (ret < 0)
> -=09=09return dev_err_probe(rga->dev, ret, "failed to request irq\n");
> +=09=09return dev_err_probe(core->dev, ret, "failed to request irq\n");
> =20
> -=09ret =3D dma_set_mask_and_coherent(rga->dev, DMA_BIT_MASK(32));
> +=09ret =3D dma_set_mask_and_coherent(core->dev, DMA_BIT_MASK(32));
>  =09if (ret)
> -=09=09dev_err_probe(rga->dev, ret, "32-bit DMA not supported");
> +=09=09dev_err_probe(core->dev, ret, "32-bit DMA not supported");
> =20
>  =09ret =3D v4l2_device_register(&pdev->dev, &rga->v4l2_dev);
>  =09if (ret)
> @@ -848,7 +860,7 @@ static int rga_probe(struct platform_device *pdev)
>  =09video_set_drvdata(vfd, rga);
>  =09rga->vfd =3D vfd;
> =20
> -=09platform_set_drvdata(pdev, rga);
> +=09platform_set_drvdata(pdev, core);
>  =09rga->m2m_dev =3D v4l2_m2m_init(&rga_m2m_ops);
>  =09if (IS_ERR(rga->m2m_dev)) {
>  =09=09v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> @@ -856,16 +868,16 @@ static int rga_probe(struct platform_device *pdev)
>  =09=09goto rel_vdev;
>  =09}
> =20
> -=09ret =3D pm_runtime_resume_and_get(rga->dev);
> +=09ret =3D pm_runtime_resume_and_get(core->dev);
>  =09if (ret < 0)
>  =09=09goto rel_m2m;
> =20
> -=09rga->version =3D rga->hw->get_version(rga);
> +=09rga->version =3D rga->hw->get_version(core);
> =20
>  =09v4l2_info(&rga->v4l2_dev, "HW Version: 0x%02x.%02x\n",
>  =09=09  rga->version.major, rga->version.minor);
> =20
> -=09pm_runtime_put(rga->dev);
> +=09pm_runtime_put(core->dev);
> =20
>  =09ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, -1);
>  =09if (ret) {
> @@ -890,7 +902,8 @@ static int rga_probe(struct platform_device *pdev)
> =20
>  static void rga_remove(struct platform_device *pdev)
>  {
> -=09struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
> +=09struct rga_core *core =3D platform_get_drvdata(pdev);
> +=09struct rockchip_rga *rga =3D core->rga;
> =20
>  =09v4l2_info(&rga->v4l2_dev, "Removing\n");
> =20
> @@ -901,18 +914,18 @@ static void rga_remove(struct platform_device *pdev=
)
> =20
>  static int __maybe_unused rga_runtime_suspend(struct device *dev)
>  {
> -=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +=09struct rga_core *core =3D dev_get_drvdata(dev);
> =20
> -=09clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
> +=09clk_bulk_disable_unprepare(core->num_clks, core->clks);
> =20
>  =09return 0;
>  }
> =20
>  static int __maybe_unused rga_runtime_resume(struct device *dev)
>  {
> -=09struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> +=09struct rga_core *core =3D dev_get_drvdata(dev);
> =20
> -=09return clk_bulk_prepare_enable(rga->num_clks, rga->clks);
> +=09return clk_bulk_prepare_enable(core->num_clks, core->clks);
>  }
> =20
>  static const struct dev_pm_ops rga_pm =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 0e854cdf739f4..94e14c2a2ba6e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -36,6 +36,16 @@ struct rockchip_rga_version {
>  =09u32 minor;
>  };
> =20
> +struct rga_core {
> +=09struct device *dev;
> +=09void __iomem *regs;
> +=09struct clk_bulk_data *clks;
> +=09int num_clks;
> +
> +=09struct rockchip_rga *rga;
> +=09struct rga_ctx *curr;
> +};
> +
>  struct rga_ctx {
>  =09struct v4l2_fh fh;
>  =09struct rockchip_rga *rga;
> @@ -70,10 +80,6 @@ struct rockchip_rga {
>  =09struct v4l2_m2m_dev *m2m_dev;
>  =09struct video_device *vfd;
> =20
> -=09struct device *dev;
> -=09void __iomem *regs;
> -=09struct clk_bulk_data *clks;
> -=09int num_clks;
>  =09struct rockchip_rga_version version;
> =20
>  =09/* vfd lock */
> @@ -81,9 +87,9 @@ struct rockchip_rga {
>  =09/* ctrl parm lock */
>  =09spinlock_t ctrl_lock;
> =20
> -=09struct rga_ctx *curr;
> -
>  =09const struct rga_hw *hw;
> +
> +=09struct rga_core *cores[];
>  };
> =20
>  struct rga_addrs {
> @@ -119,22 +125,22 @@ int rga_check_scaling(const struct rga_hw *hw, cons=
t struct v4l2_rect *crop_in,
>  extern const struct vb2_ops rga_qops;
> =20
>  /* RGA Hardware */
> -static inline void rga_write(struct rockchip_rga *rga, u32 reg, u32 valu=
e)
> +static inline void rga_write(struct rga_core *core, u32 reg, u32 value)
>  {
> -=09writel(value, rga->regs + reg);
> +=09writel(value, core->regs + reg);
>  };
> =20
> -static inline u32 rga_read(struct rockchip_rga *rga, u32 reg)
> +static inline u32 rga_read(struct rga_core *core, u32 reg)
>  {
> -=09return readl(rga->regs + reg);
> +=09return readl(core->regs + reg);
>  };
> =20
> -static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u=
32 mask)
> +static inline void rga_mod(struct rga_core *core, u32 reg, u32 val, u32 =
mask)
>  {
> -=09u32 temp =3D rga_read(rga, reg) & ~(mask);
> +=09u32 temp =3D rga_read(core, reg) & ~(mask);
> =20
>  =09temp |=3D val & mask;
> -=09rga_write(rga, reg, temp);
> +=09rga_write(core, reg, temp);
>  };
> =20
>  #define RGA_FEATURE_FLIP=09BIT(0)
> @@ -155,10 +161,10 @@ struct rga_hw {
>  =09 * Requires that the cmdbuf is already zeroed.
>  =09 */
>  =09void (*setup_cmdbuf)(struct rga_ctx *ctx);
> -=09void (*start)(struct rockchip_rga *rga,
> +=09void (*start)(struct rga_core *core,
>  =09=09      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
> -=09bool (*handle_irq)(struct rockchip_rga *rga);
> -=09struct rockchip_rga_version (*get_version)(struct rockchip_rga *rga);
> +=09bool (*handle_irq)(struct rga_core *core);
> +=09struct rockchip_rga_version (*get_version)(struct rga_core *core);
>  =09void *(*adjust_and_map_format)(struct rga_ctx *ctx,
>  =09=09=09=09       struct v4l2_pix_format_mplane *format,
>  =09=09=09=09       bool is_output);
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> index a80dd7609ccfe..745760d830a61 100644
> --- a/drivers/media/platform/rockchip/rga/rga3-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -266,42 +266,42 @@ static void rga3_hw_setup_cmdbuf(struct rga_ctx *ct=
x)
>  =09rga3_cmd_set_wr_format(ctx);
>  }
> =20
> -static void rga3_hw_start(struct rockchip_rga *rga,
> +static void rga3_hw_start(struct rga_core *core,
>  =09=09=09  struct rga_vb_buffer *src, struct rga_vb_buffer *dst)
>  {
> -=09struct rga_ctx *ctx =3D rga->curr;
> +=09struct rga_ctx *ctx =3D core->curr;
> =20
>  =09rga3_cmd_set_win0_addr(ctx, &src->dma_addrs);
>  =09rga3_cmd_set_wr_addr(ctx, &dst->dma_addrs);
> =20
> -=09rga_write(rga, RGA3_CMD_ADDR, ctx->cmdbuf_phy);
> +=09rga_write(core, RGA3_CMD_ADDR, ctx->cmdbuf_phy);
> =20
>  =09/* sync CMD buf for RGA */
> -=09dma_sync_single_for_device(rga->dev, ctx->cmdbuf_phy,
> +=09dma_sync_single_for_device(core->rga->cores[0]->dev, ctx->cmdbuf_phy,
>  =09=09=09=09   PAGE_SIZE, DMA_BIDIRECTIONAL);
> =20
>  =09/* set to master mode and start the conversion */
> -=09rga_write(rga, RGA3_SYS_CTRL,
> +=09rga_write(core, RGA3_SYS_CTRL,
>  =09=09  FIELD_PREP(RGA3_CMD_MODE, RGA3_CMD_MODE_MASTER));
> -=09rga_write(rga, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));
> -=09rga_write(rga, RGA3_CMD_CTRL,
> +=09rga_write(core, RGA3_INT_EN, FIELD_PREP(RGA3_INT_FRM_DONE, 1));
> +=09rga_write(core, RGA3_CMD_CTRL,
>  =09=09  FIELD_PREP(RGA3_CMD_LINE_START_PULSE, 1));
>  }
> =20
> -static bool rga3_handle_irq(struct rockchip_rga *rga)
> +static bool rga3_handle_irq(struct rga_core *core)
>  {
>  =09u32 intr;
> =20
> -=09intr =3D rga_read(rga, RGA3_INT_RAW);
> +=09intr =3D rga_read(core, RGA3_INT_RAW);
>  =09/* clear all interrupts */
> -=09rga_write(rga, RGA3_INT_CLR, intr);
> +=09rga_write(core, RGA3_INT_CLR, intr);
> =20
>  =09return FIELD_GET(RGA3_INT_FRM_DONE, intr);
>  }
> =20
> -static struct rockchip_rga_version rga3_get_version(struct rockchip_rga =
*rga)
> +static struct rockchip_rga_version rga3_get_version(struct rga_core *cor=
e)
>  {
> -=09u32 version =3D rga_read(rga, RGA3_VERSION_NUM);
> +=09u32 version =3D rga_read(core, RGA3_VERSION_NUM);
> =20
>  =09return (struct rockchip_rga_version) {
>  =09=09.major =3D FIELD_GET(RGA3_VERSION_NUM_MAJOR, version),

--=-LUk+buoFZ9npV6snsjJ6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX+qAAKCRDZQZRRKWBy
9APYAQC3+Ba2e3KtuxOauTBOpSWrSeYxNct2Q4M+PoM0wC0eMwD6Ay0rXE0bWpIU
060zMHc66CKgKzTFatFjSJkmmuvdAAI=
=WTa0
-----END PGP SIGNATURE-----

--=-LUk+buoFZ9npV6snsjJ6--

