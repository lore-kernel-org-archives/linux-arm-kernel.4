Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA424606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6FhtyKO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gK/WKxGh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=; b=a6FhtyKOKM3+0M9blokbXFgAKh
	BEoVzdg+CLhZ1eT8iXRif8b8mzWYLnQEjW5kkmm4/sg2sauNoyAOwW458sOcVw3EfZWIwWCCuNKV7
	KYlrDJhXcvaowXc18FVehgbhDQjS4ULa7XfOjKikSN3dGbpSJsHfLcHoJJKwdJp+zceNDj8Qgdcny
	yujlp5VAAMFJKzZkR5yW+QkmAEDLdbru43x/0HLc1hbSBfo9H2lILJOx4g0W2723lLdE9rV3Ea/y1
	MVLWRq4N+ySO5ERurGDG6y4ieSEdgCVXB5li3GwvTMarGtmZtXKBGZl+DfibTEXsNEI02aRApbUlx
	H3mioFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd67-0000000E1uf-1uyf;
	Thu, 26 Nov 2026 17:17:27 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd64-0000000E1uL-3ZEe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:17:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-490d59c3edaso4948843f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713443; x=1796318243; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=gK/WKxGh6TZv9Ev5MWaQaCdrAxTizV2l8BdHPkuWmqc1R8loGarV201YbeJynSJv2Z
         qjRuvk8KfyH5f9F7WjrrfiWgnCNHT4a/cdJ/VQADj9KooFc4LkbxRn8uP56Fl0M1/Gfy
         jkYnd42BHxB8A7+anJD1OWjXokyRAKjXLgAxcPRykDyzIM8DnnZLRc768oQxYl8ILRzA
         dM7ikXRSQGoqmBWTz4WLb7ASjPBmtFvSJX3eI2Q/LZ09rAQGw4UheQesaMFPMwysNdpB
         C4FWI9Hm9oKN1itwFHso4BwR1vHMCzFKNv4tg2zH2HARMZKkCm2krB+Go0dSldS+89sM
         LnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713443; x=1796318243;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=xtDf+Bwyg+icwRc+fgEtx7fwgi4SD7RvWBVm/ZjIAWkkDYYCdT2pYEjLY52PWr3U+b
         dZWZ4HlsLxwWaOtx1T6hzuuvFLXIOTee+dV0XfbSlJqO/WmWyBXVSmvVXy3BhMqC5tCx
         cJga4McRNQowNFRdXQSOp00E5x98HdHT045oyHzV/W6fm5g2P0NgQSqY6MTZfd70UTfI
         iMn8b/bwCTJ6EB6QtpuKbdDAwT+KP270vqdQ5QVNCBNdGdKaz4ND8SljJMx0ok7nZWu5
         bYMp7OlgJ5KPOdGYPYXY7peSozRif07Q3ij9EFkBfYp0d/FM9pgnbRuKcaAkNQKJ4yDn
         KLdQ==
X-Forwarded-Encrypted: i=1; AL+hErGQrfD7tCXYNx48tZ6FO8tJfNooPVcLKtNxH/N9BIF2PP8vddpgp7Gw7DhZoX33bYAOlzpokJ8g+p/D7yU0qR8f@lists.infradead.org
X-Gm-Message-State: APuU4Z9GCyWXiLHiZUSIGY2IiEWV8ntHUAo6zhljEd6aMXUncr5cn2VF
	2v3OPjrZk15PM35vka50sxQjOQ7tW8NZnioOAQoMIci5ScN1WxRpho1p
