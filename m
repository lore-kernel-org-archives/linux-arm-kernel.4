Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379B5606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yxqZPiuT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMaxAH7m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=66yLjLF09no/CGggODWw/UNlLt5dwM1C2hA7f/88NZE=; b=yxqZPiuTPdmo3EQQWnQqVG3E9A
	aMqiMEf2oV3mlCqDB2wPSqgbOg2/+NRT2zXU4/FQ+gD+Spfs5ZSXrZY/fUmL+VxbxpIqOp+UQ83MZ
	qza2sL14nIFNyz+v8R8YaS6+MiPKraCvq7aDaZ/bz7yku3BuxPsBcb4xyIkmvHKjKhJTpG1pvP9HJ
	TTDMhXQV1C7QVCcBZ1R+0ntG/ltZ4JLD97ySUSNWwcPoCAvBOkhGduDPnRf2NDMYyUJWzFHerMJHR
	+ATxpTyCGRgx6SH3KgkwloE35O8N3QPxVFQHypDRuCKkm/fFL+mNmesfJgwyI7s0Hx6WbXAnDV4sE
	nniXtOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtf8-00000007BIK-2w3z;
	Tue, 24 Nov 2026 16:46:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtet-00000007BCC-1NKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:46:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D42D627C6;
	Tue, 24 Nov 2026 16:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CCA1F000D1;
	Tue, 24 Nov 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538778;
	bh=66yLjLF09no/CGggODWw/UNlLt5dwM1C2hA7f/88NZE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BMaxAH7m0fFWfiFx4/Wk2I1BVUzKTw3nqggjWxQ7oB52l0+GE1njFSsJtFQbGUbaI
	 ZKH9WXB+PXzpSZsc2LO+SvxYj8kUvtACPrSpkJhbEsQjItQcTMSZlljF89lET8+q4i
	 9wDP3A1cWMj4UnxJW9JFwErcg6VHA7hTwsFwFaIV+mq9p82O5DscIHm4uNfPxz5TSv
	 JdwoMrAGvX5JxeVjlT/s2dpuo9z3fh/tE0fmYmg0qCGWBDXmPFAM5f93m7RK7bVx69
	 Ew9sUlAt/vfgaXGo+Ktq1otOa78OkrnrUhNESS4C8yN/hnp48GsJxoqXiqQdos0amD
	 ogwLX7yjHtSSg==
Subject: Re: [PATCH net-next v2] net: xilinx: axienet: Derive RX frame length
 from residue in dmaengine path
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 git@amd.com
Date: Tue, 24 Nov 2026 16:46:16 +0000
Message-ID: <179553877690.3135.3125454257939180385@kernel.org>
In-Reply-To: <20261123164251.48234-1-srinivas.neeli@amd.com>
References: <20261123164251.48234-1-srinivas.neeli@amd.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the residue-based length is "correct
  across all designs, including multi-descriptor frames".
- [Medium] The commit message says that summing the residue over the
  chain gives the correct length for multi-descriptor frames.
- [Low] This patch fixes a real, user-visible RX failure in the dmaengine
  path of axienet_dma_rx_cb()…

--

net: xilinx: axienet: Derive RX frame length from residue in dmaengine path

This commit changes axienet_dma_rx_cb() so that the dmaengine RX path
computes the received frame length as the posted buffer length minus
result->residue. Previously the length came from the APP4 descriptor
metadata word. It also detects failed transfers through
dmaengine_result.result and removes the unused LEN_APP macro.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index 7e83c4b5f1931..5b4998e2ca148 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c

[ ... ]

