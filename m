Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D71606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EU3acpAy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Vq+E7Xsk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zno5lGS0axCV2J7th/KKxA7LyCzjnlPiDTG2Ak1Q8bE=; b=EU3acpAy8Nv2/08z69mCtSBuIK
	lKugoumJGdx3TCFP6eSSzEZlV/boqktax8jqNB4Rh3yYf421jRckB/Rtxhar4MDchgLRQlzF+Ozwk
	r8eH+hRctVl7A7kpcVeoq4QN4kLuQdjmL6KmEAiPKMc5iqoOauxM/s8oQ5ynlAM0YFdpJCyX69vD6
	yLCrK4BoNql0SW8CHs+W/m0HVt8QljJx28N5xT3ofvxsoqiV7QMBfd7iJ9QxWay5bg1KO+EP+ktSg
	Kc2Fh+QpJCIn+ZIA6LRBk2OMOeF+I15CxSTw3IaQiqVHeiwlWAE+eCtSXWJbu82zO1Ml11db0st+T
	fXK7LHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz6L-000000038n9-3RSa;
	Mon, 16 Nov 2026 15:58:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSz6J-000000038mf-0Zlq;
	Mon, 16 Nov 2026 15:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zno5lGS0axCV2J7th/KKxA7LyCzjnlPiDTG2Ak1Q8bE=; b=Vq+E7XskQVTJi7Fjb9VsfEP7L2
	ui7ElJUX6yhXo6pAgC/vgt3OJFYJJ1Usi4r0ta9yTSblNO2OlyoT0lqdg3RxrYh08HbkqLmMSZWjg
	HEYgnwyZ4YtBeUr+HyOY4dDSPE/zmc/Y3S3sTj0aJFUudQwEFNuaXLAevYSQ4JvhFY2w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSz5w-00GxGL-44; Mon, 16 Nov 2026 16:58:12 +0100
Date: Mon, 16 Nov 2026 16:58:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cunhao Lu <1579567540@qq.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev <netdev@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH net-next v3 2/2] net: stmmac: dwmac-rk: Add RK3572 support
Message-ID: <ec29187b-e23b-484b-b642-b1d504627c28@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-2-a957fdcd9c7a@qq.com>
 <f8d4b637-1818-419c-ac51-fb2ded1f9b3e@lunn.ch>
 <tencent_273206094323A701D688217E3A4D72341C08@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_273206094323A701D688217E3A4D72341C08@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_075835_177839_499EFBF0 
X-CRM114-Status: GOOD (  19.06  )
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

On Mon, Nov 16, 2026 at 11:11:42PM +0800, Cunhao Lu wrote:
> Hi,
> 
> > [...]
> > > + .regs_valid = true,
> > > + .regs = { 0x29d20000, 0x2a040000, 0 },
> > > +};
> >
> > Just looking at this, it is not obvious that rx_delay and tx_delay are
> > actually not used.
> 
> My board currently uses rgmii-id, where both MAC TX and RX delays
> are disabled. I kept the delay handling to support rgmii-rxid,
> rgmii-txid and rgmii, using the default values for the MAC delays
> enabled in those modes. The legacy tx_delay and rx_delay properties
> are now disallowed for RK3572 in the binding.
> 
> I currently have only one oscilloscope, with a maximum bandwidth of
> 200 MHz. With this equipment, I cannot accurately determine how the
> TX and RX delay register values translate to picoseconds, so I am
> not planning to add support for tx-internal-delay-ps and
> rx-internal-delay-ps in this series for now.
> 
> Would it be acceptable to support only rgmii-id for RGMII in the next
> version, and reject rgmii, rgmii-rxid and rgmii-txid? This would let me
> stop using tx_delay and rx_delay in the RK3572 driver path as well.

No, rgmii, rgmii-rxid and rgmii-txid are valid, it depends on the PCB
design.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

What i would prefer is that the C code does not parse the rx_delay and
tx_delay properties. If somebody actually needs them, they need to
implement tx-internal-delay-ps and rx-internal-delay-ps. Since you
don't need them, you don't need to implement them.

      Andrew

