Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E42606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GRnoZOCA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EE4pXnNy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=poGwgjpmsxdXo4E2tjeuNJNfqDre4+vtgrUuX7o6vhc=; b=GRnoZOCAPdcNfW
	GqwQRSvJLexb8P14NCDSxTkJ9OqhXQ6Qro2yNHpatHg7narfyULMfez6PumFewNFA6e1iVuneWhF6
	VZdVce8gOPQc4i3ig2hIXhTR9oYutOVbgRMk7ndpCZt42aV9OzSgpknkdCO11F97lG3wkR/fPBIv2
	VrS/LuaS4HkJS27tJG9J2/aLIdvjgdt3IhvLNy/Iu/F+qHWRvdwXYi4vLNDkwKUqdVurVqVfO8uEt
	kDw7CJ2dDO9/C73oxVoAyzUBeU94qXNTdkdJtdLA42hRu+zcWUnXDAPP0ODbuehvaqLDyWFAZsoXg
	YMX144fC8+VE3six8EbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtxK-000000057SJ-2UN0;
	Tue, 10 Nov 2026 22:04:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtxJ-000000057SA-2qV4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:04:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 572F2405E8;
	Tue, 10 Nov 2026 22:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC9B1F0089F;
	Tue, 10 Nov 2026 22:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348281;
	bh=poGwgjpmsxdXo4E2tjeuNJNfqDre4+vtgrUuX7o6vhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EE4pXnNyIftrHc0enzk3tZXvrcDnMaB3850Jq1hDhw7BhvFJRNWrxSN80zX5+PYJr
	 su1cuKScN2RYyyppezHmxcPwK8VdMrSObERWsybzfiGtYSY9xeD/3Fm/6eMKy4Bj0I
	 +/nMGOR2umlQJg76aiQKP8hiPJl06k9fnP/k5Y34TRqVi+3I8M0FxKO4+dVxoymGd8
	 /9BJ0ddQVED+xNBQLYEh+lSg7Vf4qojiRGaLLq8z7gZAum/ta62FlB/qkHgdBVtSUx
	 Gzi8w5hJiesBMQhAJ3SsGx5443Z68bFwH7vfkxyCKDWIMSLwZv0I6PEq3tNU6hcG9S
	 Re+fcNyblNDgw==
From: Jakub Kicinski <kuba@kernel.org>
To: daniel.machon@microchip.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	UNGLinuxDriver@microchip.com,
	richardcochran@gmail.com,
	linux@armlinux.org.uk,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robert.marko@sartura.hr
Subject: Re: [PATCH net-next 1/9] net: sparx5/lan969x: stop the FDMA channels properly
Date: Tue, 10 Nov 2026 14:04:39 -0800
Message-ID: <20261110220439.2337145-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-sparx5-mtu-change-v1-1-f27bab580463@microchip.com>
References: <20261105-sparx5-mtu-change-v1-1-f27bab580463@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: sparx5/lan969x: stop the FDMA channels properly

This commit adds the FDMA_CH_ACTIVE register. sparx5_fdma_stop() now
disables the RX and TX channels through FDMA_CH_DISABLE and waits for
them to become inactive. It also sets INJ_STOP and waits for
XTR_BUF_IS_EMPTY to become 1 instead of 0.

> The stop sequence is used by the FDMA deinit, and by the FDMA buffer
> resize added later in this series.

[Severity: Low]
Should this patch carry a Fixes: tag? These three problems all seem to
come from 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA
functionality"):

  - the FDMA_CH_ACTIVATE read-modify-write that does nothing
  - INJ_STOP is never set
  - the inverted XTR_BUF_IS_EMPTY test

lan969x inherits them through the shared sparx5_fdma_stop().

sparx5_fdma_deinit() and lan969x_fdma_deinit() both free the DCB rings
and data buffers right after this stop. Before this patch the channels
could therefore still be active when that memory was freed. The old code
did set XTR_STOP before the free, though, so actual DMA into freed
memory is plausible but not proven.

The commit message presents the change as groundwork for the resize
patch and does not describe any user-visible impact. Would it make sense
to state the impact, add the tag, and perhaps send this to net
separately from the net-next feature series?

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> index 15ec9b053824f..bcae0bbd5e44e 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c

[ ... ]

