Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA718606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aqHYkfLZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNTYIhWy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1HDtwLDGfSRrUZ/V7Ccnlt8XRob7ixLwnD6AArPjBEg=; b=aqHYkfLZt3MBuQ9QUnxfCG0YKr
	p3L4Ud9zlZCrUFA8nXd8ELRWAV+JyI1kugb2td+GgwbmJH9o0BxOeJ/GGPzbr6rEhRkuTs8UWhM7h
	riAndEn4NjVV/TlIQvqzkFKM4XQ7XQRDfvd2p6MFvnSx3TE9ZoeE7qjLgGOmyFQ+QRV9+EOSgDHjC
	76jAL1xJnbZHq8JX2MvFQsBruSdQM/3KnXKJdUmPHvaJWgj1F0lg+8iZrRx9bvdbMzLzDX/0caQh9
	uwCTD+YQ6BiXciwHMFFUvmXWrOQUyam74pYrW5R6bogUumvZ4lcgeXYzsFW4NvjNsvAL/oCH+5fW+
	EQd00jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSdI-00000001Gog-0Wsp;
	Mon, 09 Nov 2026 16:54:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSdG-00000001GoG-3Hnd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:54:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F04756348E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 16:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C481F008A5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243249;
	bh=1HDtwLDGfSRrUZ/V7Ccnlt8XRob7ixLwnD6AArPjBEg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lNTYIhWyh0pZzKnL2tR9hpeq6ddbd8RQRirnojvBgYsvmM1l1rIJVGWiQamXZNFiX
	 2yUV1ul3sJhA0O6Laskk3E2LTKXWvkAPJTRVtRzsBD8WAMOilp2Ocb3C/d6zaof0zw
	 oMrHZndlwXz5TDjJqcIJFjuBPqnaqdevqnbvlXXpIZ8lRe7dmUB8FigPn/B/dwPoeT
	 FA4X9yTQuDUujEt3e/aV4PeYZj99NJ9+tI/RQr1ducpwBYr76Yv106CRVQnA9PVH6h
	 U89Z9FMuU6zAPVmXNCIQ35ki2rCJ/YFR+G5Z5KS3B04GcGfJA7Ir4v6WcqMkCMaIV5
	 PEVC2/O7PoZrQ==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-563a0462094so520563b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErErpmCH+/OtDruKUn1UcmnF4y1Lfx4O2hI0gUMIxZu+ywQbx6RDByaEzcSfNE2wL1QggU/Jd8B+4zN9mOMtWlHa@lists.infradead.org
X-Gm-Message-State: APuU4Z87xGOPjgW2byp+mip/NSwLg5Sqr+aYyQEeKABsBeWQ9QBuuPNn
	/XE55Ynk1Z2PdvnO10icx1ej5ZOC+3mIQU5UkxP7EIkMxMku2oqnR67WsQxQvzXfANW5LLhFkDX
	w2VceE3I7DUmS9D76pMU049OmSOlvBqw=
X-Received: by 2002:a05:6808:124d:b0:4cb:f21b:6f8b with SMTP id
 5614622812f47-5683cd808femr133852b6e.30.1794243248824; Mon, 09 Nov 2026
 08:54:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104185659.884455-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261104185659.884455-1-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:53:54 +0900
X-Gmail-Original-Message-ID: <CAGb2v64xKf-w_Zuqqpg3Y=p9PZw+hdtW6hCdsXjR4Gxp_=gWpA@mail.gmail.com>
X-Gm-Features: AclHuK_bYfJMnl5Ic49VL29CSJbv2z-P7IUwDE--H7P2QG7_ODWK-Rv_7ZMYaAc
Message-ID: <CAGb2v64xKf-w_Zuqqpg3Y=p9PZw+hdtW6hCdsXjR4Gxp_=gWpA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 3:57=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
> reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
> undo that, so the clocks stay enabled and every further bind attempt
> enables them once more.
>
> Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.
>
> Fixes: c64c8e04a12e ("drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

