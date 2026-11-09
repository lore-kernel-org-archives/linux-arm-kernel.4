Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0081606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ySIJtdJL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wm61kTRA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pJzY35+Iq1WY5o8SwGQBlJsXXYfxvzqCFf4SStexuJ8=; b=ySIJtdJL2YY/rshDtHW1t6oQ6f
	InbOSig2fJ/J+VMMWFcBOLOZJFV5GtpMffFlEIujP0AmablHfRkXFOJaoz8/x/avDwBcHPi9Klfg+
	AYZ1QDHloJQ3IRSWVzcC5HFligoTORVtsPxsX6G+ud1voHWNVJM5qNm1B+LXHkopceH1WCRt+fOsu
	LDZLyBL4cnn/CsAMx9lgHeCEgMoKwwulHvODpZ5ARRNIUOojfHLl84iQyhXTvmjWe8F/yHAJLwTLi
	iwHNwVw0Dz69oG5kh/PshTKI14G1TidP3tbDxetfGxEFP71zsi1tiIF7yuh19jD7HptKtDtvlNA+K
	VogvGP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGKb-0000000HFkb-0Ei5;
	Mon, 09 Nov 2026 03:46:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGKa-0000000HFkD-2C44;
	Mon, 09 Nov 2026 03:46:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F3306611E2;
	Mon,  9 Nov 2026 03:46:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794195962;
	b=JD/C/0ZoKT5fd9yma5QiqbU2D1fGGGhtXcy22Ru8/BTRF1mlDhxPAmwCUPAkcMdD2U4j
	 Raq4m5QqyX/STkgywDZICZ17t/5UbYuchXuQLGQwRNjI4ALriASH8MXNnkTSKqQ664qum
	 kHWQnHtwyfii1lxJ12qEkBcc+Gywgpvpa5xgfPmP8UowJ/YH94ssNIAsdtdoV9+u2UcG1
	 STZ2RpTFpWjm8822xUR0sbHnhJLyToKz2U7TvtTnwLxDBuAHadedvg+D0c6JTA3GZJa+E
	 rM3CNnRv7cxMAJWxzqRDzTEiwhPwl+ZA3lghQVKyEYV8z6kysInYXTS4EHWxok7kW9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794195962;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=pJzY35+Iq1WY5o8SwGQBlJsXXYfxvzqCFf4SStexuJ8=;
	b=qoToWs05at8uPNKmmGuwO0luB77Ru1xEn6kEyDqBnyx8Llm65Byp5zT0jkQZW52x9MHb
	 utix3dQdP9kJRNkq8iSFWXq16ornNg26prGXwAAtoejvoUrRXzU0qlNI8/1V0y4N9gumF
	 e3bdjYc65w8S3YniQXBXZlK84gjieVvUFfwiEQFzVhsyjrIn6Y4Oapq4Cxp2t1Rq8Vlwh
	 0KuHbQ1dIQu5asVhxqEhsvVcVg3DN0DvZ9i02Mmzu5uWNo1tYNBb2fMXD0p/NIXBuiRXp
	 L0R0DXbSQ9e0pE5HOTic8ZX6ylKQtRGmk2H/xVj47J4Zd/XJLnqFK3617DmtP4ryTMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1FF5E1F0089F;
	Mon,  9 Nov 2026 03:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794195962;
	bh=pJzY35+Iq1WY5o8SwGQBlJsXXYfxvzqCFf4SStexuJ8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Wm61kTRAVF0xchiB9hWNx6ek03/7njs5z7oVR5BooNuBXeNzMW6nQXa7KQTWHlC37
	 AjJdcjHF25L/gpP8LnLPisRAf0rKNqard3T5cOtjUZ+mjhV9fkOQ4EXMvguYL7270g
	 MmI2pPlhqqoQxNnE2tonekEoL3bhlYJ7COkm1eiv+s5PS+7oa2A80V2+vKbnvJdK8h
	 2jh64skhy40G2NIRiYzmXrxWrW3A87BXSTAwKRvYCaVtaxcMwoBb+XykY6Evk8m7Wt
	 SrP0QxuBAfHMeDH8Y3QxCf9XLNK/W13Y8NTwT40AA6R78nhqotnG50vR7TxWI9f8gb
	 9u2YdY/R7RSow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9F7664826E;
	Mon,  9 Nov 2026 03:46:01 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Mon, 09 Nov 2026 03:45:58 +0000
Subject: [PATCH] arm64: dts: rockchip: Enable SDR104 on the Kobol Helios64
 SD card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261109-helios64-sd-uhs-v1-1-ef8fc370d282@iav.lv>
X-B4-Tracking: v=1; b=H4sIAPVB8WoC/x3MQQqAIBBA0avErBtIk8iuEi1CxxwIC4cikO6et
 HyL/wsIZSaBqSmQ6WbhI1WotgEX17QRsq8G3elBqc5ipJ0PGQyKxysKWqMNhV4F60ao1Zkp8PM
 f5+V9P9MS6/thAAAA
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=dC7wpDaNbCjkiANOAYK+QKZwUz9weOXO+ehiRLkJWy0=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkfHX9I/uZ4N0sia0uS55ILh0VNsmYbVFUmHvgnJ2pys
 NVwqu3KjlIWBjEuBlkxRZYJhzRuZSy5+tffw/wBzBxWJpAhDFycAjCRywEM/+OEa00n7HvzzvxX
 oMBxhck7s6OEUn5dXbKXy1lfkGv/tQcM/xRfRk9cMMnGicWyffGChzM+aQk0LZ1Q6dozrYBFImv
 TfSYA
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

The SD card I/O supply vcc_sdio_s0 can switch between 1.8 V and 3.0 V and
is already described as vqmmc-supply and as the sdmmc I/O domain supply,
but the card only runs in high speed mode.

Allow SDR104. With a SanDisk 32 GB card it runs at 148.5 MHz, and direct
read goes from 23 MB/s to 53-66 MB/s.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on Helios64 with Linux 7.3, its device tree plus this property,
and the U-Boot and .config of Armbian, PCIe host driver not loaded: 15
warm reboots and 3 cold starts, SDR104 at 148.5 MHz each time, no SD
errors in dmesg, a written file read back with the same checksum. One
card only. Writes stay at about 11 MB/s.

Armbian kernels carry this property with PCIe enabled. In their console
logs tuning sometimes fails when it coincides with the PCIe probe, as on
ROCK Pi 4, and the retry reaches SDR104 every time. The cause is not
confirmed on this board; async probe, applied as
https://lore.kernel.org/r/20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv
is not tested in this combination.

A normal reboot powers the card off, but after a watchdog reset or a
panic the card stays at 1.8 V. An SPL that does not set the SD I/O domain
from vcc_sdio_s0 then fails to read the card until a power cycle. Armbian's
U-Boot does this (such resets 8 of 8, on Armbian's DTB). The board is not
in mainline U-Boot yet; v2 of
https://lore.kernel.org/r/20261021-b4-helios64-v1-1-74afe8aa6d72@iav.lv
will carry it. Kobol's U-Boot is not checked.
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index f13ea2df7a30..35153e84f206 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -781,6 +781,7 @@ &sdmmc {
 	disable-wp;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
+	sd-uhs-sdr104;
 	vmmc-supply = <&vcc3v0_sd>;
 	vqmmc-supply = <&vcc_sdio_s0>;
 	status = "okay";

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261109-helios64-sd-uhs-9424ef31f9c8

Best regards,
-- 
Igor Velkov <iav@iav.lv>



