Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJRv8U8x;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kRQ7/C0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GCUENms0Eg+zy1gRC4+um4g3Klzq7iMeIXkFPj0+DsI=; b=CJRv8U8xro0dVD
	zSQZnYA6OGPYeVCIiVtfv1exlRI4/vB6/M5sI1V4cQLsnF38tBFZap+YeSa+2jA76wZn0Dn+FPhUe
	TTWtaq6duyj4ndW0F2Rke0oL0tKugPcCw0KDLCut4V6aPXIt1/P5ohq0BxwHqA+ulVZIVk9ijmCR9
	UFVkMRsh5vgWG2iaYDeJuodH8kv9eoBDTvLW+6cpZuU7w83SAdPNPjM/PN5Kx/RuudIYFs4e9JEZv
	vcHfIvXyZB/KOiw/4cDdMRvZRob/NBlMeue1B9kd2zg9mQRBhf+Zf6zyH4U4tobPNdnKoYMI3kQG6
	hLf9AxJJ03KRZY9exDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCEN-0000000DjOw-27VQ;
	Fri, 20 Nov 2026 00:11:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCEL-0000000DjOi-3bVY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 00:11:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CCD562623;
	Fri, 20 Nov 2026 00:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B5B1F000CA;
	Fri, 20 Nov 2026 00:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133512;
	bh=GCUENms0Eg+zy1gRC4+um4g3Klzq7iMeIXkFPj0+DsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=kRQ7/C0f8r5gpJCV38GIqMKqTE8KoilEbFEHcXcWJZpuQ1ZqdZ9KpLDOS5z4lqMsS
	 +NXr7y8Aw0vXzMBLumsq9BTQMqtS1UGiJBTnjX6IyDaeYr3/4Ad4+a6PgAuNe/d+wx
	 YKpGn0eal0CK1ZteXl3WXH6g5iaJVHalixU//2WW/W2oJDnByEOBle1wdK6mQSWxCJ
	 yYnUFMF4qUuBqwYiHbDxqDoqqWjwKNDzb/AxXKR6hHMg+qjjh7SV683H5xXdwD2OpT
	 HhePPyxwkuYGgD6Jkire9ewfL9QeumC8auK3CTLdjUPGMcEeprdMLE/bHcBWk2fiNf
	 Tlb6L0UkCAlUQ==
Date: Thu, 19 Nov 2026 16:11:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
Message-ID: <20261119161151.5251fc86@kernel.org>
In-Reply-To: <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
	<20261119144848.4ddd88cb@kernel.org>
	<CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 19 Nov 2026 16:32:58 -0700 James Hilliard wrote:
> Would it make sense to address the `rx on` drops in a separate
> follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
> would mean enabling error forwarding to DMA and passing packets whose
> only error is an IP or transport checksum up as CHECKSUM_NONE, while
> still discarding frames with a bad FCS or other fatal RX errors.
> 
> If we leave the checker enabled in both modes, `rx off` would only
> control whether the driver reports a checksum as verified. In that
> form the follow-up would replace the conditional bit-27 write rather
> than depend on this patch.

I'm not very clear on the changes needed to get to "bad L4 csum packets
still reach the stack" / correct behavior. Would you be willing to
sketch the full series out already, and then we decide what gets
applied where?

What I would like to avoid is us applying this fix to net (which
seems legitimate on the surface), but then following up with another
fix which unconditionally clears EMAC_RX_DO_CRC since AFAIU we
need to clear it for the correct behavior.

