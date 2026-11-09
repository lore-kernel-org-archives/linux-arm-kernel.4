Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D010A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c17mf7HW;
	dkim=pass (2048-bit key) header.d=picomail.one header.i=@picomail.one header.a=rsa-sha256 header.s=mail header.b=gHpbuhBN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cXbJk2INOtDbIQpp5ZPiMsPF5rN/iKWVctoi+2geGYo=; b=c17mf7HWzQCU0RRkBIvXLoQJsB
	zfkvR51t2+zFJsNUkab8p0jPZaE+nljgegfCHnEtheBbeN7D4FUKDU5M6uwcmtFovcKUMQfPC7DJR
	4dFxy9zzrFIZyacUfnhNQGaR1pDwYNKLQcQcWfxDjKddmefoOYS0UJMKWJcvJVdl5YtzYcM9y7pfJ
	KZCkvIk96v0f7CG8UCNoTjIIrXIJTYYE2TxIAE3ViN/nIZ0J/0jUQw6wQ+XKJgm3UyUzStDuVS48f
	hLvgujmEnInEqXe8YEyNqO7dbP0/IQIdARNNFqxdPyl81BqQGPeO7OjDT3liLDDTxN/WGjsx+cOmj
	LxdesRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQhz-00000000zB6-22su;
	Mon, 09 Nov 2026 14:50:55 +0000
Received: from mail.picomail.one ([2a13:7e80:0:3d1::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQhx-00000000z9x-1LTt;
	Mon, 09 Nov 2026 14:50:54 +0000
From: Jonathan Schmid <kernel@picomail.one>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=picomail.one;
	s=mail; t=1794235843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXbJk2INOtDbIQpp5ZPiMsPF5rN/iKWVctoi+2geGYo=;
	b=gHpbuhBNgY/RTmYVoFBqFHZ+iIeeulOWb/8hr/zhuVyid+3RigOTD/xGsnBu6M+YXy3+8y
	4U+YjLn5S2JxWWrHuPDZFD5+YuxQL+5nNLaUWm7mv2Ao2jDlPcGGzdL1uGkZRCaMlmMz8M
	D5XZm7Y6lMnTc/vs4CjR8r0KGdhNP9TsAdErFZWcR/rttC4VtdAPN1/Rdhyuz9UWdqhMkP
	SvLihVgkBvwRpgsZHJBPUFIK0aZCdt8EDshpPOJMtPrhCYewJFIMXn3bzgbS2zazTJa7Bf
	vBoZT0ZHYXyZJHqQKkZe28SEd4SiMLQ1p13r9M9P/5/eALWbKJ/pEiq8z4uE/w==
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Schmid <kernel@picomail.one>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Pull down the eMMC data strobe on RK3576
Date: Mon,  9 Nov 2026 15:50:22 +0100
Message-ID: <20261109145022.75261-1-kernel@picomail.one>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_065053_508910_E6787A5F 
X-CRM114-Status: GOOD (  13.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The eMMC data strobe (DS) is only driven by the card while it sends data
or the CRC status token; in between, the card releases the line. RK3576
configures emmc_strb with pcfg_pull_none, so DS floats between
transfers.

In HS400 the host samples the CRC status token that follows each written
block with DS. With the floating line it misreads the token now and
then: the write ends with a data CRC error and is retried. Nothing is
logged and the data ends up intact, but the errors show up in the
controller's err_stats in debugfs, and write throughput drops.

On a board with RK3576S and a 64 GB eMMC 5.1 in HS400 enhanced strobe
mode at 200 MHz, mainline shows about one data CRC error per 16 MiB
written (1123 over 18 GiB) and writes at about 50 MB/s. Changing only
the strobe pin from pull-none to pull-down at runtime gives 0 errors
over 15 GiB written and about 176 MB/s; the drive strength and the pull
of the clock pin made no difference.

Pull-down is the reset value of the pad, which the vendor kernel keeps
(its eMMC node has no pinctrl), and RK3588 already uses pcfg_pull_down
for its eMMC data strobe.

Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
Cc: stable@vger.kernel.org
Signed-off-by: Jonathan Schmid <kernel@picomail.one>
---
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
index 98c9f8013..2ce5e1bfd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
@@ -613,7 +613,7 @@ emmc_cmd: emmc-cmd {
 		emmc_strb: emmc-strb {
 			rockchip,pins =
 				/* emmc_strb */
-				<1 RK_PB2 1 &pcfg_pull_none>;
+				<1 RK_PB2 1 &pcfg_pull_down>;
 		};
 	};
 
-- 
2.55.0


