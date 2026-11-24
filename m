Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B35E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbc1g4h9;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=MDRTN/tS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bGnX/iGZlgGEkI+A2mMrk0IcJmCgekVCaIDWKQdKsXc=; b=wbc1g4h9SKG9V0LpoCzzSzeIv8
	wd69wg+qIB2q6cnl3hT3NRB7I2FzWuAl0JqaGqnYYt3yjg4/iWSJxI5FunnPxJtYEvc38A0AlcqCj
	P1oUDANvA9pH7u4HL90mtq89MlzNxYjkX8ljTvW75bojwLQEezkX6BiJq7jgR4s+YbrN/lKU7m+GB
	80lL+goVkojrckG9MH8zp3KbDOqYlxhCG/FBsXF3hGWLnh1/AqHuRIbnsjbNwnHnKobbwBod64GKl
	UvTGJiudDn0dGkewyiEOxhTAIMQ2bi1BLLV7W9JIpvSGacuLr8g2z1JaLjNjcHaPMrU+aGI9lAphR
	O5sDqQ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoP0-00000006IU3-2XxU;
	Tue, 24 Nov 2026 11:09:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoOx-00000006ITf-3Nht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795518579; x=1827054579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FgzITZRt5fWSTf72IJZ4AJHUAoY48XOZrElrGCAvSG0=;
  b=MDRTN/tSqwlKEHy/o6VEkTyvDglEhKrTahMorXn2gk9LTKpI1DbQmHWa
   tLMWP8CcS37cojsF37zDgW+fuInGYtN5iH4/4soyQ1ldV+kxHs/xVRBIE
   Ntedc0uc38emVPnLgEMOqPBWFgV2/NhXApVdtP9jbwMzTcph9pQL9m+wZ
   BEAWdhdXA3rS3fkd+CUyz8yX2XT8I54WhTehcG05TrWiZboGjEco9ZGBN
   ynrI7qhX/gM6ZaNOS+gUO3OESzkjUEib2ohCGodOj341kNwcYCWT0pa3r
   iG0TGZQvCZJjUbbKAxTOUL7s8SP3JiDJxTZ3HnSoimMEa5G3UevgsAHjm
   Q==;
X-CSE-ConnectionGUID: AKY9yM2+ROe7nyPTM4+KAA==
X-CSE-MsgGUID: 9HGun83SRcybvxP03o15dA==
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="66982986"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 04:09:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Tue, 24 Nov 2026 04:09:30 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 24 Nov 2026 04:09:27 -0700
Date: Tue, 24 Nov 2026 12:09:26 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: <netdev-bot+sashiko@kernel.org>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <richardcochran@gmail.com>,
	<linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robert.marko@sartura.hr>, <horatiu.vultur@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horms@kernel.org>
Subject: Re: [PATCH net-next v3 7/9] net: sparx5/lan969x: scale the queue
 watermarks with the MTU
Message-ID: <20261124110926.o3pm6urngmdca72s@DEN-DL-M70577>
References: <20261120-sparx5-mtu-change-v3-7-55c272fe1acc@microchip.com>
 <179544589953.3135.16152141389643791611@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179544589953.3135.16152141389643791611@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_030931_882722_0703EE75 
