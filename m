Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B7606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/rPnftR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jrj+iFOM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RHPlhdBNPxXzXTwkaRxmCp6HVueIFSTW7DRmFxWoNDk=; b=b/rPnftRRjQWBG8jcxSykNLSzT
	p9+vnmgVtDL1dIToCpun/8VN0aub7y+J/7+F4gjWtVG3pRLB/oHARruqDl8LKU5bdnqTt9dk9sJFl
	pqbvWMpSnwWTcYoI4kg0q94ndscsTOOLS/pOuF69yNZjHAf1mGraCcGiiQOaizHBcmVc8spoBtOAp
	CcSk0ICT5FOyUmHIPTAVhGxJOxJLmBFY73wxXQmLjkZU29+DcSuussqreUKWmuSj7HOEoT6aj1wj0
	VI12UN6TH2bh2mn2S0LEEYXSRiXkT/LpUnF+SNRC3vxCcfBwUZQXMJGHYm4srJDn+lil+beYuA4xZ
	BfGXWjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMz9-0000000Epvt-3HQm;
	Fri, 20 Nov 2026 11:40:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMz8-0000000Epvb-3lJW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:40:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4233D62203;
	Fri, 20 Nov 2026 11:40:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174853;
	b=gwX5PY75GLTzNLtYE50Us7SsgI6ifqfkW/fVPPOCJE2q4xeaHac3OBTJ8cXajf3/t1ik
	 iPlbl9fnR9fSYdSi2R/Tr6hddmlxsV43HHpdfoCmBiyVXw55AE8hfPNJwkm1C2+ZFVemn
	 ZyofWQo8z3yBJXorvDmj3AhTD5/DXfw5oHstlcT0afqcajxoyzK2FTv+NQij8r5XEuYpA
	 EOLSgUBZMrgHsdDGWoRI/0vX++4a2AZUhVGHi9o9JXjKCfC/IC9QOxLSlF5zJZxoVYVNp
	 oV1kvCCKaWyK5B+3dmnm4ytkcai8WRCEuEOsXz/d5mQdm7XVhd/6hn/QiCII7I5fuAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174853;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RHPlhdBNPxXzXTwkaRxmCp6HVueIFSTW7DRmFxWoNDk=;
	b=gTa0t69lfO4fsiX1SC/O9Im+oMhzMilYaADhIQlsj7LFYJuF7ufWlFHwHqFwgKltZ1LF
	 cG441D6yeerRy/cbIu7bY8hO2NflodHgscZIq5Ggec403a4Lp/7VFjQkUmdHZ5ZyTujLV
	 X+zMyB82oR1ZO/4OTOZIxipLGcfmlkHxFVE8gptq5GfT77EbFL3O7i8IOyp+HasZtnigZ
	 CLQBsy3OF1lcuv4Xx6kRou12c8YfDyPQ3u8sPtFmBsh/4uqPl6q2TXLVaefCFNhrGkIod
	 xZg/gZkecOEHV7TNbugdXxJq59w8uFb3Fw+ptJco5owOHON3TYnj2JOLMOHJQkEHBZg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 013211F000D0;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174853;
	bh=RHPlhdBNPxXzXTwkaRxmCp6HVueIFSTW7DRmFxWoNDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jrj+iFOMo8UJZjlJ+NdJsdiTgzLXJSh7al69m9lblPFt/bC68uGvu+HCM0hJ0yT7U
	 FS0OfOGDE5VZ9i+CoIT/gOTi0jJmPgUk/4P6HX8tjHcWbdBs3TM9FUzHdDkHkZhUU8
	 Qh08RYiRD504Pp0+HQCajoEcgp0UT2Wk1KWEFC4QcYR6oCLMklYAFuqgyYwNZkSpRG
	 TwRryOodEEJtbyvpfm1Bk0L6fUDzTS3GMvLBMbUyJqy60XZwbiumq8TL2flKgVTYsU
	 CxHzFflDPjnc4sH0EBc9dOVpb4NeDy4UGLMq31LLxh6GjjoVpNYnUgjgCH2btMf32Q
	 MA2CNWZKjEHvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8C9CF49863;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:45 +0100
Subject: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=2115;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=7KEtdKj9IY+64J+dCjZb1N3Us47orLdmi9i9eYZWsuM=;
 b=SOxTVC1DYhuLVEV7n+Im/3RiM9ou+VEHmEJgGfO8FSkz+Qz6pLswSgdzCSEG8p+bdVtsJUhhg
 We9IBq70qemCUoxa7CgvszjvEU/6ECL/sz79h+0mCFhVGJuWuuwmOTt
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: ipfarher@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ivan Pfarher <ipfarher@gmail.com>

The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
clock, which on this board comes from the RTC clock output (osc32k-out).
Nothing in the device tree references that clock, so it is disabled as
unused during late boot.

WiFi keeps working without it, but the Bluetooth core does not: with the
LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
Read Local Version, no firmware download), so the controller can never
be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
makes the controller answer normally.

Reference the clock from the WiFi power sequence, as other boards using
the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: osc32k-out stays enabled and the Bluetooth controller
answers HCI commands. Build-tested only against current mainline.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a WiFi/BT combo")
Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 3eb986c35..34d6c1468 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h5.dtsi"
 
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -54,6 +55,8 @@
 
 	wifi_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
 		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
 		post-power-on-delay-ms = <200>;
 	};

-- 
2.43.0



