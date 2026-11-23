Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lwQ/hOGD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/8w1HJy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FPZIAOyVkBpe9724KFBEseTEXrvfOC8DdMEfIRc3mW0=; b=lwQ/hOGD7cQ0RC0KV85T5QMTGC
	AjpN/UHt5kXTI/g7aj3FIfZY5QU+do5hfdw8PKX+nuk5rHAdkZpi0ITiRrZWQxz1v2I7EE59oTHgT
	jzg2+9QhE13m4LTv3s2IDfZ0ScTp2FKidaNJJsjyMDglfbUJyWmG3oKfWbg1rQ8JyHex4ACRtph5Y
	eQq5cP/XL8cU7PMUwvwwONlZ0SkwddEBw2vEr42ZdyZFEUaFjvfNW6AWyOvUairDCvjsJBxV7Sb72
	6N4xF0nikS7Z+hMuRE0EtueCFdGlx0wxbAVYFTUFsgVI64qX5vju48/QL29PKtULxMNbwYz/q49PS
	HVii1eQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVV5-00000003rdh-0MRJ;
	Mon, 23 Nov 2026 14:58:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVUo-00000003rTu-0taj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73A1961133;
	Mon, 23 Nov 2026 14:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E101F000E0;
	Mon, 23 Nov 2026 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445897;
	bh=FPZIAOyVkBpe9724KFBEseTEXrvfOC8DdMEfIRc3mW0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V/8w1HJyKKGk5SG83M1yFhF2ndXhArzdL3D75APUkUnKLwRit1vAWVeOUcwQ4kJ+J
	 92c8Gn/1JCZi+6EtsvYV3dJbUAYzwx1ZxjxHQAZP5RDXokul3bNbYjnOQ7jHZBJedQ
	 ZJKWNVD7cqHjfYzE+KAccOtGFGOFoBIx8BP9lPOZOg834/UaxFYQC0Uuu/O0ircNum
	 E2GM966N6bXdZXh1va5IjDdnOh95Q7w81l4Qhks+1dB1anJMYEsGi65GGH4m2UedNY
	 POlyTNXLYMl2a/Y+2B/pz+TgcoxajLuB6upGoQjds1TRCO4c1rj4fXTwsDgMqEqcCk
	 +PQ1HA+lmDGCg==
Subject: Re: [PATCH net-next v3 5/9] net: sparx5/lan969x: size the FDMA
 buffers from the port MTUs
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:15 +0000
Message-ID: <179544589573.3135.16010204842375196022@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-5-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-5-55c272fe1acc@microchip.com>
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

Critical: 0 (1) · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: sparx5: UAF of two-step PTP skb on TX drop in
  sparx5_port_xmit_impl()

Pre-existing issues:
- [Critical] Use-after-free and double free of two-step PTP skbs on the
  Sparx5 TX drop path.

--

net: sparx5/lan969x: size the FDMA buffers from the port MTUs

This commit sizes the Sparx5 and lan969x FDMA buffers from the largest port
MTU plus the Ethernet header, FCS, IFH and two VLAN tags, rather than a
fixed single page. On Sparx5 the RX and TX DB size is that length rounded
up to 128 bytes, and sparx5_fdma_xmit() now drops frames that do not fit.
On lan969x the page_pool page order is derived from the max frame size.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> index 537c945409bba..b92d249777f0b 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c

[ ... ]

> @@ -224,6 +223,10 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
>  	struct fdma *fdma = &tx->fdma;
>  	void *virt_addr;
>  
> +	/* Drop frames that do not fit in the TX buffers */
> +	if (unlikely(IFH_LEN * 4 + skb->len + ETH_FCS_LEN > fdma->db_size))
> +		return -EMSGSIZE;
> +

[Severity: High]
This is a pre-existing problem in sparx5_port_xmit_impl(), but the
new -EMSGSIZE return makes it much easier to hit. What happens to a
two-step PTP skb that fails here?

sparx5_port_xmit_impl() calls sparx5_ptp_txtstamp_request() before
ops->fdma_xmit(). For two-step PTP, that puts the skb on
port->tx_skbs with skb_queue_tail() without taking an extra
reference. It also increments sparx5->ptp_skbs and port->ts_id.

If fdma_xmit() then returns anything other than -EBUSY, the code
jumps to the drop label, which only calls dev_kfree_skb_any(skb).
Only the busy label calls sparx5_ptp_txtstamp_release(port, skb). The
freed skb is therefore still linked on port->tx_skbs.

