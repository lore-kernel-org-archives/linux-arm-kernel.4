Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F973606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNP4Yc8i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFWU1dbh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=; b=lNP4Yc8i12AWMu
	jdbDioJZ2z3ExDPBUEf9plulfTkuo4AthrF4umU9+uVBUujhfsrmlDZkjiDBP32OVPR59O+OJAUyC
	FoKXdMI8xersARPiwXAl4B/D0165S+jzcGMbyLCakisoDek0au0aj9HID6s7Nmj3mDpoSMSfUVsiw
	cK1g1j1jXw/dV3QsWKT6Ad82pBADbgVfkQR2g4CUJUWaOcx5GtZXwYk2u1orlJVafDp6w9oOOzhJh
	3Yfvo1AAycbURqIJg3sYJk2Q3bTsHQAm4mCNnxCa3Pm1Ra+PtN5p1EG9jN4/5DM8jfyJh49c1H+wP
	RH/JYx4U/UmcgqL4cz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyHP-00000002zEU-3afd;
	Mon, 16 Nov 2026 15:05:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSyHM-00000002zDC-0vjY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 15:05:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5912262D52
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104B21F000D1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841555;
	bh=OLWrs6wHPjIfz7q4sqV0vSP15dB9qR0xZiDxNkgRnPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FFWU1dbhaoZvQa91GRdHI8OMpKROvy42/LGrcfuQXbdf73zihIiGdYVwNZODlPIbV
	 Q5czS1aAFUldNovu3EQYEfoc8NHu+qSDhm6v6a8eCG4NjUp76kfyw8lV9DsKKVk32O
	 CcIoLaAkJxaGHLILcqeNkWcM46hNELFAqOhyLM6uSFD20cXkC38iqTJWOeahtcSyYd
	 gl0YXDYAHTXv1NBld07Xow1K8b2g7I8++GShq7P5vme83fnO0wDP07J8foPfiJr0EU
	 +rycpV7xKfNuwSFM0D1jd7RIE4w+CF+RlYtMpdD4VUI53TH4XpcHTY33zunLN8yGxa
	 pKvVYF2ayle9Q==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so5639089c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 07:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFYOrF0XYDyAloAvHZP4ukZMCkTC3FJlYK6XkOagemlmTxe/jYGasw/yfEA7vdt0Zha0V5kYVwBWSNHWhphf69N@lists.infradead.org
X-Gm-Message-State: APuU4Z8kbTHT+vt2xnSTXh1GtEqeYxrwNpYSOunb+LOLJgy6GYd6R9fn
	egbBMMW3RZPmlCcSSmGL5//uz8iHbBfBxpkVVtYoFU8lhA7t6O7tBotfpl+nQQFiUsxXdJi1jMH
	WAjg5zgMnbCwdDfXPlUydkBcAt2xyJQ==
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id
 a92af1059eb24-1b503115668mr9409313c88.9.1794841554483; Mon, 16 Nov 2026
 07:05:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-3-l.scorcia@gmail.com>
In-Reply-To: <20260921113914.779393-3-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 16 Nov 2026 15:05:41 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
X-Gm-Features: AclHuK__YOxqBRiQVL1fHhE6d4s71_dwL_BIXyQUunv6tKh3Bya6r5Lxps8nc8A
Message-ID: <CAAOTY_8o7CQQ=GiRX9hiPOjWs=DMP_XSqhpz21d0cN_w3E5LdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/mediatek: Add support for mt8167 Digital
 Parallel Interface
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=
=8821=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:39=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Add support for the two DPI blocks found in the mt8167 SoCs. One of them
> can be routed to a DPI connector and another is directly connected to the
> HDMI IP.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

