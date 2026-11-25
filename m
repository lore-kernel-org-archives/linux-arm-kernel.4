Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7182A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nR4L8odv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iz8yFJcG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yN6sorU/+V+/y3FUt4PkhSOz62znNRL5ZJduK+CC3yw=; b=nR4L8odvZ29YhG3r7tLEsCjSdR
	4IjO7ihMoh6gA/zpef7Jrc15fpzRUgTlpJIwYSSh6cvMxNCL4onLYoTJC20+BQWA1vfs7lkk49zyv
	/9xYiUEsGNVT42LVQ8F8pT12elE/22wx4618vnkamYrneEXQc5N+bNNvx6v7VDC7jDco7Gc0QQpEr
	ZrQrfEUzU2zzlVDg3J3NjSn5RcgfAbb7/qCi4TLkyuf2k3yJi9r4LZ1tGmej+15LKUzlZ6WZsbHgw
	KP8SUgVbyKqlmTWldQ3A6QXJsqiWes1I6aDKWDKzVOhnNO5hqxxC48y/pvV4SiVn8AyDyvz3Q5Jrs
	51VhLoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6P8-00000008elF-18P5;
	Wed, 25 Nov 2026 06:22:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Oy-00000008eif-0ap4;
	Wed, 25 Nov 2026 06:22:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B5846060F;
	Wed, 25 Nov 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795587762;
	b=nzp4RRl7WuBrtJObMTont1sKLeq3qAmsievJjGzRmgGbN54KwFHnoeYh8cAewxI7sk7z
	 p8WUjuJ6TomsZFvUl7QXX9V+LHNDoLLz6OPw6LtukyODdRzFJTQvW1A5PqqfNDI/XVBu4
	 LPZ9vctNxep91aQhJNqlWn6oLxlOT4KuL9Qe8GkQysP8/0M3O38leYBNZEPzrTMRNAz0w
	 kHonyDwLaJbwEeCfANgPcdLp5xKRpBGfP5t+VLdaBKGkdHZ2p1V4X/At79ylxyNrL70mW
	 Xxm5aRmhDGiE0D1PSFDWGryQBnRCUBiIaT2ReeUrHRhBLl3EjRHyBKrTU7hpEWUOzTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795587762;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=yN6sorU/+V+/y3FUt4PkhSOz62znNRL5ZJduK+CC3yw=;
	b=hMClWBJ8ZPxlGy0J6NkQ344BcMEYmilFyA8hBUQ8yDJ+8ArzD/SumpvjZ9RmNDVasjJJ
	 z4kk17kaVQOmt6XFj0cc/I3hI+z1odg1E3peG3uNv62/ffVWtj9tMxB3N3FTuL+JnM1/y
	 JQIGkrPzftawZyXEj3J6UHMSpiHsVe6TgFd9z35akJAr8eVwU15gRsVEbkQ3MK1Dr0OMD
	 EQNzqBJ9eJc4F3FGO0DlYaXK6em6pPW2cqSnt30kE0PwkOHI+ht7n+MqMtQwehU6U1cTW
	 /FS10OmYBvg0UaziCSSsWaiahEoT703QCUV6iqmUKJoBjEAV3rwXYJkWj+zGbH2UrLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0732B1F000F2;
	Wed, 25 Nov 2026 06:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795587762;
	bh=yN6sorU/+V+/y3FUt4PkhSOz62znNRL5ZJduK+CC3yw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Iz8yFJcGjycrx82YfeygoMRskP7QpN88ZMzQMfHUQIncIT3RlfI5d53NccBmKuDy8
	 7cHI7PcP/oC/ByWmT1XVW5oKVCFOUJ6LCfy4U6oCkoySMp73vCIaSLD6TpIkSTR1pG
	 P6hqT9KpqyxojZwCtb8UpHjLof6b1kuPVuFuWoLEBbEG/7S0K2KY0029y/IVgPHQ1i
	 s+8/cKvXl+2pXsMWMdfbLAjCHgrZ1k26IOLB5rlhuhwQnom9RVhXbdSLdyte0RTiSV
	 z7p8gH9khBJ6Jxumta1JUKv5rQUMGYrGngvmV4t5HRoCG9reH67Uo0t+YN4P+CDEIP
	 HfvL/FmEzErmA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9484F4CD3C;
	Wed, 25 Nov 2026 06:17:49 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 25 Nov 2026 08:17:43 +0200
Subject: [PATCH] arm64: dts: amlogic: meson-g12b-odroid-n2-plus: enable SD
 UHS modes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-n2plus-sd-uhs-v1-1-cc2019e68da8@iav.lv>
X-B4-Tracking: v=1; b=H4sIAIZ9BmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNT3TyjgpzSYt3iFN3SjGJd8zQTUwPzJFNTYzMTJaCegqLUtMwKsHn
 RsbW1AMWaA5xfAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>, Dongjin Kim <tobetter@gmail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=QFes7H4ehieglLItkfgr4kYTQK7rp6WUcLDiwVP/k2s=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNlstR1RXhcXX5uev6Fur7Ks5LLQgykv7evK2TVvv6m45
 VOc1i7XUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACbSGM7IcP1e8CrDSHebFxZ2
 p/o4v3Gu+Ht7ftHltVGLpqaXCfA97mH47/h32bzrcd4bPn/Yc8cw6271txDD+RpJ9n6/2rT/vdh
 7lQMA
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

The ODROID-N2+ (board rev 0.5 and later) feeds the SD I/O rail from an
FC8731 LDO that a GPIO switches between 3.3 V and 1.8 V, so the card can
switch to UHS-I signalling. Enable SDR12 to SDR104 and raise
max-frequency to 200 MHz, as meson-sm1-odroid.dtsi already does for the
ODROID-C4/HC4.

Tested on an ODROID-N2+ with a SanDisk 256 GB card and a v7.3-rc6 based
kernel: SDR104 at 200 MHz, reads at 86 MB/s instead of 23 MB/s in
high-speed mode. 20 warm reboots, 10 of them with the BootROM loading
the bootloader from the SD card, and 4 watchdog resets with the card
left in SDR104 at 1.8 V all booted from the SD card again. That is the
case for which commit 663bfe77b6f7 ("arm64: dts: amlogic:
gxbb-odroidc2: remove UHS capability for SD card") dropped UHS on the
ODROID-C2.

The ODROID-N2 (rev 0.4) uses an RT9179 with other divider resistors; by
the schematic its 1.8 V setting is about 1.9 V. This is not tested, so
the ODROID-N2 keeps high-speed.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
index ce1198ad34e4..1f49686f359d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
@@ -15,6 +15,14 @@ / {
 	model = "Hardkernel ODROID-N2Plus";
 };
 
+&sd_emmc_b {
+	max-frequency = <200000000>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+};
+
 &vddcpu_a {
 	regulator-min-microvolt = <680000>;
 	regulator-max-microvolt = <1040000>;

---
base-commit: 36f28822232ae35d36ccd2587e333db1ac961ff7
change-id: 20261125-n2plus-sd-uhs-7f4507b55364

Best regards,
-- 
Igor Velkov <iav@iav.lv>



