Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZ+QwqDH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buXPPTgT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dLwsm8mo6huIxR4X/ABQql4ivoBRzs1lydcsNmou+t4=; b=xZ+QwqDHPWKdY0+eAMlSxR8XiM
	KzSUobPQoH+bsnu1eJWsrnBeBp0uMsrXrgvx6d8a9WC7YybyfC8Vgy0KloDwFncPHNeufp93Dax+E
	vHcCopwFBTsrIEgHQ/LNndUljxs/PFN3JSKUdoCniyd8gXNbh90DkK/Ft8ei5x48PsMWZxHQfrGgB
	AZCJpWh72lOcjRm0b3lwl8WDi1G83eOfvmarFdMY5A74zVYo4qwkzcAeIkc/EAYhHSWR3BWXibMsQ
	WwQETxruQdtsHagHtwEVNJihrCZSNBqtekqQffr+0KFqDbGFUgWdEjvSH6EEHFA3Xeep4Bq5oBIP6
	q0MbQP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKw-00000009Sxz-0yUD;
	Wed, 25 Nov 2026 10:35:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAKT-00000009Sjm-0jGF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:34:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D5CB44E75;
	Wed, 25 Nov 2026 10:34:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795602860;
	b=xA1++OniXQ5HHJTb8O0PWQY2PwYvO7z0ydmzTA6y0nUKHDvvQjApfCQZxO2q/Dh8CqI/
	 HkybYzKaPkB+qKta5gY8LStvd9bz6rnP3yIxvBRWAJz0SqaJLU3Z/SJbZv/cRrz9oRXR4
	 RHPwYPRoC0lw/BDdPUSUs8owRJV3cPor67PWoPBFVz3Z47MXBSa/NGZF1cfqCuqqmCEaR
	 ZOqcewukro047nk8wvPmt2iClvT2jg4+igKcvv1pFBG9WxKsOElMKHL3Xon0ULC5SFyTh
	 1eRzumbKySFek4YLN7irnRH5bIMXj1LJOE1bWzv8JH2osjuSRxnQ7H5IBdJ9mgbxSjQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795602860;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dLwsm8mo6huIxR4X/ABQql4ivoBRzs1lydcsNmou+t4=;
	b=XBwOW458BHWNDq5vkAT4uDPW0jRDDq/ONdA2T3Ei1a19dGXPfUTbUZqS3rH8N4zPstbC
	 aLnQFEF2OD14hruu3P7SDowcGafrHcW29dXDQRIO7eEegOPpKse69KnXKI50tZHNihS0M
	 4fJud6PrbgKd9pRlP+EB5CJ5vqODEGJTEzjyyST9707hlYyefp9jBaZGywtdaj6SXg06G
	 mM/QPG3q6SiEZGatXk/YLZ3iGYiGgin2YzS0HVj11yH4kNByuNgls27WZC5Qz4X3oiRQG
	 PnBaPSoilcA3UrYe/Dub1XzWh8mYkn9kE+8+XSfWbx5Vr8CCxoLDjcDBupy/BHngcGA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 268161F000ED;
	Wed, 25 Nov 2026 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795602860;
	bh=dLwsm8mo6huIxR4X/ABQql4ivoBRzs1lydcsNmou+t4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=buXPPTgTmpbrQi3rRn/lb4lkMjtWO9GkPtQU6PJcgUAwZhyuEzNhB+n9agQiu1u3T
	 N8YfkgWiAiCAVms5H9ildJoIfOgLnzYn4a14G1gk9a1teqMYGDfsAHL8PTlTOLlYZL
	 xEckPK/LOwv6XeBFXA/WlwKaWDkMstmUZLlV17UFAt94SQmAR/z0gXO/8DNa6echn7
	 c6zQuZGTC804DkimBTAK4eZjXTK4PNd9uBGdCftxBcakteUEMaL8yz2BHskdoEUV/V
	 3sPqYnNyM8uzI6DEgEQnpQ+kBaM6b+GOVAv1GO6I9ADZl0x8YusSEkRjEMskZAzWDb
	 +P+E+O29pt9rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 871E04CE4B;
	Wed, 25 Nov 2026 10:34:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v4 0/6] soc: cortina: Add CS7542 global clocks, reset
 controller and pinctrl
Date: Wed, 25 Nov 2026 13:34:08 +0300
Message-Id: <20261125-cs7542-syscon-v4-0-3337bb0d3b48@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrq1hpi0FV97DuIDSQo1Q0yKRE
 O5uwY2JkeVL5vtnJkF7qwM5JTPxerTBuj4OfkiIasu+0dTWcRNMMQNARlWQgiMNU1CupyhZLbh
 QsjRIonl4bexr612unx2e1U2rYY2sF60Ng/PT9nCE9e5fewSaUl7kItcZA86Lc9OV9n5UriNre
 8RdjVGDqiWvUCCaH812NYvagEplCTJlJv/Wy7K8ATQ5alQ4AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795602848; l=3311;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=BPx9ey5gPlpgxq1x8AULdynhkApA0pokCgsTvvDkg4w=;
 b=A1YqO5klgGHGCaJZRxeasM3CEvJHMSJCLQ0TrWWsImwg1ATX68tuSQqC5OCZnUPddhNRYkOlT
 CSpCb6Is3JGB+05lwIqYc+suxh1jotO6WaP3h1UWI8CZhnTfxOS+unn
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
 .../soc/cortina/cortina,cs7542-syscon.yaml         |  59 +++++++
 MAINTAINERS                                        |  12 ++
 drivers/clk/Kconfig                                |   9 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-cs7542.c                           | 161 +++++++++++++++++
 drivers/pinctrl/Kconfig                            |  13 ++
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-cs7542.c                   | 195 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-cs7542.c                       | 134 ++++++++++++++
 include/dt-bindings/clock/cortina,cs7542-clock.h   |  13 ++
 include/dt-bindings/reset/cortina,cs7542-reset.h   |  19 ++
 14 files changed, 712 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-cs7542-syscon-273d545c7af2

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>



