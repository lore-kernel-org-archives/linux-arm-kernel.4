Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431660A3809
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qWN9sJdF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhNainQ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=; b=qWN9sJdFFMjUbC36axUriDd8ZB
	55En6ZAV0ThmCrC9DoFUACkpTcgEXuOECEZdi5XFbhioV138BeKuequJuyGiKlFhwUklIgvsZbo6s
	pouuF13IbCO3TdMkkRyW13d5AT3XzwWTpEyRRCgz0GwDD0VK1izUIxOXTU3FpdRSmaxTNqvr2KG4R
	Sz90K5QiNNI3++iOXoajY7ldjMtS9jhUSi1BQcypQz0NGqR9u+b67gidTY/+TDA+LSR5Z78snMpcW
	rOzyvdFUleZOkRvjtqEk5GxtE2ZcAdni3WS7gjvsLQ5zr2xssOGjqW75rIEP/UEyEqd6rF1gK2J1V
	IrwSoAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88L-0000000DGaK-3GEA;
	Thu, 19 Nov 2026 19:49:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU88K-0000000DGXS-0iNX;
	Thu, 19 Nov 2026 19:49:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 919EE471A9;
	Thu, 19 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117763;
	b=xbN0wfuetxI9o7tITwX3XTqmCbUFV34EizETsMKuktfTzqHJful5xVPmiLzF1E74QdiQ
	 0k/0+VcExVg56t1QBXGSp+C3hu20gRxtruVEHHRtcD5Vz+6Eb7E83JWs/RtaIn0IMZTDk
	 8WlVd8/Oe0FiB4QgblbARBr8dM7MJnwqxxPKlaF0vu/rX9qTWct7f8gsEJVpgePdwV8AZ
	 p51W175H/I35C5G32dJdx7ihyc32JhxlZ5uOZWswgpeHyTn7HWRRJaOJhBGZWf/iL451E
	 6FC9Z2s6/Bpxw/YZvi0flc64DxGAI65rUDmANLEEE67kGJhaLx1rm1VQSgTjSPOfoRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117763;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	b=jwgaTFbehMP690PVdGc+AAVXWILpVwqp1gN2HrDF+/qmu/qdeymUxwiYHqXxeuDNatRU
	 G+OWwPoxT40NjUwL2aDQbP8ahhkNrXhCKfEyMesDyRnMVugaDapaYIqCSZCO6Unt8bja9
	 yXXMksqlj7DYP+IZCOSWqtp5npv1GoGRM7gkc3YPA+MydwYUt9FFHrMpGtgsIWwsDIJwT
	 L5deioeYDFHcsacyGznQndcOMCp6Kl9eGey45fchZY/Y4D/zzgFoDHn68b+YHkkOx0ibB
	 g+QKHkKAXWNfN3z0eR99X11UMXg6/TXYp08Tp7G7m4HR2q43jmstXUPX4S4/W5tOmnQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70D061F000CB;
	Thu, 19 Nov 2026 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117763;
	bh=NLcacHh2AlI+z6F4X0aPUFEo3odgTr28TBoLjE+0958=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BhNainQ7RuGC5Xcmp9oIjCoZDtP9KgW8b/oFSBA2U2e5G76XdI5LZPtM2Ne15Wz44
	 pvGj0LWhGFGrba2WmnKmRpRdZfLNln3dYAqj16CCtKa84alQzMjB9UtnWEc4+jNQaA
	 QDTgGYftTWPLnln8xstBhwyLucBDn2jSBRZBJ0wWT4AORBiUvbprJFqAGufWY74Z5+
	 Ni5EQkC0Ih+qXmIk6P6KrgU3iDPaAsAX/tE11ADwEWl5ZQRbcWQIsGuNaXTAVl+anr
	 TJR4plFZX+v26JmwVr9h85yJjGu8ITTxU1w+jbf0bAnyeMGpD5Erm4G5bDQie1igQ/
	 tRWP6MDLJ+eLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A38C54B414;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:22 +0000
Subject: [PATCH 6/6] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 FuelGauge support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-gta3xllte-usb-battery-v1-6-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=1850;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=8/qztykzuOZxhphrQU0aaqpVGh+Y9V0/eepwjkmIL64=;
 b=21d/ypEdBDsGYrW/vcomA2ptJ+BSgDPuTOUObjThbEmYwTq/Bf9mVhfYVzfITsCVthjbT19Q6
 lE79g+pF+x/A02WDaQ+kJJFTZNSLX4Ht+dfeEFqjN9i3PwmH85FBKKk
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
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
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Umer Uddin <umer.uddin@mentallysanemainliners.org>

The Samsung Galaxy Tab A 10.1 (2019) has a S2MU005 Multi Function Device
(MFD). It contains PMIC, FG and EXTCON. This commit enables the FG, to be
used with a simple battery device to allow for battery percentages to be
reported.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
index 57df878cb563..1c0af6f89396 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
@@ -22,6 +22,13 @@ aliases {
 		serial2 = &serial_2;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <6000000>;
+		voltage-min-design-microvolt = <3300000>;
+		voltage-max-design-microvolt = <4350000>;
+	};
+
 	chosen {
 		ranges;
 		#address-cells = <2>;
@@ -86,6 +93,20 @@ cont_splash_mem: framebuffer@ec000000 {
 	};
 };
 
+&i2c_0 {
+	status = "okay";
+
+	fuel-gauge@3b {
+		compatible = "samsung,s2mu005-fuel-gauge";
+		reg = <0x3b>;
+		interrupt-parent = <&gpa2>;
+		interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
+		pinctrl-0 = <&fuel_irq>;
+		pinctrl-names = "default";
+		monitored-battery = <&battery>;
+	};
+};
+
 &mmc_0 {
 	bus-width = <8>;
 	cap-mmc-highspeed;
@@ -112,6 +133,13 @@ &oscclk {
 };
 
 &pinctrl_alive {
+	fuel_irq: fuel-irq-pins {
+		samsung,pins = "gpa2-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
+	};
+
 	key_power: key-power-pins {
 		samsung,pins = "gpa1-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;

-- 
2.56.1



