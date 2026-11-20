Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A8606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ASgBAODc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=ehbxFn6Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sf4AH1zOcw+3m6cCakkCBTqDSIqFr2QBiWyWayVrX3Q=; b=ASgBAODcQSBAmt
	hzT4iwzmBGFoQZgjrUduPGC0hEgrBoMI3vYPgGCiWDLM4VJUEIKrayvMayWo0fzDncIXCbLNWdybt
	/IoRLToVSpzSxzVfkUPtlKnZdvSkD5AWHYVuYzYLzVauPSShuwUJW0BHR3LxHOp0m4GI8EGZdOHKC
	DYRKiwjRE1bqRlrrh2FkDwcYtBY893odBsxb410aoCF3E9W3SXOdORgQHUtm6UuCnTBbsuWlgcuer
	JBRPi5yoxJuC/xS13FkdPk4gPQwCcxpXB3epqnKDN4KvHpX8xJAj37hvzEHdGFFLQBnUinw4ZrI/p
	dtp2V1D3s2dIR4miWuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOMQ-0000000F3HP-1aD6;
	Fri, 20 Nov 2026 13:09:02 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOMN-0000000F3Gv-3SFb;
	Fri, 20 Nov 2026 13:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795180132; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FYuT9fhElAX47KBGkB2SllZszrMGccBSGnyXiMEX3YyCdM+qz2KtfxinqDTV0gnBxd7yL1QjJk62yM6TZYzHg7HN8T0fwLQvz8MlW3Nh/5Z8Fmfsk0rFHXd7i7DT1Nz40qqIUfmm42YhlDKF3hcOZiBttATAo9+v27L9plRC+H8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795180132; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sf4AH1zOcw+3m6cCakkCBTqDSIqFr2QBiWyWayVrX3Q=; 
	b=ZvoUZTyPgb2vfXKImZEhHSAbdbVhjmCzBRjYcu6VXR90/d3TPkzip110xHwT9jQopXhZZyymkcmaT+hs2loUQtQJNdUao3WN0bJBD5ToCXonxp7vH/9WwJUypvvvngNIyFQ2ODELpu9gb2gKFl6HcsFWy+Vycxb2Lwe5ACDY4cU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: a=rsa-sha256; b=ehbxFn6Q8yTrPbnsU7wE9E48PYRCjMfiX6+/+ropJDEv7ZZJUwwiOwqGBdAKwHfXE50PWuhmohKp7qW3kRr5IezHe5AfOzOAWWZ0ENmw8J/IIAJQS9I2Ndy6j11Wd4BteUiDNonSiNc+Ny8gPbFJcnssEkziiKPJBPidYaiBhew=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=sf4AH1zOcw+3m6cCakkCBTqDSIqFr2QBiWyWayVrX3Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1795180130356352.2454153669245; Fri, 20 Nov 2026 05:08:50 -0800 (PST)
Date: Fri, 20 Nov 2026 08:08:50 -0500
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: <aiyengar1990@gmail.com>
Cc: <hverkuil@kernel.org>, <mchehab@kernel.org>,
	<benjamin.gaignard@collabora.com>, <p.zabel@pengutronix.de>,
	<mripard@kernel.org>, <paulk@sys-base.io>,
	<gregkh@linuxfoundation.org>, <wens@kernel.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <jonas@kwiboo.se>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>,
	<linux-staging@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <ckoever@outlook.de>,
	<aiyengar1990@gmail.com>
Message-ID: <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
In-Reply-To: <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com>
References: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com> <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com>
Subject: =?UTF-8?Q?Re:=C2=A0[PATCH_RFC_2/2]_media:_cedrus:_mpeg2:?=
 =?UTF-8?Q?_decode_MPEG-1_as_V4L2=5FPIX=5FFMT=5FMPEG1=5FSLICE?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_050859_949188_47D56ADB 
