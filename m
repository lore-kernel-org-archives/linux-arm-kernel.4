Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gpIfxo8U;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=FW+OZ4fD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WArVX4RHsDBbDlMB9jeJsbFXO9eOXVjEfVktWuU8cPM=; b=gpIfxo8UWdKvpy
	llUeMLVrG4A7Gkk2hSEPjEnGMePvo/Z37YWbwbSVch5G8+iWwXWIvqsXIqymeIpNcxiLBrNfhv2Wk
	eXw4YqjWTqP72PQSz1CS0RDW4uMJDwIuNX2Dcks/XPoQntXp0bU99IuxCinA5sP4wAcDhh4akzweh
	lFxN0ua5zVRUy0fk9SVAwpTgF2sguQG3XflbkwjMEkdlpDzwmefGgM/b9ygXLP+7ua4Z4x4LwhySa
	jVeIll1mSDK80q//MP6DEDTXaMej4VsTdk/tmio+NK9C7oedh1aPz9GUeFWugznQKUiTnDdeaXPlk
	aehLVOOg5xk1J5CgZeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFSE-000000054ZT-2ljL;
	Tue, 17 Nov 2026 09:26:18 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFSB-000000054Wd-0YGT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:26:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C9D3A1649;
	Tue, 17 Nov 2026 10:26:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794907565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WArVX4RHsDBbDlMB9jeJsbFXO9eOXVjEfVktWuU8cPM=;
	b=FW+OZ4fDSt2alBajQx7uaqezbygOJtYL72/kkl7KfcNuHwWUB3oBK3KFvyyZiPWWCXMDD8
	uKvAEAu1EOBgDwBYCgXs4rhB+h6QmXiJXt+j4zArt3v+5JWppgfws56/ulFuBNTexuO2Ro
	t5/9q4FYt7yz9keCy3hrLfW3q2JjrPNRRIV9z+6Yxup2xbUcYHh6Bv4tYm3AwG3HMd3XEL
	qWoAoIRRPlnCLEZ5GskvUK129HDkyp/Pl6yJwKHnDEyYF6bldUdV2TK56hzyhBWoeFojH0
	QQpU+4hh3p4AqTHBbHXH0nYQqzS2miZ2XA/gM4HjiGma13u4B6EyAoj4SzbBIg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 10:26:01 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 horms@kernel.org, 0x1207@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC ASP 0x2
In-Reply-To: <20261114015554.2187341-1-zxyan0222@gmail.com>
References: <20261114015554.2187341-1-zxyan0222@gmail.com>
Message-ID: <e041744a3817153bfe5269053d0a9260@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_012615_483484_BF6E15B0 
X-CRM114-Status: GOOD (  21.12  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 14.11.2026 02:55, Zxyan Zhu wrote:
> Commit 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC
> Core 3.20") made dwxgmac3_safety_feat_config() bail out early for
> asp == 0x2, assuming that configuration has no parity protection.
> 
> Per the DWC_xgmac databook, the ASP field of MAC_HW_Feature3 selects:
> 
>   0x1 (AS_EPPE):  all automotive safety features, with ECC and parity
>                   ports on the external application interface
>   0x2 (AS_NEPPE): all automotive safety features, without ECC or
>                   parity ports on the external application interface
>   0x3 (AS_PPE):   all automotive safety features, with parity ports
>                   on the external application interface
> 
> The reset value of the field is defined as:
> 
>   (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 1) ? "3"
>   : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 0) ? "2"
>   : (DWCXG_ASP_ALL && DWCXG_ASP_PPE == 2) ? "1" : "0"
> 
> so ASP 0x2 implies DWCXG_ASP_ALL = 1, where the internal FSM state
> parity and timeout (MAC_FSM_Control) and the on-chip data-path parity
> (MTL_DPP_CONTROL) features exist; only the ports on the external
> application interface are absent.  The early return therefore skips
> enabling safety checkers that are present in the hardware.
> 
> Drop 0x2 from the condition so the FSM and data-path parity checkers
> are enabled again.
> 
> Also update the safety feature descriptions printed by
> stmmac_dma_cap_show() to spell out that ASP 0x1/0x2/0x3 differ only
> in the ECC or parity ports on the external application interface; the
> previous wording, "All Safety Features without ECC or Parity",
> suggests the on-chip checkers are absent from an ASP 0x2 device.
> 
> Keep the early return for ASP 0x4 (EASP), which selects only ECC
> protection for external memory and has no on-chip parity features.
> 
> Tested on XGMAC 3.10 and 3.40 cores.
> 
> Fixes: 669a55560e4b ("net: stmmac: Check more MAC HW features for XGMAC 
> Core 3.20")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 1a88cbaed70c..6b2bfc241109 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -859,10 +859,10 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, 
> unsigned int asp,
>  	value |= XGMAC_TCEIE; /* TSO Memory Correctable Error */
>  	writel(value, ioaddr + XGMAC_DMA_ECC_INT_ENABLE);
> 
> -	/* 0x2: Without ECC or Parity Ports on External Application Interface
> -	 * 0x4: Only ECC Protection for External Memory feature is selected
> +	/* 0x4: Only ECC Protection for External Memory feature is
> +	 * selected, without any on-chip parity protection
>  	 */
> -	if (asp == 0x2 || asp == 0x4)
> +	if (asp == 0x4)



>  		return 0;
> 
>  	/* 4. Enable Parity and Timeout for FSM */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 25894771e9e9..24f887df88fa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6741,9 +6741,9 @@ static int stmmac_dma_cap_show(struct seq_file 
> *seq, void *v)
>  	};
>  	static const char * const dwxgmac_safety_feature_desc[] = {
>  		"No",
> -		"All Safety Features with ECC and Parity",
> -		"All Safety Features without ECC or Parity",
> -		"All Safety Features with Parity Only",
> +		"All Safety Features with ECC and Parity Ports on External 
> Application Interface",
> +		"All Safety Features without ECC or Parity Ports on External 
> Application Interface",
> +		"All Safety Features with Parity Ports on External Application 
> Interface",
>  		"ECC Only",
>  		"UNDEFINED",
>  		"UNDEFINED",

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

