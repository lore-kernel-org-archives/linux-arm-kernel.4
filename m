Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160B0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UmzA31r/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m1s8OUdm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZeJA76pSYL/29D1SUxOsf1XnK3pl538xdtA25Rrvpo4=; b=UmzA31r/9ysF6/xYTdNvKP0icb
	chUKODhl7awwUWkQXfFALIc/lkiw1Ef7mNpsXeYVmIqdyrDX6pctB3fH6lEhVQj0rUL3A6nY9B/oD
	NcXF0T69sDRl5dJUIpFgLpOAMvCxfVLgEVfQfaIOX9WcpCzOjW5cCSevDs9oGiUlfiXq/a6rqZaJB
	wl/Ztx9qq5QbcxpCJV2wJlKxluP5fXvyvDqmtae+YGX7YlghXcneivMpTWn1GWaZBpT9xhKZtndSU
	auaiQcN12Ho6F4OKAPjKIBJmsqrIxEZR8k4dnnfzAvXIzwMOQzf0lLN4uHLBzALo1q0Gphz1P130y
	oRiFgn6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsUi-0000000DCfV-0Hf9;
	Fri, 13 Nov 2026 14:43:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsUg-0000000DCfD-1yqX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 14:43:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9959460F21;
	Fri, 13 Nov 2026 14:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FF81F000C4;
	Fri, 13 Nov 2026 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580989;
	bh=ZeJA76pSYL/29D1SUxOsf1XnK3pl538xdtA25Rrvpo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m1s8OUdmwP41N/y2KWKb5jHCOlvKLqkZBWbDu3E14YEh5d76fNLkhxj1nUGmB5chr
	 7Sj0wBrGftxeG7S73VUUhCDhVwtQ0KlbpL/3bWT4vz4d5kYedh2cXX2pqCpSoDU0hI
	 urYVSrcZI0pIHIlyazLa6XUoGn8nmLbNcCCJUQFlZefVZQnzqdqI93UQHPfuoEJ72E
	 pDsYdbop+FjGLAmzwafXZt801QB6887kHaxQ5XuTrp4EE7sPTZAIgVeMb8mh7KTU5E
	 Eu5kZT0S+YCgXQTzWZEIw4F2HVmyIjNvEuD+V38wOUZkMqUCgKWGCkPdYuTnm2lXSe
	 3hAQ3kpK5bNTA==
Date: Fri, 13 Nov 2026 08:43:06 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	Jacky Bai <ping.bai@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
 mux
Message-ID: <179458098591.828545.5346870650734056259.robh@kernel.org>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-1-5a0063f1da9e@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-1-5a0063f1da9e@free.fr>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 08 Nov 2026 11:06:49 +0100, Vincent Jardin wrote:
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW: read-only in RCWSR12..14 of DCFG, changed at runtime
> through the override registers of its DCSR view.
> 
> Describe the pad mux as a child of DCFG at its RCWSR12 to RCWSR14
> window: the override registers are at the same offset of the DCSR view
> of the parent. One group per RCW field, one function per encoding.
> 
> Each function lists the groups that take it, so a pair the driver
> would refuse, such as can on iic1, is refused by the schema.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bindings/pinctrl/fsl,lx2160a-rcw-pinmux.yaml   | 264 +++++++++++++++++++++
>  1 file changed, 264 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


