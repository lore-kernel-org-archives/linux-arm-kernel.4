Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AB606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3RXT+CMg;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X7Ugrn8W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/fAyJeLPX6psmcLu3bRtntJrGTBMuzXSqMGDafrQVq4=; b=3RXT+CMgOrAKXS
	YEZ0fL4QAsisfIte1/3UV1lgWBZF8QHLstUHxQ0RjZi7M3H+FpDugI4ipGLY/1ICL4gxhoQ41oi2L
	UlA4HxlXMo/H0HUxEbqIhsrMObMBeNrnf/OR6L/BV7OGleNTAh6srbmhKkFoBxrygLIY0nCMSnjd7
	3T2WvbnNMdzLoSaOMUSdaGXFceApOSGvKT1qTIZ0/kUhcvKhmWonYgYgzcBVt0IkSyPVW9rT3H0qD
	CGr5w/GpKUD9KNSbLS4mZTYq7JHjWWpMZhOUzLyE6152qg0VI8QpcqFa86ir64LrSSnzXKSiJ/0Fr
	4dHDT4wX/ay57I+uj6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtIc-000000076cM-0OGh;
	Tue, 24 Nov 2026 16:23:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtIY-000000076bO-1yhf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:23:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2804D4E41743;
	Tue, 24 Nov 2026 16:23:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E82E7601E1;
	Tue, 24 Nov 2026 16:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29D3111E69A5A;
	Tue, 24 Nov 2026 17:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795537387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/fAyJeLPX6psmcLu3bRtntJrGTBMuzXSqMGDafrQVq4=;
	b=X7Ugrn8Woddfokr6FLA20qbzDK2NELl4DQDx+HPPXRfk/l8yWbz11HRU+N8n6PDS8Oepap
	umVsvpBz6qia0hLPmeEwLkIHawgA3+FXb45ikrpmTAVQIO+eQH+XX7GMs6fUl5zjSRs7jS
	YMk+zRR1fZcF4HS9/IytPMFK8vyDkhWqVsmSASsAiLwOP+SNiPHrCkubDGFo1LDafaoXde
	8qkGXCsYZurAGUNPPLmlS1iGSh97K/jzDT7Q/JRriSfRhneLQDsXijDLeYXP9jPxXUGw3q
	BtlZOsLo9J3IrYAF5pzd2gas1FtJFxJ5nerJMiccqOrGEU60u9wIYfLvoLcZUA==
Message-ID: <1498b3ff-c43a-4087-a108-016fda1a5b03@bootlin.com>
Date: Tue, 24 Nov 2026 17:23:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: fix uninitialized axi_blen array
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261124150144.7505-1-jszhang@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261124150144.7505-1-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_082314_650254_AFADA362 
X-CRM114-Status: GOOD (  15.76  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/24/26 16:01, Jisheng Zhang wrote:
> If platform doesn't provide "snps,blen" property, the axi_blen[] array
> will contain random value from stack, then the array will be converted
> to mask which will be written to DMA_AXI_BUS_MODE reg later. Fix it by
> initializing the array.
> 
> Fixes: efd3c8cc52bb ("net: stmmac: remove axi_blen array")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

I let you answer the bot on how that was found, etc. (it's better
to put that in the commit log anyway)

Thanks,

Maxime

> ---
> since v1:
>  - fix subject title
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index b3e06aa58fe5..29ead405f449 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -96,7 +96,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
>  {
>  	struct device_node *np;
>  	struct stmmac_axi *axi;
> -	u32 axi_blen[AXI_BLEN];
> +	u32 axi_blen[AXI_BLEN] = {};
>  
>  	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
>  	if (!np)


