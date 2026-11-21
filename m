Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E571A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4Ddy4bt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C93fQcPXxnOGbGKaXQAkMtOoh58jzuHpLH1rCb798RU=; b=B4Ddy4bt+Zdpa3+ujSZetspr9B
	Bo80U1/PcC2WtdFfZJl0CWptYjSlVAszq1iAZb9Rk5w5e8iGn8uOxTHubYtROf7eUB9sm+wEe05wX
	kDJCIdXOl6Zgja1vs+34/KcJv7zAVVPGog8PfvNnf5/Hr+qnwVpf9kfA1ThRJictsNdH2UpgS4sM1
	gTElmkD5VW8MRalCKbqGd9p28RbvPUSZOvA3Vgvm7oGF18o+We5Fz2u4keDd9l9++2xmNJIgFP8fO
	0v6M1PlUd4ZL6RDhbGdiT5DkJjOKv7Yuufpfq9RfWtZcm1cs+boWBDbdGKhxJGR/n6vwEJ/lCTJQc
	oIABiWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfw-00000000LWt-2v2z;
	Sat, 21 Nov 2026 21:31:12 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfq-00000000LTj-2j5X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:11 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so21862895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296665; x=1795901465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C93fQcPXxnOGbGKaXQAkMtOoh58jzuHpLH1rCb798RU=;
        b=2hqdRpzzrGtabaRInLrO3oqqiQVuam6HzIf/pOwM9vpC9dYqPlHurO4QUpM9I6o+IF
         jagFqSg77taPa5xE3pFBsJYp8T7ogxoyncHOlubOaBKtKSgO3l1ZNEPK+hkXOWd5qN0+
         /0bd0XzOMEdpRU9Zz3AWGm2ylNiF9eIMSygFlmLKvd+3UiaVZNAQJK2xoDoPzvhSsGdX
         oBnF8q0kBMzD3jDbgxB0eSmJcdAQJLZZ8M9CwqTSCPOvw1gPq+dmwfMlAqZYANpB0BOO
         uX+0SDSvEGjGSY795S3x728s5EK9X2fVdDP49oWpQqWElzWmV/RFSyCpYpRWbUlv5vof
         57+Q==
X-Forwarded-Encrypted: i=1; AL+hErH7mjSstgK3mu1i3dKiLbeh/HBuufpRoITYHnqJ3viyblHDK0auBusf05V91eHO4iUzyh7sZxBDgy4juaY8eTLk@lists.infradead.org
X-Gm-Message-State: APuU4Z+oyFwB8Q1jL10Z4O0pSR48tdlRO7IfiePXiOxh7WHwYWrmR8Tc
	KToQnzc3t/15voQyjYykiUP52Gi2zPmKtz7McEinAuapsDt5ODQUZN3L
X-Gm-Gg: AZFdTZdF7osxAmDOja0yVDHhAwnDNp6phNcIWJBPEJ3AgERi878KD1YL4Pj2CJU3yHH
	ooOMBma7a8zCl44BSGd62YTV46Mvh+4RKULuVcvwS96cWZBc0oH87eXrDX9xikoE65caO/ha0AZ
	7mYAnbvfPIhiuC73NDM+piYAEYhpgbzaGJP3GaQ8QHs2ZAwQJnBvLlE6z9QiP+t8Dy//XO//M1e
	3OUcvbdNxWgWmD5oihGc3tc5ossnGD/PSj3IKhm2VbFEAsHKftpOGuEM3hu1fPabcfVuteAhBmz
	rSr3IgSIWZGxJVWb8YGphfqSvnnEDgS9vjNJM6fgAws4DUV9FK02s/VlWlCie3PUr5fUpyP/tf0
	L0MTKa5VvgP5IvJrhW5aXZ969b32zVZBFlb6SqdUL90C+awbVDkiVfEQBRyqvxpGDJMHKQ6I10t
	pOHcFh8VZ2mDqEBe6n2xH1YyKBMwIxjCzR4nPZFOCeQHf3bhsgBmhzjoqJJf48zI97v4MTeWXLX
	QyzuZZKUlDsczHY5qiCqY2m+l/NppXdXQ+R8p7PYk3dD2Nhe6HITj09PljJnSEBowbMJqornQTb
	F9hFdGLbAu0nG+SPw2rSTlJ0bXKsVSXVTs1id6Xxcy5pJuwwN3QE6qtAGJy5SOqpcU0LYeBP9jE
	gPvI3YP/RIWQCcdLERw/ntQo=
X-Received: by 2002:a05:600c:5246:b0:4bb:60ba:49e0 with SMTP id 5b1f17b1804b1-4bb88930707mr167527095e9.26.1795296664478;
        Sat, 21 Nov 2026 13:31:04 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:03 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/4] Add ethernet support for the Amlogic T7