X-CRM114-Status: GOOD (  20.00  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,


---- Le jeu., 19 nov. 2026 11:34:53 -0500
devnull+aiyengar1990.gmail.com@kernel.org a =C3=A9crit ----


> From: Arun Iyengar
>
> The engine has an MPEG-1 mode, selected with the MPEG-1 decoder type in
> the trigger register, and takes the full pel flags and the picture
> coding type (D-pictures included) in the picture header register.
>
> Enumerate V4L2_PIX_FMT_MPEG1_SLICE on every variant with the MPEG-2
> decoder (tested on H616 only), with the MPEG-2 limits, and select the
> MPEG-1 mode from the coded format. try_ctrl accepts the MPEG-1 flag, the
> full pel flags and D-pictures only with the MPEG-1 format. A job whose
> sequence control does not match the coded format fails, as do field
> pictures in MPEG-1 sequences.


MPEG2 requires MPEG1 support. The new format simply add noise, you can fix =
cedrus with V4L2_MPEG2_SEQ_FLAG_MPEG1 alone.


Nicolas



>
> Signed-off-by: Arun Iyengar
>
> ---
> drivers/staging/media/sunxi/cedrus/cedrus.c | 22 +++++++++++++
> drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 1 +
> drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 1 +
> drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 38 ++++++++++++++++++=
++---
> drivers/staging/media/sunxi/cedrus/cedrus_video.c | 7 +++++
> 5 files changed, 65 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index c3331b4f3f02..60b296032a90 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -77,6 +77,26 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
tx->bit_depth =3D bit_depth;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
edrus_reset_cap_format(ctx);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +=C2=A0=C2=A0=C2=A0=C2=A0} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_MP=
EG2_SEQUENCE) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct v4l2_ctrl_m=
peg2_sequence *seq =3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
ctrl->p_new.p_mpeg2_sequence;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct cedrus_ctx *ctx =
=3D container_of(ctrl->handler,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct cedrus_ctx, hdl);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (seq->flags & V4L2_MP=
EG2_SEQ_FLAG_MPEG1 &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->src_fmt.pixelforma=
t !=3D V4L2_PIX_FMT_MPEG1_SLICE)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
return -EINVAL;
> +=C2=A0=C2=A0=C2=A0=C2=A0} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_MP=
EG2_PICTURE) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct v4l2_ctrl_m=
peg2_picture *pic =3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
ctrl->p_new.p_mpeg2_picture;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct cedrus_ctx *ctx =
=3D container_of(ctrl->handler,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st=
ruct cedrus_ctx, hdl);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ctx->src_fmt.pixelfo=
rmat !=3D V4L2_PIX_FMT_MPEG1_SLICE &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pic->picture_coding_ty=
pe =3D=3D V4L2_MPEG2_PIC_CODING_TYPE_D ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pic->flags & (V4L2_MPEG=
2_PIC_FLAG_FULL_PEL_FORWARD |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD)))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
return -EINVAL;
> =C2=A0=C2=A0=C2=A0=C2=A0}
>
> =C2=A0=C2=A0=C2=A0=C2=A0return 0;
> @@ -90,12 +110,14 @@ static const struct cedrus_control cedrus_controls[]=
 =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.cfg =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.=
