Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CF606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hk0cbpeu;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=R2tNfgZr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zzM63kKTZFMMJk4aOY2Aqbh7hEVBemm6VnTiR8uQUuQ=; b=hk0cbpeuxcL7MH2cUDEZBKx/cG
	VX1EYCmDZiNqy/TR0pObjguYWLZf9YrqIZwvvJnA67K7UNKdtv/wPKRO3LF5nc17GfqUIXJ81x6Sh
	llrBI1CVhOy0wqLmH6XcgYxX48BgwKZdgGQzJVMqPClLt463PULo4Cevi6zFiyqd/mwrjiByn/M6B
	dAkfPj04kNCb+4SqvfEmvBadhDO976qNA+KD/B2Wx4HAZ+AFHx/IwgqkRJAyyF99Nzkpnx3GGsOqN
	66Btib3sp9yOSwFtJ4SRtly2u9yeUE7MxxroaY0EahFnpCEAY0IHuiBCr5NH1SYnFHsa/J38k/huE
	MaogfE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiTu-00000000cCQ-0I2E;
	Sun, 15 Nov 2026 22:13:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiTq-00000000cAM-0oLo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 22:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794780825; x=1826316825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9kE/8IZDOYjIPSl0tUGVCuxcw2o8Mkmx63fH+MtyhR0=;
  b=R2tNfgZrr/ZTRN/A6vvL/nsRV61rPDca2HrbGnrqA1F48YRLurhbdttG
   EMhgtkW372YOaeY5PuGf7AQC45LWzwrOOKgYi97fI9AtTtRmOkC1b1VFr
   9z30wP31IfF/i5k1Ystm4nCrUScL/PoRfLM0B83jIUOhvaG7pK0NLZAz5
   YL7YZMtm0zaQixKI856RBNPMyM6WqMEb3kwXfK12ZVFR/gabdamkMiu9e
   SM3wVfOuKNKNbWPDUQEkO0HQlE84l/dJqkGp0BfNWMAADbwaWM+nFfbiT
   ueXkwNrI4ckWPE90b5wRJwczshfivXCdT+XuGJE45vPqkaGNorVgKUk8e
   w==;
X-CSE-ConnectionGUID: G9ThvyHeR+KS0n9uyVvf+g==
X-CSE-MsgGUID: dORnRI7RSbi+EQlfATRCnQ==
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="65572559"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Nov 2026 15:13:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 15 Nov 2026 15:13:44 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sun, 15 Nov 2026 15:13:42 -0700
Date: Sun, 15 Nov 2026 23:13:42 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Haoran Wang <haoranwangsec@gmail.com>
CC: <Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: sparx5: check DT port reg against array
 size
Message-ID: <20261115221342.nlrfhxlg4ovyaq7i@DEN-DL-M70577>
References: <179457014579.23820.10657909253312598784@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <179457014579.23820.10657909253312598784@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_141346_485405_04F11FC8 
X-CRM114-Status: GOOD (  21.99  )
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

Hi,

> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> Date: Fri, 13 Nov 2026 19:42:25 +0800
> Subject: [PATCH net-next] net: sparx5: check DT port reg against array size
> 
> mchp_sparx5_probe() reads the 'reg' property of each ethernet-port DT
> node into portno and passes it to sparx5_create_port(), which uses it
> to index the fixed-size sparx5->ports[SPX5_PORTS] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so a device tree with an out-of-range
> 'reg' value (runtime overlay, corrupted or attacker-controlled DTB,
> kexec-supplied or bootloader-fixed-up DT) turns probe into an
> out-of-bounds write, potentially far outside the allocation.

I seem to remember that these type of checks have been rejected with "device
tree is considered trusted". Though, we do the same check in lan966x, so I am
not entirely sure.

> 
> Add a range check while parsing and skip nodes with an invalid port
> number.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> ---
>  drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 08a398adf121..6616e76bd0e3 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>  			dev_err(sparx5->dev, "port reg property error\n");
>  			continue;
>  		}
> +		if (portno >= SPX5_PORTS) {

This wont do.

SPX5_PORTS is the size of ports[], which matches the sparx5 port count.
lan969x goes through the same probe but has only 30 ports.

Instead do:

        if (portno >= sparx5->data->consts->n_ports)


> +			dev_err(sparx5->dev, "port %u: reg out of range\n",
> +				portno);
> +			continue;
> +		}
>  		config = &configs[idx];
>  		conf = &config->conf;
>  		conf->speed = SPEED_UNKNOWN;
> --
> 2.43.0

Since a v2 is needed anyway, please also add what the bot asked for to the
commit message, and properly populate To and CC with get_maintainers.pl

Thanks,
Daniel

pw-bot: cr

