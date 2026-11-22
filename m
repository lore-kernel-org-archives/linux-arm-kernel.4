Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5A606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=av1y1qaF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5bsoI5TT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KDBbuF5ql8/IVe5UKKYnyAQX4+XIz2LwiSFaHGaN3XY=; b=av1y1qaFyQo2ceVKxPFin+zg+E
	sBfbXchu8U0hvLs9zqiTgXFeGVrhao98EwMXxbngfT5h1yFlTeJaNMhNVAWwe7kCJT7n1Sw9Wa2lt
	QP+kDP95GufBYKHPPQ3zbcEUGAwLa2dZMO0mYHIOMHQTj2rZ0c089vA4FMPjWH+dStVpYIGBKlqD5
	xSFOJ9iefOgtLTh6PEhHDhGbAi085fPIK+kjxiNjG03UPYUXuGLCgx2Cql+LquBbL5hj/E86yPPSE
	gnPQFFs5XQOcAc8deTxiiW+sVZwauXmSzAv8OVQCN92YKeki2Ofq7jB5uprwg8XF0nU0mf9iePQjT
	34Rb1RiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9aZ-00000001HGm-3Xjm;
	Sun, 22 Nov 2026 15:34:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9aW-00000001HGJ-46F9;
	Sun, 22 Nov 2026 15:34:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KDBbuF5ql8/IVe5UKKYnyAQX4+XIz2LwiSFaHGaN3XY=; b=5bsoI5TTnSlGRfAQrt5wg0M5wh
	Aikl7hDAxg6CJoCVgzRLZi72pNs2Ud7GDcc58pccxgWaQso04K+K+hC+FBFjq/IkkVT7poV5aYGBT
	GvEGratV5V9mGmw7808uMHBMIEkprb+Xp0gZjlSBxJSbDVk19C9v0duMdLoV0IamY788=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xV9aM-000aTg-8q; Sun, 22 Nov 2026 16:34:34 +0100
Date: Sun, 22 Nov 2026 16:34:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] ARM: dts: rockchip: Add Luckfox Lyra and Lyra
 Plus boards
Message-ID: <99694488-727e-4004-8f80-f48871862cb7@lunn.ch>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-5-jonas@kwiboo.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122060114.773624-5-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_073445_018190_EAFBC856 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +&gmac1 {
> +	assigned-clocks = <&cru CLK_MAC1>;
> +	assigned-clock-rates = <50000000>;
> +	phy-handle = <&rmii_phy1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&eth_rmii1_miim>, <&eth_rmii1_tx_bus2>,
> +		    <&eth_rmii1_rx_bus2>, <&eth_rmii1_clk>;
> +	clock_in_out = "output";
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	rmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};

It is unusual to not have a phy-mode property.

What is the MAC capable of? Can it do RGMII? Does it default to rmii?

It is not required, but it would be nice to have a phy-mode.

   Andrew

