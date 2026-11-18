Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39D606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=06eKDXqB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h167uyux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vEoi4P7BQr8rHpfacdOlQuPPdzVB1aHJRvkDt1Kpjuc=; b=06eKDXqBtK3YZsHl2E8OOFkqPe
	Hi+pMrCCVP9GF6GjcEMDE7wh50QivO+pnQPEmzIJJaQ5Z+AKaeZujE8C6pmQCKm/Jl+2ucGZmnX3+
	Z/3TSlrOtzs9xYHi128NmKKFM94vEozLEoRFI7kq4Cj/gnr0ulENaHfmy6ii18Icdba1FgxmJQjwy
	sUOe+rfHLrthhuLpHULA7Dv+NDUuDksmSR4S0E7XZyrzGE6UnSmYSgNlAUQ/Y7pvAy4j7poD4l9NQ
	NKDGoI9toMZVN1kqDTNADRsxtFDuPWL4uZ2ZgqUeLFviQymy1kfS+owqlBiXGywjG5GZDbb6slOUH
	/BvmNssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdOt-00000008ezE-4511;
	Wed, 18 Nov 2026 11:00:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdOo-00000008evI-2JBM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC32D620FE;
	Wed, 18 Nov 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794999621;
	b=2+QsxIAsrFXXzAKmCkX0bOv3cJsyy44/iKvmYK6Gmm6pnEbcTFoQqjCGIksiFvDmipGo
	 39K6d4hmNtJaa+d6JHHwEjcv4YiXcmadRASOqymHctle466YZx/JNHJ7m0RfbsOtHD8tY
	 S3Y1Zsz3RtnCOlggB5hInjJ5OkLItttuYt1AZxpwXe8ReeJfuFksZUztnlewUtCdyEIBn
	 wVQN4r+Tna960DE90pyLx846hC/y8hrTtE9k12SOTlQwwyMzWP5dna9JjcIiOna+HpsEd
	 J2y4s3sNyJrTGguUC93o/mIJEVuFJ+oXJCzK7xJBATvLmAqCYrzLIumVQoDQUI6Zo3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794999621;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vEoi4P7BQr8rHpfacdOlQuPPdzVB1aHJRvkDt1Kpjuc=;
	b=QcUGGEOf3uatUHPkeTh5D4w4m/4kujpY7Fm6OA59qYa1p5haKe6h6o71bbgVPDiZQuRb
	 qa6lfM03bPTDSUiPlp1Y+ivi4n/y1B+ZFS/7zjg2kfOG2PzD+et7OOfVt92a2Cl9Lpgvd
	 /IW9H2mzl9TiEIqjktfqy2HTZyD8qumWUsrIR9hqOPUx0Jvix7SDefCO5tv+kgz+fAtr4
	 lWk+K2Rs+Lh6/Pg6u0eyo+B9VQZHyWAZkELiCnu5js+QU60czE1FJ7DLvtB6MHYSkvohz
	 udeg8qQP1Vsl7kpgV/+xCsLinOahVumnUhN1ghv+m0A8EqLaaBRR2ceOw6tTsZZo7cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DD9F1F000CE;
	Wed, 18 Nov 2026 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999621;
	bh=vEoi4P7BQr8rHpfacdOlQuPPdzVB1aHJRvkDt1Kpjuc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=h167uyuxGBHw2dhL6UZckpyOy8yLt80U2IaeqOv2eZ3pJbWN4FHQ+DX8xS52SYtg9
	 /NlJoJBwjI76/bm2HJHrJmMtSQuuUKxdHEcF/UGUeIkArMVmt0pwGQ2yHwRr8Zv+bh
	 pcLXqjYsPHgPC6v/nAXXAcpRgR63WJ9XrdxAvI8FSafQwN/VMtHOTsZ6DJNPXLp5a/
	 xGsXTP2KM8YghyGTLZD0qX+yaixCUBTy5AbBwbXHSyTDMxFDtUjujo1XGaamtwhC9S
	 Dg8EzG2EPhFt0gHoKjuOEwsco6Szkd4EZAyAngrkeajEUimjk6malT6G09A6k0QB4r
	 Jq6gVxInkOR6A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A05E4AD36;
	Wed, 18 Nov 2026 11:00:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 18 Nov 2026 12:00:19 +0100
