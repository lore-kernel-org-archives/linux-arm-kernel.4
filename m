Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDB5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s5zoupZY;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=eRco/R1g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=; b=s5zoupZY8wKWQYPLmLS1Sijdls
	/wqDBEPwy3RDvIV4gChHhZGMar44lERXJQeHBUZINxsiwP3mpDRCFur9RHJwG6GtpraPQTTFq+b+l
	t1IDTN7EWgV6qyQ4w2axSmP75gjsfCe8zCUK3a/2rT8dJ1vk9Qo5yrsFt/C8bTXeNJX1htnj7IBKI
	mSaEVMRXzkdV8ojg/TOgtn8bJ70GvLZpCB9fNOcRtisVc8zOVkVYf0NDCjLzkk+AHrbppDQbyy1WT
	aSInvcPgsPm1icfp3qtz5sK3qM1DCQuJepb0BT2doUadadwHeKcEXIFjynCgHuMbXMKG1xcUnslLj
	lm9IHRbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhoo-0000000EcZl-3nZn;
	Thu, 26 Nov 2026 22:19:54 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhol-0000000EcYf-3YQb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 22:19:53 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-93f22a8515eso635871185a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795731590; x=1796336390; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
        b=eRco/R1g7FZj/eRzXm24JBcAikUgEe0EC8tT+kOWCrpttFsCbVC8W8dHkGQvmZh5aG
         pgs1aqN/6/d+7e2hcDKm9n6+gLOq2YzS3XvpMA0C5sooTQpZw9cWWIQ3XNdxnkzH1jC5
         yoyyKwt5qyJ6jUacA6pCZzEAN7WyPw9YdSiDJUe8e991OZhI4rMdCuMTKl7wxPyLvDzc
         f1t0y3RQ0BjapWD3IfDlaoIuj+BM02JdIMR36JP0onMndw4/jjlwMHhjes2gu9jmWfRm
         SsdCsdSvTFvQuJvXaGYeV2PATxgftuBVo/Q1sr8oPtS/ruiTWL4VUP+2e/q993UfJPcU
         qqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795731590; x=1796336390;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gSiBV6drlTbocMgCCg5biesF+T1YQl3nT64qn/PW44=;
        b=SB/5NfxtGBLSWWE/KuBMUDs1fu/S2H+Zhyhl28e6hg7S17+i0iFHqh0WWKAVKfST8a
         7pDzkgvKOSfVMoSqgmnO/2HIgdSP7RZ5FxHuFe9Kt/JSKJqvW9lmqFXorR1ZqbSak/CC
         D2izUlvZestsBjfqOzr85QUnKv59xs1tXTBjqPkoc8Fm8qIpME3nvju+SQZ+vHzDyX7B
         SfyQzfDaZAPkyToSmKZyZt4BsJbA+r7zBG71GUKPPPsBrdKnZvbpbd0nQxn3PIbql9TH
         fWaDn0m1LRWh2dSzDrzeHi0IHVC6cMnwn7AyyoUGdfAu9b9UgeZO3n9f5/mDSXP5SKUt
         NYgA==
X-Forwarded-Encrypted: i=1; AL+hErHQB654hpRdxjAJHAj6YNu+c26Uc1Q3crnEFp7LTwTLdnQZ6QvCrqX4B/w8b3hLKqOc2XBsJ0tznRLpYj/Q/UtP@lists.infradead.org
X-Gm-Message-State: APuU4Z/6RAroeFU1MKjoo8losbfJAtUTtd11LbiwuwcT58WKKZhG6sr2
	pHnaN3LMHJkOKYv5PBmkK0otMrhT0XKsQAdFlcKHtW5Ybvh67sxbtNJlsVeBQjCKaOg=
