Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e4awJwwb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FhxF28VO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SCQzlcbNwCmuhr5iFrK9gJq6siqjEJF99ctxEcILNVU=; b=e4awJwwb5odOJ2
	eT4nlFEJzzmi8HJLhWvsXlZBUaxuUO6d05d1nkrpwZ8+K05gP9m8U2RZlDeXX4twe5QiHzH7RmYxT
	5QelcO5PRi5OGkTSl/ziyEsBN34Vn7g0qxoPHq6FlHjbkQZ52bQHr283lUSEzv8H5VFtrzxL5gRwY
	B3kkKRYnng0a+jNxerYRxveH5x2G1KOfWAlPwA/acZXB/r1JdWv1DeVp3pExCGZfxyhvJmMPlB3We
	gp3kM5BJs+aoh8ZjoC3Kkz87shwVeplvVGlTp6JQknNCwDNzR78NMMDaBpSP26NFlE/0wzzB5Fg+8
	pb5yrPN9H1V2jdY71TDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWIu-000000044pD-3IeT;
	Mon, 23 Nov 2026 15:50:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWIo-000000044mG-3vvH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:49:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08319622FA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998BF1F00A36
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448997;
	bh=SCQzlcbNwCmuhr5iFrK9gJq6siqjEJF99ctxEcILNVU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FhxF28VOIx6y+hROoeNp60dLhhrLpae7rXzvw5rF7qUHPlYBCLyMDNMQrcWOhiw+K
	 JOho/jbZlZPyi/MQG4qrbOTx6O2AC+OlL0ImJHsNE0LlHpxtBfDzhLu35Yc3hfleS2
	 ihgiKn7z2XWHEBsgVwvIEcniBlcJpVjzCmrj4zEmHNqUfPvlqH3QNhxNUqR4e/eo3H
	 h6lnzAzDOV+cx6KIn2xsrZSX3gL8aAGSYVRRpmSdUv6WOpi6ANFIcZ0ulo0yf2is4j
	 URk3Qs2PoDSTaxmIQ3BmGcwDoC8R99MU4xDeAYvMS3AV/kqFPabpp+UfMAigDS9p7q
	 wXQ2sWK9pU6yg==
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so4397547eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFdkygTnaOxOokbfUi6ttila8sXVHhENjGtCT1YZ7X10j/7GB+Fzhw1MJy5i9YXtvSaisoRL3Qjrdmn+UbNXtW6@lists.infradead.org
X-Gm-Message-State: APuU4Z8+9anvu2MY98lJc7Yj8AMRKYBfRsQS8CEUvn1u47ZwaQeUpAB+
	j49pR9XDzkwyShxmLuD79yux24Uz7Wi24lmqMbRA9kEoOkzTgutFztiRe7MEk1R7sefwfZTeBRp
	S57iWHmSddqv7SQ/HOQfJsnB70HEw7A==
X-Received: by 2002:a05:693c:8943:20b0:386:af00:e9a6 with SMTP id
 5a478bee46e88-386af00eb48mr3600530eec.2.1795448996995; Mon, 23 Nov 2026
 07:49:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261011004248.1117649-1-agentzoan@gmail.com> <20261011004248.1117649-4-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-4-agentzoan@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:49:44 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8NSXSj64NBQN11kLs1ik0YXWH1FZ5gzJtzWYNEozQ7Lg@mail.gmail.com>
X-Gm-Features: Aa3M54oYdPL6VD3WqMQ7QRwBmptZ5_Vy6FcQra7b4AqYYR8h27_8PCC_wigfSRA
Message-ID: <CAAOTY_8NSXSj64NBQN11kLs1ik0YXWH1FZ5gzJtzWYNEozQ7Lg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/mediatek: mtk_crtc: Pick the connector route on
 every CRTC enable
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
> mtk_crtc_update_output() only picks the output component of a CRTC
> with connector routes when connectors_changed is set in the commit that
> enables the CRTC. But connectors_changed only says that the connectors
> changed in that commit, not since the CRTC was last enabled. A connector
> can be attached to (or moved to) the CRTC while it is inactive, and the
> later commit that only sets ACTIVE then has active_changed but not
> connectors_changed:
>
> - If the CRTC had never been enabled, the route slot is still NULL and
>   mtk_crtc_ddp_hw_init() dereferences it (mtk_ddp_comp_clk_enable()
>   and so on).
> - If the CRTC was driven through another route before, e.g. a CRTC
>   shared by an HDMI bridge on DSI and a DisplayPort output that is
>   switched off (DPMS) while the monitor moves from one to the other,
>   the pipeline is set up for the old output.
>
> update_output() only runs from atomic_enable and the lookup is a short
> loop over the routes, so do it on every enable.

With modification, applied to mediatek-drm-fixes [1], thanks.

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

