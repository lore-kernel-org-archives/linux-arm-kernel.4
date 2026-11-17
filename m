Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF20606A8BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KkC9nroh;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ckKFsnPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BYDghbSSGp8ajBj0SqwqioXz4gab4WkH6tR1bMEa1MY=; b=KkC9nrohEgsYuR
	yUOhvWAY+X9PZIQktw/MJBmiGSC41DeR1L19u23wwhssXAxCFk8ld5n0stu8X7RzCc8X7Tl2R9Q5g
	Q0Q+Nz8fEg93U6rct9xvFUwuktt/7wol1HJa9eWWQe9/a776SLxXkCbjXziHQttNVnD6DcXuPPm+Y
	FcTOgeEhsQXlpHOxBOcXGYUXf+JaBXesAc9UaJEgC7obiUJw4R6PTbm2a6TsRcwZ0w5cZ6NhQmAVg
	CFkeNfO21XPsJ/lvcTSXYK9KBDUeHH6c9JxjuRjPxV4xwBCYl2S85UqimLIej/rcJto9A7jUzoIVf
	/yxtCJbO0SU2qZ5KNi+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKcK-00000006EaG-2zq1;
	Tue, 17 Nov 2026 14:57:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKcH-00000006EZl-16Bh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:57:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 89524C6916D;
	Tue, 17 Nov 2026 14:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 208C95FD6A;
	Tue, 17 Nov 2026 14:56:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD32711BC0039;
	Tue, 17 Nov 2026 15:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794927413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BYDghbSSGp8ajBj0SqwqioXz4gab4WkH6tR1bMEa1MY=;
	b=ckKFsnPOv0NWmOIZtDjV4G8YpEPKa48eiB5p5OyeEE5Idd7Cl3q2mCJFAzgSG2pDRTXU74
	YgTwk7KCcawBZN4VG6jzjFZv8DBpoXJE5IIQBu527JZps6qPQgxFp731qDHduX23lGOy5l
	WlDmrzk0pFKeKKUnljc4Y7fwSMW0OCUd/gzXamxydWs0xqoqvEroD3UIz/H5OESx42upZv
	XaL1TzqXNL+TjyZ7z7ZIYUKqtdGVno5+hTRJ3JnkcL1UhqZs/BJhC7MwnJ4PFqKatiSZrX
	EUGZJpFHqxTdi2+V7LPnCT0+gso8C/e3ded9Kfn3ukx3HgwZxQDcGoBgQGZoWA==
Message-ID: <5231b964-215d-481d-87b3-86ff99829eba@bootlin.com>
Date: Tue, 17 Nov 2026 15:56:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/3] net: stmmac: dwmac1000: don't discard frames
 with only a checksum error
To: Christian Schmidbauer <opensource@grische.xyz>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Oleksij Rempel
 <o.rempel@pengutronix.de>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Aaro Koskinen <aaro.koskinen@nokia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261114133640.3285413-1-opensource@grische.xyz>
 <20261114133640.3285413-3-opensource@grische.xyz>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261114133640.3285413-3-opensource@grische.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_065701_636219_C96F9E4E 
X-CRM114-Status: GOOD (  23.76  )
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

Hi,

On 11/14/26 14:36, Christian Schmidbauer wrote:
> On dwmac1000 with enhanced descriptors, the hardware sets the Error
> Summary (ES) bit of the Rx descriptor not only for L2 errors but also
> for an L3/L4 checksum error. enh_desc_get_rx_status() returns
> discard_frame whenever ES is set, and since commit 1b746ce8b397 ("net:
> stmmac: don't overwrite discard_frame status") the checksum status is
> only evaluated for good frames.
> 
> Return discard_frame only when ES comes with one of the L2 error bits.
> A frame with only a checksum error is then reported as csum_none and
> reaches the stack as CHECKSUM_NONE, so the stack verifies the checksum
> itself. This matches dwmac4, whose Error Summary bit does not cover
> checksum errors.
> 
> RDES0 bit 7 is not in the mask, because depending on the core and on
> Rx checksum offload it reports a timestamp, an IP header checksum error
> or a giant frame, and enh_desc_get_rx_status() cannot tell which. In
> threshold Rx mode, a giant frame that fits one buffer therefore reaches
> the stack with a verified FCS.
> 
> Also remove the pr_err that enh_desc_get_rx_status() prints when bit 7
> is set. Once the MAC stops dropping checksum-error frames, any host on
> the link can flood the kernel log by sending frames with a bad IPv4
> header checksum.
> 
> This prepares for setting DMA_CONTROL_DT, which makes the MAC deliver
> checksum-error frames instead of dropping them in its Rx FIFO.
> 
> Fixes: 1b746ce8b397 ("net: stmmac: don't overwrite discard_frame status")
> Cc: <stable@vger.kernel.org> # 6.6.x: ee0aace5f844: net: stmmac: Correctly handle Rx checksum offload errors
> Cc: <stable@vger.kernel.org> # 6.6.x
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>

I was able to test that on Altera Cyclone V, and it works. 

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

> ---
> v2:
> - Drop RDES0_LENGTH_ERROR from the mask of Error Summary bits. The
>   length check further down already discards such a frame.
> - Explain in the commit message why RDES0 bit 7 is not treated as an
>   L2 error.
> v1: https://lore.kernel.org/netdev/20261020190319.884375-1-opensource@grische.xyz/
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> index 7ece8d4157a8..d0622f2605aa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> @@ -216,9 +216,6 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
>  		if (unlikely(rdes0 & RDES0_OVERFLOW_ERROR))
>  			x->rx_gmac_overflow++;
>  
> -		if (unlikely(rdes0 & RDES0_IPC_CSUM_ERROR))
> -			pr_err("\tIPC Csum Error/Giant frame\n");
> -
>  		if (unlikely(rdes0 & RDES0_COLLISION))
>  			x->rx_collision++;
>  		if (unlikely(rdes0 & RDES0_RECEIVE_WATCHDOG))
> @@ -230,7 +227,10 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
>  		if (unlikely(rdes0 & RDES0_CRC_ERROR)) {
>  			x->rx_crc_errors++;
>  		}
> -		ret = discard_frame;
> +		if (rdes0 & (RDES0_DESCRIPTOR_ERROR | RDES0_OVERFLOW_ERROR |
> +			     RDES0_COLLISION | RDES0_RECEIVE_WATCHDOG |
> +			     RDES0_MII_ERROR | RDES0_CRC_ERROR))
> +			ret = discard_frame;
>  	}
>  
>  	/* After a payload csum error, the ES bit is set.


