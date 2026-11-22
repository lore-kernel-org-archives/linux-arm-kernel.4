Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xzB8fGj1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzfauxW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/izPWKlba6hwEZVlAponaP1r95LRqIjVUfRXZ0aBzfg=; b=xzB8fGj1ye0t1jn7403Iume1f/
	O7yNx6cLOYk6JgStPR9RjGSPY5+iIS4qUm/OAgLysYfZqjmKUh9dn9o3bAFHsbfrliezBNFek6NBe
	bdRK666JA2z0+seBNw4V5FL4THaptnalxJysbAgEQJIIyiRCdTOirxCPKkCsCjLqqNVq61hQtd5TK
	k0JJnnvTQy8hTh1JfuXVPg/WHq3WPC5rht2MjhPEOOY8hfLzG0uXCREmgP0O0wsmlfZ9CrxHFu921
	cCye9OlpWy/91yWVY0bvO5nL5SYdvtxw3SI6abXAj8KATStHBub0cr13J/t8bbwpWK8oxZhJlMbO2
	ZZhyfaAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA0E-00000001JgN-1L2B;
	Sun, 22 Nov 2026 16:01:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVA0B-00000001JgF-2KPP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:01:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B871445113
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 16:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999841F000F0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363274;
	bh=/izPWKlba6hwEZVlAponaP1r95LRqIjVUfRXZ0aBzfg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=LzfauxW3rEExAgmdG4kLoxGoYz/MCia8CKAMKl83GyTQO0VtPeGsltO2V+0WDIzWj
	 5iECqnhnsj/kKrsaZZtZk0JF7iqOz3ahCt6gKFZoeCjvUuH4G+mPSe+xwT74u1jd3i
	 QF9gztIjuvKpikuFo71r975dBEJ0kr1hGDuDYjo/O/TRz+k3VHSfQI/wli9qg4Ng+3
	 dBPEhXy5EWxAy6sz9xdKD6tt4S48iLgaF+amu2RYe3stbbjXIWbs98fXr1HI5mxKlg
	 KICpVYQ9w6f7Vj+VrtZPVQwSY+uwspIRjAXPj8v0O4PDsMoo3TwFFPD+0XpeTJTuHV
	 dYP13IXmp+OrA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso24521021fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 08:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEHdrPUCmOBCT7hha7JLjLfOVK2dOM+jAM0PB/XuD0R0To1vbMjU6i+g2SKjIAj+MSZV3uEaDx30qpRmiaxZ4X0@lists.infradead.org
X-Gm-Message-State: APuU4Z9o0Cf3hVhp3x+pRvf8odqn2bz8MtzYBnAha4OolfeByABR1Teb
	zN4mDUUjUOyojGvMfEx2+pkdXODEylUYnnOLEMNXgN+/iyeeI4IOf0oFlPOLw84eKQOTbbLNjRu
	Kxhu/MWV21L48r4AXYB5LyzdPq8s1jM4=
X-Received: by 2002:a05:651c:1474:b0:3ab:f9b:974 with SMTP id
 38308e7fff4ca-3ae7fac2697mr24800931fa.29.1795363272768; Sun, 22 Nov 2026
 08:01:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com> <20261122144926.284857-2-maxime.chevallier@bootlin.com>
In-Reply-To: <20261122144926.284857-2-maxime.chevallier@bootlin.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 00:00:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EZ3VP9HDyJps==0RcZ8fWTJuai2d-5ga0V4aEsrM8uw@mail.gmail.com>
X-Gm-Features: Aa3M54qOwDNW1Yljk-lFISp4AdkVQZj8kdy4KwB-RgmQjeLm8Au5CMg40XaXguE
Message-ID: <CAGb2v65EZ3VP9HDyJps==0RcZ8fWTJuai2d-5ga0V4aEsrM8uw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: dwmac-sun8i: allow controlling
 TX and RX flow control separately
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Nicolai Buchwitz <nb@tipi-net.de>, 
	thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Sun, Nov 22, 2026 at 10:49=E2=80=AFPM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Currently, the sun8i flow control setup only looks at FLOW_AUTO (which
> is FLOW_RX | FLOW_TX), and enables RX/TX based on that.
>
> Allow enabling RX/TX flow control directions separately.
>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

