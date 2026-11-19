Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UyS0OqLj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ffVgQ9h8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uxdKeh6JL2oY2XBBPbmZrNwISGDq9uDthjhiqqIBPyo=; b=UyS0OqLj1dJw5L
	nUmIGK9ec0MidkgU5N6YwtLRFVu9ERKj3R6x3b3EqhdRHZ/caaGInEsRLCqjrm7j8iBlBemAQ4nS+
	6bolR27L3+KUhQ60tgj1YPaIYIJ0xuy40rMK8Z+r0Vsl+vUujx/hY6zSlyFsOFgB6nwid6ZiABePn
	hJxCuSotM6NxY97XRnTG3x5m7Dga547zK0KJDleXJc/l2uKuLV1cOPVJTAbuu94QmBEz3DwwfD5Vr
	a2KLm6UVuq55/38VlG1yktgFA4vNqLQZHSwWtuxvt7RzLu9HXvzXcZz9XRIkqsc6K/h02xUozHrX+
	2wowCRr97EMj9yN9I36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAw0-0000000DcB4-2DZ1;
	Thu, 19 Nov 2026 22:48:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAvy-0000000DcAx-2DPj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 22:48:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE80D41F29;
	Thu, 19 Nov 2026 22:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3EF1F000F4;
	Thu, 19 Nov 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128529;
	bh=uxdKeh6JL2oY2XBBPbmZrNwISGDq9uDthjhiqqIBPyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ffVgQ9h8PYbAfvjb/j9aLLRAvUnUGIgrkaCBDw9pyRnvQSv3u+1coTIst4AxVU8XH
	 NRTiObskWMdWIbzoqqAO602nC8w0WbYVdyF67eahSHHBG7N7ftFEPkayEMhaBs/BNY
	 snOOLcTwLVlDglPubRcvab7a0aBNX7i53JhyatGwYHpXrQ8yj9Nzol7/T5D4L8Mdxp
	 PAlZGU2KQAucnzJfUvQvxm+bRH5HMHOX2HTAha3KhBSamDAZNI9cmROT4kUB41N/VM
	 A3KB4VBYm7aJnsZEBW9Brl5KRg48316bR+5e+5wWTjtr2gvkjnI1LSH2wzdScKrGLQ
	 uJmnrLk5bSiMw==
Date: Thu, 19 Nov 2026 14:48:48 -0800
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
Message-ID: <20261119144848.4ddd88cb@kernel.org>
In-Reply-To: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
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

On Sun, 15 Nov 2026 17:58:26 -0700 James Hilliard wrote:
> stmmac_set_features() clears hw->rx_csum when RX checksum offload is
> disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
> hardware checksum engine. The MAC therefore keeps dropping packets with
> invalid IP or transport checksums before they reach the host, even after
> ethtool reports RX checksumming as disabled.

Rx checksumming only controls whether the _good_ packet indication /
offload is communicated up the stack. The device should never drop
packets due to a bad L4 checksum. Checksumming L4 is not much of a DoS
vector. Oleksij was fixing this in other stmmac variants. I _think_ you
should always clear this bit if it leads to packet drops.
(FCS is fine, bad FCS should only be passed up if RX_ALL is set,
but sounds like your device has all checksums controlled by one bit?
in which case we prefer to see all and let driver discard the bad FCS)

If I completely misunderstand things we should at least get a respin
to update the cover letter. The commit message talks about L4 offload,
and rx_csum is L4 AFAIU but the bit is called CRC which deserves a
mention somewhere IMVHO.
-- 
pw-bot: cr

