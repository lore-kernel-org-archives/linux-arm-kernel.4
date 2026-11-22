Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7BE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 06:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IznsN898;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=cUDnae7y;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=a/NrGWp1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=; b=IznsN898gHopPqmHCBAr3lqMX0
	jXxBsW4I+9dY1Zar20F/HwPoFGRjMa91zF56ASckhkLVqAWgQSFQaJzn6MYuI/G0ath1OHkW3y+tx
	NSxlr1PE2MFbBVDBx8AwQyv8aVauO9nAs0UA5CyvvbbtJ6px3RuRt2jVzexz6GekId5E7YSlUdCoL
	cxk3JdUs9PuDGLPwVod01rcyiTT5gz3rA1/Z+mQ+Z3YLk76Sciuuumm5RdrUxk/lBbHoaJaAu/Q/2
	raBlYIJbTOs7bHsnUy0agadxhUAdRhg0fVell0gVmGKXimBspgq67iwsRaDdqAKtuw9cT5UeNCTLd
	qsfZQtWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0ef-00000000m0H-2j4C;
	Sun, 22 Nov 2026 06:02:25 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV0dp-00000000lHW-2EFD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 06:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795327293; bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
 b=cUDnae7yA1M6I2hroE6s2wSpQ6BFd3NqVOhaCCNbNQvE/K2U/PBR/qRjidXv6zfqeCEeUdCGc
 cwDpPLTQDn1z2/4qRNmkRh6+ovXlcHJB1vTAvQsEXDaKeyI008qOTYfpfdWIqcbYyNu3UVUm47R
 O5+hzGa6Q+HZcKnK65k9tlbENMKhJnzVYt9hCPoo1Ja1eKKT6MFXwmOyZBrOaUJfLhzv0DktuJW
 osMQI/mAzh2jM7NiqdIMNWwJ2Gs6VpkrO+l+FxuLtw6nBAvLNpzGvUZ9S5R+kIaRv5tADAlHBAM
 nSFcCcFtSrJI9Xc/p6MdKgzTPRtrOoKy1TyqAEidopkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795327293; bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
 b=a/NrGWp1k+xPMd27VtL7ljA1cwEn62tdUxdPA8doZsSJoMHC1CbFnVI3oxJWCRqGlZyQfQl6b
 sNw/jL34PS+n7BPPG4iyT4YcBuZYOpL2VKV+iuysb722WTYOADe4KnSh20Xn3ttNJwmllZH2A4l
 UWHT3rVXFuCHDu77nMpTgt8=
CFBL-Feedback-ID: 6b02852fcff95ecda8c09329:42337bd3833695854f7a2e6fc72dcce6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02852fcff95ecda8c09329
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
Date: Sun, 22 Nov 2026 06:01:03 +0000
Message-ID: <20261122060114.773624-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_220133_568497_05A331DB 
X-CRM114-Status: GOOD (  13.80  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial devicetree for Rockchip RK3506 SoC and initial
support for Luckfox Lyra board family [1].

The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
RK3506B varaiant.

All board compatibles use rockchip,rk3506 in this revision of the series,
maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?

The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
series. The already merged driver depends on a rockchip,ioc1 phandle prop
that never was described in dt-bindings. The SoC DT in this series instead
uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
and GPIO1. A patch to fix the pinctrl driver can be found at [2].

The branch at [3] also contains follow-up patches that e.g. fixes pinctrl
driver and adds USB support.

Mainline U-Boot support can be tested using a branch at [4], it contains
board support using same devicetree files extended with USB support.

Changes in v2:
- Add default pinctrl to fspi node
- Add display_subsystem, vop, dsi and dsi_dphy nodes
- Add osc_clk_out and ref_clk0_out to pinctrl
Link to v1: https://patch.msgid.link/20261119152055.556266-1-jonas@kwiboo.se/

[1] https://wiki.luckfox.com/Luckfox-Lyra
[2] https://patch.msgid.link/20261120201540.672016-1-jonas@kwiboo.se/
[3] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
[4] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (8):
  dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
  ARM: dts: rockchip: Add support for RK3506
  dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
  ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
  dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
  ARM: dts: rockchip: Add Luckfox Lyra Ultra board
  dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
  ARM: dts: rockchip: Add Luckfox Lyra Zero W board

 .../devicetree/bindings/arm/rockchip.yaml     |   9 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
 arch/arm/boot/dts/rockchip/Makefile           |   6 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 594 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 614 ++++++++++++++++++
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
 11 files changed, 1546 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
---
Based-on: <20261121155810.706866-1-jonas@kwiboo.se>

-- 
2.56.1


