Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA847606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pMl4P927;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyE4WWr2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z1gOcE4sJDHdxNv2xjdQJHwE41dUt343uBhIQUVlSbo=; b=pMl4P9272RZ6xw
	K0SbqtYsaFLhh5WUOfhLQDMTTjTefi0b5nbO2XC088QOw8CpE2zl6Se7uSdvKae45NkI17H/vm9Fl
	C2J7mvzJviVRBElRat/NJL3r6HLepj8k2C2TCOA03M8rBMByRDD1O9L5TGwY6w465EJTO7w0Xr2nb
	9O9j9gPXWBPn/N+7bs6+b4anwrphUDFK14NRzjJdPlcoZDs4Lne63fh7iX20Lua5YGSVpWJjUppkI
	WGUK39dBrC+FR0lNCTBP3AOTz3ewjTmTE6ooIa64VbO43/OI0AGDjTkIlfx5IvkSufzWUlc47H1Of
	k7VHWJVj+cXBwVbv4kYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWS2-000000046Vu-3FQw;
	Mon, 23 Nov 2026 15:59:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWS2-000000046VI-0G43
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:59:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A112D41902
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2321F000EF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449569;
	bh=z1gOcE4sJDHdxNv2xjdQJHwE41dUt343uBhIQUVlSbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NyE4WWr2bYRyPrtQ0BjND99uXDUVHjV+msu5AQC0qgAw9hX/r+VNrMLcx9T7n81fe
	 KpKL0RkZox1E86XW7DiiT1SQPvuXfKfEN0AX2YJWgJL2HQHwyGXPfkAdDr3e0Sm1v7
	 CTL60zgorXfY0BW9Bs7JUIiB4+PkhBjmBbNpl7PHIchzibkMaGHvn7oFXGHm9tJi3Q
	 F09Dfj/3szF+1Af86s15Tzpu7ffaRvExTQBld/V4GjVbowyoPQojKTPKrCWYtq+y7s
	 0lTKmCxccJgZ15Hkq/OPevcuuZ5UDqD54fOWLadPibHRFirQpl6nSMXqwdJ6tdz2Ls
	 ldSfzOa1P1HHw==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so2336690c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:59:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGyDzncR2munDO7ZKXEYXjiKIhxHRySS2npzs4TwvqwXrTbfHH5ZfLEzDA/EjT9X2LtBKMfI0iW/ifKew0r/W4m@lists.infradead.org
X-Gm-Message-State: APuU4Z85L2AA/okXsI3W4TnWDW56Nb9MPiGUd0AKYgxRN3vISvSgKSPs
	+iwSbhEJQCiD8R1vndMHFzEVHqFaQYFiwgGfVlx+oTbocHUO0GVnJltj63gpAgoCH5XpJCdvrlW
	RyFXulZLHUMDyyUOoZedCaQJ6DQ8pAg==
X-Received: by 2002:a05:7022:1587:b0:1b2:6d5b:36bc with SMTP id
 a92af1059eb24-1b5568efd35mr14176365c88.23.1795449568635; Mon, 23 Nov 2026
 07:59:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <confirmed-20261105-38-2e09963f1b23@gmail.com>
In-Reply-To: <confirmed-20261105-38-2e09963f1b23@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:59:15 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8cH0mYNqneRvrLnXoiYfDajs2mC1QDQNLFBbO_h6jzDg@mail.gmail.com>
X-Gm-Features: Aa3M54ouwi-KBChskOnrEwzeqY5DzbDhQkaCtvHg-m39Wxz8dX26BLU8Xe3rDyA
Message-ID: <CAAOTY_8cH0mYNqneRvrLnXoiYfDajs2mC1QDQNLFBbO_h6jzDg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Keep the mutex node reference across
 deferred binds
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Yige Jiang <yigejiang86@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=886=E6=
=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_drm_probe() acquires private->mutex_node and releases that reference
> on probe failure or in mtk_drm_remove(). The component bind callback does
> not acquire another reference, so it must not put the node when the mutex
> platform device is not available.
>
> If this bind failure propagates through component_master_add_with_match()=
,
> the probe error path puts the same reference again. A bind attempted afte=
r
> probe has returned can also leave the stored node without its reference
> for a later bind or remove.
>
> Remove the bind-time put and leave the node reference with its probe/remo=
ve
> owner.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---

