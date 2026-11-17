Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AC9606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f0fBxfC0;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PvkjzJcK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dwgskig9h6iqU3KR/twPrHbj/qykGXE3PcHP9fx9wKA=; b=f0fBxfC0lsaHfp
	LUKKZwZ/E6zMySXl6ozx8vxNdk/Nk1qYzRIpmljUyRLRSgdKONSiMERauqbnFPVfeodOhrCgHJpes
	TN5roKeEClwKjpjKC8Egc0edMsOQMt9Fs6k8n3wi7oJJJj9h6+PpT/2r27+bZtLaIBGJsZe3nMzeo
	8AxcZIzyhCgOkuXjJil0KyswnjfiUa7ocETElF/KyD07yIUQRL9rgtlcfhIzgEosxZOSBtSa5viiE
	THVb4kVdYwxLr8nN4NF9WhzCVacwfjaaf416EWH1MkX7hOmYh8JTwmWDz2CZ2llx9zrgkw/qXi/i2
	Oh97aZ86QA68HNczY9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ8C-00000005uKe-0cEY;
	Tue, 17 Nov 2026 13:21:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJ89-00000005uJI-1G7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:21:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18DB7C79A97;
	Tue, 17 Nov 2026 13:21:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6365FC81;
	Tue, 17 Nov 2026 13:21:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E12D11BC0026;
	Tue, 17 Nov 2026 14:21:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794921705; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Dwgskig9h6iqU3KR/twPrHbj/qykGXE3PcHP9fx9wKA=;
	b=PvkjzJcKgfUAPBAW52SsDYZGyBgweWeE1bS+J5zb3I/lWnRn1latHT4KJqrp2L181qVyzI
	gX6ltYdWoYCZ0cS1xMjwfDlQdpnT8sbc5PjjlktHojAC7O6OFdTo0r/SQWVVUNJvtRtx7D
	9PBIddrSNLMnKvEBFdPWkhHvhVX+Kzw4I/zCJq4VBZu0SwycBj/yIqrhlLxgn/JU56qdKm
	rGNmEYZFVGMm0UKaQi0TbX5tyLKlp/8K01l8203XhZTXjhsZK4wtpYu4JVhFPCH5aPkq9w
	XqFoDUu/soIQL+9yMFF6xfX4lsJLrvVYlKX4C8zwX8kOrfjy+5Xin1zVWMIn0g==
Message-ID: <73d6b341-3553-4243-83aa-ea8bb223cef9@bootlin.com>
Date: Tue, 17 Nov 2026 14:21:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v7 2/4] net: stmmac: track unfilled XSK RX descriptors
 explicitly
To: Ding Hui <dinghui1111@163.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: tommaso.merciai.xr@bp.renesas.com, dinghui@lixiang.com,
 xiasanbo@lixiang.com, yangchen11@lixiang.com, liuxuanjun@lixiang.com
References: <cover.1794646293.git.dinghui@lixiang.com>
 <92136a2c509f26f7a02053380a0b3c0fa426df48.1794646293.git.dinghui@lixiang.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <92136a2c509f26f7a02053380a0b3c0fa426df48.1794646293.git.dinghui@lixiang.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052149_523083_80AE7B95 
X-CRM114-Status: GOOD (  18.16  )
X-Spam-Score: -2.0 (--)
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

Hi,

On 11/14/26 10:21, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> An XSK fill ring may supply fewer buffers than the RX ring needs. Those
> unfilled descriptors must remain CPU-owned, including on legacy cores
> whose clear callback only clears the buffer address. Add an ownership
> operation that preserves descriptor size and ring/chain control fields.
> 
> Track the number of descriptors awaiting refill independently of the
> ring indices, so an entirely empty ring can be distinguished from one
> with no pending refills. Initialize the pending region after the allocated
> prefix and stop consumption before entering it. Retry pending refills
> on each poll, including userspace wakeups with fewer than a batch of
> buffers, and retain batching during packet processing.
> 
> Update the tail after successful refills and kick legacy RX DMA. Use the
> end-of-ring tail address for a refill ending at index zero, including a
> completely empty ring populated before DMA has advanced from the base.
> Select the receive buffer size from the XSK pool even if no buffers were
> available at initialization.
> 
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Ding Hui <dinghui@lixiang.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  6 +++
>  .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |  6 +++
>  .../net/ethernet/stmicro/stmmac/enh_desc.c    |  6 +++
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  3 ++
>  .../net/ethernet/stmicro/stmmac/norm_desc.c   |  6 +++
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 49 +++++++++++++------
>  7 files changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index c6a8f8d73501..307bbd63dbcb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -176,6 +176,11 @@ static void dwmac4_set_tx_owner(struct dma_desc *p)
>  	p->des3 |= cpu_to_le32(TDES3_OWN);
>  }
>  
> +static void dwmac4_clear_rx_owner(struct dma_desc *p)
> +{
> +	p->des3 &= cpu_to_le32(~RDES3_OWN);
> +}
> +
>  static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>  {
>  	u32 flags = (RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
> @@ -539,6 +544,7 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
>  	.rx_status = dwmac4_wrback_get_rx_status,
>  	.set_tx_owner = dwmac4_set_tx_owner,
>  	.set_rx_owner = dwmac4_set_rx_owner,
> +	.clear_rx_owner = dwmac4_clear_rx_owner,
>  	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
>  	.get_rx_vlan_valid = dwmac4_wrback_get_rx_vlan_valid,
>  	.get_rx_frame_len = dwmac4_wrback_get_rx_frame_len,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 6719ac6e395b..ad377c76ed4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -51,6 +51,11 @@ static void dwxgmac2_set_tx_owner(struct dma_desc *p)
>  	p->des3 |= cpu_to_le32(XGMAC_TDES3_OWN);
>  }
>  
> +static void dwxgmac2_clear_rx_owner(struct dma_desc *p)
> +{
> +	p->des3 &= cpu_to_le32(~XGMAC_RDES3_OWN);

sparse says :

+../drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:181:20: warning: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)
+../drivers/net/ethernet/stmicro/stmmac/norm_desc.c:146:20: warning: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)
+../drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:56:20: warning: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)
+../drivers/net/ethernet/stmicro/stmmac/enh_desc.c:304:20: warning: cast truncates bits from constant value (ffffffff7fffffff becomes 7fffffff)

Not too big of a deal, but let's not add new sparse warnings.

We've seen that before, you can maybe use some trickery like here :

https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/stmicro/stmmac/descs.h#L73

The rests of the series starts to look fairly solid, I've quickly tested
it and it does seem to work, I'll properly review the next iteration,

Thank you,

Maxime

