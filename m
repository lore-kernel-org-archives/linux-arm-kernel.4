Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31823606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=thzp0T3V;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Hek2MiuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CFLFPkbYpBWJouN4jEytAc2icybRGlMdaxCF09UEUFE=; b=thzp0T3Vop87JzxIo1ob6gcNPc
	oiI/JKUnk+nlnzgvEM6AafzaYIPXTI/SkSE8wRBuR7dSZH0aHCU6aYtL6p7jsvxIbJMEIV3fzYEcl
	Xt5KQYmTdmgUj1HOCNHzl0vObI2wJVqCHVAc+sTcGRG7WFKAuudq4BuF8gFe2GEDdNpvB1rVcnvGT
	8ESo71tUsu/R9C/1x+h6fhn5H1R/uctZJ0WSOTH7hCwTDG00lLI1Eh3MQPDnIZXwoCrW6DTvbVpC2
	kpn3RrRGEr2ZgPS/ik9zq7aVQMDU8iHfrf12uhP0/KtAeK2ocFmcn95ExGW70o94PEBUVJD2SWACA
	ngM60zfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmNF-0000000Bzek-1et2;
	Fri, 13 Nov 2026 08:11:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmND-0000000BzeN-0aRd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794557470; x=1826093470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vFkGRDfaEz7TD82QokaqM0mAGCL5sNleTlbVjcTLY6Y=;
  b=Hek2MiuVvlZKYoRbe4KnivS/8PVdCMCLHhhinmIya8odO58AeBM3nYtP
   tVdrysojEFwr48nFVvSgvPfndn8kLFyII0LmtMalM4fUivs4VWEtBXnXp
   2BKVBKsr0zhEZg77NzkqbZ1R0veH6dZQmpCmsoo8w9gHZ+9bIM3zBkE49
   bB1ep9lzwEopAf/BDIr9wBg/5jbDWMujGyf9pRG9ftxmoFqQU5bf1R5rs
   t0UI/lfAxLsCrC7N2jWfoLoGnf07OCWBzV0XJ9LepQtRaxVeryhHL5f4h
   xxZeiXOLctTwy73WVIHy+xK+DD92ZyUzuYSDVTNJiWOZv1Ena3hamTeZc
   w==;
X-CSE-ConnectionGUID: i09munFsT2yxrBJIgYuBiQ==
X-CSE-MsgGUID: kA0hk5iKS2iFloseGvf3eQ==
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="297872440"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2026 01:11:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 13 Nov 2026 01:11:01 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 13 Nov 2026 01:10:59 -0700
Date: Fri, 13 Nov 2026 09:10:58 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next v2 8/9] net: sparx5/lan969x: scale the TAS guard
 band with the MTU
Message-ID: <20261113081058.onqbnzydftlc4jeu@DEN-DL-M70577.microsemi.net>
References: <20261111-sparx5-mtu-change-v2-8-59c91357e8f6@microchip.com>
 <179450479909.2199510.1751417721062491348@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179450479909.2199510.1751417721062491348@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_001103_188981_488B1A74 
X-CRM114-Status: GOOD (  39.16  )
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
>   (drivers/net/ethernet/microchip/sparx5/sparx5_tas.c) computes one…
> - [Low] sparx5_tas_gb_update() sizes the guard band from L2 bytes only:
>   SPX5_HW_MTU(max_mtu) + 2*VLAN_HLEN, i.e. MTU + ETH_HLEN + FCS + two…
> 
> --
> 
> net: sparx5/lan969x: scale the TAS guard band with the MTU
> 
> This commit adds the HSCH_TAS_QMAXSDU_CFG register. It also adds
> sparx5_tas_gb_update(), which sizes the TAS guard band of every port and
> traffic class for the largest MTU across all ports. The guard band is
> programmed at init, and the helper is exported so it can be called when
> the MTU changes.
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
> Should this calculation include the 8 bytes of preamble and SFD?
> 
> The guard band is MTU + ETH_HLEN + ETH_FCS_LEN + 2 * VLAN_HLEN, rounded up
> to 64 bytes, so the rounding slack is anywhere from 0 to 63 bytes. For some
> MTUs the slack is under 8 bytes. With MTU 9190, for example:
> 
>     9190 + 14 + 4 + 8 = 9216 = 144 * 64
> 
> which leaves no slack at all.
> 
> Suppose the HSCH converts QMAXSDU_VAL * 64 to time at the link speed and
> does not add preamble/SFD itself. Then a maximum size frame started just
> before the guard band could still be on the wire for up to 8 byte times
> after the gate closes.
> 
> I couldn't confirm this from the register definitions. The felix driver
> uses the same formula for QSYS_PORT_MAX_SDU and adds the 24 byte L1
> overhead only when it checks gate lengths, so the hardware may already
> handle it. The default MTU of 1500 has 10 bytes of slack and is not
> affected.
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
> > +	}
> > +
> > +	mutex_unlock(&sparx5->tas_lock);
> > +}
> 
> [Severity: Medium]
> A later patch in this series, "net: sparx5/lan969x: add support for
> changing the MTU", makes sparx5_port_change_mtu() call
> sparx5_tas_gb_update(). After that, raising the MTU of any one port grows
> the guard band of every port. This includes ports that stay at MTU 1500
> and already run an offloaded taprio schedule.
> 
> For example, port A runs a 1G schedule in which one TC has a 15-20 us
> window. That works with the 1536 byte guard band (about 12.3 us at 1G).
> Setting MTU 9000 on port B raises the guard band on port A to 9088 bytes
> (about 72.7 us at 1G).
> 
> Would that TC on port A then stop starting frames, without any error or
> log message?
> 
> Nothing seems to catch this case. sparx5_tas_enable() checks entry
> intervals only against TAS_MIN_CYCLE_TIME_NS and TAS_MAX_CYCLE_TIME_NS,
> not against the guard band time at the port speed.
> sparx5_tas_gb_update() rewrites the live profiles without looking at
> running schedules. Because sparx5_tas_init() sets
> HSCH_TAS_CFG_CTRL_ALWAYS_GUARD_BAND_SCH_Q, the new value applies to every
> gate close.
> 
> For comparison, vsc9959_tas_guard_bands_update() in felix_vsc9959.c
> re-checks each TC's minimum gate length against the required frame time
> when the MTU changes. When the gate is too short, it enables oversize
> frame dropping and prints a dev_info, so the TC does not hang the port.
> 
> Sizing for the global maximum looks reasonable, because matchall mirred
> and flower redirect can send frames from any port to any egress port.
> Could running schedules whose windows become unusable be validated, or at
> least reported?
> 
> The commit message also says:
> 
>     As the scheduler does not start a frame inside the guard band, a gate
>     window shorter than the guard band at the link speed cannot transmit,
>     as is already the case for the default 1536 byte guard band.
> 
> It doesn't mention that this threshold now changes under existing
> schedules when another port's MTU changes.

This is intended. A port can transmit frames of the largest MTU of all
ports, so its guard band has to cover them. The gate windows have never
been checked against the guard band, which already changes under running
schedules when the link speed changes.

> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-sparx5-mtu-change-v2-0-59c91357e8f6%40microchip.com

