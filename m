Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9DE606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PYIxfOJv;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0SwakPSZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sAbuJKLmKtX7zPRK5+klIxJMc8Ksx7mRqYtHwGJgnFE=; b=PYIxfOJv5exr9P
	DQND1hfaN30DTYj4oAfr/XWp6BLoPYJkq0z5igqZXmfTPT0gTacVjQNvwAQnQmzW0IwpNH9tI6dZr
	FQlvZoE+PNB4w2UI9P1yIHz88K9qZi4UIw0E8zZ8aimtz7hFL7NWj5mVwVxQ3cf/oi2GTRx8/fK0k
	OZkdunsUIY0AQiEfMcIIng8DuqpSoPZYYei0Nmv1+9Tdnzk+LzLo1oAZE4kd9l2IFFrc5fmiH5zlU
	OYZhDhPcEZUKG4RtrKYMjnF7opQKDzq9Ol7oRMPuB8TRvzG6RXT74ChVIpqBanu1gAr58krGhESKd
	cAILb88+O4oovsgZCDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTOA-0000000FwPp-3pPc;
	Fri, 20 Nov 2026 18:31:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUTO0-0000000FwOW-1dYq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 18:31:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D28CE1A16FF;
	Fri, 20 Nov 2026 18:30:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97ACB601B9;
	Fri, 20 Nov 2026 18:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F167A11BC0B11;
	Fri, 20 Nov 2026 19:30:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795199452; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sAbuJKLmKtX7zPRK5+klIxJMc8Ksx7mRqYtHwGJgnFE=;
	b=0SwakPSZBT7Srp6ifOCuTk901V1MDOLJ95w6eUyIPnxnDN1rqr8c9wxBUD+Els4Do/uYyJ
	YWqN28XO8H5bz2M4jELqVmCFNiOXut0WRGfQksK28DOOR7Zo3WPuoHE3PrNCrCfzN/LLOA
	AX5kXIjAy8v8Xymhqi9sGgw4A94ofJiravElwHRPJzrbF4U3OGi3y05ED5Nh9VOgf5AHXe
	JbZH0usF3xSRnjV90zJIkCq+tCQZu1t/PZmLsupsFJIhL9uVwsKefi+jrAQiLMxqaVMw/i
	QT+V0EPlH9nZr8sgL2H7yec2LOADcjOlVjrTsHWHu2GSEQ5fxX/UzLXDQ9tzsg==
Message-ID: <a91278be-9c14-4769-81f1-38497c38c47b@bootlin.com>
Date: Fri, 20 Nov 2026 19:30:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-sun8i: support ethtool
 rx-all
To: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
 <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-submit-sun8i-rx-features-v1-v1-2-5058fecba6b3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_103103_836272_E61EDE4E 
X-CRM114-Status: GOOD (  13.19  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/20/26 16:32, James Hilliard wrote:
> Packet captures on sun8i cannot currently inspect frames the driver
> discards for Ethernet errors. Add opt-in rx-all support for complete
> frames with a reported wire error and for runts the MAC can forward.
> 
> Set the runt-forwarding bit at hardware initialization and when rx-all
> changes. Serialize live updates with the DMA controls in the same
> register. Deliver these frames without claiming a verified checksum or
> including them in the good-packet and good-byte totals. Keep counting
> the wire errors even when the frames are delivered.

This deserves a series on its own. it's not only about sun8i, it add the
whole plumbing to stmmac itself. Is it something you've used and needed ?

This feels a bit strange as you answer to the series info bot that this
comes from Jakub's comment on the previous series, but I don't really
see the connection except that Jakub mentions RX_ALL.

If you want and need this feature, you can submit that separately.

Maxime


