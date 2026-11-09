Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF5560A260C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LhltErHc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=B4raoCQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BYHIJBcBzX4woTKDxJ+AvoVlmuTug2Ro1Y2L1Yciwrw=; b=LhltErHcJU6Ee5FRO0/W5q9xTF
	XsNZMeIC8WFRGd6V7RiQ2HGnjEM7o7jPVWwUmCzHSJZ71NkWKaruUaYsrw5C0JQmBwimbPHCtWdO5
	tRvXNbvSmJB79jmSPkwIwbJ2n7FRR7lBMtRCizX7jBeTgoB8DtkH8PdMzxR8POm9YIUfDTRQ7YoOF
	sxPPEkfxb4cbZz2+aTmmAz7W5Dv0vpCGFPqlD28qjbqWHA9mAsOHdawm9TJTwz4nip/KodzeBaZ1Y
	JFKSC/NucBOdRl86fNIiyTrowv1g7B+9z4sm2LyWj0IIJ9Pr5QifiWV61AjHQ2UdCC0ih14reCACO
	1TIBX/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVSY-00000001apI-1kOF;
	Mon, 09 Nov 2026 19:55:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQVSW-00000001aoG-1NpZ;
	Mon, 09 Nov 2026 19:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BYHIJBcBzX4woTKDxJ+AvoVlmuTug2Ro1Y2L1Yciwrw=; b=B4raoCQN8gsvUex+Q8OePWBW7u
	r5YhYneu+ii6Y+mO/SOP08HMZ2rhwY11TMJVcztNP32aNQf9Nwd8MbDynYHGNyUQkvDzmynieRU1M
	JzrwsgEQt8iH5AsXqOXiWuVW/imtOxouUCyS74/XKA3JHH9T6nY/3otCIto+Ebw8R0g8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQVSN-00FKho-06; Mon, 09 Nov 2026 20:55:07 +0100
Date: Mon, 9 Nov 2026 20:55:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
Message-ID: <f2663951-aa1a-44de-87cc-8e7b105e1036@lunn.ch>
References: <20261109191515.252449-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109191515.252449-1-cyan2254650260@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_115516_369668_8E06607F 
X-CRM114-Status: GOOD (  10.70  )
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

On Tue, Nov 10, 2026 at 03:15:15AM +0800, Pufan Jin wrote:
> The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
> that alone is not sufficient for reliable RGMII operation.  With
> phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
> drops ~90% of the packets; the PHY's internal TX/RX delay is required.

Sorry, but this does not make sense. 4ns of delay is 2ns too many.

You need a proper explanation of what is going on here.

    Andrew

