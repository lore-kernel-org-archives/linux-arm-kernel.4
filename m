Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296BE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hhR6ppAF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ooMIwlxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cjblWQP22DDkX8PQwyqUXo6ncqKIwHv586PCd1qQti4=; b=hhR6ppAFiT5p0ZHTM6ChPTzzCq
	1r1/K5evGQWNGZxfCeG8QSJKpfaR5hM0FPrJcqp4t/QKta2BFXkCtaEREo2coKK0H15grP4yj+vjn
	3qgLt5VfWMZOCC0/ejCQ8uPqM2ni2ugIWfwwwkpBJ2Pk4FSCqgabFRoOUluBmSb89K7uQQWxDdVdi
	Z5dT896BYFo8A3QsG+C6fIGFeDNpBpUhD5rbzmoeel55khYxo6SMyREoZaUlmlJMm2o2h7Egt5SvF
	Z4MFJbyzMP5deFiHg+5Bwav0lmbQ132HsN8XlrdWXHrmyzlUd08VLO366iyRYpdl4YgXpe1vSFCas
	XKoAtBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVer-00000003uMv-3aXt;
	Mon, 23 Nov 2026 15:08:41 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVep-00000003uLh-2wND
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cjblWQP22DDkX8PQwyqUXo6ncqKIwHv586PCd1qQti4=; b=ooMIwlxgNI33rP63+Ad3nDuhiS
	S+S+xP7FY8nMS6Hcz9h2CIDRnqiLbNwX+E1kpoG6nRApr1vLNGYfAgvNTmmXiyiBQSkdZ9mPQE3gU
	/962kEe+CI852MVoo3PV30dPW/u97302eFEgw85NsSKZGlxkjNLOhmzpe/xv6xk6x6IU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVeZ-000obW-B9; Mon, 23 Nov 2026 16:08:23 +0100
Date: Mon, 23 Nov 2026 16:08:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] net: stmmac: Add glue layer for Synaptics SL2610 SoC
Message-ID: <c86cfa4a-5738-4b8d-bed5-4dd075f7cbf8@lunn.ch>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-5-jszhang@kernel.org>
 <4f1c4180-3a00-4b17-a27b-e61b307d3e5f@bootlin.com>
 <awQ5raWYlMBpCqIl@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awQ5raWYlMBpCqIl@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_070839_737506_4EE6D6D4 
X-CRM114-Status: UNSURE (   9.11  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > > +#define CTL_PHY_INTF_SEL	GENMASK(4, 1)
> > > +#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
> > > +#define CTL_PHY_INTF_RMII	FIELD_PREP(CTL_PHY_INTF_SEL, 4)
> > 
> > Please use PHY_INTF_SEL_RGMII and PHY_INTF_SEL_RMII from "common.h"
> 
> I read this as "use SYNA_PHY_INTF_SEL_RGMII and SYNA_PHY_INTF_SEL_RMII",
> correct me if there's misunderstanding.

https://elixir.bootlin.com/linux/v7.3.1/source/drivers/net/ethernet/stmicro/stmmac/common.h#L316

#define PHY_INTF_SEL_RGMII	1
#define PHY_INTF_SEL_SGMII	2
#define PHY_INTF_SEL_TBI	3
#define PHY_INTF_SEL_RMII	4

Which is easier to understand?

#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
or
#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, PHY_INTF_SEL_RGMII)

You should try to avoid magic numbers.

	Andrew