> @@ -1219,30 +1218,27 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>  static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
>  {

[ ... ]

> -	/* TODO: Derive app word index programmatically */
> -	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
> +	/* Actual length = posted buffer length - residue. */
> +	rx_len = lp->max_frm_size - result->residue;

[Severity: Low]
This fixes a receive failure that users can see. Should it carry a Fixes:
tag and go through net rather than net-next?

The line being replaced came in with commit 6a91b846af85 ("net: axienet:
Introduce dmaengine support"). On designs without the status/control
stream, the old code had two failure modes.

If the channel has no metadata_ops, dmaengine_desc_get_metadata_ptr()
returns ERR_PTR(-ENOTSUPP) and every frame is dropped here:

	if (IS_ERR(app_metadata)) {
		...
		dev_kfree_skb_any(skb);
		lp->ndev->stats.rx_dropped++;
		goto rx_submit;
	}

Before commit 8bbceba7dc5090, that ERR_PTR was dereferenced instead.

If metadata_ops is present but the status stream is absent, the invalid
APP4 value is passed straight to skb_put().

The stable trees that carry the dmaengine RX path won't pick this up unless
it has something like:

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")

>  	skb_put(skb, rx_len);
>  	skb->protocol = eth_type_trans(skb, lp->ndev);

[Severity: Medium]
The commit message says the residue-based length is "correct across all
designs, including multi-descriptor frames where the residue is summed over
the chain". Does that hold for a frame longer than one posted RX buffer?

axienet_rx_submit_desc() posts each skb as its own dmaengine descriptor
with a single sg entry:

	sg_dma_len(skbuf_dma->sgl) = lp->max_frm_size;
	dma_rx_desc = dmaengine_prep_slave_sg(lp->rx_chan, skbuf_dma->sgl,
					      1, DMA_DEV_TO_MEM,

xilinx_dma_get_residue() only sums the segments of that one descriptor:

	residue += (axidma_hw->control & chan->xdev->max_buffer_len) -
		   (axidma_hw->status & chan->xdev->max_buffer_len);

So the residue is never summed across the several descriptors that make up
one frame.

When the MTU is above 1500, axienet_device_reset() sets max_frm_size to
mtu + VLAN_ETH_HLEN + XAE_TRL_SIZE and enables XAE_OPTION_JUMBO. No maximum
receive frame length is programmed into the MAC.

If the MAC then accepts frames longer than max_frm_size, any L2 peer can
send one. For example, a double-tagged frame at MTU size is mtu + 26 bytes.
AXI DMA S2MM fills the current BD without EOF and continues into the next
BD, which belongs to the next descriptor and the next skb:

  first callback:  residue == 0, so a truncated max_frm_size frame is
                   passed to __netif_rx()
  second callback: rx_len == remainder, so eth_type_trans() parses bytes
                   from the sender's payload as a new Ethernet header

Could a remote peer use this to inject a frame with its own choice of MAC
addresses, ethertype and VLAN tag, getting past hardware MAC filtering and
VLAN separation?

If the remainder is shorter than ETH_HLEN, eth_skb_pull_mac() silently
fails and the short skb is still passed up the stack.

axienet_dma_rx_cb() never checks XAXIDMA_BD_STS_RXSOF_MASK or
XAXIDMA_BD_STS_RXEOF_MASK, and dmaengine_result does not carry them.

The missing SOF/EOF handling predates this patch. Before it, APP4 on the
EOF BD held the full frame length, so skb_put() hit skb_over_panic(). With
this change the same input instead becomes silent frame splitting.

Should buffers that don't carry both SOF and EOF be dropped? Alternatively,
could the MAC's accepted frame size be limited to max_frm_size?

[Severity: Medium]
A related case can happen inside a single descriptor. Is the summed
residue still correct when the dmaengine provider splits the single RX sg
into several BDs?

xilinx_dma_prep_slave_sg() caps each hardware BD at xdev->max_buffer_len
through xilinx_dma_calc_copysize(). max_buffer_len comes from
xlnx,sg-length-width, which can be 8 to 26 bits.

Nothing in axienet checks lp->max_frm_size against that per-BD limit. Two
examples where one descriptor ends up with several BDs:

  width 13 (8191) with MTU 9000 (max_frm_size 9022)
  width 10 (1023) with the default 1522 byte max_frm_size

AXI DMA S2MM ends a BD at TLAST and starts each packet in a new BD. The
legacy axienet_rx_poll() relies on the same behaviour.
xilinx_dma_complete_descriptor() only checks the last segment:

	if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
		break;

With a frame A shorter than BD0, the sequence would be:

  frame A lands in BD0, and the descriptor stays pending
  frame B lands in BD1, which is the same skb at offset BD0-size
  BD1 completes, and the residue sum gives rx_len = len(A) + len(B)

Would axienet_dma_rx_cb() then deliver frame A followed by len(B) bytes of
stale buffer data, and lose frame B? If B is longer than BD1, it spills
into the next descriptor as described above.

The old APP4 method was also wrong here, because it reported B's length
from the last BD. However, the commit message explicitly says the
summed-residue case is handled correctly.

>  	skb->ip_summed = CHECKSUM_NONE;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123164251.48234-1-srinivas.neeli%40amd.com

