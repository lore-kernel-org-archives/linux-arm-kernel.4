Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB8A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTYPcnK3;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=QMoncX0k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8XFKXyx1GOfO5xGIHtXdRmS/LrQDe1E2/0CLeb0IQjQ=; b=QTYPcnK35OYZpP
	+/Y+KTZW4ncxbW7RaGv3usqrcG8GLAe/HAyIu/yaTmXefanfojLDyoLcwkGOxobLePRb6mnUBZse7
	4OmCr0l+Ed/umR8yy3V2ZK3TS68ckrtOuqVwR1s2GVMYazfH3ccECMyZzZAOMPVF3Lf8jZKluQnwf
	1KnqSyS/cOKSKmScm8ySCTfyqV6XDYkR2jsYClati5/bDStwkxluWFYdLt0oS2S6BsBB7DspFUrAc
	3sOXEjOTHbQI/SUXfpT+fP/TyZSZfMvjEV2gTO3TZZpPbKY7ymF1TM1pUYnLt9SwJJSUnt+FX7nrV
	47hZTFqjAxI7qQ7ZML2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9wo-00000001JDg-0iJI;
	Sun, 22 Nov 2026 15:57:46 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9wm-00000001JDM-0ktz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 15:57:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B944A023C;
	Sun, 22 Nov 2026 16:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795363061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8XFKXyx1GOfO5xGIHtXdRmS/LrQDe1E2/0CLeb0IQjQ=;
	b=QMoncX0kbUNktHVsqC7SkFlEI0N7Fs7OwtUaYespsF20PTXAK/En3B9Grn0PPamfmiPJdU
	fyiTim553wM3e/omRjM8egf24MnL+jqrsVGGvR5cr0dfxM6tim/TvsWykJBV4xJUpyLWyu
	0Q4ACmWEPc0y/JvPdF1dSCXcDpsxIFjV9MlJ4ICjGykwIZC0QffHaWXo2HD/kV+fcU4RvF
	Xo5rx7fQ54OI1barIla3Nh8HUxzf+QasyJGERXkSf/J8sFm/XU2xARWNxRbZuXtVo7MW+Y
	uIbWXBkgFhGa/FO8xrS1koyBjqqY+Srk2amcMal6qoJaK1LipUr6mJ9/RDk2yQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 16:57:40 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 2/3] net: stmmac: dwmac-sun8i: emit pause frames
 when the RX FIFO fills
In-Reply-To: <20261122144926.284857-3-maxime.chevallier@bootlin.com>
References: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
 <20261122144926.284857-3-maxime.chevallier@bootlin.com>
Message-ID: <5eb47dcb49898e948968a54bfa992e72@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_075744_468905_57F226D9 
X-CRM114-Status: UNSURE (   9.66  )
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

On 22.11.2026 15:49, Maxime Chevallier wrote:
> The TX flow control mechanism needs multiple things setup to actually
> work:
> 
>  - The TX_FLOW_CTL_EN bit needs to be set in the TC_FLOW_CTL register,

nit: finger off by one :) TC_FLOW_CTL -> TX_FLOW_CTL

>    this is already done
> 
>  - The RX fifo thresholds needs to be set, to indicate when the MAC 
> needs
>    to start sending pause frames based on the RX fifo occupancy, and
>    when it should stop.
> 
> Let's configure the threshold the following way:
> 
>  - Send pause frames when there's less than 2K left in the RX fifo
>  - Stop sending them when there's more than 4K left in the RX fifo.
> 
> This was tested in Allwinner H2+ using the ethtool -t "flow control"
> selftest. On that SoC, the RX fifo is 16K.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nbb@tipi-net.de>

Thanks,
Nicolai

