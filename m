Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IfoOSrfs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5Zs8BuVC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2TMaY06QCdoxAv25NeIIrFHhhOR306YESTNsCHEfZAw=; b=IfoOSrfs3hf30QcW4qmFeVfEOs
	0L+lVPntQdXaWDaCORoxMNiDg88ilOSp5LNB+CBFkkThVK4tpbrpPHt4wPj+kAl3xf0vKMxAYQFzQ
	TbNx6i26dAtyXZ2pm+bsi5T810PKPDOiuY0f/heEEpfomxzKvXBTeJzkav7RNqa8feEwOP8cC1ZEF
	6WgEJyZlIMfbGyqnN+nxfw/8iojL1zlM3tzf6Par0JN5WwZRxLXSOART+hrStEQ51cmFlWq7PMS+J
	/6WSQtukSZTAi+JQMjmGU4Hu0gGd7Q+KC2LE9WyGYMjjGuZnfAcNYj9UBucoYjfcrGkYZX0W6qK1S
	1D6nZ88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKGY-0000000BLrx-12yt;
	Wed, 25 Nov 2026 21:10:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKGR-0000000BLrQ-10rd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2TMaY06QCdoxAv25NeIIrFHhhOR306YESTNsCHEfZAw=; b=5Zs8BuVC/5OjpGsjRwXsgtqpYr
	6z4DN5q6hY+dVWrN9y2aODEWFZESULHf4TEME9L2UzyryQ04F/91PGJU80rQerwRjS4Gag35OsJfy
	8Ad+D7BIsqGh979V7kJmSvDiW3IPI20V+8ADCN+IngsRwGCx+gV338I/HMvVCCWGe08k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xWKG0-001R9X-9M; Wed, 25 Nov 2026 22:10:24 +0100
Date: Wed, 25 Nov 2026 22:10:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4
 hardware flowtable offload
Message-ID: <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_131054_929297_08BB9588 
X-CRM114-Status: GOOD (  15.24  )
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

On Wed, Nov 25, 2026 at 11:50:28PM +0300, Fil Dunsky via B4 Relay wrote:
> This RFC connects the CS7542 forwarding engine to nftables hardware
> flowtables on Securifi Almond+. It is separate from the CPU Ethernet
> bring-up series. The main questions are the flowtable context interface,
> QCA four-byte CPU framing, and conservative hardware resource lifetime.

This is v2? Please include a version number in the subject line.

Please also list what changed relative to v1.

> - Is dsa-tag-protocol the right selection interface for this parser need?
> - What hardware drain evidence is needed before safely replacing different
>   result records or clearing the sticky HIT bitmap?

Is this a DSA switch?

DSA implies that there is a conduit interface which is used to pass
frames to a port of the switch. My first look at this driver did not
suggest that. It looked like there where a bunch of DMA channels, not
a full network interface?

I will look at the code again, but you should decide this quickly, the
different between a pure switchdev driver and a DSA driver is quite
big.

	Andrew

