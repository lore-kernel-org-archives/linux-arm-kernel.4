Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8063A606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Vjc0Gsw;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Mi3v09Is;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=W6aayl0y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4j/XQhOlH2ab0JMIuNjO9RvRaPgAJ0A16BCloj2ZjhA=; b=0Vjc0GswUwPlb5qs9GMgI64jQ5
	MQX06ClyUYXHQREPaRAU6sxsgZ7bU78uOSdBTCyh8cmS+jk8nqMhdde5MRO+Ete2eczeN4vI2bdy3
	IQPdbOif2bwzpTgDP1tSiyiJ2Uawb5hcY+gKIgYLh7nHs8jli7YX7WN6momIUD5NmDnQOWFdWwNEQ
	Ejxr9l8+DtEQp9OLNqTsTL5XhajOu2VNsEp4I3Oxs9p6BgLQdo/YnboyHjgr23eS7DoFdzZVooi7t
	wqPzZHrEGHc+LCQiTLePJBGjP4zhC0Qfbpoy+OCvVRUS9ugS98FiiyS8KhDzE79K63rEmABFcGlXu
	RsYZN96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKnB-0000000BOIn-3Hw8;
	Wed, 25 Nov 2026 21:44:41 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKn5-0000000BOGA-3mn2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795643071; bh=4j/XQhOlH2ab0JMIuNjO9RvRaPgAJ0A16BCloj2ZjhA=;
 b=Mi3v09IsNtNnS3bkhI+MnzQwl7vRmLCG0cnOwdykyIJM9yQa8VGFByhQ5grjx8uaMn9++VWrR
 Nq5V0GfFra1Yg/3nQHh0wEekjsAueakCxPPX5duF3LeNQ+BrtnuytINvfQEqxURvLnLeai/OK02
 1macQXDI4gmtMLEqlvqpWVbgH1s27XfZ1EaeFPw2NR4yZdrQCcYAL8epo7zszL9NzJiTM4UT9wI
 ytghFu0EthkqOZnFnpCP9OgqDJTMCE/eDO/blcQhaap9ZPcv13OAtorP7imwFiDZgtdAsTxKbC8
 HGPYBp1P9vKZtmX3PA33dcETc+fygUOCIDXqHbBBCFSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795643071; bh=4j/XQhOlH2ab0JMIuNjO9RvRaPgAJ0A16BCloj2ZjhA=;
 b=W6aayl0yB2MXslwLxlVCfBcFJIIs9qHPCH3kRzkJG2aLyFXrfb+QkUlCkoqwXEvhbQv1Mg2B7
 +K6ri2XhfeGfvaxyvq2+pQT1YnSRae+f7YMaGZ1JbmZc+WysIrrOXnvp882vYxK3R8OiAhvo2oe
 46YhbzU9u5AH+4ABHW2ALss=
CFBL-Feedback-ID: 6b0756bdf930f38bf754f931:8054e09cb6735f7376d55581c80b2ed5
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756bdf930f38bf754f931
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.39
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
Subject: [PATCH v3 0/6] ARM: dts: rockchip: Add Luckfox Lyra boards
Date: Wed, 25 Nov 2026 21:44:12 +0000
Message-ID: <20261125214421.1580359-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_134436_229094_779F034F 
X-CRM114-Status: GOOD (  15.02  )
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
RK3506B variant.

The RK3506G2 SoC variant has 128 MiB integrated DDR3 memory and the
RK3506B SoC variant supports external DDR2/DDR3 memory.

The pinctrl driver for RK3506 will not work as-is using the SoC DT from
this series. The already merged driver depends on a rockchip,ioc1 phandle
prop that never was described in dt-bindings. The SoC DT in this series
instead uses rockchip,grf in GPIO controller node to reference correct IOC
for GPIO0 and GPIO1. A patch to fix the pinctrl driver can be found at [2].

The branch at [3] also contains follow-up patches that e.g. fixes pinctrl
driver and adds USB support.

Mainline U-Boot support can be tested using a branch at [4], it contains
board support using same devicetree files extended with USB support.

Changes in v3:
- Squash board compatible patches
- Add spi_nand label to flash@0 node
- Drop unnecessary /omit-if-no-ref/ on led1
- Collect a-b and r-b tags
Link to v2: https://patch.msgid.link/20261122060114.773624-1-jonas@kwiboo.se/

Changes in v2:
- Add default pinctrl to fspi node
- Add display_subsystem, vop, dsi and dsi_dphy nodes
- Add osc_clk_out and ref_clk0_out to pinctrl
Link to v1: https://patch.msgid.link/20261119152055.556266-1-jonas@kwiboo.se/

[1] https://wiki.luckfox.com/Luckfox-Lyra
[2] https://patch.msgid.link/20261120201540.672016-1-jonas@kwiboo.se/
[3] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
[4] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (6):
  dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
  ARM: dts: rockchip: Add support for RK3506
  dt-bindings: arm: rockchip: Add Luckfox Lyra boards
  ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
  ARM: dts: rockchip: Add Luckfox Lyra Ultra board
  ARM: dts: rockchip: Add Luckfox Lyra Zero W board

 .../devicetree/bindings/arm/rockchip.yaml     |   9 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
 arch/arm/boot/dts/rockchip/Makefile           |   6 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 123 ++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 594 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 614 ++++++++++++++++++
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    |  99 +++
 11 files changed, 1544 insertions(+), 1 deletion(-)
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


