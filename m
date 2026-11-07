Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA769606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U22tOLdy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CW/Xjxlz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dz4nU+XktsAws1dehkwjm0qCQeZEQukoJ/eEOgzjJmw=; b=U22tOLdyUv8RBVkG1l+0x5CUEi
	PEJ1e/3VuijmnhBZD9uA7NoSbheERIQ+f2UUrSfQYC3D6TP3Nw0YNyjb/ZLcmO9HzjuR0oTgIRQQo
	gMlfOKOZ2IHJ0ORcH3iOGZPvoLHoLnoVrujbwh2fwqMASUlB0AJOuXVZwo45Cv/cqIf1ZUbI5sJuZ
	AqoNee88LYBcmMYQv0FVotqxw+IEoDneiPgFsniA+ptn9VhKP1e/ZPbiUX9OvW2ntu9S5oyo/hJEN
	o5NijMXqiZUDbH+tuzRVXaOqQCfDvs0R4DqRgFeMzC7sBp8+IjIfBKrqSTLglMg4jru7Dw/iT2/aP
	rZpxHeBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfuT-0000000EhHa-142Q;
	Sat, 07 Nov 2026 12:52:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfuR-0000000EhHS-2vkO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 12:52:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A77743AF3;
	Sat,  7 Nov 2026 12:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB991F0089F;
	Sat,  7 Nov 2026 12:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794055958;
	bh=Dz4nU+XktsAws1dehkwjm0qCQeZEQukoJ/eEOgzjJmw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CW/XjxlzDTg1aVQdaW7JqzCU9aaRZxg62YnM+vgqwA4flyextgxB4VK1ac/IZ1+v8
	 Cld5GUjoR/e3mRH/HCVPROmI+GqeAVSCy0MnXbulfqi3Wg3TcDyaUu8OJ0KPQ9C4i+
	 l5t5U3OLiP7rQ9LyRNqBdmyAEfWssgWcaIleDJl3djI003zeCK49MptH2JveNn6Sj0
	 IYM96xWfsnZsLVEpC461U6Y9DFgP8aRtUIMcm4BCbGuF+ws5liDWWlFWiQN/0ZkVSx
	 3uMyOs5gUS7S2Iidi1R4Zoizlq2D/QeYDvO73S//iARvwmixC1nJu8Uktg24qnjpqD
	 UhmvdKDI8T73A==
Subject: Re: [PATCH] net: stmmac: free RX resources when TX allocation fails
From: netdev-bot+sashiko@kernel.org
To: vulab@iscas.ac.cn
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Sat, 07 Nov 2026 12:52:36 +0000
Message-ID: <179405595688.994134.1843500788974971566@kernel.org>
In-Reply-To: <20261103102857.1340748-1-vulab@iscas.ac.cn>
References: <20261103102857.1340748-1-vulab@iscas.ac.cn>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: stmmac: double free of RX resources after stmmac_xdp_open()
  failure
- [Low] The commit message does not accurately describe what leaks, and
  it leaves out one of the two callers whose behaviour changes.

Pre-existing issues:
- [High] The NULL-pointer oops this concern describes exists in the code,
  but it predates this patch.
- [Low] This problem wasn't introduced by this patch, but the kernel-doc
  of alloc_dma_desc_resources() (lines 2434-2442), repeated word for…

--

net: stmmac: free RX resources when TX allocation fails

This patch makes alloc_dma_desc_resources() release the RX queues with
free_dma_rx_desc_resources() when alloc_dma_tx_desc_resources() fails.
The goal is to stop the RX side from leaking when stmmac_setup_dma_desc()
drops the partially populated dma_conf.

> stmmac_setup_dma_desc() only frees the
> dma_conf on this path, so the RX DMA rings, page pools and socket
> buffers are leaked.

[Severity: Low]
Is the list of leaked resources accurate? When the TX allocation fails,
__alloc_dma_rx_desc_resources() has only done four things: created the
page_pool, allocated the buf_pool array, allocated the descriptor ring with
dma_alloc_coherent(), and registered xdp_rxq.

The RX buffers are filled in later by init_dma_desc_rings(), so no socket
buffers exist at this point.

stmmac_setup_dma_desc() is also not the only caller. stmmac_xdp_open()
calls alloc_dma_desc_resources() on the persistent priv->dma_conf:

	ret = alloc_dma_desc_resources(priv, &priv->dma_conf);
	if (ret < 0) {
		netdev_err(dev, "%s: DMA descriptors allocation failed\n",
			   __func__);
		goto dma_desc_error;
	}

Before this patch, the RX resources on that path were not leaked, because a
later release freed them. Now they are freed early inside
alloc_dma_desc_resources(), and priv->dma_conf still holds the pointers.

