Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951DC606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LwPuZ5ke;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQ09frOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=; b=LwPuZ5kevemii+Gz0ZRR4FUE0R
	goneL9e5k94oRAUQMBHuNMaxYgzRssVOeE5r2o168EcdctxsbU8ppWjY/DRQ/gQSSUUSzIwMiJByB
	+Cv+nJJLq4LI4S/948hUCBZ2zbdJIrpaDh/jMDPaMtERZAVlyfAIbe4Nc/iha2yl64/IT3bIkMl0S
	MlJRzSnKYcC7bf/GpkQdGifWfNnQKjd1YbTv0gEqNtrxlvcqHrWo27ZaruN0bj0hYHpqW32sSuZAq
	P8D3raycG32O6w9a0icY5v5480ykAd8CaydlXUBHlNRrz2isHnzALDQ90534i00LfK6T2rf0MURDG
	bxtmmUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdAB-0000000E2gJ-2Zcx;
	Thu, 26 Nov 2026 17:21:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdA8-0000000E2f9-2Qjb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:21:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4b467581b98so70623135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 09:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713694; x=1796318494; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=uQ09frOWK/74x+FWOzVN1TTBcuMPWziIdw94YfMd+yUih0xNKqkZhVNTDARiJbAl3+
         pbcTc9+BOXe23481xL8XK8mcEv8LP2FFtay6cOh592iPsSrHmnImScDVzTNJ0QY4Oyvb
         QhojDUQtV0FWpaQ3gR5JaWnpmYtHzQKyR5QA7Zr7Cq4hOt2ScdKkSj2Sk8gKkgkPl5fG
         1o/55h2nWieK3mXM8eHkC66hpgcFrbDzYECdmpWbzMvKusJkEwhfYhNkSdYLTTRmrBG5
         KcYpqPiKoQhb5H086b0E3g8rsZwCTGDR3MlBzi9bTX645sbsdh6b/4bCP3bGs/6lUV94
         Y02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713694; x=1796318494;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPlvcQPGEEm8iV8OkCIRBzVDRIB9FJj4cVWpQcsCjok=;
        b=eT3cWIhoQDDQljgK0QykDxIAKDGeGOXub90U8TNG0G2jwAr4w/xN3rGbKPAP975nGf
         hzp7/GLibSpqmlxacQfROWFqk5cOB9CDnxuoARB5cva3RAisk0kS/xbG3tHlVzX3FUqX
         y/Tjf1DYqx18oG/Yv8fwEPhh4d8i5MVramaZ/gjnE0wMThSSYkaF7pdKFRqLuVQNVolK
         j7l3N+uti53YnTsTb3CpGsdlyjjiRpOTb5WSu1DZjPeox3eIzf9T2YYDWHZVhFvQeG+T
         TlH3YL1WjzZRYIMWF+yaY4xtbxOIttgQbOoZFw01i02rT5fFnxIWdlpb4wQm9KQMhnyT
         oj9w==
X-Forwarded-Encrypted: i=1; AL+hErGl5TFVLndVIVUghiCzt8y09EfbsKf76eHP6V3D9wAR1o3zwEs7zdHiw984h5NQQ+2w7/89RsCBwzXLYLYxCFA2@lists.infradead.org
X-Gm-Message-State: APuU4Z9YON1alxjcxh7y+1+uIHl02t2hQSDqtmKnA+KNmUxwXSVok8H7
	YD4005KOjSxSV+NsCjGQowiUlkrLL3Cq99CxXJtldjyh2LKE9qSEsLFkuVKGPQ==
X-Gm-Gg: AZFdTZctRZrMJEL2RXp2sruFbvMvT7JOuSAZLv3+9arQipldl1I1L2Q2Z8VU11GPzZ1
	/JXTl+2xVS4X874rkpEw+vex2bTqcYzhV13BrTwYbVJberSttab8ZYWvYoeRf/v56L2vHe8av14
	dTnGWH90Wzy27zyPAngd1PT4XdsgopUku5JWZ9AKEs+nw12+zjHyXvPoQeflNaIk3k5Z0rWU/tc
	czAopuYLqUOfW/Vf0ZFd7THtX/TiPITTX5ta+eYsUlTKIyYN4qfMXRZKjJMcAepn7lAQwR7FNwa
	qkFL57VlW8gNfEpA99oUFUmyi69uTRhna/c7EJRV0domhVo/ODQV2jA2FigTYI7fhuEJhbtsF2T
	D6DlIb14I3tOl2kyyD6+0Ky3WsKMkX39TX02q1hmGud5+xma1eJAx5FwLg1as3sCM3EaVqAkOF7
	X8icNcb/uwmFxho1CxWsR1ssEMGcSH3+dtlq0yemddw3y6EPCcSlAU4Jh9mZUO6210VhXyvGH7g
	326URj5pjNoN/KSK+w6cCsFJCxScGzabOlej5HgnxIC07ogrezWljuRa4l+J/KsexA+39VEEUBe
	F1QTW7aD8/DEWxmfD0tmg/jr4SKyXk01Pio8jJozJqJC7MsZvw34XFbFOkecpXYZLSktE9lneuU
	MmywkmkfMJy8OEo9nGNNs53q5qrgzYKzbf2iOndBBXworSOFkX3HnLN9C4FKA+tSNxbL/uTbpNs
	/cLjGBnCQykbI4u43I18kKU8HCIKp1Qm2B5eFrldP26a5YZr8pSvGs2zozDAHy0EefXJIFckiT+
	5l55qXNn1Fmp3d8MxU1OcGakI9g47H3JNYYoW1d3pD1B3Iqvfv7R+NM9o6o/y8=
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr403969765e9.16.1795713694512;
        Thu, 26 Nov 2026 09:21:34 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm373445195e9.4.2026.11.26.09.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:21:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject: Re: [PATCH 1/2] media: cedrus: fail buffer allocations that do not fit with
 -ENOMEM
Date: Thu, 26 Nov 2026 18:21:32 +0100
Message-ID: <euqQyxcYQfOA1pYfEtNPBw@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
References: <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-1-f9f50812c85b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_092136_737537_F1F8424E 
X-CRM114-Status: GOOD (  13.23  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:47 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> vb2-dma-contig allocates with GFP_KERNEL, so a buffer pool that does
> not fit in memory invokes the OOM killer. Set __GFP_RETRY_MAYFAIL on
> both queues: the request returns fewer buffers or -ENOMEM instead.

This is correct only for IOMMU allocation. CMA fails directly.

Please update commit message.

Best regards,
Jernej

>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index ad4ec3490775..9b2d24e77fdb 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -602,6 +602,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	src_vq->dev =3D ctx->dev->dev;
>  	src_vq->supports_requests =3D true;
>  	src_vq->requires_requests =3D true;
> +	src_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	ret =3D vb2_queue_init(src_vq);
>  	if (ret)
> @@ -616,6 +617,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *s=
rc_vq,
>  	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	dst_vq->lock =3D &ctx->dev->dev_mutex;
>  	dst_vq->dev =3D ctx->dev->dev;
> +	dst_vq->gfp_flags =3D __GFP_RETRY_MAYFAIL;
> =20
>  	return vb2_queue_init(dst_vq);
>  }
>=20
>=20