Date: Sat, 21 Nov 2026 21:30:58 +0000
Message-ID: <20261121213102.143130-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133109_862425_C2C41F09 
X-CRM114-Status: GOOD (  23.15  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patches 1 to 4 of v7, the bindings and the driver, are in net-next:

  2297f88ce0b8 dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
  18029931478b dt-bindings: net: add amlogic,t7-dwmac
  c4c851a3325e net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  4fdc7da7e13d net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7

This version carries the rest: a new binding patch for the MDIO
multiplexer, and the three device tree patches. Patch 1 is for netdev,
patches 2 to 4 for the Amlogic tree; the device tree patches build
without the driver part.

The T7 has the same ethernet glue as the G12A. The glue registers sit
in a block gated by sys_ethphy, so the controller node lists that
clock as "pclk", and the pipeline stage between the controller and the
DRAM has a gate of its own, listed as well. The MDIO multiplexer gets a
T7 compatible with the G12A one as fallback. The VIM4 is plain
rgmii-id, with the PHY at the address its pins strap.

Tested on v7.4-rc2 on the Khadas VIM4 with the PHY at address 1:
941/944Mbit/s with iperf3, no error. A scan of the bus shows the
PHY at 0 and at 1 and nothing else.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7."; I will drop or rebase whatever overlaps once we agree.

Changes since v7:
 - patches 1 to 4 of v7 are in net-next and are not resent; the
   numbers below are the new ones
 - new patch 1: the MDIO multiplexer binding gets "amlogic,t7-mdio-mux"
   with the G12A compatible as fallback, and patch 3 uses it in the
   multiplexer node (Martin)
 - patch 4: the VIM4 PHY node uses address 1, where the PHY is strapped;
   address 0 only worked through the RTL8211F broadcast address (Martin)
 - patch 2: Martin's Reviewed-by

Changes since v6:
 - no Assisted-by trailer (Krzysztof)
 - patch 2: the T7 gets a binding file of its own (Rob, Sashiko); the
   pclk description names the glue registers (Krzysztof);
   rx-internal-delay-ps as constraints, default 0, maximum 3000,
   multipleOf 200 (Rob); tx-internal-delay-ps stays false, the
   meta-schema refuses "not" on a top-level property, so the reason is
   a comment above it (Rob); "snps,dwmac" dropped from the compatible
   list (Rob)
 - patch 6: "snps,dwmac" dropped from the node (Rob)
 - patch 4: Andrew's Reviewed-by

Changes since v5:
 - patch 2: the T7 block follows the Meson8b..G12A block instead of
   splitting it in two; default: 0 for rx-internal-delay-ps on the T7
   (Sashiko). The explicit false lines stay, as asked in review.

Changes since v4:
 - patch 4: the old delay code is left untouched; the T7 only gets a
   callback of its own, and the probe parsing it shares validates the
   RX value (Andrew); no NULL check on the callback (Martin)
 - 0 accepted for rx-internal-delay-ps, the T7 joins the G12A list
   (Andrew)
 - comment on the deprecated vendor delay properties (Andrew)
 - the MDIO mux and the on-chip PHY bus start disabled in the dtsi; the
   VIM4 enables the mux (Sashiko)

Changes since v3:
 - phy-mode untouched, the PHY adds the 2ns, rx-internal-delay-ps is
   tuning only, tx-internal-delay-ps not valid for the T7 (Andrew)
 - 0 dropped from rx-internal-delay-ps (Martin); vendor delay
   properties explicitly false for the T7 (Andrew)
 - init_delays callback; patch 4 renamed (Martin, Andrew)
 - VIM4 without tx-internal-delay-ps, the PHY TX delay works (Martin)
 - Meson8m2 moved to the dwmac-3.70a list; its boards warn in
   dtbs_check until Martin's dtsi patch lands (Martin, Conor)
 - the delay table in ethernet-controller.yaml dropped
 - Martin's Reviewed-by on patch 3

Changes since v2:
 - T7-only delay path (Andrew), PHY mode from
   phy_fix_phy_mode_for_mac_delays() (Maxime)
 - tx-internal-delay-ps checked against the hardware values (Sashiko)
 - vendor delay properties not valid for the T7 (Neil, Andrew)
 - no max-speed on either PHY (Andrew); VIM4 PHY interrupt on GPIOH_6
   (Sashiko)
 - the T7 node owns sys_ethphy as "pclk"
 - no longer RFC; Conor's Ack dropped from patch 2 and Neil's R-b from
   patch 6

Changes since v1:
 - the driver honours the generic delay properties; VIM4 moved to
   rgmii-id with tx-internal-delay-ps = <2000>, Neil's R-b dropped

Lucas Tanure (4):
  dt-bindings: net: amlogic,g12a-mdio-mux: add the T7 compatible
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,g12a-mdio-mux.yaml   |  6 +-
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 88 +++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1


