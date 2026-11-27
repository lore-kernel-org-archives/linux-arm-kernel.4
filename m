Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA4C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JTIwI8dd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQX5gb5a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=COOXH4offwY4vHwPd6x0ySf+s1NuOsnA2fHJwQt4QbY=; b=JTIwI8ddFIgZet8rGSvtNT8Nrq
	Z2HOIDOn11XahluMMgcCRc0nBdQ4TAcXuR9dNDoStCotLpA1MQHJQL6do4DL8JRzwNfB1KcL+i0+p
	EOtoUEMzd3tQR4o2WxLsdVHyOPf19x8cxjJS2VUvK8+25f8tyv8ZaqWZCHG3mLgSs+ipjrCP8unhO
	gPDb/mplQmHEj7Hc7rkta41SUfDhZ9AYHrl/p8E/FekCBj8xrEKMNC6eK+iPsGRgmbgB69rO8GcpE
	+XrZGTY2AAcLUT/mlJ+QUIMlbtG1h6gZ+tdGioCvMgwjDgYfnIDitUxmBcQzChQLGb/7FLdm1aEFJ
	yRYKVSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2tu-000000004sp-0DnT;
	Fri, 27 Nov 2026 20:50:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2tr-000000004si-3oi9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 20:50:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EAB7600D4;
	Fri, 27 Nov 2026 20:50:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795812630;
	b=3vEnHEEun8Q3yrCi5vO+3HdLURoUHNdghA6UiyxSc1UIpxrVoj7gD3IdGPaaHLM0JGPq
	 /OQi/+1Gqa2LSM3rfPbzTluBPnEJb+MibhiSONOmJX9dpjR0bVMbdthVjKj9OfgUmA//F
	 XpcFiYhyFrL6yPDnsMCFjtEK1aoqXSx78urngEAwl0tWlVVjsoXPPlbwV437cg6HLriSk
	 jDIGl1P6RTpmF6GttXBbMqtYAHx6U1m5B/336F+vw4QI9KkkmYrI2xQwhCWMYdz2uBkkW
	 7dTBdb0ON33upQqsU1oBPdgZNVtVIffbBjTF1MH8hjLndniRinlFKPHJYvQCu6uXW4A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795812630;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=COOXH4offwY4vHwPd6x0ySf+s1NuOsnA2fHJwQt4QbY=;
	b=Id7aqnA/6XoOa/fHmb2vBZIMTQUTkW6+NB1zVzN3O2rcWUPr9P/+WaNtnX/VxrpOR7+5
	 +zRXETf0+ZAgA/m6EkGfALW3YMzYvN8Gf1k6MyOy+ZrKpPA4xHOCwW9bUKtJLfnyd4wbM
	 dXj3eQaxOwsgeCixkb6FkL9N7flLrCDr/ljp2S/gHxP+87zgkN+sCuObLhPVYNZFo1uVD
	 j6cUBMUKgv8qUivQ3qwJMBjgXzFuJLD5pZWAr53kzc5gBIVSRpWgs3k87UmD34f+JfE/l
	 xr3OElFmtH+f02iwpFUp84pNpIHy3MwYLgRSuhI+9WcLwM5aSU+s+vQ997OTh/T1/Tg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DA0B1F00897;
	Fri, 27 Nov 2026 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795812630;
	bh=COOXH4offwY4vHwPd6x0ySf+s1NuOsnA2fHJwQt4QbY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PQX5gb5aW9Uoh4yyCoSIRwLBrRVgITqsPTJJfDhXz0bN9dcjyMAj+N1N6ZwOjik9U
	 eKbQ4bEWuFiJaw8oJkxt2qRCWHh1ZcvCxeYZtXHl9lWCxNfTRYQPTdDjQx0EfoZ/a9
	 qMl/8bt9r+xsmrFBOqATd4qeESz4eNm791Ni2C/wATL4qvBLGUSkUs08XDsQrrpWO6
	 PdA+/EcZ/e1ASQLV7+d0XGA55pY0UiSM+xzLPiOs/UWN0uM8hTAgVorqvdw6d3gDj1
	 1VOApyzCYyeFJ96eIUqOAP5QszZKDI52+YkpCPT7aqtIKNIw/5oUZrM6BoiQhlbrBL
	 IDhBn80rkItwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DE79F4DDD7;
	Fri, 27 Nov 2026 20:50:26 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v5 0/6] soc: cortina: Add CS7542 global clocks, reset
 controller and pinctrl
