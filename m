Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F06B606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GOby6Xb/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=E5STnlff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UMbwUeB8t+bBe5Ch2nKDl0BemN+d0WbUUhpgXgVg7Aw=; b=GOby6Xb/zvUH73yoTMRqQigUUw
	ZC0FfWxjhYj3cIXuSjQ2YnjGuCIeh5cPdzxjQ/2/H7PNEJ4T2jHNicgCHP/2zhkd14SrUW13v8HcN
	EBjcyUDRzNUg/61KLnKmJIqFWF4Vzr4KsA9GtvSohJ9yRBirnuYy+KW79Acpnt1BvwFp9JXgqyHIZ
	xaro/lz5VXIXvoWz56Mi6CiMKAckWjWYsqJZAtsRDf26HN8cmZ0IWkvXDx3E0BTzPA4sjVxf2Xwgw
	VXN96FawvS7O7dF0LiwIAe1h4Q552zTcyv9jKGuktHewQ+JbyjMD4HT+ErQpk6bJsdAeu0mzJsoGX
	+pxbkUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcAX-0000000534Z-23CQ;
	Mon, 23 Nov 2026 22:05:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcAV-00000005346-1LjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UMbwUeB8t+bBe5Ch2nKDl0BemN+d0WbUUhpgXgVg7Aw=; b=E5STnlff64Gn8IH+Qnqieq/Etb
	EMU8DWBBBZWQ4Ao5o+ckh8EQ9HiFx14Uhn9TXNq3jCvctiLCKkGSd4xdzQBBcjSqSian6qZ93+wPK
	V00ke96kUHndeowZRlTQ0OnDFpwqgJQnSu64C9q575bp/cuEl3Qwaw0Dzx7BfC7/9eM8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVcAC-000uQ6-CR; Mon, 23 Nov 2026 23:05:28 +0100
Date: Mon, 23 Nov 2026 23:05:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: filipp.dunsky@gmail.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542
 network engine
Message-ID: <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_140547_389155_E36DEA43 
X-CRM114-Status: UNSURE (   9.76  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +description: |
> +  The CS7542 network engine contains three GMACs, the network interface (NI),
> +  forwarding engine (FE), queue manager (QM), traffic manager (TM), scheduler,
> +  CPU XRAM interface and packet DMA.

Is this three independent MACs, or are we talking about a switch? Can
frames be forward from port to port without the CPU being involved?

> +        ethernet-port@1 {
> +            reg = <1>;
> +            phy-mode = "rgmii";
> +            fixed-link {
> +                speed = <1000>;
> +                full-duplex;
> +            };

This is unusual for an example, in two different ways.

1) rgmii often wrong.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

Does the PCB have extra long clock lines?

2) Why fixed link? Does this connect to an Ethernet switch?

   Andrew

