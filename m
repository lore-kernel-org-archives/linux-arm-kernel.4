Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7AF60A262B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bja/pqeR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRQvGF4E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=raiFpMktU6SgzAyhebPSZFHLXapYemhWjN1mZKsayBw=; b=bja/pqeRuEwC7DKHTSiygXTYGL
	mpBozH1Avo9MUJ3jC4t/z1jNC8KZmsMOXlZ3tEqVKIVUi02eDZxW6UYwHkbUroCKEqFx3Fi4i+AVM
	6JH8JIMI2c8wY1MmhD69b9APZvlv9oUKuTvDOa8Vpb3BtSAz40OBEtAETylOZSN93QC3FtULRBBqV
	OreEQ40h2ZitQCi6CLSAGa2rZRm/hKsTklfNrDek1IZUdj1H3r8vY9C1CjiYGfWef8LOdyodAJaZs
	WnDM7VA7XN8oVuVKvVEMnA04+j3jKs9C5WsKbpAS3dRNFdWvledYabS+3bw664lRyoZj0uZI2ofRR
	ZrGWYLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkeG-00000003kSJ-1hgZ;
	Tue, 10 Nov 2026 12:08:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkeA-00000003kPe-07Gh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:08:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 628A841735;
	Tue, 10 Nov 2026 12:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DC21F0089F;
	Tue, 10 Nov 2026 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312497;
	bh=raiFpMktU6SgzAyhebPSZFHLXapYemhWjN1mZKsayBw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HRQvGF4EhCuUWcoBZnDCOxvthlGycXreUTJkYG+jkPdP1pHj8XrUnRwJ5qjMczPr9
	 Ss+gSeaCaRv6dCGVHEL70KQFZguuNUB0PasjkwfG/mgPZzhyHjT8n6HjYseObzdDv8
	 j8I4N7x9GudJXDIL3O0JpzJu6XSjAHD8MksmenqP96+rGuKoCaOV270I0lg1xyJpht
	 K5la6Rz4huB654Vjm7fcZx3HtteKZWzcjHDzIU1Xnvb2jkxcX4VtXNFQKdSkndc1iw
	 tDU0KWTXxOreB+2cB07z+k5WvZjxne7yWJ8YU9JYozfr5GGswMRIlz80Sc+LkVN4fO
	 wii/H00UZLIEg==
Subject: Re: [PATCH net-next v6 RESEND 2/4] net: stmmac: clean up partially
 allocated DMA rings on error
From: netdev-bot+sashiko@kernel.org
To: dinghui1111@163.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Date: Tue, 10 Nov 2026 12:08:16 +0000
Message-ID: <179431249603.994134.12572647022221286504@kernel.org>
In-Reply-To: <20261106090507.1020751-3-dinghui1111@163.com>
References: <20261106090507.1020751-3-dinghui1111@163.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message misdescribes the patch, and a real leak fix
  ships without a Fixes: tag.

Pre-existing issues:
- [High] stmmac_enable_rx_queue() and stmmac_enable_tx_queue() return
  void.
- [Low] The kernel-doc for __alloc_dma_rx_desc_resources() says it
  'allocates the resources for TX and RX paths' and 'pre-allocated the…

--

net: stmmac: clean up partially allocated DMA rings on error

This commit adds per-queue error unwinding to
__alloc_dma_rx_desc_resources() and __alloc_dma_tx_desc_resources(), so
each function frees what it allocated before it returns an error. It also
makes alloc_dma_desc_resources() free the RX resources when the TX
allocation fails.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fcc80ece37679..b02371ed2d062 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -2361,10 +2365,22 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>  	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
>  	if (ret) {
>  		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
> -		return -EINVAL;
> +		goto err_free_dma;
>  	}
>  
>  	return 0;
> +
> +err_free_dma:
> +	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
> +	rx_q->dma_erx = NULL;
> +	rx_q->dma_rx = NULL;

[Severity: High]

This is a pre-existing issue, but this path now leaves rx_q->dma_rx and
rx_q->dma_erx NULL on failure. Can stmmac_xdp_enable_pool() then run the
zero-copy RX path on a queue that has no descriptor ring?

