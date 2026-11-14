Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF044606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yF/W8ZAl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftop1jhn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4eKOGVbqcbO2J+lZ/HT16uw5nka7xe8u+7fHYo1uQRQ=; b=yF/W8ZAlmPI9JRKDQMxsuQ/uAG
	qMYTU6QjZTn/8lmjvZaosTGB/V8glPwWbhVMYxSJbLVvG8sRLxBuCncRM1qbuNJlseoW+V3QY/1sc
	Xa6zZD0+ZVJZPrHIaVio7Sj0scVfHHFmxiJvGamPkp3K+00AN2ruwdxVWp/oWqO1qnd7VJjpYp4oz
	elmc8K9w7kofs/fv7b+Ddx+MKnPCtlEzMre7k1l9vTXmM7XSzaO0KrG+dMS2ukGhv+hZHU47MYgs9
	15bVt5ixfvq7o1ZNl6ZvKf3J0KFiVmZq2oIqrOsjWQr3bYStclEuiYZ9w/jrNFbdg9MLoLEd/a70j
	92Gfb7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBtE-0000000Ft5U-0UBx;
	Sat, 14 Nov 2026 11:25:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBt6-0000000Ft2x-1dWV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 11:25:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF9F360230;
	Sat, 14 Nov 2026 11:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D71A1F000C4;
	Sat, 14 Nov 2026 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794655539;
	bh=4eKOGVbqcbO2J+lZ/HT16uw5nka7xe8u+7fHYo1uQRQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ftop1jhnfpGxoXOk5SafmD7l5cno+NOfBuh2yQnjhuUFaLB7KH0iYmilpAkHVnRyj
	 i5zW+d9+caDvJ7dRwAmcsbwX3ajSem669v/yJlIjieGxsiM16tSkCh8FSodQ5A6cki
	 +VRVFP0jsLYyZK8kV81+PcHk5dd6a6PHNYlWXlFB5VMJom1fY0pNqaCzQtjmFN1tF3
	 JP1/dzoeGDd3MnviR7hmeFiMAs/EauKrCw90xAWoz1WY74g6H6z8O0jOJ7QXbiR2Jh
	 0CWfWovMbsmEsy86MKABMupkxti2yALrS49ZZ/l5ThcfYHi+Jl0JTN0dP7SooTTLdV
	 KjiuJ8bS5A3eg==
Subject: Re: [PATCH net-next v4 4/4] net: phy: dp83867: support setting
 output-impedance
From: netdev-bot+sashiko@kernel.org
To: s.trumtrar@pengutronix.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 michal.simek@amd.com, edumazet@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Sat, 14 Nov 2026 11:25:38 +0000
Message-ID: <179465553811.2199510.12732274072788992215@kernel.org>
In-Reply-To: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
References: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new 'ti,output-impedance-ohms' property turns an absolute
  ohm value into a fixed IO_IMPEDANCE_CTRL code with a straight line: 70…
- [Low] After this patch dp83867.c holds two conflicting descriptions of
  the same IO_IMPEDANCE_CTRL field.
- [Low] In dp83867_of_init_io_impedance(), the comment '/* If no nvmem
  cell, check for the boolean properties.

--

net: phy: dp83867: support setting output-impedance

This commit adds support for a ti,output-impedance-ohms devicetree
property to the dp83867 driver. A value in the range 35..70 ohms is mapped
linearly onto the 32 IO_IMPEDANCE_CTRL codes, and values outside that
range fail with -ERANGE.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index a3cd5cb11ea0a..ca668e75f0c99 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -553,12 +557,29 @@ static int dp83867_of_init_io_impedance(struct phy_device *phydev)
>  						"failed to get nvmem cell io_impedance_ctrl\n");
>  
>  		/* If no nvmem cell, check for the boolean properties. */
> -		if (of_property_read_bool(of_node, "ti,max-output-impedance"))
> +		if (of_property_read_bool(of_node, "ti,max-output-impedance")) {
>  			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX;
> -		else if (of_property_read_bool(of_node, "ti,min-output-impedance"))
> +		} else if (of_property_read_bool(of_node, "ti,min-output-impedance")) {
>  			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN;
> -		else
> +		} else if (of_property_read_u32(of_node, "ti,output-impedance-ohms", &val) == 0) {

[Severity: Low]
This isn't a bug, but the comment above still says "check for the boolean
properties". The block now also reads the u32 ti,output-impedance-ohms
property and can return -ERANGE. Could the comment be updated to match?

> +			if (val < DP83867_IO_IMPEDANCE_MIN_OHMS ||
> +			    val > DP83867_IO_IMPEDANCE_MAX_OHMS) {
> +				phydev_err(phydev, "'ti,output-impedance-ohms' contents out of range\n");
> +				return -ERANGE;
> +			}
> +			/*
> +			 * 0x00 = 70 ohms ... 0x1f = 35 ohms. The datasheet
> +			 * does not specify the settings in between, map the
> +			 * range linearly to the nearest one.
> +			 */

[Severity: Low]
With this mapping, 50 ohms becomes 0x12 and 0x0f is about 53 ohms. The
non-OF dp83867_of_init() in the same file still says something different:

	/* Per datasheet, IO impedance is default to 50-ohm, so we set the
	 * same here or else the default '0' means highest IO impedance
	 * which is wrong.
	 */
	dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN / 2;

So after this patch the driver has two descriptions of the same field. A
nominal 50 ohms programs a different code depending on whether
CONFIG_OF_MDIO is enabled.

The commit message mentions this mismatch, but both the comment and the
two values are left as they are. Should the two paths agree, or should one
of the comments say that its value is only approximate?

> +			dp83867->io_impedance =
> +				DIV_ROUND_CLOSEST((DP83867_IO_IMPEDANCE_MAX_OHMS - val) *
> +						  DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
> +						  DP83867_IO_IMPEDANCE_MAX_OHMS -
> +						  DP83867_IO_IMPEDANCE_MIN_OHMS);

[Severity: Medium]
Can a fixed linear formula give the requested impedance on a given chip?

Commit ab1e9de84aff ("dt-bindings: dp83867: add binding for
io_impedance_ctrl nvmem cell") says the IO_IMPEDANCE_CTRL reset value is
"factory calibrated to a value corresponding to approximately 50 ohms".
It also says:

  There is no fixed mapping from register values to values in the range
  35-70 ohms; it varies from chip to chip, and even that target range is
  approximate.

That is why a per-board nvmem cell was added then, rather than an ohms
property.

With this patch, ti,output-impedance-ohms = <50> computes 0x12 on every
part. dp83867_config_init() then writes that code over the factory-trimmed
value on each probe, resume and soft reset:

	/* If specified, set io impedance */
	if (dp83867->io_impedance >= 0)
		phy_modify_mmd(phydev, DP83867_DEVADDR, DP83867_IO_MUX_CFG,
			       DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
			       dp83867->io_impedance);

As a result, the RGMII output impedance can differ from the requested ohms
from one chip to the next, and no error is reported.

If the binding description for ti,output-impedance-ohms also documents
this linear mapping, the ohm semantics become DT ABI that the hardware
cannot guarantee.

Would a raw register code property work better here? Another option would
be to document the ohm value as approximate and keep the reset value as
the 50 ohm point.

> +		} else {
>  			dp83867->io_impedance = -1; /* leave at default */
> +		}
>  
>  		return 0;
>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1%40pengutronix.de

