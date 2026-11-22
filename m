Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF654606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqezYMGu;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=TWqFJ7O0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=j/ABN0weoH/winFO8vB9+wkWZtGk1oyDvKSMVSfn8VY=; b=hqezYMGuW3Zvmu
	5DmNtK2HFP5H+wUV35nP90XXhQ+cRTEVS57fv6AasBdwfaCzTHKvYR0QbScuZ1OyfhnHR3FLAZQvy
	2/m0oqNz4ToLhZJ/DJwMsjbZsTeXqV6jNxikURbfymjeEkykHqb8aI28cbOpfGFXqVcWWKIk7+Z1z
	DteL+VJF5yVNtVSn1/zDtFdHdfYYukGb5V8rWBJ8YTb5w6gVS26WaP8Vw8eyvopfh3RuCNA7xqC94
	5Zvu0WQdK2y627hY2EFLIXrzs+XszJTXF1DxGr8BDYKhbLTFuVDI4GNdadYLTqa8umte+pDdPFJ9a
	oEwKyn3FBfYn3mHasusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVATg-00000001Mei-2z7e;
	Sun, 22 Nov 2026 16:31:44 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVATd-00000001Mdm-3IBW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:31:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C25FEA03F0;
	Sun, 22 Nov 2026 17:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795365098; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j/ABN0weoH/winFO8vB9+wkWZtGk1oyDvKSMVSfn8VY=;
	b=TWqFJ7O0ELEUZetvWU8HRSG7eUK3T++NZpI4PJ0PHfZC7v8QLnMSB1RsKjaqBKIt5HJiUz
	Za8XmjLHFcNEfs1aW050lOjQXCgLxj531sxOnLZH8GT3vc3+WhiX5cip0q6ZrsZSfR3THf
	Ez3jTcPDq5rShz5TlWqHnpmrwCcrBvOl1GFUvqG5cBO7HRbBTJEfY/jQbosYToTM21HMBg
	ZnB0r6lu9RiO0KLihOUK2mskWTl3CyW7cU0uOA7/ZDNKA+L9qEsemtWInuTSkNl7r0Stbn
	cFNJR0NzUntuNiAMJmSfJlFk24TvBn/gPs5bDHCHa0JlriHfo6YNXyAYpUiBhg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:31:37 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: wens@kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: aiyengar1990@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Russell
 King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to
 2018
In-Reply-To: <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
 <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
Message-ID: <5e09c85c2c33885fecbdf81cd0b9209b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_083141_977416_8A9072DF 
X-CRM114-Status: UNSURE (   8.01  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22.11.2026 12:39, Chen-Yu Tsai wrote:
> [...]

> FWIW I think this applies to all DWMAC cores.

> [...]

> So for normal descriptors the buffer size is bound to (2KB - bus 
> width).
> Not tested, but I think there is more evidence supporting a 
> cross-platform
> limit.

The sun8i EMAC isn't a Synopsys core, so this needs a test on one.
Maxime, could you try MTU 2019-2021 on your boards?

> [...]

Regards,
Nicolai