> @@ -468,20 +471,39 @@ int sparx5_fdma_start(struct sparx5 *sparx5)
>  
>  int sparx5_fdma_stop(struct sparx5 *sparx5)
>  {
> +	u32 channels = BIT(sparx5->rx.fdma.channel_id) |
> +		       BIT(sparx5->tx.fdma.channel_id);
>  	struct sparx5_rx *rx = &sparx5->rx;
>  	struct sparx5_tx *tx = &sparx5->tx;
>  	u32 val;
>  
>  	napi_disable(&rx->napi);
>  
> -	/* Stop the fdma and channel interrupts */
> +	/* Disable the channels, and wait for them to finish the current DCB */
> +	spx5_wr(FDMA_CH_DISABLE_CH_DISABLE_SET(channels), sparx5,
> +		FDMA_CH_DISABLE);
> +
> +	if (read_poll_timeout(sparx5_fdma_ch_active,
> +			      val,
> +			      !(FDMA_CH_ACTIVE_CH_ACTIVE_GET(val) & channels),
> +			      SPX5_FDMA_STOP_SLEEP_US,
> +			      SPX5_FDMA_STOP_TIMEOUT_US,
> +			      false,
> +			      sparx5))
> +		dev_warn(sparx5->dev, "Failed to stop FDMA channels\n");

[Severity: Medium]
If this poll times out, the RX or TX channel may still be active.
sparx5_fdma_stop() only warns and still returns 0, and both callers
ignore the result and free the DMA memory right away:

sparx5_fdma_deinit() {
	sparx5_fdma_stop(sparx5);
	fdma_free_phys(&sparx5->rx.fdma);
	fdma_free_phys(&sparx5->tx.fdma);
	...
}

lan969x_fdma_deinit() {
	...
	sparx5_fdma_stop(sparx5);
	fdma_free_coherent(sparx5->dev, &tx->fdma);
	fdma_free_coherent(sparx5->dev, &rx->fdma);
	lan969x_fdma_free_pages(rx);
	page_pool_destroy(rx->page_pool);
	...
}

Neither deinit path resets the FDMA with FDMA_CTRL.NRESET after the
stop. Later in the series, only sparx5_fdma_pause() does that.

If a channel does not go inactive within 10 ms, can the FDMA keep
fetching DCBs from the freed rings? Can it keep writing frame data and
DCB status into freed memory, or keep transmitting stale buffer
contents?

Should the error be propagated to the callers, or the FDMA be reset
before the memory is released?

> +
> +	/* Stop the fdma and the RX channel interrupt */
>  	sparx5_fdma_rx_deactivate(sparx5, rx);
>  	sparx5_fdma_tx_deactivate(sparx5, tx);
>  
> -	/* Wait for the RX channel to stop */
> -	read_poll_timeout(sparx5_fdma_port_ctrl, val,
> -			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val) == 0,
> -			  500, 10000, 0, sparx5);
> +	/* Wait for the extraction buffer to be empty */
> +	read_poll_timeout(sparx5_fdma_port_ctrl,
> +			  val,
> +			  FDMA_PORT_CTRL_XTR_BUF_IS_EMPTY_GET(val),
> +			  SPX5_FDMA_STOP_SLEEP_US,
> +			  SPX5_FDMA_STOP_TIMEOUT_US,
> +			  false,
> +			  sparx5);

[Severity: Medium]
The extraction stop order is now the reverse of the old code. The old
code set XTR_STOP in sparx5_fdma_rx_deactivate() first and then polled
the extraction buffer. The new sequence is:

sparx5_fdma_stop()
    spx5_wr(... FDMA_CH_DISABLE)
    read_poll_timeout(... FDMA_CH_ACTIVE ...)     up to 10 ms
    sparx5_fdma_rx_deactivate()
        spx5_rmw(FDMA_PORT_CTRL_XTR_STOP_SET(1), ...)
    read_poll_timeout(... XTR_BUF_IS_EMPTY ...)

XTR_STOP is still clear during the CH_ACTIVE wait. Can the queue system
keep pushing CPU-bound frames into the extraction buffer during that
window?

By the time XTR_BUF_IS_EMPTY is polled, the extraction channel is
already inactive. Is anything left that can move the buffered data to
memory?

If not, this poll will hit its full 10 ms timeout whenever frames arrive
in that window. That is the same "wait always runs until it times out"
symptom the commit message says it fixes. The timeout is also dropped
silently here, while the CH_ACTIVE poll above warns.

No extraction buffer reset or DB discard follows the stop either. The
lan966x driver uses the same FDMA IP and does this in
lan966x_fdma_rx_disable() after the channel goes inactive:

	lan_rmw(FDMA_CH_DB_DISCARD_DB_DISCARD_SET(BIT(fdma->channel_id)),
		FDMA_CH_DB_DISCARD_DB_DISCARD,
		lan966x, FDMA_CH_DB_DISCARD);

Later in the series, sparx5_fdma_pause() drains the CPU queues before
the stop. After it, it pulses FDMA_CTRL.NRESET and calls
sparx5_xtr_flush(), which covers the resize path. The deinit path
(sparx5_cleanup_fdma()->fdma_deinit) gets no reset, though. The
ordering and the ignored drain timeout are still in sparx5_fdma_stop()
at the end of the series.

Would it be better to set XTR_STOP before disabling the extraction
channel, and to warn when this drain poll times out?
-- 
pw-bot: cr

