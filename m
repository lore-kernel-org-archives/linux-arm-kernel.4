Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DDF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9NkCIB2;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=I/mCq+r9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d+X14DANS5O3iOHEYShXxLr7GGZvSrigtM13ny3x+BM=; b=T9NkCIB2DhbeFl
	QgKaum//AjlsoN2KVn8TYkWC3nEVVKsyAc1EiH1Z7pOIMzy64XOCeK6CkkAED1M4wMk19tJ4I8CKo
	/YqIc6433+Pa3zQFLTFUQ/z0uLud/e1v1yIMTEYzQjmnWMaV+u8vB8S1Nb9Tn+lWvMnzJq/V8IPkk
	5+9LgtIVFrJ2Pi+IBnegkIengCCKcAt+8HyVZDzRzdt7Krro/O8FCp7EMX9K9XRF/FnQVIC1Ah6lF
	bvL9tQjWPeHVqZhex/12pCY4h0S0JagFKtYZAb8xKKr5bL7bFiT0HAbSG32QS+S/QZmPnm3gt92LF
	h4aW+SpSm3Y4/xCPOmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJVI-0000000BGVi-2sX5;
	Wed, 25 Nov 2026 20:22:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJUa-0000000BGE8-3naL;
	Wed, 25 Nov 2026 20:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=d+X14DANS5O3iOHEYShXxLr7GGZvSrigtM13ny3x+BM=; b=I/mCq+r9+IP4jEUb5srWtPXLUR
	Q9eUARsmjm6g2+CWrR4LzXL/cuWDw+cMdaFUspq4xmBnQtxROU/EkS56FRkzJTDijZHCRkifgMGCk
	M1jZSGgaJLSGCuXerVs7Dk+vS/Gk1k0mSzJxX37Wtbdbd+vUqhMIx0e82ED3DB2SusxtRZ6qTsY5B
	oGNZqwwyBz5Uk/ZU+lDmHK2t9tpinEV8G8FHYX6JqPypnFOftFsG31679JIAYuctlo4nMflug4bA7
	WooYS6uDmQ2XcTmbFziaYnBTEGTW0Lo7g2eP1riNa9Cj3UlRu5BeRc/c1yjCp8sAVNHsOXdMne/70
	BnbChMFw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MidG971 <midgy971@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
Date: Wed, 25 Nov 2026 21:21:03 +0100
Message-ID: <179563805248.3885553.17653076293063984623.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120123250.1417061-1-midgy971@gmail.com>
References: <20261120123250.1417061-1-midgy971@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_122127_286588_773E5006 
X-CRM114-Status: UNSURE (   8.71  )
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


On Fri, 20 Nov 2026 13:32:50 +0100, MidG971 wrote:
> The ROCK 3B RJ45 jack carries two LEDs wired to the RTL8211F PHY LED
> pins.  Describe them in the PHY nodes' "leds" subnode (binding:
> Documentation/devicetree/bindings/net/ethernet-phy.yaml) so that
> PHYLIB_LEDS instantiates one LED classdev per pin; the RTL8211F
> driver drives them in hardware via led_hw_control_set (e.g. the
> netdev trigger with link / rx+tx modes: amber = link, green =
> activity).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3568-rock-3b: describe the Ethernet PHY LEDs
      commit: 5c83555aba2bd0835228b2205a00ddcdcb3ec1ed

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

