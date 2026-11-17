Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88ED606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YdTueGHc;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=L9L/oWME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kZI9eVSoDxMYzUaBre8Bv9aq6kAqdYaQlY1gjc3xYZI=; b=YdTueGHcVdNjd5
	CM3sMnWkPaHgmJO2tee+zH6hdqW+xgzIRTlodzCjfwcV1lzjtZv3imSPtG6mpmdIHl2YxCq755izl
	wSfzEcwS0jYFK25U+aW5ue1Kr8beuClao10AM5i1rVv20JJj+zCl/jLy6NtYm2L4SRJUWuwz5zmvT
	zuPGhwC3cn5hptkZAYGx9VG/lldjHNIREBFLAwwlq5Gi9TpskdgmTItJtqr4tKCVC6usnBXvUgCe/
	fifla2ER/oZg2KBcJ1+tZORqDCUT8ZY24gBZnKl5mVNfRB1zIZbeTm874uJFFvteLj+hJkE3rZzLN
	DoRa/CXyeIqufwj07NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKdo-00000006F0a-2FCM;
	Tue, 17 Nov 2026 14:58:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKdi-00000006Ez6-3HYn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:58:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 583D44E4157D;
	Tue, 17 Nov 2026 14:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D5705FD6A;
	Tue, 17 Nov 2026 14:58:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A199911BC0026;
	Tue, 17 Nov 2026 15:58:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794927507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kZI9eVSoDxMYzUaBre8Bv9aq6kAqdYaQlY1gjc3xYZI=;
	b=L9L/oWME0xTjm1qFnZuBc4j0HIJJBehI97LwiCBSfmpSrNkqoDsTiORYkaiKwR8cdzSK74
	OGWacgA9cYal6peO/AyoxFO57fztN6NdO/n9x62b44PhnICKvF4vjYJIiloX8TxnPBZLzO
	/hAEQGeEdB6OH2utl5RcTnnmz4XN4wbtAdtZkBuvngzf/5ZMX9+sYhIg/OzoXBWGVzpLZk
	JFKK1WVy7h7LF+1+i5zIMgYkFfZlnJiQ3y1D18NEbj2NHBAeg6tOLIy1soQw1pG+Uvr/oP
	NIKUrlpViqlTpvUYDIabBC+cAffoT5lxJCBniesBSdujCcHF8lv6cxxSTobUNw==
Message-ID: <28d89c7f-32db-474b-89fc-90eebcce2668@bootlin.com>
Date: Tue, 17 Nov 2026 15:58:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: stmmac: dwmac1000: stop hardware from
 dropping checksum-error packets
To: Christian Schmidbauer <opensource@grische.xyz>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Oleksij Rempel
 <o.rempel@pengutronix.de>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261114133640.3285413-1-opensource@grische.xyz>
 <20261114133640.3285413-4-opensource@grische.xyz>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261114133640.3285413-4-opensource@grische.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065831_032864_70283166 
X-CRM114-Status: GOOD (  29.20  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/14/26 14:36, Christian Schmidbauer wrote:
> When the checksum offload engine (CoE) is enabled, the dwmac1000 MAC
> silently drops any frame for which the engine detects a checksum error,
> before the driver sees it.
> 
> This breaks VXLAN over IPv6 with zero UDP checksums, which RFC 6935 and
> RFC 6936 allow for tunnels.
> 
> Set DMA_CONTROL_DT so that such frames are delivered instead of dropped,
> as commit fe4042797651 ("net: stmmac: dwmac4: stop hardware from
> dropping checksum-error packets") did for dwmac4. CoE remains enabled,
> so the driver still sees the error status and marks the skb
> CHECKSUM_NONE for the stack to verify.
> 
> Set the bit only with enhanced descriptors. The normal descriptor parser
> does not report a checksum-only error to the stack, so cores that use
> it keep dropping such frames in hardware anyway.

I can confirm, I tested that on dwmac-meson8b (normal descriptors) and it
does drop.

I could confirm this works with enh descriptors, thanks !

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> 
> Tested on an Aruba AP-325 (ipq806x-gmac-dwmac) with Rx checksum offload
> on.
> 
> Link: https://lore.kernel.org/all/20250625132117.1b3264e8@kernel.org/
> Link: https://github.com/freifunk-gluon/gluon/issues/3783
> Fixes: 47dd7a540b8a ("net: add support for STMicroelectronics Ethernet controllers.")
> Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
> Cc: <stable@vger.kernel.org> # 6.6.x
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
> ---
> Depends on patches 1 and 2 of this series.
> 
> v3:
> - Move code comment of DMA_CONTROL_DT on the line of the define, similar
>   to the original version in commit 47dd7a540b8a ("net: add support for
>   STMicroelectronics Ethernet controllers.").
> v2:
> - Set DMA_CONTROL_DT only with enhanced descriptors. The normal
>   descriptor parser does not report a checksum-only error, so cores
>   with normal descriptors and Type 2 CoE keep the hardware drop.
> v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
> index 1de1f929d61c..55d9c39287f1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
> @@ -162,7 +162,7 @@ enum rx_tx_priority_ratio {
>  /* DMA CRS Control and Status Register Mapping */
>  
>  /* DMA operation mode defines (start/stop tx/rx are placed in common header)*/
> -/* Disable Drop TCP/IP csum error */
> +#define DMA_CONTROL_DT		0x04000000	/* Disable Drop of TCP/IP csum errors */
>  #define DMA_CONTROL_RSF		0x02000000	/* Receive Store and Forward */
>  #define DMA_CONTROL_DFF		0x01000000	/* Disaable flushing */
>  /* Threshold for Activating the FC */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> index 3ac7a7949529..31d5f79ef560 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_dma.c
> @@ -15,6 +15,7 @@
>  #include <linux/io.h>
>  #include "dwmac1000.h"
>  #include "dwmac_dma.h"
> +#include "stmmac.h"
>  
>  static void dwmac1000_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
>  {
> @@ -129,6 +130,13 @@ static void dwmac1000_dma_operation_mode_rx(struct stmmac_priv *priv,
>  {
>  	u32 csr6 = readl(ioaddr + DMA_CHAN_CONTROL(channel));
>  
> +	/* Deliver checksum-error frames only with enhanced
> +	 * descriptors, because the normal descriptor parser does not
> +	 * report a checksum-only error.
> +	 */
> +	if (priv->plat->enh_desc)
> +		csr6 |= DMA_CONTROL_DT;
> +
>  	if (mode == SF_DMA_MODE) {
>  		pr_debug("GMAC: enable RX store and forward mode\n");
>  		csr6 |= DMA_CONTROL_RSF | DMA_CONTROL_DFF;


