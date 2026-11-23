Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318FB606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V4Jgi32T;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h9eopam/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JHXeULIVQNGIXkg/gHNyxlKSvwy0n+U/9gspP4hp0zQ=; b=V4Jgi32T7i2QXHRMQee9C4aZT8
	ytpyHQnDZEKBMznwCUmwt6TSq36+vpay3y3cf++zc/Fhxya6bBRK4/mTQ2QwqHBFEXHUn0qdHaR7N
	ntUCdUjpHPCdLCcZP/m3LVCQKFx8cqAH7cSDGMX9q3XfjmYDdYvub1i2gpT7SepSICs6XP8bnhq8g
	byefdwYaG00XBZhRUksRTwJ1sdW+8JjfST86nVHc/4bmr0/0EnbKzSg2eZMYx+TNNuk1x5mPLmTzf
	6nI+pzQR/Ml3UDdoq1sgVRlGPNEYtPDi6PcX0B+7U7G5sXaVVinyjILYHPAx6UNZ9Cr9JBO4/nejC
	+jX8jSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVVB-00000003riV-01Iz;
	Mon, 23 Nov 2026 14:58:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVUu-00000003rXb-0wSu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 14:58:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A81CD61133;
	Mon, 23 Nov 2026 14:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA791F000E6;
	Mon, 23 Nov 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445903;
	bh=JHXeULIVQNGIXkg/gHNyxlKSvwy0n+U/9gspP4hp0zQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=h9eopam/9BaQtoy2o9kETxgS9rKnidAWxZI6v6Zl2EQlCIKJJiyaMdmtsKf+FjChb
	 7aDlFzZReYBzKrU4SbMH8Sz0AyNafHJmq7SOMWqnEg67GALkaaTSmTmoCUN8Rig5E5
	 /sznT28wrFpm9TWFExhKLqjmQj6Pw0pvMQrp2fEba9mtoyebJ+YFShr5Wk0/nUiM1C
	 Hult1fQc0aenaz6jetYgETtqKTsEQSO9SEJHQzduEYDsZzI6ddn24upJmn63XgBuzh
	 KcYchdDwhQg4PbSYf5eNWBopIdQEe9N58wVVmcUEecLVq+h4mPuegyCdL4t+JWBOkB
	 xO5xOsF0AFH2w==
Subject: Re: [PATCH net-next v3 8/9] net: sparx5/lan969x: scale the TAS guard
 band with the MTU
From: netdev-bot+sashiko@kernel.org
To: daniel.machon@microchip.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.marko@sartura.hr,
 horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com,
 horms@kernel.org
Date: Mon, 23 Nov 2026 14:58:21 +0000
Message-ID: <179544590174.3135.13752120910636082921@kernel.org>
In-Reply-To: <20261120-sparx5-mtu-change-v3-8-55c272fe1acc@microchip.com>
References: <20261120-sparx5-mtu-change-v3-8-55c272fe1acc@microchip.com>
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
  (drivers/net/ethernet/microchip/sparx5/sparx5_tas.c) takes the largest…
- [Low] In sparx5_tas_gb_update()
  (drivers/net/ethernet/microchip/sparx5/sparx5_tas.c:738) the guard…

--

net: sparx5/lan969x: scale the TAS guard band with the MTU

This commit programs the TAS guard band (HSCH_TAS_QMAXSDU_CFG) for all
ports and traffic classes. The value comes from the largest MTU of all
ports, plus the Ethernet header, FCS and two VLAN tags, rounded up to
64 bytes. It adds sparx5_tas_gb_update(), calls it from sparx5_tas_init(),
and makes it available for use when the MTU changes.

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
Should the 8 byte preamble/SFD be counted here?

The guard band is sized from the L2 frame only, F = mtu + 26, rounded up
to 64 bytes. A frame of F bytes that starts just before the guard band
needs F + 8 byte-times on the wire to finish.

When F mod 64 is 0 or 57..63, the rounding leaves less than 8 bytes of
slack. For example, mtu=2022 gives F=2048 and mtu=9190 gives F=9216, both
with no slack. mtu=4000 gives F=4026, with 6 bytes of slack.

Suppose the HSCH turns QMAXSDU_VAL * 64 directly into time at LINK_SPEED,
without adding L1 overhead itself. Could a maximum size double tagged
frame then overrun the gate close by up to 8 byte-times? The default MTU
of 1500 is fine (1526 vs 1536).

For comparison, felix/vsc9959 adds L1 overhead explicitly when it
calculates the guard band. The tree doesn't show whether the
sparx5/lan969x hardware adds the preamble time internally.

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

[Severity: Medium]
What happens to taprio schedules already offloaded on other ports when
this loop rewrites the guard band?

The loop writes the new guard band into every port's profile for all 8
traffic classes. That includes ports whose lists are already pending or
operating. sparx5_tas_init() sets ALWAYS_GUARD_BAND_SCH_Q, so the guard
band applies to every class:

sparx5_tas_init() {
    ...
	spx5_rmw(HSCH_TAS_CFG_CTRL_LIST_NUM_MAX_SET(list_num_max) |
		 HSCH_TAS_CFG_CTRL_ALWAYS_GUARD_BAND_SCH_Q_SET(1),
    ...
}

Later in this series, "net: sparx5/lan969x: add support for changing the
MTU" calls sparx5_tas_gb_update() from sparx5_port_change_mtu(). After
that, "ip link set dev ethB mtu 9000" raises the guard band on every port
from 1536 to 142 * 64 = 9088 bytes. That is about 72.7 us at 1 Gbps and
727 us at 100 Mbps. At the maximum MTU it reaches 219 * 64 = 14016 bytes.

Take a schedule on ethA with a 20-50 us window at 1G. It works with the
1536 byte guard band (about 12.3 us). The commit message notes that the
scheduler starts no frame inside the guard band.

After the MTU change on ethB, wouldn't that window never open? The queue
would then fill and tail-drop, and no error would be reported.

sparx5_tas_gb_update() returns void and doesn't recheck the programmed
lists. sparx5_tas_enable() checks intervals only against
TAS_MIN_CYCLE_TIME_NS and TAS_MAX_CYCLE_TIME_NS, not against the guard
band, so such schedules are also accepted without a warning:

sparx5_tas_enable() {
    ...
		if (interval < TAS_MIN_CYCLE_TIME_NS) {
    ...
}

The taprio max_sdu[] values, which correspond to this register, are also
ignored. So the guard band can't be limited per class.

felix/vsc9959 handles this in vsc9959_tas_guard_bands_update(). It
recomputes the per-TC QMAXSDU from the schedule's minimum gate lengths
whenever the MTU or the schedule changes. It also enables oversize
dropping, so short windows can still carry smaller frames.

Using the switch-wide maximum MTU seems reasonable, since ports forward
and mirror frames from each other. The concern is only that running
schedules can stop transmitting without any error.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