X-Gm-Gg: AZFdTZdsQR3N1NZ65QaOrHRMzSKTdtBrcTA+51A0I5cDLi0XZrvqEPlQlymNSB7AFzd
	oDOuIGy/VGMSoToGplyNNBZmIK6uxvKXoghnV7BE97i3arzKs0+vzpRzQXJYg3B51bkMC4NXx88
	xgbQdzhJb/V7WM6lNkS7dzaOLOnnKRj/MSNOXxwt9hefXpEW/4FiPRYSOFxH1k1TBtA2UUOHs6x
	KMNACs3NTFFiuJAHWL/9B6wd+3N2SZ5AQf06Rufy6PZ5RYVKI87oE8XTurEkZDqex8AtPTjNp1K
	5rpj2Gwal4mowGvZqs5CTcy31AjoCilpyOZ6ei7Dm6jkZzNxMe9H3ticjpjvV1ovJsXFm7/vqzp
	yGHSSJr70ptJzQUvkYKNT2BRWQkecytgk1nIE+l7O4tNehec8wxZCGdQOFVqrezQ5/2dzzVWGg3
	FHRmU6zvsGKi229wmO2V1+FHYZFPbrjHGiAQ08WfrfIeIJAiKAmw42H7oxT2PAvxx6TJxLQaUzx
	a7yMw8xZ9QOLfZWmLMG/5a+T2ByYb5F+NRFX4hlBSQzI9bxKPjCvTZSfIRs5BqpWrXNd48vSIkc
	Z6+9eCOIg6HdpldARfC9ZkjGI7lmdYK2uCas+V4veavhcOqq/BQ5t6fxvTZvPLeDKhNcy9iNr8Z
	iKwfp6Zms3lmJcOFOk5RO2VKU3XfcaQw+Epe4dG5cFoO7j8cf/P539Ivn0ot1wLbMSZFwA1iDGQ
	dC25jAvTDN6SXZ0lOmdamhxtL4ZkcdX4tkxkrvBJuIh4AQoXlTSHxvdD8PE9nlSYwSwv5cwQeaJ
	b7tvtj2VgdZ53MmC+snj1rcO6n9txKqzhb4QVB7rzFMVWfdaEnu/5fiQz15OYTkIBus1wQ6qHng
	c+J0q5MS
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr18536789f8f.8.1795713442699;
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm39409423f8f.26.2026.11.26.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject: Re: [PATCH] media: cedrus: vp8: do not disable the engine when a context
 stops
Date: Thu, 26 Nov 2026 18:17:20 +0100
Message-ID: <G0WUYb9qQ46JcwzsVuhrfA@gmail.com>
In-Reply-To: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
References: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_091724_914161_6A9B6691 
X-CRM114-Status: GOOD (  31.70  )
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

Dne =C4=8Detrtek, 12. november 2026 ob 17:08:44 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> All the contexts of the device share the one video engine, and the m2m
> framework keeps running the jobs of the other contexts while one of them
> stops streaming: stop_streaming() runs under the device mutex, which
> device_run() does not take. Writing VE_MODE_DISABLED from the VP8 stop
> callback can therefore switch the engine off under a picture that
> another context is decoding, which then never completes and fails on
> the watchdog.
>=20
> Every job selects the engine mode it needs in its setup callback, and
> runtime suspend resets the engine, so there is nothing to disable when
> a context stops. Drop the call, and the helper, which has no other user.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is correct, I have similar patch on stack. However, helper to disable
engine is useful, but in different place. No worries, I can reintroduce it
once I came around to post fixes for concurrently decoding issues.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Tested on an Orange Pi Zero2 (H616) with the same change on a 7.3.3
> kernel that carries further, out-of-tree H616 cedrus patches (VE behind
> the sun50i IOMMU). The old behaviour was brought back on the same boot
> by a temporary test switch for comparison. The test is a 4K H.264 decode
> through FFmpeg v4l2-request while a second process opens VP8 contexts
> and starts/stops their OUTPUT queue in a loop. With the old VP8 stop the
> watchdog fired 12 times ("frame processing timed out!", after two IOMMU
> page faults at address 0), only 289 of 300 frames came out and the md5
> changed. With this patch all 300 frames match the reference md5 and
> dmesg stays clean.
>=20
> On media-committers next, the base of this patch, it is build-tested
> only (arm64, W=3D1, no warnings); it has not been run on that tree.
>=20
> This patch is independent of Jernej's pending series "staging: media:
> cedrus: assorted fixes and VP8 4K support" (v2) and also applies on top
> of it.
>=20
> This patch was developed with Claude (Anthropic) as a coding assistant,
> which found the bug and wrote the code and the commit message. I
> reviewed it and tested it as described above, and take responsibility
> for it (Documentation/process/generated-content.rst).
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c  | 5 -----
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.h  | 1 -
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 --
>  3 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..a22a8402fc60 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -71,11 +71,6 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  	return 0;
>  }
> =20
> -void cedrus_engine_disable(struct cedrus_dev *dev)
> -{
> -	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
> -}
> -
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt)
>  {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
> index 6f1e701b1ea8..4edf729c556d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -17,7 +17,6 @@
>  #define _CEDRUS_HW_H_
> =20
>  int cedrus_engine_enable(struct cedrus_ctx *ctx);
> -void cedrus_engine_disable(struct cedrus_dev *dev);
> =20
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..4438c7e1bbda 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -856,8 +856,6 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> =20
> -	cedrus_engine_disable(dev);
> -
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
>=20
> ---
> base-commit: 3fc9303dba01676c2090768126e5327e341b7761
> change-id: 20261112-cedrus-vp8-stop-cb2d66d855ff
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20





