Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104D60A2619
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2h49RyG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YlETi7LG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tfQEiEpyUG9H1Q6bEwLdcxfuZJ7yClGMga9Onbudq/Q=; b=i2h49RyGt928IJw1ONUbb6tHcu
	6Ab4sQmsoERdLdzS8bMnE04rX4KT57gQ7vxWmnVPr36yD+23DiiCpSjPfRN92Cv9cDiQm/XA+s+aw
	QWMU1U6JJW3MD6e5I9TQyxlbSzn5o8UwvFlP1oUEzV1MPEKzjMp+2LpKcl+7cXdIAGOrG+4K9TzNq
	/Rl43tCvh/Kk/jT/UF0qV7AXFCl4M13KI3JeRNAuemzVkvdSbXf1XlVpd6AofhuQlIvNa/ZlOA+d5
	GOpqfKfltMLlT/h+yU7mNq49rFsHIp6iastyHPbkX7eWCUPkl4SZM59ddLpk0mZ1b3MjBPuV+oq3s
	r2Tyao6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR57i-00000006H0F-4A6Y;
	Wed, 11 Nov 2026 10:00:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR57h-00000006Gzu-3d7x;
	Wed, 11 Nov 2026 10:00:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44EAD4566F;
	Wed, 11 Nov 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794391209;
	b=A768J8fS7FUtav5cOht9VtSxQAkbJI2MfmBaNHwU60FYgs44KZ+qALSPfvDwDdHb41OH
	 oj6MnPJxdaUUE0WJwFOl7wAf6r03Ao2TTviZeuP73mfHSJk7h6NOsSUp5r1KE8uTB1y2z
	 d78Zeo0YaPxn3hwbl7egdIC9oOx8q6apEpu+ro4KPR+xd9fb9ZWsCEihKQFGJY69skNcK
	 wPneVe+a0NjZ5i6wVkD7Vxar5oIInHLjWVDR84ZBUDQmWGXZ0f2iFi62hBZybqgb+Pxdx
	 kGcFrn6+cFcZ2S862jVs0XD2NonPHH7PpcCAox5QA7o6EmZJ+7tOS/rrkPi+Zm/3/tg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794391209;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tfQEiEpyUG9H1Q6bEwLdcxfuZJ7yClGMga9Onbudq/Q=;
	b=G9LTSAFYOTr0UPUQCkC3HX8WnMG6JNouo2Zww9dmLTX6OP0hDngbsy2S0M1sDs71JRjq
	 nBhlHFPg9Czg94Qkcz1CAl2FSoI9VTsWnUcEqH/DO/vYLl0jgk74e+EH5mj+gMZwiJouT
	 MB/KS8mQk5x+J/W6Xm39ce/jiS0MNUMgsOrh8nB+Q+UN3SFlCNUoA16bXSMUEz8H1stq/
	 VcEEy6KXa06c1ByXRscj+x6ZsASEAPuqd2vbIBCtJCvN0Qett1B9vTmEKk90wKCUU0430
	 2o0aBOmYCGZFUBlu9LHbXRolIr2m9MgzZ1i+6mqTtWxy8+vwNyoBI+wTccd7EwwBT4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AF841F00A05;
	Wed, 11 Nov 2026 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391209;
	bh=tfQEiEpyUG9H1Q6bEwLdcxfuZJ7yClGMga9Onbudq/Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=YlETi7LGoakdQd7iAKfwDNkvgSeEvm39zkaOXSazUbU120ty9lpisxqzHy7QIbWrs
	 t3hXJaFg6CjsR+gMBEE59TKUAcbKln2wCrMttBmJSf4SrNWgPzP0VynhTbVVDuS9vh
	 xY/9UicLYF9Ab0ZVb02Kq5Y2/MgKIk9Dlfet/WkFp6KAydFwCZQaspeqkDFj5zZEGw
	 zGY7I9NmhCqegYcvYZur0EB8MIP9w0yOBE+kioE6ocQnmnLIhV4HvGilNo3iSAW+Bp
	 PLMTl9hnU1OB1+yvP21x6h8Mqw7ZerEs7KOwuu+22ivc79Xo6lOGMkhL4CT6EyVI4a
	 B4/446bKbDYnw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C5CD548F21;
	Wed, 11 Nov 2026 10:00:07 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Subject: [PATCH net-next v2 0/2] net: stmmac: Add RK3572 support