stmmac_enable_rx_queue() returns void and only logs the failure:

	ret = __alloc_dma_rx_desc_resources(priv, &priv->dma_conf, queue);
	if (ret) {
		netdev_err(priv->dev, "Failed to alloc RX desc.\n");
		return;
	}

stmmac_xdp_enable_pool() has just torn the queue down with
stmmac_disable_rx_queue(). It then continues without checking anything:

		stmmac_enable_rx_queue(priv, queue);
		stmmac_enable_tx_queue(priv, queue);
		napi_enable(&ch->rxtx_napi);

		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);

Suppose the RX re-allocation fails under memory pressure (in
page_pool_create(), kzalloc_objs() or dma_alloc_coherent()) but the TX side
succeeds. Then tx_q->xsk_pool is set, so stmmac_xsk_wakeup() schedules
rxtx_napi, and we get:

stmmac_napi_poll_rxtx()
  stmmac_rx_zc()
    p = stmmac_get_rx_desc(priv, rx_q, entry);   /* &NULL[entry] */
    status = stmmac_rx_status(priv, &priv->xstats, p);

Would that be a NULL pointer dereference in softirq context?

stmmac_xdp_disable_pool() has the same pattern: it calls the enable helpers
without checking the result, then calls napi_enable() on rx_napi and
tx_napi.

The allocation failures, which are the realistic triggers, already left
NULL rings before this patch. The only change here is the
xdp_rxq_info_reg() failure case, which used to leave a zeroed but allocated
ring and now leaves NULL pointers.

> +err_free_buf_pool:
> +	kfree(rx_q->buf_pool);
> +	rx_q->buf_pool = NULL;
> +err_destroy_pool:
> +	page_pool_destroy(rx_q->page_pool);
> +	rx_q->page_pool = NULL;
> +	return ret;
>  }

[Severity: Low]

This isn't a bug introduced by this patch, but the kernel-doc above
__alloc_dma_rx_desc_resources() still says:

 * this function allocates the resources for TX and RX paths. In case of
 * reception, for example, it pre-allocated the RX socket buffer in order to
 * allow zero-copy mechanism.

This per-queue helper only handles RX. It also does not allocate RX
buffers; that happens later, in __init_dma_rx_desc_rings().
alloc_dma_desc_resources() has the same comment.

This patch reworks the error handling in both functions. Could these
comments be updated at the same time?

[ ... ]

> @@ -2476,6 +2500,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
>  		return ret;
>  
>  	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
> +	if (ret)
> +		free_dma_rx_desc_resources(priv, dma_conf);

[Severity: Medium]

This hunk looks like the only part of the patch that fixes a real leak.
Before this patch, if alloc_dma_tx_desc_resources() failed here, every RX
queue kept its page_pool, buf_pool, coherent descriptor ring and xdp_rxq
registration. stmmac_setup_dma_desc() then only did:

alloc_error:
	kfree(dma_conf);
	return ERR_PTR(ret);

This structure seems to date back to commit 71fedb0198cbbd ("stmmac: break
some functions into RX and TX scopes"). Should this hunk have a Fixes: tag?
It could also go in its own patch so stable can pick it up.

The commit message says the outer error paths are "relying on the NULL
guards added previously". That reads as if the per-queue unwinding removes
the dependency. Does it?

alloc_dma_rx_desc_resources() still does:

err_dma:
	free_dma_rx_desc_resources(priv, dma_conf);

That loop walks all rx_queues_to_use queues. It includes the failed queue,
which is now already cleaned up, and any later queues that were never
allocated. alloc_dma_tx_desc_resources() works the same way. So the free
helpers still depend on checks such as !rx_q->buf_pool in
dma_free_rx_skbufs().

Also, before this patch those err_dma labels already freed whatever a
failed queue had partly allocated. The per-queue unwinding therefore
doesn't appear to fix a leak on the open, MTU change or ringparam paths.

The only callers whose behaviour changes are stmmac_enable_rx_queue() and
stmmac_enable_tx_queue(). On those paths the leftovers stayed in
priv->dma_conf until the next disable or release, so nothing leaked.

The commit message also says "the callers only free dma_conf itself on
that path". stmmac_xdp_open() frees nothing on that path:

dma_desc_error:
	return ret;

Could the commit message be reworded to describe what the patch actually
fixes?

>  
>  	return ret;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106090507.1020751-1-dinghui1111%40163.com

