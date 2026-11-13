Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B13060A382D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1VomG4wO;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=nZIhhgZd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uhrSsfkZelttWvoilY1I6PmftUCwaXRwT6836hZLb58=; b=1VomG4wO9yP81V
	0vvTcPJ3FXxn5TpHouHnTQ2fOnefJClXlBCkIcf5RIo34SIEjdBttyEs7tdFQoyFUv+VR/+RbyE2N
	GHProEeNJd9CKuAO+sFpHQ67kVn+/4KV/m4CnqfOc6SK/e6ZA+4Jfjg0mtdaULHgrQaBMoLwijL9M
	SJjRxoR9B2l6s/GaEr34bGZMBnIpaERO8DMHI7xck3Uff/bdofgnA6Ky05pztOyouqw4R9AMe0H5T
	8mh8ftVPPxQzy93jnIwh9u2GCSxywv55ZFyZoUnhaho2jiC4+4XNOawr35a660DLMNHsNIXXcTHxb
	HXMayQJx8x/CTSW6IPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWj-0000000EXY6-1KnU;
	Fri, 13 Nov 2026 21:09:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyVM-0000000EWmW-1xDd;
	Fri, 13 Nov 2026 21:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uhrSsfkZelttWvoilY1I6PmftUCwaXRwT6836hZLb58=; b=nZIhhgZd1BDwsr7gqq3pDmzr0y
	OkzTVQekJSOoHOCTdGt4OLee0rBFy4DvWXg3zf6nCNeHeSkLrzG+Uy4byNbYhiJJY47gYiskWgJin
	m2mrxyZSozPZUuPIlxnw1ZyB+nDnxTbzWcemNXqEfEm7L4IMviMwC3HKt8xj5w4BiEbl9L56lFWsa
	V840/FGeax3D9SiJ8XCffTMPGsmme/9bpOs34LeWq3YAh8zd2uWs0inbPbcD6A40pLuR4OBOKciEp
	SVCVK8oaTQAA3avGP9amEEroInVrCxVx7OjlJdcgPsCkuWp3kCL2PEWfExo56keHFcv0e8JVbfYN0
	D5uQfp5g==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricardo Pardini <ricardo@pardini.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	luca.ceresoli@bootlin.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 0/6] describe RTL8125 PCIe NICs on Rockchip boards
Date: Fri, 13 Nov 2026 22:08:06 +0100
Message-ID: <179460406449.1165597.15463539316974362465.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
References: <20261109-rk3588-dts-rtl-eth-describe-dt-alias-v6-0-91f1efefba0b@pardini.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130818_564801_08A30EEB 
X-CRM114-Status: UNSURE (   8.29  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 09 Nov 2026 13:32:15 +0100, Ricardo Pardini wrote:
> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> NICs whose PCI function nodes are not described in the DT. Describing
> them allows for stable ethernetN aliases (matching the GMAC alias
> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> stay stable across boots and U-Boot and kernel MAC match.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6
      commit: 4eda11fb5710e3de4305d927ad7c9393e023108a
[2/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 family
      commit: cd745c39406cf013a468743426d4f367ab62b33b
[3/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on CM3588
      commit: 2184164a940ca2379995b43de0f6c9149cd65a20
[4/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R5S
      commit: ce3c2a83e2469a7a913fe2b0e0582de95894d7a0
[5/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R6C
      commit: 1d3e2e77edc323215df7a2c3b1aee0e3ff8da38e
[6/6] arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 ITX
      commit: 44020ac2d5ed7b5cce56bbfd29f0a697f70d04d6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

