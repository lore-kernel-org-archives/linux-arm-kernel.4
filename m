Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD469606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n+/pZPTT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=U0uJ3VV2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8B8Z/Qk1nK5Bur2fvtAfwzJGSgXNSKiCnAjpMw2EVs8=; b=n+/pZPTTxVYpJJyLVYW8kBr+Q3
	zDbJKW6Jt0jQ0w8sJW/acepLNpVVt2yJEXOURtZB5x1v+y7DLPOD0m5gNNanDLZWiO5NsWuYSBC6Z
	mdPrQJVrhEotrTRbWFbh/Bo3+zAUtJfDAHyTb00+FV2I695zT7tFod9mgPh8cCSXux5WfXqGkxvLY
	ujsZnhMKKSD4a3X7rKoPHz3b+Q/7ap9eIjVAwZgJCJ1sLAGgooK0V/tGhLlz29sEKK2RhkyySXM3N
	Me3OX8+w/cJicYrIyG8Hx6z8uGfy/6QLn4ZHAVvrYH9T+aHj3voSdLlDwS0DQ4t0fF3wds8OIKxnM
	iGvCiY7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCkS-00000001bA7-1iDH;
	Sun, 22 Nov 2026 18:57:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCkQ-00000001b9l-11Lm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8B8Z/Qk1nK5Bur2fvtAfwzJGSgXNSKiCnAjpMw2EVs8=; b=U0uJ3VV2VFvLy98r6f+U5S2PYJ
	aY6uIU5DawC2aNmwGsjQEQ/LQUylIdw7NupDyC7brvskQK5VDDZxee/2CjDaJRaPDrSfbF0reSgsK
	2Pq66Jyz2qD35vyeU4FWOp7dUcKTwnFByWT8aRQIvGcBFWnwF8jfuvSiiYUgbvlNPMbQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVCkA-000bb1-BM; Sun, 22 Nov 2026 19:56:54 +0100
Date: Sun, 22 Nov 2026 19:56:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: aiyengar1990@gmail.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-sun8i: Limit the MTU to
 2018
Message-ID: <002c36a6-c049-4ad3-9b1f-18f2162eaa71@lunn.ch>
References: <20261122-sun8i-emac-mtu-limit-v2-0-c4081e5b83cf@gmail.com>
 <20261122-sun8i-emac-mtu-limit-v2-2-c4081e5b83cf@gmail.com>
 <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v65_vY86WqvKr1m=g0N1Qr2UhLC1v3OHKPG3x+oURUKp7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_105710_307761_E2AA6A6B 
X-CRM114-Status: GOOD (  14.92  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The STM32F4 reference manuals has this note:
> 
> Even when the start address of a receive buffer is not aligned to the
> system databus width
> the system should allocate a receive buffer of a size aligned to the
> system bus width. For
> example, if the system allocates a 1024 byte (1 KB) receive buffer
> starting from address
> 0x1000, the software can program the buffer start address in the
> receive descriptor to have
> a 0x1002 offset. The receive DMA writes the frame to this buffer with
> dummy data in the first
> two locations (0x1000 and 0x1001). The actual frame is written from
> location 0x1002.

> So for normal descriptors the buffer size is bound to (2KB - bus width).

There is a second use for this, unrelated to bus width. The ethernet
header is 14 bytes in size, 2x 6 octet MAC address plus a 2 octet
ethertype header. By offsetting the start address by two, it means the
data after the ethernet header is then 4 byte aligned, making it more
efficient to access fields in the IP, TCP UDP headers etc.

	  Andrew

