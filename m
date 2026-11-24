Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9066606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yw639Kla;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JCDTNmB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OwZXOITJo56PReQ9BykCMJAs017o0l+E14VdkE53qkE=; b=Yw639Kla2XN42PvO5PsAeInpUR
	+tQ6OTjtxc7Es6MjHJBbEzkz23cbMzn3pHiBv170/ei74yGi7oFVJjjsMXRG2BI6074Kf7NEJ3kDu
	D9ZjfJpz1cpdipSg9DN9frj186V6gGuhXw25XR4j35R4XCAcbvTbRWbIAcmMYavlRwQVneSSjfjmL
	eBnehs36zDMZb4336CwpwH6d041Pe16CG0u/Hx/iti56dVGCiJIyMOW6wpjiH6S4knpzDKgGQR3NG
	G9+OdXhmgmGCo9i5l01mtJzriGuQqJOEylnd6qlBRK27VUBOHd3guxn8BPmwltPomR2FuBG4OBGML
	XFwP/LZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoRH-00000006IgW-3cz8;
	Tue, 24 Nov 2026 11:11:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoQp-00000006IcU-1bX9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795518695; x=1827054695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8pXOKlK0mI7Ua5Htx7CMcHzP1KNpru5khORw6FKthcw=;
  b=JCDTNmB+xnNBuuCx2kxNORNlQuJQouskj9zRp5jwyZkTdlN9u0U1br8S
   /xOh80MZ9dRcqciHgtzqykS+mCtA+2Gt4bHaEmlRhD5NEFxg6TD0Gnz7C
   txTj54TVR58gDwRooo947FMUuVO6nLR6fve10buYPX+6vDCJqrm/wOxMC
   uPrmkYwqnJYSvGp5tcUDDUW3SOcz6WX8IWP90QNa4I+BFjfjtCmjxY81w
   w2wwGqttYtfV9XGYC2x5p3cCbM+Pa4zbC6V0OEqJPvlD9NsTl/7D8kCiU
   45bsTaTAw23rjVO93J6NrFUzkkBrIhR45l2M+NUi63fkYxbOh3PGOQMHk
   w==;
X-CSE-ConnectionGUID: xaLedNgPSdmdvd3E7rHtqQ==
X-CSE-MsgGUID: kaayPWVHTBSQnDmgi0HBlQ==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="66983052"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 04:11:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Tue, 24 Nov 2026 04:11:25 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 04:11:22 -0700
Date: Tue, 24 Nov 2026 12:11:21 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horms@kernel.org>
Subject: Re: [PATCH net-next v3 8/9] net: sparx5/lan969x: scale the TAS guard
 band with the MTU
Message-ID: <20261124111121.medudcljq3slykzx@DEN-DL-M70577>
References: <20261120-sparx5-mtu-change-v3-8-55c272fe1acc@microchip.com>
 <179544590174.3135.13752120910636082921@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179544590174.3135.13752120910636082921@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_031127_947374_1BA54C0C 
