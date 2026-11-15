Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C96606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OsanHZTy;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=xVtLiVPR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=; b=OsanHZTyc01tY1
	VUc+mSG7g1rnAB9gryhFGOfffQ72YgM0REOG9/AtjmPedTrNfbpUlCdEABE1FfIA+iyXy1ZMxsWPl
	528Yh262KSEC++Mx2VLuuiOmzGDTHyFTqNZmnwRlOZPWNfmeeIMGGzyoZGpE16n3wbEPl3v7GI9fc
	KhMw0lnw/ZIErZX3EPHg09g3jvBB/dLqFcMS6mPpBSNTsf+9dj6zlmoWHubcgMaLSxCd45d+zvaVV
	2MEsd2jKB1Oxehm9GlU5A7XDwjb7jJ3+28zj0BtauQ3MHSKPT3Y4ZmwEMlgiUeog6kYiGzN73NDF6
	EGDEWVH63qoTeB4WBTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShmk-00000000Vp7-0lPK;
	Sun, 15 Nov 2026 21:29:14 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShmh-00000000Vo8-1Lzz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 21:29:12 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-67583c777abso2812247d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 13:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778150; cv=none;
        d=google.com; s=arc-20260327;
        b=oX+fe6vfU6Kltadh/HsdYAFpZq1SnUMjsyOjaL1DjRkBuhjtyjtKvWKiTZlBMFCcy5
         1q3HlxQouawfyGinXwwFfrx0o3PrqrXos3LFWhBfaruk1ho6rTOEQSrC4vvWoVeH//5O
         Xs/6y5M+2OMHiljrdJPlPAGunvl3RvuZ9fy/TMBKbfeybsciiuR5pQZq3VyZ/87TYwV2
         IfUS6OH5qTHFYEQgnmrf3/TJWDzGlWP1LwuOfIwl4uOwzF3VR4AeynaOFOOnwLVsB20D
         WUILTmW0x1pH8vU/FbkLnCQd+vuFdQ1PQ2MnZsjIuczUc/GO4bBpZ0F8/PnVi0kHuWvQ
         zj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        fh=pk5MVrjXWilYluKcxbRm/cZRpQMndcorVQ9Z/mjij70=;
        b=FFY/t0pm0WimcoR1SEHNlawuDDXucsBLBSlgX1qGKPWZjV4B73E/J4C6sfiLL29Iqj
         5WAiEFxeKgzBInFBIg66GNf255Ix1BcRVjk7DasfgpNTuPRqMNkZKZQpusrPInyB4JgU
         FNPZm4ByvT35CFesErJd+WW7ZmkpDhUPK4e2szNVRPb32QuliTHBdIUgzWYFLpgT+tjx
         qxDjKQhFLa9Yalc4EtobDcXdFTnj9q2+ZEM3/pVJRKYOL5v0fSu5Uz9TZmNEd7PMWd+O
         cH8HEj+YsnXgGc9pdcDTG1uFKW2Jblw7wuBBMug4/KykvATSvOYAzhS+h72vvumuf0Mk
         u+ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778150; x=1795382950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=xVtLiVPRWLpwqK1qzdnX/vgyaSB1RmgMVHEXfLHaFAgyKG9lSYUrfPKetY+VaNjLIZ
         Triws1FUK6wzAy7/n7i51KSxWseFUGiRgXxJxvRqvN1u79omq5NRWn2+vLX+uuvW79Da
         kqRZ+H+Jkr4fYL0aVT6Wb73srkVX4w98BVdMmNkVlcM2HctnwGWmyVFbVhwutPPmwklI
         KXXD6yKeAiRVoaotZCl5TdmgSxbj7A2reP7lnpROt8AkokFx7y+bDa7lFOmCVoGdZwxT
         7wyWO8S4aQf0wMgosKSXOrOU6JAuYyGo1flO9Ad/rmnULonRkty9LnICMrIod2kSK5U7
         xvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778150; x=1795382950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDJ9mV97bkkNMHmuEk5zxwCzRbf60DW+NGGRcWDMJuA=;
        b=r34OPPj+rLki+VmFhWZK8yyBKIiMqwAFVZ8r2inT5o9M7400/y5vfnvTWWG3vvAYko
         4i4T+V/c2A8eL6qzV1QYcENQhsyTD/kJVsAys6K86XwOBPz99ZsdtfL29Jin7cHub8bg
         pLg7PhsjMoAVgFKiNvmRU1dxQsCaKFRvq634n9pWumqcE3Y9BmszkQGxxSvWR5QVCvXZ
         XHDxLMuQjOVHyhICZQiMm6uguPmSkMG213Zo78laiAXaijeFPvPM1B9gytoreXWels0l
         LOtqLEmgRdXvWa68d/fpfTdVVF5OQbs0+BifSrYJbGaavFZTIabG72FUOKG77d1iND9F
         73Gw==
X-Forwarded-Encrypted: i=1; AL+hErGqgYkrs9ZjNkjcKSjsBal7jnFkJU/Dnxpa970dNFS/AiPibMXQytxfPtlfULmGBecn14dcCSRS6UODr9oD4CxC@lists.infradead.org
X-Gm-Message-State: APuU4Z9yvIqyTAtiebgmOLVf+VxKSsdYAVR8Ml2MOvUq7q92dcXZDQsU
	GEEn1KV7EtbgsmcLEuX1BJ2dA3DaMUj1zEmr7SX8ULwnJreGGjQiU8xcvzIgsY8xYWDRE2kZ8Uo
	NqEuWcAz0su5yzckCp7QVANyhRrtHX90=
X-Gm-Gg: AYBFou3YfMKc2DtX9LKJy6+AqK6MuSFsFySrU4CfWNOvXuSFJA/aq9tkFBbLgf3Ac6B
	Cskw2JsxDOBe2t9QGzjMtHSDaHN/F2H5OvXHJk2xEC+QDW57o31K+XoXZ3N4RIvLapZxYOnvU5j
	zjWi0Hbx4maFSkAtMxisIfCThcCCBc1xlsOC05bdN2nEev7w3Ec8wT8OFEmCFrJD1CddO9ExCKj
	mScuJj6sS6IJsxt1ki2OBj1zD0pG/dq7dh19bc1KRnNGXf4hYDuiIGMqNI4pprtzSPolNKxz7Bu
	bvvHQSGzecT1zd6Qdj0becRJC/KOtd9A86GVnXXHJiCANXEcr7+BwTqNr9+jJKk7wzkcyeH2L/A
	yhg7feshy/fkAVzP0tM0kqcfN1L7TrMt2olKm8AfGMyzzoP0bKINcZc2XOby14/WOAoMeCQ==
X-Received: by 2002:a05:690e:1c0f:b0:67d:b0a1:c9c3 with SMTP id
 956f58d0204a3-67db0a1d2ebmr1094277d50.32.1794778149875; Sun, 15 Nov 2026
 13:29:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-6-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:28:59 +0100
X-Gm-Features: AclHuK_mrwYOs88jQPUihYmd8k-bNvXzF9c0J2wcB0Lmj_2uDGdqbd4QCFY5NB0
Message-ID: <CAFBinCA12FvOi=9gB1xj3MDvNWstx1N4TtyyrrndJ_JT5eLX=Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] ASoC: meson: gx-card: add support for audin FIFO
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_132911_366717_2C360A0E 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 18, 2026 at 12:18=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
[...]
> +       if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", =
"FIFO"))
> +               return meson_card_set_fe_link(card, dai_link, np, false);
I suggest using the "audin" prefix. AIU / audin seem close enough on
all supported SoCs that we don't need a SoC generation prefix  in
there to handle this differently.

