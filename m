Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E61606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFL+JaBa;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Hhj/HoKb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OEvSG5RTeI+fg/i5waR+u3f8/plLy5P1A28O4+06/2Y=; b=YFL+JaBabtOVQc
	+XmgjFUA/3CWDwkTiVmfSQ5GxMAsvrugSalNhtJa5q5rt7ZhXuzMoorZGhG6Bvt445sB91EHtFp1d
	q+VGUMRw+BQIuJxhzFWzJxe117FmdvuZApokfPlCKMhMx+oWx0j6l4xawsM0AEj10kSdnmq0oF26Y
	THWhLal51ddXGboCnW3tREoLfBncuPcoa3lBdt1lxt8hAB1abyXiY5QZy+2B4JT2pwWMrRgjA4g0V
	a/7CudT4PPWQcgAuRtrRBShcjRRF0Kp0c0yihnbXfScA/YCxmqh+Ua/bllwEXKU9NBQtzvDZJJXxv
	wQL8mwfIcZGAurODdYpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxe0-0000000BC57-313V;
	Thu, 19 Nov 2026 08:37:24 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxdw-0000000BC3r-34iX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:37:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D95A7C4CBEF;
	Thu, 19 Nov 2026 08:37:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A5C5160237;
	Thu, 19 Nov 2026 08:37:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49E7511BC31E4;
	Thu, 19 Nov 2026 09:37:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795077433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OEvSG5RTeI+fg/i5waR+u3f8/plLy5P1A28O4+06/2Y=;
	b=Hhj/HoKbH/p4BCNUecTtB0nPfOPf7B7pvbMZm9lpG9RuTLYVGRYsUU2ikxh5DcSkktPbxU
	NXd2aiaA+HLTQls+TCSwQPsyPh1OutfAY2MBuEFfHWJR/604cueOcF/MN3oXCE3samsj39
	ikRZQ9OoWyd/s3MnLwdAUrANmkGG8ZwRxyRV9DO/KBuaT5iCLI4BNK7cyQuKQA4Q/tO9tR
	fsBjvxNCuQs3vMMwAbxpCca9AzBacXPjvsQW8txc+2+TrH9SH6opz7CXbHL86O2rBnuoyC
	c265qXp/hqGHWkliDIq84f6dLsKKSxRBKNxtDQTSUSTHZIkuwp6K/Dw/ru2XuQ==
Message-ID: <63b50406-f264-4492-8586-bf2d9cde91ba@bootlin.com>
Date: Thu, 19 Nov 2026 09:37:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac-rk: split gmac_clk_enable
 into enable/disable
To: Coia Prant <coiaprant@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261117182502.3045841-2-coiaprant@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261117182502.3045841-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_003720_910940_E819968B 
X-CRM114-Status: GOOD (  13.78  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I missed that one, please make sure to run get_maintainers :)

On 11/17/26 19:25, Coia Prant wrote:
> As the great Linus Torvalds once said in
> Documentation/process/coding-style.rst:
> 
>   "If you need more than 3 levels of indentation, you're screwed anyway,
>    and should fix your program."
> 
> The gmac_clk_enable() function previously used a 'bool enable' parameter
> to handle both clock enabling and disabling. This resulted in deeply
> nested if/else blocks, which made the error handling and rollback paths
> cumbersome and prone to bugs.
> 
> This complexity has led to bugs, such as the bulk clock leak fixed by
> commit 8db67bb6a1ff ("net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails").
> 
> Split the function into two distinct helpers: gmac_clk_enable() and
> gmac_clk_disable(). This flattens the code, removes the boolean flag,
> makes the caller's intent much clearer, and simplifies the error
> unwinding logic.
> 
> Additionally, this refactoring aids compiler inlining and CPU branch
> prediction (trust me). The reason is simple: no branch, no prediction.
> While the compiler might optimize it, there's no guarantee it will :P
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


