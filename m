Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB0606C37B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J2CMMcQP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KvkJz7/c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k6pn9nCU8/diiJOQiOnHSa9q5XfgvqFN2sbLyFB5850=; b=J2CMMcQPRQmbJnLkpiV5w+DjL5
	Zo5wKSjRLQmslDkf4m9iuXVgyoYvaLHKiS4QznPEwXd4ttBeR19oHkAA3ZLNFKMPP6o0fnW2Sqp2n
	xHx1ML6KG1ahdciL4yhkq1f0nUkKDrVI8HIGQ4VvIYGQySKnwphJS6BKfxCiLmcqoM9vTBqioL841
	tu7FKZnoF+hePb6gx33kNSFZ4nvuoR/2xFm0Tz1CWUM6zeJkmQJ63ERUBpwRRrvrFIoP2FvpzqV2I
	MwMWiY/522JGQRuzKlgMTsIMaMGDCmAfFlqXBnR5o8B8AJcVJVakAYiLoaKi2MSRRnaFwrxDB9hbP
	GwLoKRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYg9-0000000AlZM-01BE;
	Thu, 12 Nov 2026 17:33:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYfp-0000000AlUb-0w45
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 17:33:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A60CB62330;
	Thu, 12 Nov 2026 17:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DBF1F000D1;
	Thu, 12 Nov 2026 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504800;
	bh=k6pn9nCU8/diiJOQiOnHSa9q5XfgvqFN2sbLyFB5850=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KvkJz7/cDU6GejIo9YKXTnmGT9HZlN/dB6E+Rsl8vTX0AP/71In0QYgP8yk3YUsg5
	 SkvrlMI65/yplVDu/waX12zntZsOnCDXA53KDSKs+uHqBFcsVYttrAXYIRm+/0RjRp
	 ZvCWr+Laabf36G/3gdZRBnWTJJSJF/lGgUhMlMyS4zAzSVGHlck4i/XdIwjpjxpA94
	 d6yM71n3nBSRc55H2EB86YU2enXKslc4MRPb1VjGWY6VmZCOPQkFncxyDF9S3Tslay
	 pjnd1OkFqIw4a80+BbcP8yG5QsLEZeaJyS1oJLkjRlD7t39Lexva1IHKBdhoa0lBjV
	 JCUtGJeeIMwbQ==
Subject: Re: [PATCH net-next v2 8/9] net: sparx5/lan969x: scale the TAS guard
 band with the MTU
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com
Date: Thu, 12 Nov 2026 17:33:19 +0000
Message-ID: <179450479909.2199510.1751417721062491348@kernel.org>
In-Reply-To: <20261111-sparx5-mtu-change-v2-8-59c91357e8f6@microchip.com>
References: <20261111-sparx5-mtu-change-v2-8-59c91357e8f6@microchip.com>
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

- [Medium] sparx5_tas_gb_update()
  (drivers/net/ethernet/microchip/sparx5/sparx5_tas.c) computes one…
- [Low] sparx5_tas_gb_update() sizes the guard band from L2 bytes only:
  SPX5_HW_MTU(max_mtu) + 2*VLAN_HLEN, i.e. MTU + ETH_HLEN + FCS + two…

--

net: sparx5/lan969x: scale the TAS guard band with the MTU

This commit adds the HSCH_TAS_QMAXSDU_CFG register. It also adds
sparx5_tas_gb_update(), which sizes the TAS guard band of every port and
traffic class for the largest MTU across all ports. The guard band is
programmed at init, and the helper is exported so it can be called when
the MTU changes.

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> index ec80bc69371ab..32e502bc4f18f 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c

[ ... ]

