Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AE5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1trm5QHi;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=ldBy2mfg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0t4b/Qrw4yRrOcM6IJZhKh0+8lcwSixNn61ToWP1MHc=; b=1trm5QHiuR1s1dBricGAu+WNgE
	FsLETpPKjYFZVRT9nwaNEKS5OUvNAd3ZyRZNaxOk8J38JTLgPZcNvljAyiM70I1qCWItoUUp1X2MG
	WqGIbijtRlMdCAfpv/HTbloi4TBjVprfyUOAdFAb/CT7K2LlgzJj8Tv8cIji/gVKQv5PDQjXTF94k
	epeE+Y5xd8jqxv/HZQp2FUrAaVgL+u1CqMKsphrwhlgnDi8YnppoJwKOBEVvS6brcy9NtxCj4P5af
	poPF35f/k4YccIIZeV8ogLVju54Oy2EGVXazaZc4guEfdu6XS9mNgM06oCpj94RXvTIokmSUvoeuQ
	lHKbwWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOuy-00000002Vzp-26AK;
	Mon, 23 Nov 2026 07:56:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVOuj-00000002Vrx-0L9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 07:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795420598; x=1826956598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVHwpw/FD6pKxcpupPVa+nHhi8ImbmRxTL9k4y+v1VI=;
  b=ldBy2mfg+6XTe3K3bTIBcaOYbx7TYUTaVaW5xd1ILkHEMNnMgo3CsP2r
   kavQmCYwwmPJuF424f1nFr8iVkKhGEF58b0CPx9rSAT49uItRXP11yf9L
   zfa11LiJfNj0EHizSOX2mRpK0SSp6xQMN5RdKaihlRg0kBL4YoGFlyALa
   WRr0nm42RPbmvGalFuedulDcMJHySDHz8VXKRIA8jmsV+IeShhu0/Qp3p
   lsW2s6Z1X9ZFpiZ3/3rrzLvFpr9lvSHA4r7/vFHWevGWkFvbEdbOZIwxi
   x6Q/b5K62Qd92qBv9eO9g7m65Id65lgp5K9JydBB8RfUh5WWEWGUaLsLY
   Q==;
X-CSE-ConnectionGUID: ritJ1AcqSF+GWKgCqeULuA==
X-CSE-MsgGUID: 1v7AMAg7TiC5geIKHAp9mg==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="66915052"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:56:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 00:56:25 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 00:56:24 -0700
Date: Mon, 23 Nov 2026 08:56:23 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port count
Message-ID: <20261123075623.7pgmsdn32x4vselo@DEN-DL-M70577>
References: <20261119094613.klyjRQ7HPrCZV7VwnhNzSf_Ev6wIWbyixM5FfrNrJS8@z>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261119094613.klyjRQ7HPrCZV7VwnhNzSf_Ev6wIWbyixM5FfrNrJS8@z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_235637_439862_CA74B8E2 
X-CRM114-Status: GOOD (  29.17  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so an out-of-range 'reg' (runtime overlay,
> corrupted or attacker-controlled DTB, kexec-supplied or bootloader
> fixed-up DT) turns probe into an out-of-bounds write.
> 
> Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
> the same bounds check but fails probe with -EINVAL; skipping here keeps
> the remaining valid ports working.  The bound is the per-chip port count
> from the match data (sparx5->data->consts->n_ports), so lan969x, which
> shares this probe path and has only 30 ports, is bounded correctly as
> well.
> 
> Found by a scripted scan of of_property_read_u32() call sites used to
> index fixed-size arrays, followed by manual review. Verified at runtime
> on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
> CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
> malicious DT overlay, the unmodified in-tree driver performs the store.
> reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
> write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
> with a later NULL oops. With this patch all three are skipped. The PoC
> and full logs are posted in the thread. Not tested on real hardware,
> QEMU virt (cortex-a57) and compile testing only.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> ---
> v2 -> v3:
> - Fix the diff paths (a/a/ -> a/, b/b/ -> b/) so the patch applies
>   (Daniel Machon).
> - Restore the in-body From: line so the author matches the Signed-off-by
>   (checkpatch author/Signed-off-by mismatch).
> - Clarify that lan966x fails probe instead of skipping (Daniel Machon).
> 
> v1 -> v2:
> - Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
>   so that lan969x (30 ports), which goes through the same probe, is
>   bounded correctly as well (Daniel Machon).
> - Document how the issue was found, the runtime verification and the
>   test setup, as requested by the patch bot.
> 
>  drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 08a398adf..164706745 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>  			dev_err(sparx5->dev, "port reg property error\n");
>  			continue;
>  		}
> +		if (portno >= sparx5->data->consts->n_ports) {
> +			dev_err(sparx5->dev, "port %u: reg out of range\n",
> +				portno);
> +			continue;
> +		}
>  		config = &configs[idx];
>  		conf = &config->conf;
>  		conf->speed = SPEED_UNKNOWN;
>

The patch looks good to me.

However, the AI review flags a pre-existing issue, about two port nodes with the
same 'reg' leak the first port's phylink. To me, that strengthens the argument
that the device tree is considered trusted, as we would otherwise have to
validate every DT property in the driver.

That said, this patch fixes an out-of-bounds write, and other drivers do the
same check (lan966x in lan966x_probe_port(), and ocelot in ocelot_vsc7514.c,
which also skips the port). So it might still be worth having.

I am unsure here, so I'll leave it to the maintainers to decide.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