X-Gm-Gg: AZFdTZf5wt3YmbNMguvMqP+KynaSN3mUuZc1QeehiJ2u1RY070HeNQt0kDOhzOtPmz9
	8N0XdMb9yusdSAiIufa8o3euQQZH+c005bFYN6P8LQPJwMMlkms2ZkrsjN+XK32DdjYNA2OdXHs
	6LlENt7RPb0ZX4c8QakqspGDGn0RnykM8Ew/2Hi46TiG0lu4A1vIo7hH95rU51OA47Mt5g+bXPQ
	M3UNgNMwZH1PmUmAEIL4r6mJN8vKZG1GO/Ql+8mB57+ov2IzZr5AgJTHl6yT8r34AlnHMaKv+ZO
	oX/HdpBpTSWnbKHnF+MTDew3Jc/itLKEyse2EvbpjyvfNCL0fC9piMajCI/zYwY1v4rgY57u2E5
	zxGWpciIsXixxa3a1GWSWN7IGKeYd89LjlAXbniDuSyVN1bosiN/yzjwtVpxSk1I7kMBUFvF3tV
	wZVxfKHhNsop2l4rwuf55GZJvi7oTrI0Qpd+xIRGThGu3vQRzsTNW0iJZp6EBm0k2EMN84r6Gz2
	JrYftoQqSvitNI9wtS/37JHN/4rg8b3jVePr8EaK7ybjtvUUc8ibuCP93zXXliZshjVBVQaBvxY
	kz7OEp5BzbBY9Rde9TkEfAf0i3nWZ8xEuayJZ/xDoNf9oPtRBC5mtgs=
X-Received: by 2002:a05:620a:3188:b0:947:3673:f902 with SMTP id af79cd13be357-949ba9e9297mr3983731285a.55.1795731590418;
        Thu, 26 Nov 2026 14:19:50 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a09477acfsm454257385a.32.2026.11.26.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:19:49 -0800 (PST)
Message-ID: <c2ac221b70cc33e550f550ab21c1a5a5967d4676.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Free encoder controls when
 setup fails
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 26 Nov 2026 17:19:48 -0500
In-Reply-To: <20261103083533.1176842-1-vulab@iscas.ac.cn>
References: <20261103083533.1176842-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-v7c+rvNTZeeZDaQiPqM0"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_141952_019465_5825BEAC 
X-CRM114-Status: GOOD (  15.62  )
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-v7c+rvNTZeeZDaQiPqM0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 08:35 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> mtk_vcodec_enc_ctrls_setup() can fail after creating some controls. On
> that error, fops_vcodec_open() jumps past the control handler cleanup and
> frees the context, leaking the handler's controls and allocation.
>=20
> Use the same control handler cleanup as the later m2m context creation
> failure, and remove the now-unused label. No m2m context is released on
> this path because its initialization has not been attempted yet.
>=20
> Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video E=
ncoder Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c      | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_en=
c_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv=
.c
> index 4e4541b2fc8e..dd47feea6acd 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -140,7 +140,7 @@ static int fops_vcodec_open(struct file *file)
>  =09ret =3D mtk_vcodec_enc_ctrls_setup(ctx);
>  =09if (ret) {
>  =09=09mtk_v4l2_venc_err(ctx, "Failed to setup controls() (%d)", ret);
> -=09=09goto err_ctrls_setup;
> +=09=09goto err_m2m_ctx_init;
>  =09}
>  =09ctx->m2m_ctx =3D v4l2_m2m_ctx_init(dev->m2m_dev_enc, ctx,
>  =09=09=09=09=09 &mtk_vcodec_enc_queue_init);
> @@ -191,7 +191,6 @@ static int fops_vcodec_open(struct file *file)
>  =09v4l2_m2m_ctx_release(ctx->m2m_ctx);
>  err_m2m_ctx_init:
>  =09v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> -err_ctrls_setup:

Fix mtk_vcodec_enc_ctrls_setup() instead.

Nicolas

>  =09v4l2_fh_del(&ctx->fh, file);
>  =09v4l2_fh_exit(&ctx->fh);
>  =09kfree(ctx);

--=-v7c+rvNTZeeZDaQiPqM0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiwhAAKCRDZQZRRKWBy
9OypAQDmjeaO3tv2K1mt6YGlWFssP0QrnOt96UUjRwEVvDQy0AD+NPHYtKJ2HV/T
EhM1Fwjl1AFFmsIQcqTGIoFBfxMBkgw=
=EM4e
-----END PGP SIGNATURE-----

--=-v7c+rvNTZeeZDaQiPqM0--