> @@ -718,6 +721,40 @@ int sparx5_tas_disable(struct sparx5_port *port)
>  	return err;
>  }
>  
> +/* Size the guard band of all ports for a frame of the largest MTU of all
> + * ports, as a port can transmit frames forwarded from any port.
> + */
> +void sparx5_tas_gb_update(struct sparx5 *sparx5)
> +{
> +	u32 max_mtu = 0, gb;
> +	int i, tc;
> +
> +	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
> +		if (sparx5->ports[i])
> +			max_mtu = max_t(u32, max_mtu,
> +					READ_ONCE(sparx5->ports[i]->ndev->mtu));
> +	}
> +
> +	gb = DIV_ROUND_UP(SPX5_HW_MTU(max_mtu) + 2 * VLAN_HLEN,
> +			  TAS_QMAXSDU_UNIT);

[Severity: Low]
Should this calculation include the 8 bytes of preamble and SFD?

The guard band is MTU + ETH_HLEN + ETH_FCS_LEN + 2 * VLAN_HLEN, rounded up
to 64 bytes, so the rounding slack is anywhere from 0 to 63 bytes. For some
MTUs the slack is under 8 bytes. With MTU 9190, for example:

    9190 + 14 + 4 + 8 = 9216 = 144 * 64

which leaves no slack at all.

Suppose the HSCH converts QMAXSDU_VAL * 64 to time at the link speed and
does not add preamble/SFD itself. Then a maximum size frame started just
before the guard band could still be on the wire for up to 8 byte times
after the gate closes.

I couldn't confirm this from the register definitions. The felix driver
uses the same formula for QSYS_PORT_MAX_SDU and adds the 24 byte L1
overhead only when it checks gate lengths, so the hardware may already
handle it. The default MTU of 1500 has 10 bytes of slack and is not
affected.

> +
> +	mutex_lock(&sparx5->tas_lock);
> +
> +	/* Each port uses the TAS profile of its own number */
> +	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
> +		if (!sparx5->ports[i])
> +			continue;
> +
> +		for (tc = 0; tc < SPX5_PRIOS; tc++)
> +			spx5_rmw(HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL_SET(gb),
> +				 HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL,
> +				 sparx5,
> +				 HSCH_TAS_QMAXSDU_CFG(i, tc));
> +	}
> +
> +	mutex_unlock(&sparx5->tas_lock);
> +}

[Severity: Medium]
A later patch in this series, "net: sparx5/lan969x: add support for
changing the MTU", makes sparx5_port_change_mtu() call
sparx5_tas_gb_update(). After that, raising the MTU of any one port grows
the guard band of every port. This includes ports that stay at MTU 1500
and already run an offloaded taprio schedule.

For example, port A runs a 1G schedule in which one TC has a 15-20 us
window. That works with the 1536 byte guard band (about 12.3 us at 1G).
Setting MTU 9000 on port B raises the guard band on port A to 9088 bytes
(about 72.7 us at 1G).

Would that TC on port A then stop starting frames, without any error or
log message?

Nothing seems to catch this case. sparx5_tas_enable() checks entry
intervals only against TAS_MIN_CYCLE_TIME_NS and TAS_MAX_CYCLE_TIME_NS,
not against the guard band time at the port speed.
sparx5_tas_gb_update() rewrites the live profiles without looking at
running schedules. Because sparx5_tas_init() sets
HSCH_TAS_CFG_CTRL_ALWAYS_GUARD_BAND_SCH_Q, the new value applies to every
gate close.

For comparison, vsc9959_tas_guard_bands_update() in felix_vsc9959.c
re-checks each TC's minimum gate length against the required frame time
when the MTU changes. When the gate is too short, it enables oversize
frame dropping and prints a dev_info, so the TC does not hang the port.

Sizing for the global maximum looks reasonable, because matchall mirred
and flower redirect can send frames from any port to any egress port.
Could running schedules whose windows become unusable be validated, or at
least reported?

The commit message also says:

    As the scheduler does not start a frame inside the guard band, a gate
    window shorter than the guard band at the link speed cannot transmit,
    as is already the case for the default 1536 byte guard band.

It doesn't mention that this threshold now changes under existing
schedules when another port's MTU changes.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-sparx5-mtu-change-v2-0-59c91357e8f6%40microchip.com

