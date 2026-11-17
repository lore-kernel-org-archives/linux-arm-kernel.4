Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91644606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IjYr12Tx;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KOnDB1Gg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fEXjbUD3amkNKeHH7e/GPwXDSWv2ghLrxMI2EJ9KtIY=; b=IjYr12TxD+EBEl
	Rtzled5RLZugSRoAMPqkEZWDrM7qP/W9OmUeAmpjZMV8Hz/6WE6ANKOkik9mNT6d/AyUtrvGmKMCp
	Z5oO/8/MGddXHNnefCAwhGlYKcSrEr4JHZeO9e7diUps+ybLiKTi/xOwv5XHEp9YH5XhdhBg6jlPp
	5eBY/aSocG5h6zrd9nCjEha7CtT+DWCjUeanRIwtpadTXbUwAw1aBKmv2i+5S9kWQjd81YaArk8O4
	RLbU8da1chHPakKcUJSscxjOEY49RKwf2tD0dLkDW3fGoMLyzzS6I4Wqr3gpipstRsJyarbFoSpoO
	rI5ZE3nVuOsFOb6GP4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIvA-00000005qVy-1T9n;
	Tue, 17 Nov 2026 13:08:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIuk-00000005q9L-45XC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 13:08:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 671BE1A162D;
	Tue, 17 Nov 2026 13:07:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CFB65FC81;
	Tue, 17 Nov 2026 13:07:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19FA011BC0008;
	Tue, 17 Nov 2026 14:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920874; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fEXjbUD3amkNKeHH7e/GPwXDSWv2ghLrxMI2EJ9KtIY=;
	b=KOnDB1GgE7MLArtta/b25Xnbi3iTBg3GvvDpSueA7h+TE1sz1Kdwcd0zkTF2fNMWqv0fXd
	S25TzKR6jvBsiRyxapr/xrymMXPUOlj/dv354Q9Bd2zM6BWyaITdtwOiy39opJ4lPy4Ymv
	zHxS3pitBs126PvEnuYKtqNZK5yYwwL/2J21pI8hP8w1Ht0Yo7oEBrxhGQiviAMjSA0gJS
	pxGggCqVlH7UOor/N0211lHzK+vJRUKRBoVn3qIlkntYUZRSNX5+qQ6z2nMtKlYCYDE7ie
	jdWEkGO04F3wNZvks/Mtg+m2v18IRIX9zEfGWkksTOjh8zOFSaO4HSEKUm4BqA==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v6 3/6] arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Tue, 17 Nov 2026 14:07:34 +0100
Message-ID: <20261117130737.141993-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117130737.141993-1-richard.genoud@bootlin.com>
References: <20261117130737.141993-1-richard.genoud@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_050759_680311_F37BEADE 
X-CRM114-Status: GOOD (  13.32  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Declare a carveout memory region to store LPM metadata on J7200.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index d65f68c7d432..a6043970715a 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -47,6 +47,12 @@ rtos_ipc_memory_region: memory@a4000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a4800000 {
+		reg = <0x00 0xa4800000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -99,8 +105,10 @@ &mcu_r5fss0 {
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 	status = "okay";
 };
 