id=C2=A0=C2=A0=C2=A0=C2=A0=3D V4L2_CID_STATELESS_MPEG2_SEQUENCE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
.ops=C2=A0=C2=A0=C2=A0=C2=A0=3D &cedrus_ctrl_ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.capabilities=C2=A0=C2=A0=
=C2=A0=C2=A0=3D CEDRUS_CAPABILITY_MPEG2_DEC,
> =C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.cfg =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.=
id=C2=A0=C2=A0=C2=A0=C2=A0=3D V4L2_CID_STATELESS_MPEG2_PICTURE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
.ops=C2=A0=C2=A0=C2=A0=C2=A0=3D &cedrus_ctrl_ops,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.capabilities=C2=A0=C2=A0=
=C2=A0=C2=A0=3D CEDRUS_CAPABILITY_MPEG2_DEC,
> =C2=A0=C2=A0=C2=A0=C2=A0},
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index 9f8b0555b7dc..6657d6060c39 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -41,6 +41,7 @@ void cedrus_device_run(void *priv)
>
> =C2=A0=C2=A0=C2=A0=C2=A0switch (ctx->src_fmt.pixelformat) {
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG2_SLICE:
> +=C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG1_SLICE:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run.mpeg2.sequence =3D ce=
drus_find_control_data(ctx,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0V=
4L2_CID_STATELESS_MPEG2_SEQUENCE);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0run.mpeg2.picture =3D ced=
rus_find_control_data(ctx,
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..fd3ee8f5e9a5 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -44,6 +44,7 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>
> =C2=A0=C2=A0=C2=A0=C2=A0switch (ctx->src_fmt.pixelformat) {
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG2_SLICE:
> +=C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG1_SLICE:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_MODE_DEC_MPEG=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> index 10e98f08aafc..18d91b9b1e4a 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> @@ -48,6 +48,30 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx
> *ctx)
> =C2=A0=C2=A0=C2=A0=C2=A0cedrus_write(dev, VE_DEC_MPEG_CTRL, reg);
> }
>
> +static bool cedrus_mpeg2_is_mpeg1(struct cedrus_ctx *ctx)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0return ctx->src_fmt.pixelformat =3D=3D V4L2_PIX_=
FMT_MPEG1_SLICE;
> +}
> +
> +static bool
> +cedrus_mpeg2_format_matches(struct cedrus_ctx *ctx,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const struct v4l2_ctrl_mpeg2_sequence *seq,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const struct v4l2_ctrl_mpeg2_picture *pic)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0bool mpeg1 =3D cedrus_mpeg2_is_mpeg1(ctx);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* try_ctrl checked the controls against the for=
mat set at that time. */
> +=C2=A0=C2=A0=C2=A0=C2=A0if (mpeg1 !=3D !!(seq->flags & V4L2_MPEG2_SEQ_FL=
AG_MPEG1))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (mpeg1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pic->picture_stru=
cture =3D=3D V4L2_MPEG2_PIC_FRAME;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0return pic->picture_coding_type !=3D V4L2_MPEG2_=
PIC_CODING_TYPE_D &&
> +=C2=A0=C2=A0=C2=A0=C2=A0 !(pic->flags & (V4L2_MPEG2_PIC_FLAG_FULL_PEL_FO=
RWARD |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD));
> +}
> +
> static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *=
run)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0const struct v4l2_ctrl_mpeg2_sequence *seq;
> @@ -63,6 +87,9 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, s=
truct
> cedrus_run *run)
> =C2=A0=C2=A0=C2=A0=C2=A0seq =3D run->mpeg2.sequence;
> =C2=A0=C2=A0=C2=A0=C2=A0pic =3D run->mpeg2.picture;
>
> +=C2=A0=C2=A0=C2=A0=C2=A0if (!cedrus_mpeg2_format_matches(ctx, seq, pic))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0quantisation =3D run->mpeg2.quantisation;
>
> =C2=A0=C2=A0=C2=A0=C2=A0/* Activate MPEG engine. */
> @@ -101,8 +128,10 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx=
,
> struct cedrus_run *run)
> =C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->fl=
ags &
> V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
> =C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(pic=
->flags &
> V4L2_MPEG2_PIC_FLAG_INTRA_VLC);
> =C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(pic->=
flags &
> V4L2_MPEG2_PIC_FLAG_ALT_SCAN);
> -=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VE=
CTOR(0);
> -=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_V=
ECTOR(0);
> +=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VE=
CTOR(pic->flags &
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD);
> +=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_V=
ECTOR(pic->flags &
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD);
>
> =C2=A0=C2=A0=C2=A0=C2=A0cedrus_write(dev, VE_DEC_MPEG_MP12HDR, reg);
>
> @@ -183,8 +212,9 @@ static void cedrus_mpeg2_trigger(struct cedrus_ctx *c=
tx)
> =C2=A0=C2=A0=C2=A0=C2=A0u32 reg;
>
> =C2=A0=C2=A0=C2=A0=C2=A0/* Trigger MPEG engine. */
> -=C2=A0=C2=A0=C2=A0=C2=A0reg =3D VE_DEC_MPEG_TRIGGER_HW_MPEG_VLD | VE_DEC=
_MPEG_TRIGGER_MPEG2 |
> -=C2=A0=C2=A0=C2=A0=C2=A0 VE_DEC_MPEG_TRIGGER_MB_BOUNDARY;
> +=C2=A0=C2=A0=C2=A0=C2=A0reg =3D VE_DEC_MPEG_TRIGGER_HW_MPEG_VLD | VE_DEC=
_MPEG_TRIGGER_MB_BOUNDARY;
> +=C2=A0=C2=A0=C2=A0=C2=A0reg |=3D cedrus_mpeg2_is_mpeg1(ctx) ? VE_DEC_MPE=
G_TRIGGER_MPEG1 :
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VE_DEC_MPEG_TRIGGER_MPEG2;
>
> =C2=A0=C2=A0=C2=A0=C2=A0cedrus_write(dev, VE_DEC_MPEG_TRIGGER, reg);
> }
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..8979693e9109 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -40,6 +40,11 @@ static struct cedrus_format cedrus_formats[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.directions=C2=A0=C2=A0=
=C2=A0=C2=A0=3D CEDRUS_DECODE_SRC,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.capabilities=C2=A0=C2=A0=
=C2=A0=C2=A0=3D CEDRUS_CAPABILITY_MPEG2_DEC,
> =C2=A0=C2=A0=C2=A0=C2=A0},
> +=C2=A0=C2=A0=C2=A0=C2=A0{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pixelformat=C2=A0=C2=A0=
=C2=A0=C2=A0=3D V4L2_PIX_FMT_MPEG1_SLICE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.directions=C2=A0=C2=A0=
=C2=A0=C2=A0=3D CEDRUS_DECODE_SRC,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.capabilities=C2=A0=C2=
=A0=C2=A0=C2=A0=3D CEDRUS_CAPABILITY_MPEG2_DEC,
> +=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.pixelformat=C2=A0=C2=A0=
=C2=A0=C2=A0=3D V4L2_PIX_FMT_H264_SLICE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.directions=C2=A0=C2=A0=
=C2=A0=C2=A0=3D CEDRUS_DECODE_SRC,
> @@ -125,6 +130,7 @@ void cedrus_prepare_format(struct v4l2_pix_format
> *pix_fmt)
>
> =C2=A0=C2=A0=C2=A0=C2=A0switch (pix_fmt->pixelformat) {
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG2_SLICE:
> +=C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG1_SLICE:
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_H264_SLICE:
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_HEVC_SLICE:
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_VP8_FRAME:
> @@ -352,6 +358,7 @@ static int cedrus_s_fmt_vid_out_p(struct cedrus_ctx *=
ctx,
>
> =C2=A0=C2=A0=C2=A0=C2=A0switch (ctx->src_fmt.pixelformat) {
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG2_SLICE:
> +=C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_MPEG1_SLICE:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctx->current_codec =3D &c=
edrus_dec_ops_mpeg2;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0case V4L2_PIX_FMT_H264_SLICE:
>
> --
> 2.55.0