Subject: [PATCH v8 5/6] arm64: dts: lx2160a: describe the pad muxes as the
 DCFG RCW override
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-5-d01bc837593e@free.fr>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
In-Reply-To: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794999615; l=11060;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=Zq2ZELCjBC2i/jGfOicU5lCYjF3qK07tZfqYcnwzjkc=;
 b=MoX+KjH+bwxkY2/c5qppeaBm5H5a0NnGFoIv1MfCIoGy+Y/JzM7Gj9VCUwXJ3R8rkN7XxrHeN
 LR47L/Q3d4aCli2iGAJdXk2VipsIP4ILUFigdeSahLYPYHOvJ85+Xdt
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vincent Jardin <vjardin@free.fr>

The pad muxes are fields of the RCW: read-only in RCWSR12..14, changed
at runtime through the override registers in the DCSR view of DCFG,
which read 0 until written.

pinctrl-single on those registers, since commit 8a1365c7bbc1
("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery"),
clears every other field of the word with its first pin state:
a board whose RCW programs a non-zero pad mux loses those pads at the
first I2C probe.

Describe the pad mux as a child of the dcfg node, which gains its DCSR
view and, as on the LS1028A, the addressing of its children:
the child is at its RCWSR12 to RCWSR14 and RCWSR27 windows, one group
per RCW field, one function per encoding, driven by
fsl,lx2160a-rcw-pinmux using fsl-guts. Labels and pin node names stay,
so no consumer changes.
The pinctrl-single node goes.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 377 ++++++++++++++------------
 1 file changed, 202 insertions(+), 175 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index 2085362ab0eac..b0bb7bf944059 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -669,9 +669,209 @@ clockgen: clock-controller@1300000 {
 		};
 
 		dcfg: syscon@1e00000 {
-			compatible = "fsl,lx2160a-dcfg", "syscon";
-			reg = <0x0 0x1e00000 0x0 0x10000>;
+			compatible = "fsl,lx2160a-dcfg", "syscon", "simple-mfd";
+			reg = <0x0 0x1e00000 0x0 0x10000>,
+			      <0x7 0x00100000 0x0 0x10000>;
+			reg-names = "dcfg_ccsr", "dcfg_dcsr";
+			ranges = <0x0 0x0 0x1e00000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			little-endian;
+
+			pinmux_i2crv: pinctrl@12c {
+				compatible = "fsl,lx2160a-rcw-pinmux";
+				reg = <0x12c 0xc>, <0x168 0x4>;
+
+				i2c1_pins: iic2-i2c-pins {
+					function = "i2c";
+					groups = "iic2";
+				};
+
+				gpio0_31_30_pins: iic2-gpio-pins {
+					function = "gpio";
+					groups = "iic2";
+				};
+
+				ftm0_ch10_pins: iic2-ftm-pins {
+					function = "flextimer";
+					groups = "iic2";
+				};
+
+				esdhc0_cd_wp_pins: iic2-sdhc-pins {
+					function = "sdhc";
+					groups = "iic2";
+				};
+
+				i2c2_pins: iic3-i2c-pins {
+					function = "i2c";
+					groups = "iic3";
+				};
+
+				gpio0_29_28_pins: iic3-gpio-pins {
+					function = "gpio";
+					groups = "iic3";
+				};
+
+				can0_pins: iic3-can-pins {
+					function = "can";
+					groups = "iic3";
+				};
+
+				event65_pins: iic3-event-pins {
+					function = "evt";
+					groups = "iic3";
+				};
+
+				i2c3_pins: iic4-i2c-pins {
+					function = "i2c";
+					groups = "iic4";
+				};
+
+				gpio0_27_26_pins: iic4-gpio-pins {
+					function = "gpio";
+					groups = "iic4";
+				};
+
+				can1_pins: iic4-can-pins {
+					function = "can";
+					groups = "iic4";
+				};
+
+				event87_pins: iic4-event-pins {
+					function = "evt";
+					groups = "iic4";
+				};
+
+				i2c4_pins: iic5-i2c-pins {
+					function = "i2c";
+					groups = "iic5";
+				};
+
+				gpio0_25_24_pins: iic5-gpio-pins {
+					function = "gpio";
+					groups = "iic5";
+				};
+
+				esdhc0_clksync_pins: iic5-sdhc-clk-pins {
+					function = "sdhc-clk";
+					groups = "iic5";
+				};
+
+				dspi2_miso_mosi_pins: iic5-spi3-pins {
+					function = "spi";
+					groups = "iic5";
+				};
+
+				i2c5_pins: iic6-i2c-pins {
+					function = "i2c";
+					groups = "iic6";
+				};
+
+				gpio0_23_22_pins: iic6-gpio-pins {
+					function = "gpio";
+					groups = "iic6";
+				};
+
+				esdhc1_clksync_pins: iic6-sdhc-clk-pins {
+					function = "sdhc-clk";
+					groups = "iic6";
+				};
+
+				fspi_data74_pins: xspi1-data74-pins {
+					function = "flexspi";
+					groups = "xspi1-data74";
+				};
+
+				gpio1_31_28_pins: xspi1-data74-gpio-pins {
+					function = "gpio";
+					groups = "xspi1-data74";
+				};
+
+				fspi_data30_pins: xspi1-data30-pins {
+					function = "flexspi";
+					groups = "xspi1-data30";
+				};
+
+				gpio1_27_24_pins: xspi1-data30-gpio-pins {
+					function = "gpio";
+					groups = "xspi1-data30";
+				};
+
+				fspi_dqs_sck_cs10_pins: xspi1-base-pins {
+					function = "flexspi";
+					groups = "xspi1-base";
+				};
+
+				gpio1_23_20_pins: xspi1-base-gpio-pins {
+					function = "gpio";
+					groups = "xspi1-base";
+				};
+
+				esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
+					function = "sdhc";
+					groups = "sdhc1-base";
+				};
+
+				gpio0_21_15_pins: sdhc1-base-gpio-pins {
+					function = "gpio";
+					groups = "sdhc1-base";
+				};
+
+				dspi0_pins: sdhc1-base-spi1-pins {
+					function = "spi";
+					groups = "sdhc1-base";
+				};
+
+				esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
+					function = "sdhc-spi";
+					groups = "sdhc1-base";
+				};
+
+				esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
+					function = "sdhc-data4";
+					groups = "sdhc1-base";
+				};
+
+				esdhc0_dir_pins: sdhc1-dir-pins {
+					function = "sdhc";
+					groups = "sdhc1-dir";
+				};
+
+				gpio0_14_12_pins: sdhc1-dir-gpio-pins {
+					function = "gpio";
+					groups = "sdhc1-dir";
+				};
+
+				dspi2_cs31_pins: sdhc1-dir-spi3-pins {
+					function = "spi";
+					groups = "sdhc1-dir";
+				};
+
+				esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
+					function = "sdhc-data";
+					groups = "sdhc1-dir";
+				};
+
+				gpio1_18_15_pins: iic8-iic7-gpio-pins {
+					function = "gpio";
+					groups = "sdhc2-data74";
+				};
+
+				i2c6_i2c7_pins: iic8-iic7-i2c-pins {
+					function = "i2c";
+					groups = "sdhc2-data74";
+				};
+
+				i2c0_pins: iic1-i2c-pins {
+					function = "i2c";
+					groups = "iic1";
+				};
+
+				gpio0_3_2_pins: iic1-gpio-pins {
+					function = "gpio";
+					groups = "iic1";
+				};
+			};
 		};
 
 		sfp: efuse@1e80000 {
@@ -1531,179 +1731,6 @@ pcs18: ethernet-phy@0 {
 			};
 		};
 
