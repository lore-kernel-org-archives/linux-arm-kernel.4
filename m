Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5471606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 03:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7obJEVM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBqlW9rD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RLS/jgeLOKWzdwCj4pd6cH1OV040FEIUeXWjXTT8HNQ=; b=R7obJEVMWWlOs18UHuXcmn3yMS
	zpD3yUjfsVDXt8cL331mlkwZfbFYaOVctSj6oIW1zeHeizeXUBAk1jiOcDxowMNDJNlqX9r7H/jvM
	go05CGQPy9HtlV05Jh5GTNjn8IFGOLwV0/Jt5yQUsgvbnBzZ2hkC8U2s3sFDdq4F3fZRtk+VlF4w/
	HEl7tayDM9TYLrSUVx4eVdOwvduz1YlijReiwTLgUX56yvbBcRqv0NHYVTqvyOotkM7bgy6LhY0/S
	Thu9uVn8T/3Jzm94R3Ue8pR4VKK5mvabBs5nWmYV72y1medqF8cEyWMScYYisUV6ySFX2lowLDM3/
	WcZDgMug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmUA-0000000EqUy-0AyJ;
	Fri, 27 Nov 2026 03:18:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmU4-0000000EqSL-1xEj;
	Fri, 27 Nov 2026 03:18:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70945609F1;
	Fri, 27 Nov 2026 03:18:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749526;
	b=e4korflbKEDIjFigjhScfZfLtgSFxm4lm27qXC/3nB5k+f9pvkiHddb4JZH5V9FdtBrh
	 Cux+TxU7u0mYjnI2hRFHBuoWm+TzKyds2wYiSIdGiYPFHFj9XaYOzJZ5uQuiK5XAyuxro
	 CI5zPcPP8QcFGN+zpgnzMN04Gy36VmliI1xtKJ6hjmHIiCgmc/pk9huMedpgdhwQ9lyh/
	 SkAtpAgEq/2vw+ZjkQQPCH9sOFz5wxiddtQijo4s46NVjg9uoioF/X2iHVLPNI0Rzszp6
	 XPMUNF0jZYrFROTxxcUqT5Yrs8n7WoUFQTW/Rh3qwEYKpfOQzqpsdapfxsGeshBJJQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749526;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=RLS/jgeLOKWzdwCj4pd6cH1OV040FEIUeXWjXTT8HNQ=;
	b=gczHxEDDVOfT01di7uB93ZcLyBPq3cGjmAhp8XlYhx/hp+eEbBbgGAgWOczZTfAbenfj
	 YiD7P7yASbOYY94nVkshyO3XH8MeyKvpimrXFZeMnAyeLt2zQLMhrLuw87TjZbDLdqcGj
	 MSNkwvCKloGLow29pGI8SK+epFOWT0lIaMeKo6bs0oW2qC4WHYPd1mXK5zUyY0HFTP3ki
	 TUItrqTH45boDM8y41DL2rbJ4jm8j50XSXPPIY83cVslXpkfqLHcJMLdRJhFu2gzBhSru
	 FTTrOak5Ot1zfXYiSWbzP/DuC8SEcCWz2uDmx3naSHCFaDTHvZ9vz+2EOYb8GgL24oA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8DD991F00898;
	Fri, 27 Nov 2026 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749526;
	bh=RLS/jgeLOKWzdwCj4pd6cH1OV040FEIUeXWjXTT8HNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jBqlW9rD32146Ipn6m40cEcD47cHMfrhpyLWEyk2SCJoSjGXWeuF0/9qeegFMIoU4
	 1ObyYo1MbfWR1a91GcAFgH7V+9e3SVqTqxd18UGK8kObKht3wQcp5AHJ1TFiWPrpg2
	 DkyZfh/MH51G66N3P0sJKGoLgjMDYEcH+L4/CmicD3gbZA9Jkt/F8a3m5quVe0MKCn
	 N7zH5l4w9ChPtWl5t6QyDbAGYpP9ewql8pVZnrPd4SxGUG7odTV0Djy5F2kKjsV4RJ
	 0LpITjn0FFYpNTJktGao/YyVMeu25Da5ilKJmyPdv4ftlNAYy58y6KbfpqxZ1auF95
	 I0Q6At2HY5Ygw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 16C894B52E;
	Fri, 27 Nov 2026 03:18:39 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 03:11:13 +0000
Subject: [PATCH v4 2/2] arm64: dts: amlogic: a9: Add IR controller support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-a9-ir-v4-2-666dbffa76da@amlogic.com>
References: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-666dbffa76da@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749517; l=2083;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=uVqKmngtre8D85X97L1agM7jjiKqs/7e0xWwzs/gfjw=;
 b=pCMZyrl08wLePSDn6u5KyW7SMYCc5s/bKxbV+N3aS79/qHC+myZpTSGUT1o30oFIeP6N/YWpv
 574BTWNgzApDw8ucmciYdAYLSe5QEJIxoaJB1PCgLPNNbLoPYgD4NLX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the IR controller node for the Amlogic A9 SoC and describe the
corresponding remote input pin configuration.

Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
proper pinctrl setting.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
index a6b380ca47a5..389c9de3dc3c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
 &uart_b {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index 91f4cf319b0d..b1766ea57c2a 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -246,6 +246,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+					remote_input_ao_pins: group-remote-input-ao-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_ao_intc: interrupt-controller@4080 {
@@ -259,6 +266,13 @@ gpio_ao_intc: interrupt-controller@4080 {
 					394 395 396 397 398 399 400 401 402 403>;
 			};
 
+			ir: ir@14080 {
+				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
+				reg = <0x0 0x14080 0x0 0x30>;
+				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			uart_b: serial@1e000 {
 				compatible = "amlogic,a9-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.52.0



