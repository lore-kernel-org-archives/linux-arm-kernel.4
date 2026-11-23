Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE5606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VpAWqpyC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1IgZrU4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=os7fOfDtBzM5fGsJLR1+t01eUnVG/fiCJOyHPbpqHtA=; b=VpAWqpyC8A0sFM78O4EUXasgUi
	LexDTXG4UUK/VOAg5tcVzIp2o7W60gl3dx2meGNbT6DIhVyS/fWMOeRY5DG4rHnce2/rzI/slljKK
	etK5fFys2qKns3ohEfHw6ulmi3c1n3za9aEEoC00XnIgxweQmAlMomcjqRG9UkcOj9Huz95h3g8dK
	u7XilerUrUedwrZFCgNMFfJs+mSZHQhnzbvq4rIAmWvUl6lZKVllpSvf7kSOfSjSr8y2JPBRaGcq8
	VUZqNwxLnfxi3To8dpCe4ECUoyMbIn2gypY8XQtnqugHO/gPXTuyoIhz92QS7bcAsTKS/CBixIJM1
	qpswAdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVV5-00000003re3-1Kkt;
	Mon, 23 Nov 2026 14:58:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVUr-00000003rW4-2MQG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5117245A24;
	Mon, 23 Nov 2026 14:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F3A1F0093C;
	Mon, 23 Nov 2026 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445900;
	bh=os7fOfDtBzM5fGsJLR1+t01eUnVG/fiCJOyHPbpqHtA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I1IgZrU4sHU6197FiWiR9wAOGTGkqGbGOkkKlT4A6/zM+YQKtl20VeNQWcBUnwts5
	 9L2gGgMlXq+pO0NPy3p4/YZ/zZHqGRNn9TEZDM9+Z2cKQdjM/hh0aoK21vz6gRxOjY
	 yKo8hdw0HZ4zS09xyfVUZ3trjRM+dtYD8TfPM3ZU+PrX0/R2XGPTmBkJASy6zZAg1B
	 pOt17DwFnrw10CSuwy8qaesl8dg4sLC6FuNxWuE2NdAdkm0H4IuiMsoQZSlXuSZnqv
	 qAo/cm4Yd64/HgTwP+2tS0onlHps1ync7FBvOLX+1WgHTwIF9KwX59ulkDZw5K2yuc
	 Ra989EHZ0io4w==
Subject: Re: [PATCH net-next v3 7/9] net: sparx5/lan969x: scale the queue
 watermarks with the MTU
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:19 +0000
Message-ID: <179544589953.3135.16152141389643791611@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-7-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-7-55c272fe1acc@microchip.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] At this commit (and at the next one, "scale the TAS guard band
  with the MTU"), sparx5_port_wm_set() in…
- [Low] This commit adds sparx5_port_wm_update() (sparx5_port.c:717) as a
  non-static function with a prototype in sparx5_port.h:94, but nothing…

--

net: sparx5/lan969x: scale the queue watermarks with the MTU

The commit now computes the QSYS PAUSE_START, PAUSE_STOP and ATOP
watermarks from the port MTU, plus the Ethernet header, FCS and two VLAN
tags, rounded up to whole buffer cells. Before, they were fixed multiples
of a 1518 byte frame. The watermarks are programmed at port init and when
pause is resolved. The commit also adds sparx5_port_wm_update() for MTU
changes and a per-port wm_lock.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> index 701d310df0ba6..87aa0b7841359 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c

[ ... ]

> @@ -676,24 +679,53 @@ int sparx5_port_fwd_urg(struct sparx5 *sparx5, u32 speed)

[ ... ]

> +/* Pause start/stop and tail drop at 6/4/20 frames of the port MTU */
> +static void sparx5_port_wm_set(struct sparx5 *sparx5, struct sparx5_port *port,
> +			       u8 pause)
> +{
> +	u32 len = SPX5_HW_MTU(READ_ONCE(port->ndev->mtu)) + 2 * VLAN_HLEN;
> +	u32 cells = DIV_ROUND_UP(len, SPX5_BUFFER_CELL_SZ);

[Severity: Medium]
At this commit, can port->ndev->mtu drift away from the MAC max frame
length?

sparx5_port_init() still programs a fixed max length:

	sparx5_port_max_len_set(sparx5, port, ETH_MAXLEN);

sparx5_port_netdev_ops has no .ndo_change_mtu. With the ether_setup()
defaults (min_mtu 68, max_mtu 1500), the core writes dev->mtu directly
and no hardware gets reconfigured.

Suppose the MTU is lowered to 68 with ip link. The next link-up then runs:

  sparx5_port_config()->sparx5_port_fc_setup()->sparx5_port_wm_set()

That gives len = 94 and cells = 1. PAUSE_START becomes 6 cells,
PAUSE_STOP 4 cells and ATOP 20 cells.

The MAC still accepts 1518-byte frames, which take 9 cells each. With TX
pause enabled, wouldn't one full-size frame go past PAUSE_START, so that
a pause frame is sent for every received frame? ATOP would also drop to
about two full-size frames, which means heavy tail drop. That is the
problem the commit message describes, only triggered by a smaller MTU
instead of a larger one.

The problem is also present at the next patch, "scale the TAS guard band
with the MTU". The final patch of the series, "net: sparx5/lan969x: add
support for changing the MTU", fixes it. It adds
sparx5_port_change_mtu(), which returns -EOPNOTSUPP when FDMA is not in
use. Otherwise it calls sparx5_port_max_len_set() with
SPX5_HW_MTU(new_mtu) and then sparx5_port_wm_update(). So this only
affects the intermediate bisection points.

Could the series be ordered so that the watermarks and the MAC max length
stay in sync at every commit?

> +	u32 pause_stop = 0xFFF - 1; /* FC gen disabled */
> +

[ ... ]

> +}
> +
> +void sparx5_port_wm_update(struct sparx5 *sparx5, struct sparx5_port *port)
> +{
> +	mutex_lock(&port->wm_lock);
> +	sparx5_port_wm_set(sparx5, port, port->wm_pause);
> +	mutex_unlock(&port->wm_lock);
> +}

[Severity: Low]
This isn't a bug, but sparx5_port_wm_update() is non-static and has a
prototype in sparx5_port.h, yet nothing calls it at this commit.
sparx5_port_netdev_ops has no .ndo_change_mtu yet, so the MTU-change part
of this patch is not connected to anything.

This comment in sparx5_port_disable() also refers to an MTU-change path
that does not exist yet:

	/* 5: Disable Flowcontrol, and keep an MTU change from re-enabling it */

The first caller is sparx5_port_change_mtu(), added by the final patch of
the series, "net: sparx5/lan969x: add support for changing the MTU". It
calls sparx5_port_wm_update() after WRITE_ONCE(dev->mtu, new_mtu), so the
READ_ONCE() in sparx5_port_wm_set() picks up the new MTU.

Could the helper be added in the same patch as its caller?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