X-CRM114-Status: GOOD (  36.81  )
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
> - [Medium] At this commit (and at the next one, "scale the TAS guard band
>   with the MTU"), sparx5_port_wm_set() in…
> - [Low] This commit adds sparx5_port_wm_update() (sparx5_port.c:717) as a
>   non-static function with a prototype in sparx5_port.h:94, but nothing…
> 
> --
> 
> net: sparx5/lan969x: scale the queue watermarks with the MTU
> 
> The commit now computes the QSYS PAUSE_START, PAUSE_STOP and ATOP
> watermarks from the port MTU, plus the Ethernet header, FCS and two VLAN
> tags, rounded up to whole buffer cells. Before, they were fixed multiples
> of a 1518 byte frame. The watermarks are programmed at port init and when
> pause is resolved. The commit also adds sparx5_port_wm_update() for MTU
> changes and a per-port wm_lock.
> 
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> > index 701d310df0ba6..87aa0b7841359 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
> 
> [ ... ]
> 
> > @@ -676,24 +679,53 @@ int sparx5_port_fwd_urg(struct sparx5 *sparx5, u32 speed)
> 
> [ ... ]
> 
> > +/* Pause start/stop and tail drop at 6/4/20 frames of the port MTU */
> > +static void sparx5_port_wm_set(struct sparx5 *sparx5, struct sparx5_port *port,
> > +			       u8 pause)
> > +{
> > +	u32 len = SPX5_HW_MTU(READ_ONCE(port->ndev->mtu)) + 2 * VLAN_HLEN;
> > +	u32 cells = DIV_ROUND_UP(len, SPX5_BUFFER_CELL_SZ);
> 
> [Severity: Medium]
> At this commit, can port->ndev->mtu drift away from the MAC max frame
> length?
> 
> sparx5_port_init() still programs a fixed max length:
> 
> 	sparx5_port_max_len_set(sparx5, port, ETH_MAXLEN);
> 
> sparx5_port_netdev_ops has no .ndo_change_mtu. With the ether_setup()
> defaults (min_mtu 68, max_mtu 1500), the core writes dev->mtu directly
> and no hardware gets reconfigured.
> 
> Suppose the MTU is lowered to 68 with ip link. The next link-up then runs:
> 
>   sparx5_port_config()->sparx5_port_fc_setup()->sparx5_port_wm_set()
> 
> That gives len = 94 and cells = 1. PAUSE_START becomes 6 cells,
> PAUSE_STOP 4 cells and ATOP 20 cells.
> 
> The MAC still accepts 1518-byte frames, which take 9 cells each. With TX
> pause enabled, wouldn't one full-size frame go past PAUSE_START, so that
> a pause frame is sent for every received frame? ATOP would also drop to
> about two full-size frames, which means heavy tail drop. That is the
> problem the commit message describes, only triggered by a smaller MTU
> instead of a larger one.
> 
> The problem is also present at the next patch, "scale the TAS guard band
> with the MTU". The final patch of the series, "net: sparx5/lan969x: add
> support for changing the MTU", fixes it. It adds
> sparx5_port_change_mtu(), which returns -EOPNOTSUPP when FDMA is not in
> use. Otherwise it calls sparx5_port_max_len_set() with
> SPX5_HW_MTU(new_mtu) and then sparx5_port_wm_update(). So this only
> affects the intermediate bisection points.
> 
> Could the series be ordered so that the watermarks and the MAC max length
> stay in sync at every commit?

This goes away with patch 9, which keeps the watermarks and the MAC max
frame length in sync. Until then, it needs the MTU to be lowered from
userspace, and it does not break anything. At worst the port sends extra
pause frames and tail drops earlier. I dont think that is worth
reordering the series for.

> 
> > +	u32 pause_stop = 0xFFF - 1; /* FC gen disabled */
> > +
> 
> [ ... ]
> 
> > +}
> > +
> > +void sparx5_port_wm_update(struct sparx5 *sparx5, struct sparx5_port *port)
> > +{
> > +	mutex_lock(&port->wm_lock);
> > +	sparx5_port_wm_set(sparx5, port, port->wm_pause);
> > +	mutex_unlock(&port->wm_lock);
> > +}
> 
> [Severity: Low]
> This isn't a bug, but sparx5_port_wm_update() is non-static and has a
> prototype in sparx5_port.h, yet nothing calls it at this commit.
> sparx5_port_netdev_ops has no .ndo_change_mtu yet, so the MTU-change part
> of this patch is not connected to anything.
> 
> This comment in sparx5_port_disable() also refers to an MTU-change path
> that does not exist yet:
> 
> 	/* 5: Disable Flowcontrol, and keep an MTU change from re-enabling it */
> 
> The first caller is sparx5_port_change_mtu(), added by the final patch of
> the series, "net: sparx5/lan969x: add support for changing the MTU". It
> calls sparx5_port_wm_update() after WRITE_ONCE(dev->mtu, new_mtu), so the
> READ_ONCE() in sparx5_port_wm_set() picks up the new MTU.
> 
> Could the helper be added in the same patch as its caller?
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-sparx5-mtu-change-v3-0-55c272fe1acc%40microchip.com

