Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA00606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mH7oyZzs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g98bzIVj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r2q3LlcXOhJE/UcBDtYyeeDxFGZavtW/dVlyD11nD44=; b=mH7oyZzsyxI+QX
	ZLMXYFyMMF4OsYJzKYUMb0OepTFJ1rU1JR9wPe62wQHKjAT1LWxeaUiHWzIXomfbjpTcJw8G+TOIN
	pVWS27jF+JJieSDE6zIHE1XqHIqIbUTgIw5nwxyleE4Fz1sxau+4wp6pAW6wRGFHpNMNgKwkekDxq
	mhKAtLw2ag/Zg8PE4xLuxt3m+HqWlRxux4ZBrMQYPYx+6+f/jse607FrPNuLIkMIJAnW/tjbWzRP5
	aG+aFju/5YY4DdkOrQTMLxAuipfQAM0Wwh6FjoLOsZZBQP1Qtv9cdTAsJxApnelVkqLTRxpLSJbo4
	NOLJZV9F25947T5WsqtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUu0e-00000000Rc4-06kj;
	Sat, 21 Nov 2026 22:56:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUu0c-00000000Rbu-38bN;
	Sat, 21 Nov 2026 22:56:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34D1C4174E;
	Sat, 21 Nov 2026 22:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D81A1F000C4;
	Sat, 21 Nov 2026 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795301798;
	bh=r2q3LlcXOhJE/UcBDtYyeeDxFGZavtW/dVlyD11nD44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=g98bzIVjF7dsTPk0LCNmEnMGd7I8UNkcV0BYpfbjNjVtvp5uKbQPCCyMfjrk1S8ZM
	 ijCNO/E4TofRPcHmCXc2H+nMObTE9l9tITZsgQbD/cRFGegBmzyKCje9n6zzH9F6ch
	 gZYQl4qqIpjkNoJpq9lJgB1NhCi+Dp+qV97dy+mzmE4KAoJm9VPnHHUoU9vrQvDevZ
	 hQgl4E+4XPUQvEki+kFVCbBPo9yo03KmX9ltn2BOJikuytMwxYXyg2MqCv2Zg0wF27
	 sZVfYh9R2TxAYvIldqCao8WbiuZzSYg701NEensNoe2Ovj0Nx5e+IWzTmM5jEaHIUN
	 nteLzy9C8yOnA==
Date: Sat, 21 Nov 2026 14:56:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Cc: 1579567540@qq.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, David Wu <david.wu@rock-chips.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: Add RK3572 support
Message-ID: <20261121145636.5c41bda1@kernel.org>
In-Reply-To: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
References: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
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

On Tue, 17 Nov 2026 17:04:34 +0800 Cunhao Lu via B4 Relay wrote:
> This is one of the subsystem submissions for RK3572 support.
> 
> This series adds the RK3572 GMAC bindings and support for both Ethernet
> controllers in the Rockchip stmmac glue driver. It provides RGMII and
> RMII mode and clock control, with MAC RGMII delays disabled.
> 
> The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
> Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
> The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
> ports, a Type-C dual-role port, eMMC, microSD, and UART.
> 
> Testing was performed with Debian 13 minimal and Linux 7.3 on the
> OK3572-C with the FET3572-C module.

Series does not apply, please rebase on latest net-next/main
and repost
-- 
pw-bot: cr

