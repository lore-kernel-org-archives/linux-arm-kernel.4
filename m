Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A5606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uq8vqeZr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=W7GPtu+e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Unn0F/ftD1finXNKWi/skeaXkk+/fQXZw2324bDO7PE=; b=Uq8vqeZrNF1IX2YUNPNJvMAsOl
	vkk9uWcfUxu8OaYiXut6DI/0IdZrIIdCE5+emDsBKaXseNp7Ke8xtzMznueuzb6NIydj6fH14H+3Z
	b0umUhQ7W94RI5YhsEPgYccadoYBjOblcoRaXt1f41bWGD14QcBfpxFRJFqh9rFG+bUdjs6brai8r
	h/jhSWhTiwTnVNOY3kKXdq+I3fxOzZ1POlrpNGtbIdLszjCUDQ0Mg9v4VtsNlbutgQhJB6PakxZBG
	Kx27sdsNJUnDF+x3039f0j7P3BaK2tQ5NJIFMHd+P3esMFCeQfAhpJqpoWBp5fqZ4sjRgqF2eaVwz
	nc6Svkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFD-0000000ChA6-207X;
	Fri, 13 Nov 2026 12:19:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFC-0000000Ch8q-04VK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Unn0F/ftD1finXNKWi/skeaXkk+/fQXZw2324bDO7PE=; b=W7GPtu+ejpPHmi+3elgZC+jkRG
	Efssivc/4fzqea8qjC0Sb2mC5gAE6Q2QQdBEO9iFCJYTgoWREteo+mJDBWSk+yYpwW+v/sBC2j64J
	cO9UGieXAjy5o+VjXvtgWSJ+BkQZ1aav/NSzKh+tSvjBi3F/B7feZu/Gc9tZKnjxOXFVyJojCkszP
	/vxcEwhL/tmkVYYsDyLGFjlp4ZzAcaJ5VIDkBtsT4wKUZN0o2GV713UGplsgZqpL1EI5muKUXI8Aa
	PXrBooP5Y7FZu8uL4v42Ji31KitEmMSix7fUGzMupAzwAv8LOOiifK5fO1YNtfRpXoQ2oPFCQk+LK
	owwBiySA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF6-0000000BEHt-1GeY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:01 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4922523d1afso398385f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572334; x=1795177134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Unn0F/ftD1finXNKWi/skeaXkk+/fQXZw2324bDO7PE=;
        b=2SDqp9bfgCuWyHMF/WY9mojjdRnBPmI0mlRDsEHFoROzunn8CKqhJ4yfM0I50Jh11/
         bTwTULwfgJ5duDS8LJHiI3DTu3Vjld+b7O7icgj4vczg4KF29lOOs67ZWg04r65eZrDB
         Z4jrGNxSY4k/kU37WCb8RyoOFjjDYeKVmrRtmFDvffsT2zf5CPgGg0P5q3w2XnpJjQuZ
         uCSTAzFWDxhxkgOspnJuVHHqRiFRkGHmgxsMrLMitzAb6IDZO6rPWgH965Ya1CJ2tW92
         Qnj/18KTUEJgJyyPwx3CG3QoWqjniPzZ18u8r95SxQYjdpsd7dVvnpg1S8KsXlh2CgUO
         Ka4A==
X-Forwarded-Encrypted: i=1; AL+hErGkrp+crzHSVl4l/VkpGKtC0Ux61zy11LUEfy5D1P2v3CevT69twRpEyq9EPNWcmajCYdFMFIk3Z84EL2ixqqge@lists.infradead.org
X-Gm-Message-State: APuU4Z8/cCyGAz0OOFBqCIK9ipmg1kAew6Q7/0Rd/etfiqRfN2CVnNjk
	4A6Ki5yn8WI2Ycstpc3mpN2DRrPTH7aeQALaWaBck13kEvUU0fNBeHFS
X-Gm-Gg: AYBFou2rklOXusvURkQvdmjzOVra0YdcohGhaSjE0CXjVdV3CQcPYE+T6WMVWzWQ4wI
	AfmC5pWeAqvVDjlSkxEan4Fcfqvi+2eGQOR2AQZd42oV0M3A13je5AJmtoczsvI9BLFgsC03Jne
	1g4nvaJtXEgH2P1B10MgGMW/oD/oR5f4m4cujOD14PaheRV+3b2JfNmS22nerX3EtEDxw4zhXNr
	EJOUfi4b1ge77NMMO4cdhTN0V/uKgBkotk4zgiFxSYsbOIEJjaBY0SSLKkvEevYsUWEBvbrG/mq
	wrlTEXzRSFpJaIJe+SZ/zwscGyQB3/UK3FeAzT6ddYTl/Vx0u+sxUUm9ZknvgccJ5ljiDNYEC6u
	9Z13tzGC+PLIebmCkusIbTUTK/GloXscji6V7h0AMRGJoEXECbU0m93vzibDVjNjYlPinoHHXGc
	nYbara2WWJWR4xpFecJQO0sOwqJ6uIkEwjkNgoaT4u16IbuUlRyAGInbNEwqnXbfu2mdQx/2xYb
	YxRVO0qLmeduL0BPyjFYvgRTDzGjQ8JpGIGgWLiSlykSbBtC/iwItVKLEV2jCyz8gnFBsjCVGQu
	z+6Dz//RwUGGSP+xzT5HL6ghKouACZLS9m59yUOaFt5gMvPF/5yVjcrcY7bfFITWzQgo4kd0F6V
	dxh2CY9x8QsinFyWY2rpZXFgZ
X-Received: by 2002:adf:f14b:0:b0:492:dddc:64c3 with SMTP id ffacd0b85a97d-49c742a6580mr3860898f8f.41.1794572333528;
        Fri, 13 Nov 2026 04:18:53 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:53 -0800 (PST)
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
Subject: [PATCH v7 0/7] Add ethernet support for the Amlogic T7
Date: Fri, 13 Nov 2026 12:18:45 +0000
Message-ID: <20261113121852.334604-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121856_338529_96E569FB 
X-CRM114-Status: GOOD (  19.87  )
X-Spam-Score: 1.1 (+)
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

The T7 has the same ethernet glue as the G12A. This adds the binding,
the driver support and the device tree nodes, and enables the port on
the Khadas VIM4.

Two clocks are new. The pipeline stage between the controller and the
DRAM has its own gate, which nothing else claims. The glue registers
sit in a block gated by sys_ethphy, so far claimed only by the MDIO
mux, which probes after the glue is programmed: every write to
PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".

The delays follow ethernet-controller.yaml: phy-mode is never changed,
the PHY adds the 2ns, and the T7 accepts only rx-internal-delay-ps, as
fine tuning. Its TX side is a quarter-period phase selector with no
small step, so tx-internal-delay-ps is not valid for it. The VIM4 is
plain rgmii-id.

Tested on v7.4-rc2 on the Khadas VIM4: 942/940Mbit/s with iperf3, no
error.

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

Lucas Tanure (7):
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on
    the T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     |  29 +++--
 .../bindings/net/amlogic,t7-dwmac.yaml        | 112 ++++++++++++++++++
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  23 ++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  88 ++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   |  61 +++++++++-
 5 files changed, 297 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml


base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1


