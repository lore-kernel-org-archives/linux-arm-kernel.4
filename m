Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51B606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1auI1vfX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=WuCc8pdz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TsavWsjShJJGBgdbg3MCd30tYdrc0p8AQysSwTzBos8=; b=1auI1vfXVTK7opQM9S+KnLezq3
	AJx7819SSVv7ffYJF9IhFcF5C+vCtt66U3Bpi6NydmBnlKoNuaKSD7oEKMdtlVp8a84ja3UDf5rNE
	C+n6r5p4xbIpkQ6q1UBeD1/IvhueUGXAT17cwK3gpkUceyZZ0aPtwVm1RbnUzD0s0rtwNp1GLqRRq
	8rLihoFa4yGTgEKmBSdjrOhsujPS9fjhcgqfGvuwTmNdqpqJyylSCVwUeXehkk1tfmT3A/Qm4sN+e
	9QMzPirRUDKrXaK/htcS8cwN5VyCOLUk+zvNBLfCOe8sz/L+qG/cKrFT+yPZF/Jal/T3QFpIKOZPT
	ERDPy0+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR82Q-00000006mF5-213q;
	Wed, 11 Nov 2026 13:06:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR82O-00000006mEP-09zb;
	Wed, 11 Nov 2026 13:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TsavWsjShJJGBgdbg3MCd30tYdrc0p8AQysSwTzBos8=; b=WuCc8pdzkGjLD1lqWBww+P9lpe
	devYGnPLiUvLgvjOBXhkamuh6TbLj9i/vU5SQiNA/6iZMVgtNBDUQ4dN1puyzBWlwCWrbaNnZ5NeL
	XyDluwEU43rO/gt6EKbFAw8gV1UXaJTX0MnLHiemGEDoI0MVSwO05e4LLa9sp9Pvd06w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xR82J-00FkQI-On; Wed, 11 Nov 2026 14:06:47 +0100
Date: Wed, 11 Nov 2026 14:06:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: rockchip: use rgmii-id for the Orange
 Pi 5/5B ethernet PHY
Message-ID: <fdb7836a-67f9-4db0-8820-d72f56beca3f@lunn.ch>
References: <20261111-opi5-dts-v2-0-821f666418a6@gmail.com>
 <20261111-opi5-dts-v2-1-821f666418a6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-opi5-dts-v2-1-821f666418a6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_050652_081056_0B3096D2 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 07:19:49AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> The Orange Pi 5 and 5B have a Motorcomm YT8531C RGMII PHY on gmac1
> (the PHY driver binds as "YT8531 Gigabit Ethernet"). The board neither
> uses extra long clock traces for TX nor for RX, yet the device tree
> describes it as "rgmii-rxid", which according to ethernet-controller.yaml
> means that the PCB provides the TX delay, and then makes the MAC insert
> the TX delay with tx_delay = <0x42>. The setting was copied from the
> vendor kernel, which uses the MAC delay lines everywhere.
> 
> Describe the PCB correctly as "rgmii-id" and drop tx_delay, so that the
> MAC adds no delay and the PHY adds both: motorcomm.c programs its
> default 1950 ps for RX (as now) and for TX. This is the setup the
> binding recommends, and the one the same vendor's Orange Pi CM5
> (rk3588s-orangepi-cm5-base.dts), with a YT8531C on gmac1 of the same
> SoC, already uses in mainline.
> 
> Besides being the correct description, this removes the MAC from the
> timing path for both directions, so no board-specific delay-line value
> is needed any more.
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