Later walks of port->tx_skbs happen in
sparx5_ptp_txtstamp_old_release(), in the sparx5 and lan969x PTP IRQ
handlers, and in sparx5_ptp_deinit(). These read SPARX5_SKB_CB() from
freed memory, call __skb_unlink() through stale list pointers, and
call dev_kfree_skb_any() on the same skb again. Isn't that a
use-after-free and a double free?

sparx5->ptp_skbs is also never decremented for these skbs. After
SPARX5_MAX_PTP_ID such drops, sparx5_ptp_txtstamp_request() returns
-EBUSY forever, and two-step TX timestamping on the switch stalls.

Before this patch the Sparx5 TX DB was PAGE_SIZE. The drop path could
only be reached through the -EINVAL ring-full return here, or through
the -ENOMEM DMA mapping failure in lan969x_fdma_xmit(). With the
default MTU of 1500, db_size is now
ALIGN(1518 + 36 + 8, 128) = 1664. Any two-step frame with skb->len
above 1624 now takes the drop path every time.

Such frames can still reach a 1500 MTU port, for example through tc
mirred or bpf_redirect from a device with a larger MTU. They can also
arrive when the MTU is lowered while larger skbs are already queued,
which becomes possible later in this series.

The commit message relies on this drop path. Should the drop label in
sparx5_port_xmit_impl() release two-step PTP skbs the same way the
busy label does? Or would you rather check the length before
sparx5_ptp_txtstamp_request() is called?

[Severity: Critical]
This is a pre-existing issue, but this new return gives a second,
deterministic way to hit it. What happens to a two-step PTP skb that gets
-EMSGSIZE here?

By this point, sparx5_port_xmit_impl()->sparx5_ptp_txtstamp_request() has
already put the skb on port->tx_skbs without taking a reference:

sparx5_ptp.c:sparx5_ptp_txtstamp_request() {
    ...
	skb_queue_tail(&port->tx_skbs, skb);
	SPARX5_SKB_CB(skb)->ts_id = port->ts_id;
	SPARX5_SKB_CB(skb)->jiffies = jiffies;

	sparx5->ptp_skbs++;
	port->ts_id++;
    ...
}

Back in sparx5_port_xmit_impl(), only -EBUSY goes through
sparx5_ptp_txtstamp_release(). Any other negative return frees the skb
while it is still on the list:

sparx5_packet.c:sparx5_port_xmit_impl() {
    ...
	if (ret == -EBUSY)
		goto busy;
	if (ret < 0)
		goto drop;
    ...
drop:
	stats->tx_dropped++;
	sparx5->tx.dropped++;
	dev_kfree_skb_any(skb);
	return NETDEV_TX_OK;
busy:
	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP &&
	    SPARX5_SKB_CB(skb)->rew_op == IFH_REW_OP_TWO_STEP_PTP)
		sparx5_ptp_txtstamp_release(port, skb);
	return NETDEV_TX_BUSY;
}

The next two-step request then walks the list in
sparx5_ptp_txtstamp_old_release():

	skb_queue_walk_safe(&port->tx_skbs, skb, skb_tmp) {
		if time_after(SPARX5_SKB_CB(skb)->jiffies + SPARX5_PTP_TIMEOUT,
			      jiffies)
			break;

		__skb_unlink(skb, &port->tx_skbs);
		dev_kfree_skb_any(skb);

Does this read the cb of the freed skb and then free it again? The TX
timestamp IRQ handler can also find the stale entry. ptp_skbs and ts_id
also stay incremented, so can the PTP ID pool run out?

This path could already be reached through the -EINVAL return when the
next TX DB is not done, i.e. when the TX ring is full.

With this patch and the default MTU of 1500, db_size goes from 4096 to
ALIGN(1518 + 36 + 8, 128) = 1664. A two-step timestamped frame longer
than 1624 bytes used to be sent, but now it always takes the drop path.
Such frames can still reach a 1500 MTU port, for example through tc
mirred or bpf_redirect from a device with a larger MTU.

The commit message says it will "make sparx5_fdma_xmit() drop frames that
do not fit", so it depends on this drop path. Should the drop label in
sparx5_port_xmit_impl() call sparx5_ptp_txtstamp_release() for two-step
PTP skbs, the same way the busy label does? sparx5_port_xmit_impl() is
still unchanged at the end of the series.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

