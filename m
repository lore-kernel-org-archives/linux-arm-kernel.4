Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036EB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QhOhH7+r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a9fjiw+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ekLwwibsOmnGa5KPRQ4pHQQAVNXh9BpYDC2xle57Su0=; b=QhOhH7+roH9tAg
	PRlnzk1qC7El6Tg+f1zzIbOs+fqCTPq4CES+yrWI/h6FRWEex4ssp76XO37W7pUHeynFv3DgBFy+t
	AiWdUHbYvcIH2Kszry0qDFulosOj0ydvw2FsoFyJ8nsgRsoHNC4nNfVXCez/BmjQDtc12v3t++AFQ
	XF5olLL2ECzV3hQ1+zuzbcbkA0et80vboVHGikNszZ5QxGCpaKWq1iLfmklQbRDGDZO0Rv18auCjH
	xBppcdW6ojNgqbDZ+7zzCGVoRkLOzoIH0wbA2vMWcvPXG2cHyJ1x+H9/IQyfVjdMUXZNcBTc2Yn0c
	aIu5LafVRo7q/1brBKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtxR-000000057UE-3mZw;
	Tue, 10 Nov 2026 22:04:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtxL-000000057SN-3O0m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:04:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE98C635AD;
	Tue, 10 Nov 2026 22:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEB11F0089F;
	Tue, 10 Nov 2026 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348282;
	bh=ekLwwibsOmnGa5KPRQ4pHQQAVNXh9BpYDC2xle57Su0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a9fjiw+DLoeYez00ki+2sek3ztVHJPmTIg6By6YeK3UhBsv5kGo8YJWZXambgfY+4
	 S7PsFY8QVHaIq3RWzT8Lx8Gs6fUq+kCfdz/vnVMPsFtKr4yoZ6q5eJSyU03gUaa/3N
	 QaU4NyuS4BnsHQO+pQr+PwlizY5K6qWuLqhUI/z5zu7n32iKt5NOp1JEHuJikJU2wJ
	 YeCfwfNs1GDSr6+Gb0+Qc6Lrh0hiDUOZek9srGG6Rrd+0KBJa4BRgeTKW/W7O+QoJg
	 TQhQ1Dwsd6Wb13pUzQTEAUZWDuFjYUjav9gRsMKbETGGXUK/fFfmnBUTBv6jGgTffS
	 vIhk91wV57jUA==
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
Subject: Re: [PATCH net-next 2/9] net: sparx5/lan969x: free the FDMA buffers on init errors and deinit
Date: Tue, 10 Nov 2026 14:04:41 -0800
Message-ID: <20261110220441.2337174-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-sparx5-mtu-change-v1-2-f27bab580463@microchip.com>
References: <20261105-sparx5-mtu-change-v1-2-f27bab580463@microchip.com>
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
net: sparx5/lan969x: free the FDMA buffers on init errors and deinit

This adds sparx5_fdma_rx_free(), lan969x_fdma_rx_free() and
lan969x_fdma_tx_free(). They are used on the FDMA init error paths and on
deinit, and the return value of fdma_dcbs_init() is now checked for RX.
The Sparx5 RX skb slot is cleared once the skb goes to the stack, and
lan969x_fdma_free_pages() now skips empty slots.

> In preparation for MTU support, add sparx5_fdma_rx_free(), which frees
> the RX skbs and DCBs, lan969x_fdma_rx_free(), which returns the pages to
> the page_pool and frees the page_pool and the RX DCBs, and
> lan969x_fdma_tx_free(), which frees the TX buffer state and the TX
> DCBs, and use them on the error paths and on deinit.

[Severity: Low]
This isn't a bug, but these look like fixes for problems in released code:

  - every sparx5_fdma_deinit() leaks the RX skbs in the ring
  - the Sparx5 RX DCBs leak when TX allocation fails
  - the lan969x page_pool leaks when DCB allocation fails
  - lan969x_fdma_deinit() never frees tx->dbs
  - lan969x_fdma_free_pages() calls page_pool_put_full_page() on NULL
    slots when the ring was only partly filled

Should this carry Fixes: tags so stable can pick it up, rather than being
described only as preparation for MTU support? For the lan969x parts that
would be d84ad2c0d80c ("net: lan969x: add FDMA implementation").

> diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> index 053d125eda658..d162bea02cbfb 100644
> --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> @@ -90,12 +90,29 @@ static void lan969x_fdma_free_pages(struct sparx5_rx *rx)
>  	struct fdma *fdma = &rx->fdma;
>  
>  	for (int i = 0; i < fdma->n_dcbs; ++i) {
> -		for (int j = 0; j < fdma->n_dbs; ++j)
> +		for (int j = 0; j < fdma->n_dbs; ++j) {
> +			if (!rx->page[i][j])
> +				continue;
> +
>  			page_pool_put_full_page(rx->page_pool,
>  						rx->page[i][j], false);
> +			rx->page[i][j] = NULL;
> +		}
>  	}
>  }

[Severity: High]
This is a pre-existing issue, not one introduced by this patch, but does
the new NULL check here catch the slot left behind by the free_page path
in lan969x_fdma_rx_get_frame()?

lan969x_fdma_rx_get_frame() {
    ...
	if (WARN_ON(!port))
		goto free_page;

	skb = build_skb(page_address(page), fdma->db_size);
	if (unlikely(!skb))
		goto free_page;
    ...
free_page:
	page_pool_recycle_direct(rx->page_pool, page);

	return NULL;
}

This path runs on a build_skb() failure or when the IFH src_port maps to
no port. The page goes back to the page_pool cache, but
rx->page[dcb_index][db_index] still points to it. lan969x_fdma_napi_poll()
then does:

		skb = lan969x_fdma_rx_get_frame(sparx5, rx);
		if (!skb)
			break;

It does not call fdma_db_advance() or fdma_db_reset(), so the next poll
processes the same DONE DB again.

Can a later refill in lan969x_fdma_rx_dataptr_cb() take the same page from
the page_pool alloc cache and link it into another DCB? If so, two ring
slots share one page. Once the stale slot is processed successfully, the
page sits in an skb in the stack while the FDMA can still DMA into it
through the other DCB.

If the failure keeps happening, every poll recycles the same page into
the cache again.

On teardown, lan969x_fdma_rx_free()->lan969x_fdma_free_pages() finds the
stale slot non-NULL and calls page_pool_put_full_page() on a page that
was already recycled. page_pool_destroy() may then release the same page
more than once.

Later in the series, "add support for resizing the FDMA buffers" clears
the slot only on the success path of lan969x_fdma_rx_get_frame(). The
free_page path stays the same, and lan969x_fdma_resize() also calls
lan969x_fdma_rx_free(), so the same stale put can happen on an MTU change
that changes the page order.

The free_page logic dates back to d84ad2c0d80c ("net: lan969x: add FDMA
implementation").

[ ... ]

> @@ -202,6 +223,15 @@ static int lan969x_fdma_tx_alloc(struct sparx5 *sparx5)
>  	return 0;
>  }
>  
> +/* Free the TX buffer state and the TX DCBs */
> +static void lan969x_fdma_tx_free(struct sparx5 *sparx5)
> +{
> +	struct sparx5_tx *tx = &sparx5->tx;
> +
> +	fdma_free_coherent(sparx5->dev, &tx->fdma);
> +	kfree(tx->dbs);
> +}

[Severity: Medium]
Does this leak the skbs and the streaming DMA mappings of TX frames that
are still in flight?

lan969x_fdma_xmit() sets up each entry like this:

	db_buf->dma_addr = dma_map_single(sparx5->dev,
					  skb->data,
					  skb->len,
					  DMA_TO_DEVICE);
	...
	db_buf->skb = skb;
	...
	db_buf->used = true;

Only lan969x_fdma_tx_clear_buf() unmaps and frees these entries. It runs
from NAPI, and only for DCBs that have the DONE bit set.

lan969x_fdma_deinit() now does:

	sparx5_fdma_stop(sparx5);
	lan969x_fdma_tx_free(sparx5);
	lan969x_fdma_rx_free(sparx5);

sparx5_fdma_stop() disables NAPI, and nothing reaps the TX ring before
tx->dbs is freed. On the remove path:

sparx5_unregister_netdevs()->sparx5_frame_io_deinit()->lan969x_fdma_deinit()

any entry with used == true would keep its skb (when !ptp) and its DMA
mapping. The dma_addr and length needed to unmap it are freed along with
tx->dbs.

Later in the series, "add support for resizing the FDMA buffers" adds
lan969x_fdma_tx_reset(), which unmaps and frees the used entries. It is
only called on the resize path, though, and lan969x_fdma_deinit() still
calls only lan969x_fdma_tx_free().

Should lan969x_fdma_tx_free() also release the used entries?

