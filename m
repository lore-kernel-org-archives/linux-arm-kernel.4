Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B97606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MOcR3ldm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtJ2IneO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9UfLcSiWn0FiNKGKel4Ik3gxc0PzMKz6UDRi4JIVcvI=; b=MOcR3ldmWu4KKeK4aQRKZauJCg
	+pAEtzDl36OVFCz780/3eF7kuIGuy+1at18yYDV4WPhVyhXfaKLl8h2efKeQh9t1HdUP1tBoFrcIR
	N1HKBwzsHFb41BQ6a5XeCsHRMa+Asm73+7mevj3c8k8iIzjnDUuUL19M98WqaBfbRfp32/HGJw/Vj
	ZSjDCS+TvCNPYkv5KV92jzuyIIS7Nn9sb9goDtBoad7oVM/EDN8moz7ceW57zkhjb7B0eXginJcrd
	Qj2j8554zw5oO+ApIm8ZByeiVx3Ipo1wL0H2eYPJWDxnoRimIkO4p78pq/OpGBJScotQYEMSjv2zu
	if1RjAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVCu-00000003lbr-0owJ;
	Mon, 23 Nov 2026 14:39:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVCm-00000003lZl-2YGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:39:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EFF896138B;
	Mon, 23 Nov 2026 14:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2BC1F000C6;
	Mon, 23 Nov 2026 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444779;
	bh=9UfLcSiWn0FiNKGKel4Ik3gxc0PzMKz6UDRi4JIVcvI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YtJ2IneO//CyRXjolhcD6mF1NS3/RUd09qy8o19j8zpBftrUoiUhqOzUD2fwVLp0C
	 1icm5AaSh5SZyMDzO1LmM/2cf+mRbwPrfpISWD7PFuGsvaPcFM9ORouJDJJ36nxGSA
	 7+eZLM+46c7X/hYvQ1C0vC6rh5Hn8s2YmNPAvWe0sBraK49u3SRhc02IDttaZbwH/3
	 DGkjIF6+EdrL9ekElAePKO6sPIPcv/8/NxWVucDvz/ZhOlXZCCtgj+d48PxmjjI9JO
	 7FbvbWqhyHjEKC1rTy5gvHDc3lEEVX1HJqp7hUxPf39rk6PWBGCkwPsHbfkoSATJMc
	 udw2/KSs/5lXQ==
Subject: Re: [PATCH net v8 4/4] net: stmmac: restore the XSK TX pool on resume
From: netdev-bot+sashiko@kernel.org
To: dinghui1111@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com, fujiahui@lixiang.com, zhoujing3@lixiang.com
Date: Mon, 23 Nov 2026 14:39:38 +0000
Message-ID: <179544477829.3135.13778479191723150995@kernel.org>
In-Reply-To: <5874b73b815d2385bbbf5f6988d50b3772fa0ce0.1795096430.git.dinghui@lixiang.com>
References: <5874b73b815d2385bbbf5f6988d50b3772fa0ce0.1795096430.git.dinghui@lixiang.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete because it is applied to one caller
  instead of the shared helper.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the same
  resume path leaves corrupted TX next-descriptor pointers in chain mode.

--

net: stmmac: restore the XSK TX pool on resume

