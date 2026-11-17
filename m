Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83959606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBnI6GsG;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpiJ6KnJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WbZ2j7KK+/J5WiFdQr9VEro+GebKdoeQF28eK62xn70=; b=wBnI6GsGI0lpeimaFynsI/qZkz
	8wqIS49ZBEpLEsDD9GGUVsjAKsjabFICuVql6AjoFa0v+Ww//sfi3/blv8YrJ9K+h9GgVy+odFxKT
	RVnCoHTerkarIf2u5SUSAd39E46M1Xznsit8ik8iA10frdPcnWT7EZUZ+h58WOT1dMvgwyPRDUy94
	bV3wEguqlGiRf76Yj2DBxUvsXchlSwc0UN2U/9DM/kVZ029HBWicCCW/v/0nkRSMEttQA9Xu9KCDv
	Xg4KE4vGIbnme5LJIZvmMNLRrJ4+8FUo62SFXSVNzEAM+NYDS/YKajyxkfICKNu+9M6n4hdKJUMqo
	Ij0YXBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7X-000000050kC-0nCv;
	Tue, 17 Nov 2026 09:04:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTF7P-000000050fT-2Vcb;
	Tue, 17 Nov 2026 09:04:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C84AF6248B;
	Tue, 17 Nov 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906285;
	b=1mN9tnzlP1HKVhWl/IOf9omPObK4dALvuhNW5MJO0SsYH7zZxfzJKI9r+ggFDWj6ZYmk
	 WB1pI8s/vQGrGj2NTy3ZRcSetHs5suBbuVTrfbGhQdl6GNRAkzQQag4HbWcuLNXFNisZ2
	 +uTP27NbKPm2CwSBjgsDHPx8LsnX4JTwryI4MP6cn3R5tD4Z/lMmymZyKTNWyjAN++z+/
	 eNn+PTYXF08+JcV81tYw69e5Y6ymwLC2vxYYlebK9XyDJJ2lUvMDQFpoHm4AyHPyMo1nR
	 X4LLk8FOgimgT4DNJXLyzW40cZraYZ0iMPvRgFugf4FAn4gXJTomx8zU0/jkA+sDO1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906285;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WbZ2j7KK+/J5WiFdQr9VEro+GebKdoeQF28eK62xn70=;
	b=Dw5MA5VQj4RGzRBElyN14VEVQMdj1ARqqIjDdTxHF8mPXdBGfBBBL0pYh9znMWqRRPlV
	 I2Lv7IwKK2f+CWW04DY0HzFBrFHp+7UXCwMv1pAUIrM8GO5S/yzRKv1D3CxAcrI5JXs90
	 j6Rd7qaIJXRakHTG9lSWV+u7IKpJjWGBfRFMez+Hwzrkz6u6dkRXoTfPB521DF+JXnBON
	 1JcV9IJpfhdoc8vC9yufjSXBUVvFWteW81rUnV3OnYqcn88TFQvoTr6Ujqvke7QLcTuy+
	 OgiDcpj8QuOm8yGaVhdeFHcl4JzgF7ZnJEd8IOz28S14755yCDbEfFT2UmbrEyqjw0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3B021F000C4;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906285;
	bh=WbZ2j7KK+/J5WiFdQr9VEro+GebKdoeQF28eK62xn70=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=mpiJ6KnJNevN1j6B2O4VL4KJu1sYk4KKYsye2hS1B9lQ5QEWpCIxEjSPtRfmwN2ub
	 WIVk1aW+dGL68+cOffnbaq6K+dwB7C3GVuYOiDEk7416OiF2lKHZS6uKNsG/w4A+m9
	 wX2ykrW/wLBI5GYLesmik3ggVrIqI3LoVj2AiUfn3+ckLyUVYgbls5PUNdpx7Q66VM
	 GK8rGo3vKuVgVp0/zydmzyyCykZ9nxWZFDDX34NMYwQrNx+FTgX5aZ/u/2SMjhL+rg
	 ZnPlM+T8xq/0iEFV4/NrBir1N/KBxyPtcvYQ5ZaVw8XVplNpGt2kdiFwnzSiiHgUuR
	 9+UWmEIe9vAxw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 543834A767;
	Tue, 17 Nov 2026 09:04:44 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Subject: [PATCH net-next v4 0/2] net: stmmac: Add RK3572 support
Date: Tue, 17 Nov 2026 17:04:34 +0800
Message-Id: <20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIY/GoC/33O227CMAwG4FdBucYozaFpudp7TLtIExeyiYYmX
 QRCfXfSIHGQ2Hxn2f9nX0jE4DCS7epCAiYXnR9yI9YrYvZ62CE4m3vCKKurXKCthc7rYMH/cKk
 YGBhwAmGFbBplpJI9yeFjwN6dCvxJloUBTxP5uk3ib/eNZlrcZXfv4uTDufyQqpIo5yhj786lC
 ijQjva2kZpXiB/juDH+UPTEHvl/3k0sG5wKUde8Fa2iLwZ/Nuo/DZ4N3UrVW2Nbo/TdmOf5Ck5
 54LtZAQAA
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
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906282; l=3198;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=dxVQr0Z+Jy++pw/QahoAh2q1mmxM+G108Hhqlj5hWkg=;
 b=YZPG4bebkuCk+kQfDDvJcqu7+fUfXg2fyDNVN2awgoK9n1+HEpXKAp9n+u56ujzpUednHJz/o
 HYeBnC1vk40AErZpP0bmqPpb9gLdh2FWcxa9FPTAA5IH7qtfHxe+HRF
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
RMII mode and clock control, with MAC RGMII delays disabled.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module.

Passed functionality:

- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.

Stability:

- Ethernet error and drop counters do not increase during bidirectional
  network tests.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v4:
- Skip legacy delay properties and disable MAC RGMII delays on RK3572.
- Link to v3:
  https://patch.msgid.link/20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com

Changes in v3:
- Deprecate tx_delay and rx_delay and disallow them for RK3572.
- Link to v2:
  https://patch.msgid.link/20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com

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

 .../devicetree/bindings/net/rockchip-dwmac.yaml    | 15 ++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 94 +++++++++++++++++-----
 3 files changed, 91 insertions(+), 19 deletions(-)
---
base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
change-id: 20261111-add-board-ok3572-c-net-4d45887c575f

Best regards,
--  
Cunhao Lu <1579567540@qq.com>



