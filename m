Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22166606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SrYrIsnp;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=KhwzlGAA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WDxhkF33TpclfX5h060G3+KBXmy0Dwtz0cCnAQsQB6c=; b=SrYrIsnpaNFy2q
	dELQ/hwwYX7P7f+ErwJ9svnIZjZuRCpFhBYPz6S0wPCQuFTj/UaZmve0YpYnC5bFT4ra9WNtY082G
	xIzMvJ4bwcYmiZdTilGM1ydq58Fdff9bHEOiLbfB5xTHC1yCEuJOxelPpx4tZt672E+vBLOwa9TvY
	DhlBDq5Oqs1g9+BLV7qERkAvYa4AJcWMneIeedT9jbXyPWgNv5eQq5e95aDsDNokFhi+fT94SwQJi
	J9VEXFhvB6hOWx+6GD5yI8tpyMKHATjEPTe4+7ZC2BzHg6AL1eMSsMkiMyORhu7LKl54yJrkFDS0P
	iT1dkYC5ql18tR9O2D1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGRy-00000001sN7-2UkJ;
	Sun, 22 Nov 2026 22:54:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOc-00000001rQT-0hev;
	Sun, 22 Nov 2026 22:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WDxhkF33TpclfX5h060G3+KBXmy0Dwtz0cCnAQsQB6c=; b=KhwzlGAAxWJcLMcTRnCExkVRgc
	njifOQ+uyKTCfhVBAeTjEAjUALzZR3ZUTU0Snq3xkM9OFaJXVTaCx4LrrK5oqreJfpxFRfKmrtPWr
	0wVpeV8DXCjByDy/25NfAsN5asixOvb3IaWqVE7wLDqUXhL9aKcmceoBRJ+mlhhG7/TMY1vke/mLp
	SgsnzAeF5cr1TEe+s5zQytZHpYTmXEFH5x/jcUYhtR0mx5tG+IkV9H+uV2IqEzejbz+qq+3MkTdDF
	lDTTacG2PdBiAYQsVVlwmIAIeEiAJA3LezixGQoYSvTom/O8FbL4wKM12stuXj0ocrx1C/JpPhUaQ
	Liteyshg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	YouMin Chen <cym@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	kernel@collabora.com,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH] clk: rockchip: rk3576: create proper platform device
Date: Sun, 22 Nov 2026 23:50:29 +0100
Message-ID: <179538782489.3150822.15047892656895127141.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com>
References: <20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145056_739745_165FCC0D 
X-CRM114-Status: GOOD (  11.87  )
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


On Thu, 12 Nov 2026 03:36:40 +0100, Sebastian Reichel wrote:
> When RK3576 clock controller support was upstreamed, it copied the
> vendor kernel's logic. That code makes no sense as it contains a
> bunch of unused code (clk_rk3576_probe is never called as the DT
> node is already initialized; if it would be called, the clock tree
> would be registered twice).
> 
> Let's switch the driver to use the same style as RK3588: Continue to
> initialize the clock tree early via rk3576_clk_init executed by
> CLK_OF_DECLARE_DRIVER before the device model is initialized, but
> don't mark the DT node as processed.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3576: create proper platform device
      commit: e8a4084724e114295aa3a077d9458726e7ef4e90

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

