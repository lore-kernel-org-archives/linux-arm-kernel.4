Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A49E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 21:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nrFVwuHN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=xSx5SLpv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cH6JbwG5VdVbgmYxnv5oVF/9GrHOQI+8CfDJ0kv7PUA=; b=nrFVwuHN3AIwuGSPa6T0ElAU+Q
	8SPgjUc/p3fI6LyELiYJyPTVtxLpbrWrABUvvi8KvQxw28hlcwtOGoo3lRbAri6Kcac+m7AwgVqQi
	fMHXLfnJsHIWdS4FBeR+cphV+23uw0fK7WTOU3fEOvfrpVLQ615xvHfBg/Bsqhg8PmzsNNEDD0rac
	LS1vkVIHRS7lxoKwS+NsYaj3p+tj2et8EcPvVVBSj2qFYIBPOm8BEKbIkhdQEGeIu38cnKCof8TFv
	IVzlr1EMog8sgrzMrp9IsVNaEEiMrPrHhxr9CMQ+46UDcZZeLX6RnFdeT0VO9UtJosxEpbBSRH99g
	WnMqE7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLX2-0000000Gne6-2mdM;
	Sat, 14 Nov 2026 21:43:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLWz-0000000Gndj-1uzD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 21:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=cH6JbwG5VdVbgmYxnv5oVF/9GrHOQI+8CfDJ0kv7PUA=; b=xS
	x5SLpvGAqlh1hwZaJmIRl+4srILdtM9vk9LXzX9xFmbtBhtg2w/EVOdekoFG7M7lHkaczM8gY/Whh
	Bq/Uzntm7EL+Fy3IUijezIUy0cWXs5G/KB81U3+anUYS26P97QDiBldTIAo1ILh1HVntdfvXyKVWE
	u9V7HK9VF2yfhVI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSLWh-00GXUs-DW; Sat, 14 Nov 2026 22:43:11 +0100
Date: Sat, 14 Nov 2026 22:43:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Neeli, Srinivas" <srneeli@amd.com>
Cc: Srinivas Neeli <srinivas.neeli@amd.com>,
	Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Eric Dumazet <edumazet@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, git@amd.com,
	neelisrinivas18@gmail.com
Subject: Re: [PATCH net-next v4 1/8] dt-bindings: net: add Xilinx TSN
 Endpoint Ethernet MAC
Message-ID: <ff25f481-3ea3-441c-826e-75c22b47fac3@lunn.ch>
References: <20261113-patches_v2_external-v4-0-56bb26f042a4@amd.com>
 <20261113-patches_v2_external-v4-1-56bb26f042a4@amd.com>
 <13864fbe-6cd1-4d70-afee-bd3d3be163f3@lunn.ch>
 <4254be1a-f80e-4389-b04d-9fd10c1b77b7@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4254be1a-f80e-4389-b04d-9fd10c1b77b7@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_134329_522480_47830D62 
X-CRM114-Status: GOOD (  21.21  )
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

> > Is this a synthesis parameter? No other switch that i know of has it
> > in DT. The driver hard codes the value based on the compatible. Why
> > does that not work for you?

>   Yes, MAX_LEARNING_ENTRIES is a Vivado synthesis parameter of the IP
>   (256 to 1920), and no register reports it

I assume that will be fixed in the next version of the IP?

Are there many other synthesis parameter which are not exported in
registers? I just want to get an idea if this is a one off, or you are
going to add lots of DT parameters in the next set of patches.

>   The number of ports is fixed by the IP. The switch always has two
>   external MAC ports and one internal endpoint port, and no configuration
>   has more external MACs, so the binding never needs to grow another port.

And that is signed off by top management? The next switch you design
will be a fresh design, no reuse of the existing IP and will require a
whole new DSA driver?

>   The switch node follows the IP's register map. The switch fabric and the
>   two MAC blocks are separate register windows of the switch IP, and each
>   MAC window also holds that MAC's MDIO controller and PTP block. The PTP
>   timer interrupt is shared by the whole switch, not owned by one port.
> 
>   For these reasons I would prefer to keep the per-MAC resources on the
>   switch node
> 
> > 
> > > +        switch@38000 {
> > > +            compatible = "xlnx,tsn-switch";
> > > +            reg = <0x38000 0x8000>,
> > > +                  <0x00000 0x14000>,
> > > +                  <0x20000 0x14000>;
> > > +            reg-names = "switch", "mac1", "mac2";

I ask, because it would not be too hard to swap this address map
around, put the switch registers first, and then the port registers,
and you could have as many ports as you want.

Back to what you just said:

> each
> MAC window also holds that MAC's MDIO controller and PTP block.

So the MDIO controller and the PTP block are MAC properties, so should
be inside the MAC node.

> The PTP
> timer interrupt is shared by the whole switch

So that should be at the switch level.

	Andrew

