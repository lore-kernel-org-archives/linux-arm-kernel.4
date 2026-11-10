Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36246606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JYUCPYcQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5woi9aA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cvnXzh/efi9WtiQF53c/L1AOqMpNaz59Ad1/m2E/GHk=; b=JYUCPYcQffaatLh/qHtB+wyqMO
	teZTsvNUuy1FH5fjWh1u7pqUE8OinAmRwnNsJEFdmmwfDrHLQGld9zzvmQM6slKH7I2USA0pCdVfW
	aIc+c5YA88uoTU7gRsO/GOx5snRPTcAQp7f3zfEXN+I+crNC0Rd//bveARXz3/rqTwfCPPrANQlmw
	wm44cCSTLM7UuTtrNMsuN7nlB/2dxi/Xsf6enLuOzUqy/aXJiSdJGODAIsUdIJ1ggUCssBDoiFBEz
	m8w4dqDmlD5YPvFKm1RBBcfWwGGbRid8pQfFbolWEMd8IIgLUE4GxRL+GchI+4ABpNzNq2H6DRRuH
	Gejhm2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbvz-00000002Cda-3DrS;
	Tue, 10 Nov 2026 02:50:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbvy-00000002CdF-0xAv;
	Tue, 10 Nov 2026 02:50:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E161403D0;
	Tue, 10 Nov 2026 02:50:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794279005;
	b=HkWJp3dN3bPcWkGcNa51GuPtkf3vveyOXqO542kEZK+7fpYVhjg3eJst6Gn55gdR0UEi
	 7eqaWgW2AcuUc7KiyAXlZA0AUCSPbGLkDBdFPX9RYvv9G2o/4NcOWdgTUTflWGQRyhJKi
	 Om+Hl4kWVtSWuCbOh6Dszdm+uodX6Hv6/aGiijOP7FMagGQOVWvsdiB6BTsuooidfr7tQ
	 gz7k9aeXs5EuHNgMXe/n3v3Xm8qrgdU0NCanr+8EBILHOok89bEy7L82K+SO4n3UIvxud
	 lKAD20n2whf5pm9idFrsw4kaEPbNtGqVstHX5WNE7udSsjJMukzkU/5KqL3uhUD1gLQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794279005;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=cvnXzh/efi9WtiQF53c/L1AOqMpNaz59Ad1/m2E/GHk=;
	b=sx2o9zcNtPg9Ui4uVFqQI0Qha6ao2cUJCU52dHZnN637ENKBsAGFAzk0E/cyCzw+/mF0
	 3voeXXR4LtjLYpTo1DKO/Qbra3yFYyY2BMsy4QSsgxr9W5tizaZir+8IPGgBKhn/opfx/
	 4QkatUMTYyv1ouxLzqIy3hBxAEcomSd+rJVSyvlq6YAzNYqRzLZkO4qrcGToIKCdkLNSs
	 JdzoJCjTYKPyS384ToroP8NcRU0kXuM5LMdCPiyx4dlXg2YujAFmJFuQFrC4OeJLg4FpA
	 MpYem0wlK3eGBzaOFN9lxacxcNQZdquiMkRd7HMrmFPOMZ2PTDKZa6QPvgQtvPKxQkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 056431F008A2;
	Tue, 10 Nov 2026 02:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279005;
	bh=cvnXzh/efi9WtiQF53c/L1AOqMpNaz59Ad1/m2E/GHk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=F5woi9aAlFi8Llc0+haPwKizbAi19rFnofw2murvP3XYSUdD4VmWmbxeNu1KbBzCJ
	 2yycd548ROFgSR2UsZhm/uEOmJPE8vipp56X5XgZFVeQY8bY0yHfZzCJlh1goiScUH
	 Wn9Gh40AxG75dIXav6paHwsjYAfA9GtoqiFWlOX+QnnDam/FwcZjXjodpe2mqfecvE
	 iTENfRQkH3HlQ2I3h7X3GnHwMS1QeUe7wH95vz/cYt9Qnvq5uEhboOqbV+wvrWyH+G
	 Qv8oPZSmImXvTUkvrk5LMVogUmwxgB3Zk6hxS3Odo9/gHoeLG3hA0VQ9ZYhaV8aEGQ
	 w/o07rSwk13WA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8557D4878A;
	Tue, 10 Nov 2026 02:50:04 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 10 Nov 2026 02:50:01 +0000
Subject: [PATCH] arm64: dts: rockchip: Enable SDR104 on the ODROID-M1 SD
 card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-odroid-m1-sdr104-v1-1-8edc6d5c1bf6@iav.lv>
X-B4-Tracking: v=1; b=H4sIAFqG8moC/x3MPQqAMAxA4atIZgOJf6BXEYfSRs2glRREkN7d4
 vgN772QxFQSTNULJrcmjWcB1xX43Z2boIZiaKgZmJkwBosa8GBMwZg6XAeh1pHvnR+hZJfJqs+
 /nJecP7EZavRiAAAA
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=qnYQwjnRjrYCEMA3SHfY2+DFHlJaSH/TMsn5Af6nh14=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmf2qInZi0x0TBUjGFZfEd0j8Vikydvzr+ZEWZx+0Daj
 ReMh3+XdZSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJtFgxMmwxtXqmcaHfyfmt
 WtfeFasLt5424FNcwX/snvzEilnvvCwZGXb6Pb90ZsqCt+zXziwLDdVQdFlz76vypO9nOvoPOO1
 IvcsHAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The SD card already switches to 1.8 V, but only SDR50 is allowed, and
clk_sdmmc0 on RK3568 is a mux without a divider: dw_mmc-rockchip asks
it for twice the card clock, 200 MHz for SDR50, the mux rounds down to
the 100 MHz parent and the card runs at 50 MHz.

Allow SDR104 instead; the MMC core still falls back to SDR50 for cards
without SDR104. With the 150 MHz max-frequency from rk356x-base.dtsi
the clock comes from the 300 MHz parent and the card runs at 150 MHz.
Hardkernel's vendor kernel already uses sd-uhs-sdr104 on this board.
With a SanDisk 128 GB card, direct read goes from 22 MB/s to
58-64 MB/s and direct write from 20 MB/s to 47-50 MB/s.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested with an Armbian 7.3.3 kernel (rockchip64), the property added to
the DTB with fdtput: reboot, sysrq-b, watchdog reset, poweroff, s2idle,
deep, hibernate, hybrid-sleep and suspend-then-hibernate; the card
re-tuned and came back in SDR104 at 150 MHz in all 29 runs.
---
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
index ec43dee18094..6f77e73abc8e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
@@ -610,7 +610,7 @@ &sdmmc0 {
 	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
-	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v3_sd>;
 	vqmmc-supply = <&vccio_sd>;
 	status = "okay";

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261110-odroid-m1-sdr104-f6e03a0c5ac9

Best regards,
-- 
Igor Velkov <iav@iav.lv>



