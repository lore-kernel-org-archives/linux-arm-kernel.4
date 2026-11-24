Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C933606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rWTnFH+p;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uIBGKnDD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W9arlbU5hy5tgNRpcN7WmEtmYSBI8GYP25HN7JEKy5U=; b=rWTnFH+phZ+0fHUYY0AC8b0SY8
	wHshDGB45wu5BjuthAKNQi159VBsQ1UY1eOM2DWkEjrAdFGK5hDu7AZylP42xBmc+FkYSQWr2HK7K
	ngf/GAUuznBJ+rOn41xrx3YHo6yu3wocpBiYjUIkQ4IUJ8wRJQTQJU0CnRUvICVZdNQ57xHPxwwAI
	y3fZvj2fhm/YwFeRTwZZ+/yv5X3CqJe5URPaGmDiP6HUOeL78hu8+RoaEKCoH8HNkyESUYEZEYI9O
	5dQvHiWI6FaYJE4PSk3XmB7S6FClfg0l1grbkYgqyVP2dxSDXHro2fQlRbJmTB1ecvZBr8Z9q9wug
	VcVtwo2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxqp-00000007pUw-19nB;
	Tue, 24 Nov 2026 21:14:55 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxql-00000007pSC-0z12
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:14:53 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-94958650b09so491250885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795554890; x=1796159690; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9arlbU5hy5tgNRpcN7WmEtmYSBI8GYP25HN7JEKy5U=;
        b=uIBGKnDDZhfVSUVJ5rybg6sFLDTieanBKLFDSy3WjdWtGqtcGzdgHsjD+YGwj/L22w
         dAFQCmEw5Qr/lAzsoqi9GYkQypbCP5CU3ZEvpSYoapHi+io2D0LwGZCN4WwWwEha5Bza
         J3cqMBchrLvjh899OuP/XyH68UD3tcRR6rF2I/Bf77U6QoO447CBShS1DMz/xurtSIl+
         N8NnsM+nhvWwOeD3/QrcWKXCOdedTtXIBjl7uWP6HJcSOM8ynJtXrwTknZu4eXhoHJk1
         WVGdCKiIISCCnTrP1MdlNTo94BiO4kDkl5YPGkJU6MMOcsDYla2gLHsKLYkiZkwtb6Qu
         +HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554890; x=1796159690;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9arlbU5hy5tgNRpcN7WmEtmYSBI8GYP25HN7JEKy5U=;
        b=d6dVHjO7932pZxm0VT+5F2E+5U0gPMDwD64qu3s7EHEKMUCTpMvKyV/2RGWM4RTugg
         b/5RSKh35axzeLdAKn9GsvaBKZor1b/yku/r11s6zHtZI6+dewGy1bx3rogs6yobtZGL
         va2fbdeNxh6kLTf94Y1ZJdpSLyGSYJyist7Z9rFRRFAV81xouVfcRwHt3kaIvhhCoSja
         1DxPOim+ZnPjdDV3UOZdqEhcFGnWR/r3HMm8FqxzgtAAgT1p8J6+SRtkR5Ch/FkDF5tj
         0ZW+M9n0psPW1yBkpckEAWadf9jVd54plRrcAiQ+MfCp6Hnjrm3naQHTXwD7A5ylozJN
         sKhA==
X-Forwarded-Encrypted: i=1; AL+hErHOTwp/omppXUOU2DW+8LWSfS4ojEvZx74Z9jFZ9PYu7UxwH+9ZMrAyU4NqIp4dtgDj26vkJpCSYY/TE+neS7Fw@lists.infradead.org
X-Gm-Message-State: APuU4Z9VGP3E/6jl9KP/pb4YTpC+L6I/EQhwgw+BRYUq2glWGiXoTA+P
	+hcKHLCSIG33BnmOn2/874bAoRUr0pBV6ivfs2aYK/V7zmbENc84wjO/+hOhm6x5GNE=
X-Gm-Gg: AZFdTZcFP/BacqoGQ5Zbiv06RjIK/zTWeVOSrPfNn/4GIr8qMlASg2ZSfV48E0O/DAx
	U0i8sbvggFqrXbWH4AZ2QnNu3Dd/OdHH4Y+Dj21zqyWOKd/hpE+hJCmQ68K6+RIKvcuhHJcJow0
	88ywweu0lBolGcRWquQhVFwgv5mwHTXB8y6/20ZjLx/nVdetRBx9V/Xkm0mBmVvE5jguPkqqW4D
	U99763Y9ltdqPqJtHiwZhqO/CrvO9wHJgUiFlRijoAI/C4iiJqiAAO+kGYnHYPCqpu+EUmiPl2k
	iesRmB4t4e9LYDRVIqg2ay8QrSrjM75n4Luo+qL1xb+nJq5n8Kl8nmrvu7Ga84XsggJN47GW9rA
	pA1qaoMcuvzKIqeAkL5wb8uZeDpQYWpFIuncn8OjY4BKB7SuDOl0aouflHVNButaXazkKm/edr+
	O0L/+DVYeVCqWgzM4dvdESMYTMw7DeZrmWp8d3SgntQo2Dg7WSiKn7wiDnBCCixgr6no2Twm0yt
	C7+Vkhhw0mw3zVf+XYlDOw8AymRfTQl0giloFKq55OBwlpxBxaOGl3puKSNgdMIkUeEXukdyUw9
	+y9TWTGrJ/2k/Gh27QVqEt0x2+ZBW7K168i5l8LcuJlTaLE2UObfrdvjBP3K1u7Sqv2opMPhlGv
	u