Date: Fri, 27 Nov 2026 23:50:25 +0300
Message-Id: <20261127-cs7542-syscon-v5-0-d5a373c72b05@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq1pZ6YUXXkP44KWFmsUDEWiM
 dzdghvF6PIl8/3zYNG1wUW2WTxY6/oQQ1OnoZYLZg9FXTkeyrQZCMikBOQ2akXA4z3apuagsVS
 krC48sGQurfPhNvV2+9eOV3N0thsj48UhxK5p79PDXo53v9q95ILTOle5y1ASrbfVuQinlW3Ob
 Gz38FdD0tKWmgwoAP+l8a/GpL20QhdSC/T5XNO7VnNNSSOiNkaUaOhDD8PwBCDD1Bp2AQAA
X-Change-ID: 20261123-cs7542-syscon-273d545c7af2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795812625; l=4219;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=LKT0ZdEPrI0e86I7NHg3yxfQRlaUYUC+x/f2lAMoCoI=;
 b=BGh+iEkGCfRMeFsWmQsYxehsmgWZqwiDmArsRn+m4MwCj6IRt+538ZKbvZ6KDmedjW96Mt4Ja
 +VfI2Ojy2tWCfUMv23okesLvP21eYmXKTKhfSac3ARy7bdrIZIVF+7e
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CS7542 global register block selects the CPU and bus clocks, gates
the three PCIe ports and provides the PCIe and network reset lines. Its
pinctrl child selects GPIO or peripheral functions on the same pads.
This series includes the clock changes previously posted in the global
controls series together with the original clock and pinctrl patches.

The early clock provider supplies timer clocks before platform devices
probe. A separate platform driver in drivers/reset/ uses the same
syscon regmap. The PCIe and Ethernet consumers control the timing and
ordering of their own resets.

The global reset provider also exposes the separate flash reset at
RESET bit 14, for NAND consumers to acquire without asserting a pulse.

Validation: both binding commits pass dt_binding_check independently.
The clock driver builds in, and the reset and pinctrl drivers build both
built-in and as modules on ARM with W=1/-Werror, COMPILE_TEST disabled and
without the platform series. The equivalent OpenWrt backport has been
exercised on Almond+; these checks do not claim fault injection on hardware.

Changes in v5:
- Treat failed regmap reads as unprepared in the PCIe gate state callback.
- Use devm_kzalloc_obj() for the native reset controller allocation.
- Describe the separate flash reset and add its reset identifier.
- Retain Linus Walleij's Reviewed-by on the unchanged pinctrl driver.
- Link to v4: https://patch.msgid.link/20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com

Changes in v4:
- Combine the strap-selected clocks and PCIe gates in one clock driver.
- Move reset registration to a separate driver in drivers/reset/.
- Expose the seven network-engine reset lines individually. Leave the
  PCIe reset pulse timing to the PCIe driver.
- Fold in the global-controls binding and its clock and reset IDs.
- Global-controls v1: https://lore.kernel.org/all/20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com/
- Link to v3: https://lore.kernel.org/all/20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com/

Changes in v3:
- Introduce the parent pinctrl property and schema reference together with
  the pinctrl binding in patch 2, so patch 1 validates independently.
- Re-run dt_binding_check and examples at both binding commits. The final
  source tree and driver code are unchanged from v2.
- Link to v2: https://patch.msgid.link/20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com

Changes in v2:
- Identify GPIO mux functions with function_is_gpio so strict ownership
  allows a GPIO consumer after the default GPIO state; UART stays exclusive.
- Link to v1: https://patch.msgid.link/20261123-cs7542-syscon-v1-0-49858e631449@gmail.com

---
Fil Dunsky (6):
      dt-bindings: soc: Add Cortina Systems CS7542 global controls
      dt-bindings: pinctrl: Add Cortina Systems CS7542 pin mux
      clk: Add Cortina Systems CS7542 clocks
      reset: Add Cortina Systems CS7542 global reset controller
      pinctrl: Add Cortina Systems CS7542 pin multiplexer
      MAINTAINERS: Add CS7542 global control support

 .../bindings/pinctrl/cortina,cs7542-pinctrl.yaml   |  84 +++++++++
 .../soc/cortina/cortina,cs7542-syscon.yaml         |  60 +++++++
 MAINTAINERS                                        |  12 ++
 drivers/clk/Kconfig                                |   9 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-cs7542.c                           | 161 +++++++++++++++++
 drivers/pinctrl/Kconfig                            |  13 ++
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-cs7542.c                   | 195 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-cs7542.c                       | 135 ++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |  13 ++
 include/dt-bindings/reset/cortina,cs7542-reset.h   |  20 +++
 14 files changed, 715 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-cs7542-syscon-273d545c7af2

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



