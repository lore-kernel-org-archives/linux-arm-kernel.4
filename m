Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7BF606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DmG8QgEt;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=TN/m4y5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UJDeRuWL3fCKkgqZZPCGE4QtQt6Hd49+PyHfiTtMYMQ=; b=DmG8QgEtaKIzWO
	U2A4TDcLoU3poO3o+hb+GntTeDDZJntmquBIVJReeEdnf3EBEGkaQGY8W/Iw5CMSCwDSe+6KCL0li
	dirPXaqvvP6euCRHZ4BC63DoPRjg0Ftbcx1OGzraulgXSGHwSG4LYoTgNN+1KDk09yY/rmM+SD7KM
	ZCzY4jx7OLFNclbJJsX++YCN+JHUG08/wQ9dka7QQL2i2HmRNElP9BLcwtewyiASuO0clFg1P7MLZ
	WzcpFIIDvb423m1/1t/DPU7Hj9kyRFwdy1T7SECgwtbGGhbeEnw1fYmbQbkQbiEkfaD8WIMGWkiSb
	2Y/mvGzUbn50Y+HKdK5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAPP-00000001LyN-0NQy;
	Sun, 22 Nov 2026 16:27:19 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVAPM-00000001Lxr-3Z19
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 16:27:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 121B7A039E;
	Sun, 22 Nov 2026 17:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795364833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UJDeRuWL3fCKkgqZZPCGE4QtQt6Hd49+PyHfiTtMYMQ=;
	b=TN/m4y5BqoeR5s/NmHbDkHCSCWn3y13tFdwDza3BtVVmS4GHuxXXxqOrQjJB5L9DlV+QD5
	vz4q755E61MQHh0n+IkS6E0i6hkg40B/Rb2nZPc8b+iRkt+BvKX4923SjX3TopRb2L9UYj
	Nl373XyEhLpa8fWs91cU8xlFM6cD2UD5aq6U0Qy6lc57PaUWEXA4XC7RoDO7yfdCjeL6wP
	dFzPuzhervq1cvoCy0rq4lgDrgsJ5F6+PUXHNxEoPKjhLIamzwdl0cBao9ZboCfl+KQlIc
	iByoW4HLEmJ9pKajhhv0oeYDo2eJ6FD2A4ayYh9cP5hRQx/3rlUb6VDyAzE/9w==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 17:27:10 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, LABBE Corentin <clabbe.montjoie@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Russell
 King <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: stmmac: Limit the MTU of normal
 descriptors to one buffer
In-Reply-To: <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-1-c4081e5b83cf@gmail.com>
Message-ID: <d3af70f9334370a1d32511504aa14725@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_082717_034249_C45EA8AA 
X-CRM114-Status: UNSURE (   7.58  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22.11.2026 10:13, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> Russell King noted in [1] that max_mtu for normal descriptors,
> SKB_MAX_HEAD() (3712 on arm64), does not match the hardware. Their
> buffer sizes are 11 bits, and stmmac neither splits TX frames nor joins
> RX descriptors for them, so a frame must fit one 2047-byte buffer.

AFAIU TX does split (jumbo_frm() in chain_mode.c).

This makes RX the real limit as ndesc_get_rx_status() drops a frame that
spans more than one descriptor. Please say that instead, it should also
answer Chen-Yu's question about hardware vs driver?

> 
> Limit max_mtu so that a frame with two VLAN tags and the FCS fits.
> 
> Link: 
> https://lore.kernel.org/r/E1vLJcL-0000000ExBL-0GFe@rmk-PC.armlinux.org.uk 
> [1]
> Fixes: 48febf7e6476 ("stmmac: allow mtu bigger than 1500 in case of 
> normal desc (V4)")
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

> [...]

Thanks,
Nicolai