X-Received: by 2002:a05:620a:700e:b0:949:735c:90c4 with SMTP id af79cd13be357-949bab1df97mr2669499685a.70.1795554889851;
        Tue, 24 Nov 2026 13:14:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0319fcsm1129758785a.4.2026.11.24.13.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:14:49 -0800 (PST)
Message-ID: <728acfd6e085408e7998bc9e7dfbb2d110cd53ed.camel@ndufresne.ca>
Subject: Re: [PATCH v2 08/17] media: rockchip: rga: move power handling to
 device_run
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
Date: Tue, 24 Nov 2026 16:14:48 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-8-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-8-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-VHje7+kFOoy685T8Rgq0"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_131451_307567_EAC37115 
X-CRM114-Status: GOOD (  24.41  )
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

--=-VHje7+kFOoy685T8Rgq0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Move the power handling to the device_run function in preparation for
> enabling multiple cores. This allows to power the only the necessary core=
s
> instead of powering all available cores.
>=20
> As the decision on which core the given job is executed will be done in
> device_run, we can only power to correct core there.
>=20
> To avoid unpowering the core in a streaming state switch to autosuspend.
> This avoids powering down the core when the next frame is scheduled in
> the next 50ms. The timeout maps to a framerate of 20fps, which should be
> pretty uncommon in a normal video stream.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> ---
> v2
> - also set autosuspend flag with pm_runtime_use_autosuspend
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D6)
> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 12 ------------
>  drivers/media/platform/rockchip/rga/rga.c     | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/medi=
a/platform/rockchip/rga/rga-buf.c
> index c0ea6003336bf..3f7c3c68e0cb8 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -242,14 +242,6 @@ static int rga_buf_prepare_streaming(struct vb2_queu=
e *q)
>  static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int cou=
nt)
>  {
>  =09struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> -=09struct rockchip_rga *rga =3D ctx->rga;
> -=09int ret;
> -
> -=09ret =3D pm_runtime_resume_and_get(rga->dev);
> -=09if (ret < 0) {
> -=09=09rga_buf_return_buffers(q, VB2_BUF_STATE_QUEUED);
> -=09=09return ret;
> -=09}
> =20
>  =09if (V4L2_TYPE_IS_OUTPUT(q->type))
>  =09=09ctx->osequence =3D 0;
> @@ -261,11 +253,7 @@ static int rga_buf_start_streaming(struct vb2_queue =
*q, unsigned int count)
> =20
>  static void rga_buf_stop_streaming(struct vb2_queue *q)
>  {
> -=09struct rga_ctx *ctx =3D vb2_get_drv_priv(q);
> -=09struct rockchip_rga *rga =3D ctx->rga;
> -
>  =09rga_buf_return_buffers(q, VB2_BUF_STATE_ERROR);
> -=09pm_runtime_put(rga->dev);
>  }
> =20
>  const struct vb2_ops rga_qops =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index d7f0712177b70..c24bc8e26b91e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -37,6 +37,14 @@ static void device_run(void *prv)
>  =09struct rockchip_rga *rga =3D ctx->rga;
>  =09struct vb2_v4l2_buffer *src, *dst;
>  =09unsigned long flags;
> +=09int ret;
> +
> +=09ret =3D pm_runtime_resume_and_get(rga->dev);
> +=09if (ret < 0) {
> +=09=09v4l2_m2m_buf_done_and_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx,
> +=09=09=09=09=09=09 VB2_BUF_STATE_ERROR);
> +=09=09return;
> +=09}
> =20
>  =09spin_lock_irqsave(&rga->ctrl_lock, flags);
>  =09if (ctx->cmdbuf_dirty) {
> @@ -81,6 +89,8 @@ static irqreturn_t rga_isr(int irq, void *prv)
>  =09=09v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
>  =09=09v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
>  =09=09v4l2_m2m_job_finish(rga->m2m_dev, ctx->fh.m2m_ctx);
> +
> +=09=09pm_runtime_put_autosuspend(rga->dev);
>  =09}
> =20
>  =09return IRQ_HANDLED;
> @@ -801,6 +811,9 @@ static int rga_probe(struct platform_device *pdev)
>  =09if (ret)
>  =09=09return ret;
> =20
> +=09pm_runtime_set_autosuspend_delay(rga->dev, 50);
> +=09pm_runtime_use_autosuspend(rga->dev);
> +
>  =09rga->regs =3D devm_platform_ioremap_resource(pdev, 0);
>  =09if (IS_ERR(rga->regs))
>  =09=09return PTR_ERR(rga->regs);

--=-VHje7+kFOoy685T8Rgq0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX+SAAKCRDZQZRRKWBy
9BvLAP9Q5/iAdKDJ6TMCJMFG+qc3MCvexx/cnmIvxTp7c1XLhgEA2wrgdWTeGaKA
sk6wt4xFNb7zeeIPPdyxQHP8JK17XQc=
=r19R
-----END PGP SIGNATURE-----

--=-VHje7+kFOoy685T8Rgq0--