X-CRM114-Status: GOOD (  38.00  )
X-Spam-Score: -4.4 (----)
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

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] sparx5_tas_gb_update()
>   (drivers/net/ethernet/microchip/sparx5/sparx5_tas.c) takes the largest…
> - [Low] In sparx5_tas_gb_update()
>   (drivers/net/ethernet/microchip/sparx5/sparx5_tas.c:738) the guard…
> 
> --
> 
> net: sparx5/lan969x: scale the TAS guard band with the MTU
> 
> This commit programs the TAS guard band (HSCH_TAS_QMAXSDU_CFG) for all
> ports and traffic classes. The value comes from the largest MTU of all
> ports, plus the Ethernet header, FCS and two VLAN tags, rounded up to
> 64 bytes. It adds sparx5_tas_gb_update(), calls it from sparx5_tas_init(),
> and makes it available for use when the MTU changes.
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> > index ec80bc69371ab..32e502bc4f18f 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_tas.c
> 
> [ ... ]
> 
> > @@ -718,6 +721,40 @@ int sparx5_tas_disable(struct sparx5_port *port)
> >  	return err;
> >  }
> >  
> > +/* Size the guard band of all ports for a frame of the largest MTU of all
> > + * ports, as a port can transmit frames forwarded from any port.
> > + */
> > +void sparx5_tas_gb_update(struct sparx5 *sparx5)
> > +{
> > +	u32 max_mtu = 0, gb;
> > +	int i, tc;
> > +
> > +	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
> > +		if (sparx5->ports[i])
> > +			max_mtu = max_t(u32, max_mtu,
> > +					READ_ONCE(sparx5->ports[i]->ndev->mtu));
> > +	}
> > +
> > +	gb = DIV_ROUND_UP(SPX5_HW_MTU(max_mtu) + 2 * VLAN_HLEN,
> > +			  TAS_QMAXSDU_UNIT);
> 
> [Severity: Low]
> Should the 8 byte preamble/SFD be counted here?
> 
> The guard band is sized from the L2 frame only, F = mtu + 26, rounded up
> to 64 bytes. A frame of F bytes that starts just before the guard band
> needs F + 8 byte-times on the wire to finish.
> 
> When F mod 64 is 0 or 57..63, the rounding leaves less than 8 bytes of
> slack. For example, mtu=2022 gives F=2048 and mtu=9190 gives F=9216, both
> with no slack. mtu=4000 gives F=4026, with 6 bytes of slack.
> 
> Suppose the HSCH turns QMAXSDU_VAL * 64 directly into time at LINK_SPEED,
> without adding L1 overhead itself. Could a maximum size double tagged
> frame then overrun the gate close by up to 8 byte-times? The default MTU
> of 1500 is fine (1526 vs 1536).
> 
> For comparison, felix/vsc9959 adds L1 overhead explicitly when it
> calculates the guard band. The tree doesn't show whether the
> sparx5/lan969x hardware adds the preamble time internally.
> 
> > +
> > +	mutex_lock(&sparx5->tas_lock);
> > +
> > +	/* Each port uses the TAS profile of its own number */
> > +	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
> > +		if (!sparx5->ports[i])
> > +			continue;
> > +
> > +		for (tc = 0; tc < SPX5_PRIOS; tc++)
> > +			spx5_rmw(HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL_SET(gb),
> > +				 HSCH_TAS_QMAXSDU_CFG_QMAXSDU_VAL,
> > +				 sparx5,
> > +				 HSCH_TAS_QMAXSDU_CFG(i, tc));
> 
> [Severity: Medium]
> What happens to taprio schedules already offloaded on other ports when
> this loop rewrites the guard band?
> 
> The loop writes the new guard band into every port's profile for all 8
> traffic classes. That includes ports whose lists are already pending or
> operating. sparx5_tas_init() sets ALWAYS_GUARD_BAND_SCH_Q, so the guard
> band applies to every class:
> 
> sparx5_tas_init() {
>     ...
> 	spx5_rmw(HSCH_TAS_CFG_CTRL_LIST_NUM_MAX_SET(list_num_max) |
> 		 HSCH_TAS_CFG_CTRL_ALWAYS_GUARD_BAND_SCH_Q_SET(1),
>     ...
> }
> 
> Later in this series, "net: sparx5/lan969x: add support for changing the
> MTU" calls sparx5_tas_gb_update() from sparx5_port_change_mtu(). After
> that, "ip link set dev ethB mtu 9000" raises the guard band on every port
> from 1536 to 142 * 64 = 9088 bytes. That is about 72.7 us at 1 Gbps and
> 727 us at 100 Mbps. At the maximum MTU it reaches 219 * 64 = 14016 bytes.
> 
> Take a schedule on ethA with a 20-50 us window at 1G. It works with the
> 1536 byte guard band (about 12.3 us). The commit message notes that the
> scheduler starts no frame inside the guard band.
> 
> After the MTU change on ethB, wouldn't that window never open? The queue
> would then fill and tail-drop, and no error would be reported.
> 
> sparx5_tas_gb_update() returns void and doesn't recheck the programmed
> lists. sparx5_tas_enable() checks intervals only against
> TAS_MIN_CYCLE_TIME_NS and TAS_MAX_CYCLE_TIME_NS, not against the guard
> band, so such schedules are also accepted without a warning:
> 
> sparx5_tas_enable() {
>     ...
> 		if (interval < TAS_MIN_CYCLE_TIME_NS) {
>     ...
> }
> 
> The taprio max_sdu[] values, which correspond to this register, are also
> ignored. So the guard band can't be limited per class.
> 
> felix/vsc9959 handles this in vsc9959_tas_guard_bands_update(). It
> recomputes the per-TC QMAXSDU from the schedule's minimum gate lengths
> whenever the MTU or the schedule changes. It also enables oversize
> dropping, so short windows can still carry smaller frames.
> 
> Using the switch-wide maximum MTU seems reasonable, since ports forward
> and mirror frames from each other. The concern is only that running
> schedules can stop transmitting without any error.

This was already dismissed on v2 [1].

[1] https://lore.kernel.org/netdev/20261113081058.onqbnzydftlc4jeu@DEN-DL-M70577.microsemi.net/

> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

