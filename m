Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4601A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zruP5NxD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LG7D9VlL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q5fTVKGrskJG4rdSydPr4XMv95Db9+O3BQWMmUFXULI=; b=zruP5NxDpaXPuKeXE7lcY2is2S
	r09qJhDRYJCC9L/A5AJVc/sIxnmX2wMZnQKlg0uFL0FiIiX3tDxWbgmREaQEFRGJpvW+4uD8ok5m8
	P33B/ezqpvucatKdT1nfOzMn2zrf6q6rt/Lh9POLNZVfYJyegZVkovTiNLd9EDFD+pnbDWTokDzqZ
	s0wg2qMpSIY2+rbA09hrpjyjN5AFPudmv4HMpBG1jeqMkUjTT/+rK6YzcSAVC7lXcGdSPsV7p7g/H
	enzizOEts9K/CdztEjiQ1fKO2VOJ39HGFK/DiHl30VB4CkW61+J/Mg+eQDVtQFZp+A09+np/Biqtl
	rkxs5BDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxum-00000002vJa-3o56;
	Mon, 16 Nov 2026 14:42:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxuk-00000002vJE-0sjI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:42:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D98EA41155;
	Mon, 16 Nov 2026 14:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD611F000C4;
	Mon, 16 Nov 2026 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840153;
	bh=q5fTVKGrskJG4rdSydPr4XMv95Db9+O3BQWMmUFXULI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LG7D9VlL4ycHov4A3MFP0swl7FuLeK3/NWZCcN0scM6Z9FrBhWr5UHnFsuWQfeAHf
	 +Rduaj5TAKFSzumhW2L1L+eA07I65IohhX7Eod1PstibMo8Ugm50XhzTKiAO24ppkj
	 nQFLZUFEpj2eOuGCO8BeMqT+xcdLDDAsQEnrdqdTfqiWSS2bT4Kv7WxtKeDQlI+b2V
	 N4s00Zd1bHU4BpvX+ttPjaZSsFm3lQ0dmFGKH5Rnl3OIM4XW/+Kc2swF1hEcyAJSwg
	 p5q57ANVmtAlmHYzxDwO7GVNV+Y4EcB6pJluPnpYdyKp9YinMOEIBb5olYxIk7s0XQ
	 mfGMQ4syM2fKQ==
Subject: Re: [PATCH net-next] net: sparx5: check DT port reg against array size
From: netdev-bot+sashiko@kernel.org
To: haoranwangsec@gmail.com
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org
Date: Mon, 16 Nov 2026 14:42:32 +0000
Message-ID: <179484015280.3136.6207275462106785238@kernel.org>
In-Reply-To: <179457014579.23820.10657909253312598784@gmail.com>
References: <179457014579.23820.10657909253312598784@gmail.com>
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new range check in mchp_sparx5_probe()
  (drivers/net/ethernet/microchip/sparx5/sparx5_main.c:848) compares the…

--

net: sparx5: check DT port reg against array size

This patch adds a range check on the DT 'reg' value of each ethernet-port
node in mchp_sparx5_probe(). Nodes with portno >= SPX5_PORTS are now
skipped, so sparx5_create_port() can no longer index past the end of
sparx5->ports[].

> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 9b67a0520907b..d975474792f9f 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>  			dev_err(sparx5->dev, "port reg property error\n");
>  			continue;
>  		}
> +		if (portno >= SPX5_PORTS) {

[Severity: High]
Should this bound be sparx5->data->consts->n_ports rather than SPX5_PORTS?

SPX5_PORTS (65) is the compile-time size of sparx5->ports[]. It matches the
front-port count on Sparx5 only. mchp_sparx5_probe() is also used for
lan969x, and its consts are smaller:

drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c:
	.n_ports             = 30,
	.n_ports_all         = 35,

drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_regs.c:
	[TC_DEV2G5] = 28,
	...
	[RC_QSYS_ATOP] = 35,

On lan969x, a reg value from 30 to 64 passes this check.
lan969x_port_is_rgmii() is only true for ports 28 and 29, so such a port
just needs a phys phandle for devm_of_phy_get() to succeed. After that it
is accepted and goes through this path:

mchp_sparx5_probe()
  sparx5_create_port()
    sparx5->ports[config->portno] = spx5_port;
    sparx5_port_init()
      sparx5_port_max_tags_set()
        spx5_wr(..., DEV2G5_MAC_TAGS_CFG(port->portno));

The DEV2G5 registers resolve to regs[TARGET_DEV2G5 + portno]. The lan969x
iomap only fills TARGET_DEV2G5 + 0..27, and the sparx5 struct is
zero-allocated, so those slots are NULL. spx5_addr() warns but still
returns the address:

drivers/net/ethernet/microchip/sparx5/sparx5_main.h:spx5_addr() {
	WARN_ON((tinst) >= tcnt);
	WARN_ON((ginst) >= gcnt);
	WARN_ON((rinst) >= rcnt);
	return base[id + (tinst)] +
		gbase + ((ginst) * gwidth) +
		raddr + ((rinst) * rwidth);
}

Can this end up as an MMIO write to a near-NULL address during probe?

sparx5_port_init() also uses portno directly as the replication index for
QSYS_PAUSE_CFG(), QSYS_ATOP(), ANA_CL_CAPTURE_BPDU_CFG() and
ANA_CL_FILTER_CTRL(). With RC_QSYS_ATOP = 35 on lan969x, ports 30..34 would
reconfigure the internal CPU/VD ports, the ones sparx5_get_internal_port()
returns as n_ports + N. Ports 35..64 would go past the replication range.

If such a port survives init, sparx5_register_netdevs(),
sparx5_destroy_netdevs() and sparx5_unregister_netdevs() only walk
portno < consts->n_ports. Would its netdev then never be registered, and
its phylink never be destroyed?

The commit message describes the DT as possibly untrusted (overlay, kexec,
bootloader fixup). The binding in microchip,sparx5-switch.yaml sets no
maximum on the port reg, so this driver check is the only guard. Would
checking against the per-chip limit close the out-of-bounds case on
lan969x as well?

> +			dev_err(sparx5->dev, "port %u: reg out of range\n",
> +				portno);
> +			continue;
> +		}
>  		config = &configs[idx];
>  		conf = &config->conf;
>  		conf->speed = SPEED_UNKNOWN;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179457014579.23820.10657909253312598784%40gmail.com