Could the commit message mention this caller and explain how the change
affects it?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7ffed295eb14a..3f9f3b7878c20 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2450,6 +2450,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
>  		return ret;
>  
>  	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
> +	if (ret)
> +		free_dma_rx_desc_resources(priv, dma_conf);

[Severity: High]
Can this turn into a double free on the stmmac_xdp_open() path?

stmmac_xdp_set_prog() calls stmmac_xdp_release() and then
stmmac_xdp_open() when the interface is running.
stmmac_xdp_release() frees everything with
free_dma_desc_resources(priv, &priv->dma_conf), and stmmac_xdp_open()
then calls alloc_dma_desc_resources() directly on the persistent
priv->dma_conf. It does not use a temporary copy the way
stmmac_setup_dma_desc() does.

If the RX side succeeds and the TX side fails there, this new call
frees the new RX descriptor rings, rx_q->buf_pool and rx_q->page_pool.
__free_dma_rx_desc_resources() does not clear rx_q->dma_rx,
rx_q->dma_erx, rx_q->buf_pool or rx_q->page_pool afterwards, so
priv->dma_conf.rx_queue[] is left holding freed pointers.

stmmac_xdp_set_prog() ignores the return value of stmmac_xdp_open(),
so the device stays IFF_UP. The next __stmmac_release(), MTU change or
XDP toggle calls free_dma_desc_resources(priv, &priv->dma_conf) again.
That would read the freed buf_pool in dma_free_rx_skbufs(), and then
kfree() buf_pool, page_pool_destroy() the page_pool and
dma_free_coherent() the rings a second time.

Before this patch the RX side of that path was only freed once, by the
later release. The TX side already had the same problem, since
__free_dma_tx_desc_resources() leaves tx_q->dma_tx, tx_q->dma_etx,
tx_q->dma_entx, tx_q->tx_skbuff_dma and tx_q->tx_skbuff dangling, and
a partial failure in either allocator can unwind stale pointers left
over from stmmac_xdp_release().

Should the free helpers reset these pointers to NULL? Or should
stmmac_xdp_open() build a new dma_conf and only install it on success
the way stmmac_setup_dma_desc() does? Either way, it seems like this
needs to be handled before the early RX free is safe for every caller
of alloc_dma_desc_resources().

[Severity: High]
This is a pre-existing issue, but can the TX unwind oops before this new
free_dma_rx_desc_resources() call is reached?

stmmac_setup_dma_desc() allocates dma_conf with kzalloc_obj(), so
tx_skbuff_dma and tx_skbuff start out NULL for every TX queue.

Say __alloc_dma_tx_desc_resources() fails for queue k. The err_dma label in
alloc_dma_tx_desc_resources() then unwinds all tx_queues_to_use queues,
including queue k and the queues after it that were never allocated:

alloc_dma_tx_desc_resources()
  free_dma_tx_desc_resources()
    __free_dma_tx_desc_resources()
      dma_free_tx_skbufs()
        stmmac_free_tx_buffer()

stmmac_free_tx_buffer() reads the arrays without checking them:

	if (tx_q->tx_skbuff_dma[i].buf &&
	    tx_q->tx_skbuff_dma[i].buf_type != STMMAC_TXBUF_T_XDP_TX) {
	...
	if (tx_q->xdpf[i] &&

Wouldn't this dereference NULL when tx_skbuff_dma was never allocated? And
when only the tx_skbuff allocation failed, wouldn't the read of xdpf[i] (a
union alias of tx_skbuff) do the same?

The only TX failure the unwind seems to survive is a dma_alloc_coherent()
failure on the last TX queue, because dma_free_coherent() returns early for
a NULL cpu_addr. That would mean the path this patch targets still oopses
in most cases.

alloc_dma_rx_desc_resources() looks like it has the same problem.
stmmac_free_rx_buffer() does:

	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];

	if (buf->page)

buf_pool is still NULL at that point if page_pool_create() or the buf_pool
allocation failed, or if the queue was never allocated.

>  
>  	return ret;
>  }

[Severity: Low]
This isn't a bug introduced by this patch, but the kernel-doc above
alloc_dma_desc_resources() says the following, and the same text appears on
__alloc_dma_rx_desc_resources() and __alloc_dma_tx_desc_resources():

 * this function allocates the resources for TX and RX paths. In case of
 * reception, for example, it pre-allocated the RX socket buffer in order to
 * allow zero-copy mechanism.

None of these functions allocate RX buffers. That happens later, in
init_dma_desc_rings().

The comment also has no Return: section. Both callers now rely on
everything being released already when the function fails, and that is not
written down anywhere.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103102857.1340748-1-vulab%40iscas.ac.cn

