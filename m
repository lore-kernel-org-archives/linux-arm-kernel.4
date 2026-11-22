Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F26606A68B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eeGBlFPU;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=PEMGhAAE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zhzorV+YhbTY7mbA8l/NasCEWm6joOpMt0hDwmNwiIU=; b=eeGBlFPU20SM8P
	eUSXZkqfQ2pyyC7bvfLTR3x8S6vtLMpH+pjd/toYXM7kTOkFOrTaEICwmR9fLku3M1qj3n/ET8Ub/
	saFCKxjAkal0p1i8WpeDSDvLtkcc/2doPmcIH78tkN2YJz5EjSE0wDOuF8zjFGBIWTTfTPKaDJ1uG
	qohkAGNGr6IU03ekARIqEUFCAevWhaCKP3GJfz72oD0qw3q7yKqrPL2IZ+HiN5f6QgQFkkx5gwft0
	YlyryZy2EYVDiWAHibA1m5ELybsv8nrXSrwMjrk8TUhxSLM/T93GnNqnLiMSaVkKUGIUVKkxfEmD9
	KtPubWEAP/FSZBmlhoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOU-00000001rMB-1sYZ;
	Sun, 22 Nov 2026 22:50:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOS-00000001rK8-01eS;
	Sun, 22 Nov 2026 22:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=zhzorV+YhbTY7mbA8l/NasCEWm6joOpMt0hDwmNwiIU=; b=PEMGhAAEnrqiDG7aDCHdsaHreN
	yWnV1ubdWaW6VBvulUkRs8Q3qdFBNFR0grlKGhDhLM+0rD1EUHiHsgmzh2rRqo1aXXnTIfg4MdAxE
	0y1XROFkU28RdYgfk2UkJHFOMzYtvxPGqfdt5UqvmIF/PxfAywLxLdMATSDVSsCdikqqDiUXZO8ZK
	JnTgupENfhZOIn2kjx0h1WzvQYH2RXp3vhmWbEX32gH5E6gaUoYLJ39ukysuw8nrbP36Nv3KsgR0g
	+sx7IINryri5V2B4168RZ5v1dapJ86yCxa9cLzLJOLoNPvJJiEOSpVElHevhJISj+tQZmpYnHDXfP
	Vevm9Hlw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Pufan Jin <cyan2254650260@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: add USB-C PD and DP altmode to LubanCat 4
Date: Sun, 22 Nov 2026 23:50:22 +0100
Message-ID: <179538782473.3150822.5472875370609070388.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110193028.512456-1-cyan2254650260@gmail.com>
References: <20261110193028.512456-1-cyan2254650260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145044_043804_37EBAC32 
X-CRM114-Status: GOOD (  10.59  )
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


On Wed, 11 Nov 2026 03:30:26 +0800, Pufan Jin wrote:
> This series enables the front-panel USB Type-C port on the EmbedFire
> LubanCat 4 single-board computer, covering USB Power Delivery, dual-role
> data/power, and DisplayPort alternate mode.
> 
> The port is backed by a Fairchild FUSB302 controller on I2C1 (0x22),
> a fixed 5V VBUS regulator enabled by GPIO1_C1 (limited to 2A by an
> LPW5209 switch), the RK3588 combo PHY usbdp_phy0, and two DC switches
> on GPIO4_B3/B4 for the SBU1/SBU2 lines.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: add USB-C PD support to LubanCat 4
      commit: 42c1e1db2ac799921819851237f22055c0af15ff
[2/2] arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4
      commit: dbc094626a087d379ea6ab2bf6c730965a87fb80

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

