Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A4C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 01:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iMw2+47s;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=L3q8fkEC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=z1XCGeIJ+rg6XMddQPk3psrr5sIk9p5BAPCzdErJaPU=; b=iMw2+47sTg9hHmrpr/qerrTkCY
	wD+b/15tKRlCi03tqX64tuXHXSEpaIkW3JBq9qsZFspf1DyCMr0AYg3PKQ3+vaUyI5ynqZBIC1rd5
	LFVcNdGf3HYCxb7FdzFec+fx+9eeia/4p8WxkAK90SRvELFmHpZ1dwn2om8Uzl38ydpUu17DGWGXB
	sc+WN5/krxXyxkMz2MKq2mJXT2f2mKW8u6+NDnwZPTKkAgYNQothr0eRwtFeQ22uVpKoek8pdQYuC
	F/UjNwRMuENaCslPOo8sU7wYRyLhgOhCSRYpUltii/NWuD0/ITCllktZljNeDE4J/xVdImEzVn1EJ
	XrN6PGIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7yq-00000004JLb-1ZA8;
	Tue, 17 Nov 2026 01:27:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7yn-00000004JLA-1nGf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 01:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z1XCGeIJ+rg6XMddQPk3psrr5sIk9p5BAPCzdErJaPU=; b=L3q8fkECVZ8iU0vjR/o2pLd+uW
	L82+T0AgJjYNQGoYVq0CPJ4JURECiU6GpxLsYM1qKIeuiIFz7pZikb6jUVe2ZukZ/lAzL2VaJ54vJ
	y7j0US06hJNir+s27C1/2yP7qwtka9IDkJns3AjTg0LXtxsbx40G/wNPAEjEuPtnK0Cs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT7yV-00H2s6-UC; Tue, 17 Nov 2026 02:27:07 +0100
Date: Tue, 17 Nov 2026 02:27:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
 <avsebFtnIASV-KpV@pie>
 <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_172725_489985_F4F74E08 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon, Nov 16, 2026 at 01:48:47PM -0300, Magnus Leatti wrote:
> Hi Yao,
> 
> On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > > Does the chip automatically enables WoL and loads MAC from eFuse on
> > > power-on?
> 
> Yes. I pulled the power cable, kept the driver from loading and dumped
> the registers before anything touched the chip: OOB WoL enabled, eFuse
> address in filter 0, PMT armed for magic packet, receiver on. The
> packet wake bit in WOL_CTRL is clear.

I've seen BIOS poke around in PHY registers before, especially if the
BIOS has an option for WoL.

     Andrew