-		pinmux_i2crv: pinmux@70010012c {
-			compatible = "pinctrl-single";
-			reg = <0x00000007 0x0010012c 0x0 0xc>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			#pinctrl-cells = <2>;
-			pinctrl-single,bit-per-mux;
-			pinctrl-single,register-width = <32>;
-			pinctrl-single,function-mask = <0x7>;
-
-			/* RCWSR12 */
-			i2c1_pins: iic2-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 0x7>;
-			};
-
-			gpio0_31_30_pins: iic2-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 0x7>;
-			};
-
-			ftm0_ch10_pins: iic2-ftm-pins {
-				pinctrl-single,bits = <0x0 0x2 0x7>;
-			};
-
-			esdhc0_cd_wp_pins: iic2-sdhc-pins {
-				pinctrl-single,bits = <0x0 0x6 0x7>;
-			};
-
-			i2c2_pins: iic3-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 3)>;
-			};
-
-			gpio0_29_28_pins: iic3-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 3) (0x7 << 3)>;
-			};
-
-			can0_pins: iic3-can-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 3) (0x7 << 3)>;
-			};
-
-			event65_pins: iic3-event-pins {
-				pinctrl-single,bits = <0x0 (0x6 << 3) (0x7 << 3)>;
-			};
-
-			i2c3_pins: iic4-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 6)>;
-			};
-
-			gpio0_27_26_pins: iic4-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 6) (0x7 << 6)>;
-			};
-
-			can1_pins: iic4-can-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 6) (0x7 << 6)>;
-			};
-
-			event87_pins: iic4-event-pins {
-				pinctrl-single,bits = <0x0 (0x6 << 6) (0x7 << 6)>;
-			};
-
-			i2c4_pins: iic5-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 9)>;
-			};
-
-			gpio0_25_24_pins: iic5-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 9) (0x7 << 9)>;
-			};
-
-			esdhc0_clksync_pins: iic5-sdhc-clk-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 9) (0x7 << 9)>;
-			};
-
-			dspi2_miso_mosi_pins: iic5-spi3-pins {
-				pinctrl-single,bits = <0x0 (0x3 << 9) (0x7 << 9)>;
-			};
-
-			i2c5_pins: iic6-i2c-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 12)>;
-			};
-
-			gpio0_23_22_pins: iic6-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 12) (0x7 << 12)>;
-			};
-
-			esdhc1_clksync_pins: iic6-sdhc-clk-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 12) (0x7 << 12)>;
-			};
-
-			fspi_data74_pins: xspi1-data74-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 15)>;
-			};
-
-			gpio1_31_28_pins: xspi1-data74-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 15) (0x7 << 15)>;
-			};
-
-			fspi_data30_pins: xspi1-data30-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 18)>;
-			};
-
-			gpio1_27_24_pins: xspi1-data30-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 18) (0x7 << 18)>;
-			};
-
-			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 21)>;
-			};
-
-			gpio1_23_20_pins: xspi1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 21) (0x7 << 21)>;
-			};
-
-			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 24)>;
-			};
-
-			gpio0_21_15_pins: sdhc1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 24) (0x7 << 24)>;
-			};
-
-			dspi0_pins: sdhc1-base-spi1-pins {
-				pinctrl-single,bits = <0x0 (0x2 << 24) (0x7 << 24)>;
-			};
-
-			esdhc0_cmd_data30_clk_dspi2_cs0_pins: sdhc1-base-sdhc-spi3-pins {
-				pinctrl-single,bits = <0x0 (0x3 << 24) (0x7 << 24)>;
-			};
-
-			esdhc0_cmd_data30_clk_data4_pins: sdhc1-base-sdhc-data4-pins {
-				pinctrl-single,bits = <0x0 (0x4 << 24) (0x7 << 24)>;
-			};
-
-			esdhc0_dir_pins: sdhc1-dir-pins {
-				pinctrl-single,bits = <0x0 0x0 (0x7 << 27)>;
-			};
-
-			gpio0_14_12_pins: sdhc1-dir-gpio-pins {
-				pinctrl-single,bits = <0x0 (0x1 << 27) (0x7 << 27)>;
-			};
-
-			dspi2_cs31_pins: sdhc1-dir-spi3-pins {
-				pinctrl-single,bits = <0x0 (0x3 << 27) (0x7 << 27)>;
-			};
-
-			esdhc0_data75_pins: sdhc1-dir-sdhc-pins {
-				pinctrl-single,bits = <0x0 (0x4 << 27) (0x7 << 27)>;
-			};
-
-			/* RCWSR13 */
-			gpio1_18_15_pins: iic8-iic7-gpio-pins {
-				pinctrl-single,bits = <0x4 0x1 0x7>;
-			};
-
-			i2c6_i2c7_pins: iic8-iic7-i2c-pins {
-				pinctrl-single,bits = <0x4 0x2 0x7>;
-			};
-
-			/* RCWSR14 */
-			/*
-			 * IIC1_PMUX is a single bit at RCWSR14[10], but bit-per-mux
-			 * uses the mask for the field to clear before applying the
-			 * value.
-			 * So bits 11 and 12, which are reserved, are written as 0
-			 * on every mux switch, it is harmless.
-			 */
-			i2c0_pins: iic1-i2c-pins {
-				pinctrl-single,bits = <0x8 0x0 (0x7 << 10)>;
-			};
-
-			gpio0_3_2_pins: iic1-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
-			};
-		};
-
 		fsl_mc: fsl-mc@80c000000 {
 			compatible = "fsl,qoriq-mc";
 			reg = <0x00000008 0x0c000000 0 0x40>,

-- 
2.43.0