When dma_free_tx_skbufs() completes outstanding XSK TX frames, it also
clears tx_q->xsk_pool. This commit restores that pointer in
stmmac_resume_descriptors() after the call. Without the restore,
stmmac_tx_clean() skips zero-copy transmission after resume, even though
the AF_XDP socket is still bound.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1508cf08f03b0..550a0bd647e13 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2277,6 +2277,9 @@ static int stmmac_resume_descriptors(struct stmmac_priv *priv)
>  	for (queue = 0; queue < priv->plat->tx_queues_to_use; queue++) {
>  		stmmac_reset_tx_queue(priv, queue);
>  		dma_free_tx_skbufs(priv, dma_conf, queue);
> +		/* Buffer cleanup may clear the pool; the socket remains bound. */
> +		dma_conf->tx_queue[queue].xsk_pool =
> +			stmmac_get_xsk_pool(priv, queue);

[Severity: High]

Does stmmac_tx_err() run into the same problem? It is not a teardown
path, but it also calls dma_free_tx_skbufs() and then restarts the queue:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_tx_err() {
    ...
	stmmac_stop_tx_dma(priv, chan);
	dma_free_tx_skbufs(priv, &priv->dma_conf, chan);
	stmmac_clear_tx_descriptors(priv, &priv->dma_conf, chan);
	stmmac_reset_tx_queue(priv, chan);
	stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
			    tx_q->dma_tx_phy, chan);
	stmmac_start_tx_dma(priv, chan);
    ...
}

stmmac_dma_interrupt() and stmmac_msi_intr_tx() call it on a TX hard
error. If xsk_frames_done is non-zero, dma_free_tx_skbufs() does:

	if (tx_q->xsk_pool && tx_q->xsk_frames_done) {
		xsk_tx_completed(tx_q->xsk_pool, tx_q->xsk_frames_done);
		tx_q->xsk_frames_done = 0;
		tx_q->xsk_pool = NULL;
	}

Nothing in stmmac_tx_err() sets the pointer again, even though
af_xdp_zc_qps still has the bit set for this queue.

After that, stmmac_tx_clean() skips its if (tx_q->xsk_pool) block, so
stmmac_xdp_xmit_zc() never runs. stmmac_napi_check() also starts sending
TX interrupts to ch->tx_napi:

	tx_napi = tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;

For ZC queues, stmmac_enable_all_queues() enabled rxtx_napi, not tx_napi.

Wouldn't this stall zero-copy TX in the same way as the resume case?

The commit message says:

    Keep the buffer cleanup helper's behavior for teardown unchanged.

This suggests the other callers of dma_free_tx_skbufs() are all teardown
paths, but stmmac_tx_err() is not one of them.

Would it be better to fix this in the shared helper instead? For example,
xsk_pool could be cleared only in __free_dma_tx_desc_resources(), or
dma_free_tx_skbufs() could stop clearing it altogether. Either would
cover both paths and remove the need for a restore in each caller.

>  		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
>  	}

[Severity: High]

This isn't a bug introduced by this patch, but does the TX loop here
need the same chain-pointer rebuild as the RX loop?

In chain mode with non-extended descriptors and hwts_tx_en set, the MAC
writes the timestamp seconds into des3 of the last-segment descriptor.
In chain mode, des3 also holds the address of the next descriptor.
clean_desc3() in chain_mode.c repairs this:

	if (tx_q->tx_skbuff_dma[entry].last_segment && !priv->extend_desc &&
	    priv->hwts_tx_en)
		/* NOTE: Device will overwrite des3 with timestamp value if
		 * 1588-2002 time stamping is enabled, hence reinitialize it
		 * to keep explicit chaining in the descriptor.
		 */

However, clean_desc3() only runs from stmmac_tx_clean(). stmmac_suspend()
disables NAPI before it stops DMA. A frame that completes in between is
never cleaned, so its des3 still holds the timestamp.

On resume, stmmac_clear_tx_descriptors()->ndesc_init_tx_desc() only
clears TDES0_OWN and sets the chain bit. It does not touch des3, and
nothing on this path calls stmmac_mode_init() for TX again.

The RX side of this function already handles the same hazard in
stmmac_reinit_rx_descriptors():

	/* Hardware timestamp writeback may have overwritten chain pointers. */
	if (priv->descriptor_mode == STMMAC_CHAIN_MODE) {
		...
		stmmac_mode_init(priv, des, rx_q->dma_rx_phy,
				 dma_conf->dma_rx_size, priv->extend_desc);
	}

Could TX DMA then fetch its next descriptor from an address equal to the
PTP seconds value? stmmac_tx_err() seems to have the same gap.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1795096430.git.dinghui%40lixiang.com

