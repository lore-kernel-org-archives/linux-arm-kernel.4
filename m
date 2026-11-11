Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E173606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hmNGVYTI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8NI2ohN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mwUJvTtyC5sbesnsFwyKi03f4PynGWBUu785Gpys8rE=; b=hmNGVYTIAJ4yLv
	T9qD+ge0FiIvYEca902nG7fs15bGnqEVIV1Gt3GDSlZXXzLabDx/Yr4qAI+F769mxrv2lM6JSTaOH
	gplUSjmGF5QTItPawQf8hqSzcblT05eC5QJoMfkpRBN8uCjyuU33mB4YZdHv6a/mgUYPwVz8JR3dl
	xUXCJJ9GzQnLntuGNVy4YxpPf69p70GwDW84p3DIUuMpFezJsjhozGSPIuwZqX2DSD5WIRa4uoKkI
	YpQSYUZh2i575zrsw+e90S5/EDoRO8CdeFi/Ne2LykPoEJnIJqnrExBJ4derDOUJXE2GokjJNWKP/
	xdEA9tSJG0s/z3+dleZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7EJ-00000006deT-0Qxl;
	Wed, 11 Nov 2026 12:15:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7EH-00000006ddt-33jt;
	Wed, 11 Nov 2026 12:15:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6628E43E63;
	Wed, 11 Nov 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399305;
	b=OPV0+ODt6p5DbFXDocrrvjnT3FIDFOTPm9abH8rX5bjeV/VLq4MZsYnJyPSJwCSCjuyd
	 LQv6RJl+i9AOYYNqPzd9qH9eYiu+8zTV3iK6n+8w/YRqhNI/R/1003Q4zlpf8FV+R6h3W
	 KzExIMaCw8d/e6hD2XeOmfcSs5LBH1BsV9kvsPLLOc9j22rP/LSg0VjFY/ggKcHc+LQ41
	 Cr4BFM2eyhyIu2Wc+Yt+RSjnrlhR++2BQa186o49i5n701E/jFt7vofdWNxmLXnkfWwks
	 AJpnLUr+hta4KoVHutDZnJkXaQk6qd1yuSAxjtkPggywacbI06gM8NHK+2v1euzB+3g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399305;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-Mailer:Content-Type:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mwUJvTtyC5sbesnsFwyKi03f4PynGWBUu785Gpys8rE=;
	b=CzysxNuOTHB/1+4af9SxoysoK/54dIg9cRxrCzmh/9LyJ1PtL5QuEEjhkeYGHgl2Xncu
	 b5RQvBV5R7o5KuqT4xV3TEqQwZQD9XdDS4W3s9iRGiDPzX87BkPAHTctLQFLqCAF3Q80a
	 3JpKDINjqAuL9jDAKzgbPE4RfolzjLa52vd6H8AyT6jLj0R/vu9D4I2y/7LXiiqGSmAWE
	 eiHEJ5vAifdCZ5cwgepp+CpyCBtdNTAtjL0avCh13CllRQJ5vdvaVxQyJupuNFo0ncRDp
	 uremnP0M6N8WPQ2zY4mPu9wQrlJIB3d047LUgHceIqepZmyEdb1f2xLo0WP8/kHEtKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBE5E1F00A08;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399305;
	bh=mwUJvTtyC5sbesnsFwyKi03f4PynGWBUu785Gpys8rE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=Y8NI2ohN3HQHbK3B40HF4n9Yog0Szh+3jF7pJMJhGtsNP24XZ4LEAyOtib3QfZV/e
	 9zO4Qx3ZOJd1DpVIOfabfGuhCOPxDl4yDsZzvmQuX2+kkZUSt8VIsK4BnJ5PEbPlJB
	 y2JevTlWqvTlQ0eooMPI3U/HzD8443/lPRfOJdeNfJer8mXWZh5NWqWWDwJo+LuxZ5
	 Hty29HkKLJAnWMserIASdnC3X7k/MUvC5p1N+Zy1KVrPFYKrz69Yj0sexTsocKWMGg
	 VLHJGDcvbDZahZI8Qqu+irCh8rmy8pQqqDzbIvktcHUaFqpaliPFJzn+QPzRO4gd96
	 cAvuyzbZ6oVOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3F3D248F92;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
To: heiko@sntech.de
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com, robh@kernel.org
Subject: [PATCH v2 RESEND 1/1] arm64: dts: rockchip: Enable audio on
 DFRobot UNIHIKER M10 V1.2
Date: Wed, 11 Nov 2026 12:14:34 +0000
Message-ID: <179439927464.86676.4421939132317972846.audio-v2-resend-1@crepuse.com>
In-Reply-To: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
References: <179439927463.86676.9537625579963969157.audio-v2-resend-0@crepuse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=xlzLLRAxNlPSYq2hZGjl4gVBzWPQJrF0KJ1HKORoHvI=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFlfYrRWp7M7Bbz8FX1Y9Of1eUeDDNKyq5buPKV+jX9p7
 JnaaXvtOyayMIhxMViKKbLMFmUvP9S84trcCU12MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEx17ilGhoaAyctLXF/v3VAs3eeY+vlTd+meF4lN3RWzBPtijPNOCDMynHNq3fH
 8fZt/hvKOJstrk5jOrvrZbz2tXCLzxImQiTWyHAA=
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: founder@crepuse.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mizuno Miotsuki <founder@crepuse.com>

Enable the internal RK3308 codec and its I2S2 interface, and add a
simple-audio-card. Route the onboard microphone to MIC1 and supply it
from MICBIAS1, with the bias set to 85 percent of AVDD as used during
board bring-up.

The board does not expose a speaker interface, so no speaker routing
is added.

The board uses codec revision B. Support has been accepted in the ASoC
for-7.4 branch as commit 157f7cba77a9 ("ASoC: codecs: rk3308: add support
for codec revision B"). This is a runtime dependency; the DTS uses the
existing codec compatible and bindings.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
index 270ea970c95a..7adef454ea89 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
@@ -54,6 +54,26 @@ sdio_pwrseq: sdio-pwrseq {
 		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
 	};
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "UNIHIKER M10 RK3308 codec";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,widgets =
+			"Microphone", "Internal Microphone";
+		simple-audio-card,routing =
+			"Internal Microphone", "MICBIAS1",
+			"MIC1", "Internal Microphone";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s_8ch_2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -117,6 +137,11 @@ vdd_core: regulator-vdd-core {
 	};
 };
 
+&codec {
+	rockchip,micbias-avdd-percent = <85>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vdd_core>;
 };
@@ -131,6 +156,11 @@ &emmc {
 	status = "okay";
 };
 
+&i2s_8ch_2 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
 &io_domains {
 	vccio0-supply = <&vcc_io>;
 	vccio1-supply = <&vcc_io>;
-- 
2.56.0