Date: Wed, 11 Nov 2026 17:56:27 +0800
Message-Id: <20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMs79GoC/21OSw6CMBS8Cnlrn2kLFeLKexgWpX1INVJpK8EQ7
 m6pW2c3me8KgbylAOdiBU+zDdaNiYhDAXpQ443QmsRBMHHiCaiMwc4pb9A9SlkL1DhSxMpUsml
 qLWvZQwq/PPV2ycVX2A0jLRHanxLe3Z103Ht372BDdP6TP8w8J/IcE+Lf3MyRIetYbxqpSk50m
 aajdk9ot237AhfmFtvRAAAA
X-Change-ID: 20261111-add-board-ok3572-c-net-4d45887c575f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391206; l=3935;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=K69TUjKEVvwLt+A2dEQmzVRxyynd7Q6ASArcWjYZ8Ow=;
 b=iWMCDziMHq9PHDs9pkj3AGsiac09NXX9JxnXzzIDdd6jJFbdxLqH/t0+I9u25cqMGcFrOO3TR
 tXm+7pKJlSaB0dRB0j+gOdK8j+2sPX3HnuVXhu5UnDCkKDVnpnJ208y
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: 1579567540@qq.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is one of the subsystem submissions for RK3572 support.

This series adds the RK3572 GMAC bindings and support for both Ethernet
controllers in the Rockchip stmmac glue driver. It provides RGMII and
RMII mode and clock control, together with RGMII delay configuration.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module.

Passed functionality:

- SD and eMMC complete the firmware, kernel, and root filesystem
  boot chain.
- UART console works at 1500000 baud.
- SD read/write and data persistence checks pass.
- All eight CPUs start; CPU frequency scaling and hotplug checks pass.
- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.
- All three Type-A ports pass USB2 and USB3 enumeration, data transfers,
  and reconnect persistence checks.
- Type-C host and device modes pass in both plug orientations. Physical
  reconnects correctly select the expected device, host, and device roles
  in sequence.

Stability:

- Repeated cold and software reboots complete on SD and eMMC without data
  integrity failures.
- A combined CPU, memory, network, SD, and USB3 stress test completes
  without a crash, lockup, CPU offline event, or thermal shutdown.
- Ethernet error and drop counters do not increase during bidirectional
  network tests.

Build and checks:

- The kernel, modules, and board DTB build successfully.
- The series passes checkpatch with --strict.

Untested hardware and paths:

- NPU
- PCIe
- GPU, video output, and audio
- Other low-speed external interfaces

Some files in this series are derived from the Forlinx OK3572-C BSP
Alpha1. Thanks to Forlinx for their support.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v2:
- Split the original RK3572 support series by subsystem.
- Add rockchip,rk3572-gmac to the shared Synopsys compatible list in
  snps,dwmac.yaml.
- Link to v1:
  https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com

---
Raw dmesg: see the v1 cover letter.

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: David Wu <david.wu@rock-chips.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

---
Cunhao Lu (2):
      dt-bindings: net: rockchip-dwmac: Add RK3572
      net: stmmac: dwmac-rk: Add RK3572 support

 .../devicetree/bindings/net/rockchip-dwmac.yaml    |  3 ++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 53 ++++++++++++++++++++++
 3 files changed, 57 insertions(+)
---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261111-add-board-ok3572-c-net-4d45887c575f

Best regards,
--  
Cunhao Lu <1579567540@qq.com>



