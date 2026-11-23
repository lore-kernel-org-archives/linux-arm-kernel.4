Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r2ASeMcc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhnTzYnn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+aUeA+MT4pQzgTYYY3MzWDtwE8dPdBjMFRXJtpyXdqA=; b=r2ASeMccBk5wdL
	n8qvU28EqzOEfnb//4NSRazParlxNcJxb2DPZ/haI1a25zmK55Kj+qyxGauXoDek3sOi/f+GGNL9M
	rmp8s7lxj8O5U9BiC1WS6TMHKJYCr4PQR3e+VbTNFAnTfe6edebHah7DfxiQ4C0slaSfJ0+ehpN4m
	uZhcNxzzHC8KgnfJgApDlVcABOS1y2OzyOlKKXkqBhWyGNJ4kxtOhRiQtUgGju8HesX8DDhcjjVF2
	Sm167xqEHQFwihNMcuby0h+njniFItvXyk1WFbcE3kPTiv5Bm2KLLJ877b07DeJrEciIMaIkXfigI
	wATuXhdroGfxofKkIcbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWDu-000000043yz-37ln;
	Mon, 23 Nov 2026 15:44:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWDt-000000043yS-2HXL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:44:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E68B43CC9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1310F1F000D1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448692;
	bh=+aUeA+MT4pQzgTYYY3MzWDtwE8dPdBjMFRXJtpyXdqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BhnTzYnnqJZs1vlF2CbvKQ/jCtr+tzHhysT2ctBbdZUiMpjyTYRZHYHy0h8WY5jUY
	 po9bO4YN9TLw/x+knH+4j/7M2Qx68Gm3U2LNvzs0nECU49h3zxUCf/iIb2tINB6ZTB
	 KvpJe1vWWs37yzxOy69glevzwCB8cIew1fpzXvgU11jubtINVOj9Kyacl4dD4G7rfr
	 ee2WoAzM1E2Y/zm8TqrVmvDSWOs4uOOHe5vn5UGvEgT7r8VASO7h3v1iwp2v4llynk
	 W2+wNLpVKtELoKoMI+N1HjDdE8sum0OuHdKFa+ZXyriwZtjiAU2ImwvTF96bkhDz6K
	 HqAX2YIeSnxYg==
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b5786e099cso864900c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:44:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF/ehRUx/38f+xXOaYVh+bF8OfQVZc2l5DLjTp2EQdZ9ZyvGcBcrgs7AWFgLPPwNJp4EsBYnV8kC5DiY2ie755c@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZSb4xVGR3Av/RmzGq5nk5gMQ28q9c/RTHuh8iQh7TJOHH8wET
	C9p6jSXaLbT1klxwsWTE293ZEcu2f1C57Rleomay5uI5NFyRLPV8SpCRQc8Ks1fSo5ODua1RZep
	/A7HhQdTJnYjYNnUnDJKQi+TiC5lT+g==
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr10691688c88.12.1795448691498; Mon, 23 Nov 2026
 07:44:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011004248.1117649-1-agentzoan@gmail.com> <20261011004248.1117649-3-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-3-agentzoan@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:44:38 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8CtsEarnY804MbUcL+NewYha8kpKZL8cELYKkgr9YGng@mail.gmail.com>
X-Gm-Features: Aa3M54p47vp69xabIIzK4WtjBR9vqd7GfhDX7meoGYcQvi87327NFNEbYgSVxFA
Message-ID: <CAAOTY_8CtsEarnY804MbUcL+NewYha8kpKZL8cELYKkgr9YGng@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/mediatek: mtk_crtc: Skip the empty connector
 route slot in destroy
To: zoan37 <agentzoan@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

zoan37 <agentzoan@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8811=E6=97=A5=
=E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> A CRTC created with connector routes gets one extra ddp_comp[] slot for
> its output component, and ddp_comp_nr counts it, but the slot stays
> NULL until mtk_crtc_update_output() fills it in the first atomic
> enable.
>
> mtk_crtc_destroy() walks all ddp_comp_nr slots and passes each one to
> mtk_ddp_comp_unregister_vblank_cb(), which dereferences it. Tearing
> down a CRTC that was never enabled therefore dereferences NULL: unbinding
> or removing mediatek-drm while that display path was never used, or
> an error in mtk_drm_kms_init() after the CRTC was created.
>
> Skip the empty slot. Nothing was registered for it anyway: the routed
> components (DSI, DPI, DP_INTF, ...) have no vblank callback.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capab=
ility")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>
> ---

