Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B983606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CwJQkRjD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmLIMU2Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4zGs0MAu44uv8puUtDn6PZJN2reOO3lIQ7Rpp8dP37c=; b=CwJQkRjDDB2PgC
	5qssAFtQIXi3bKwPaHQOWtkl1JPFeU8vxuhSltCxW+P9A783hLVgHvO8j/Mou4aAuEk2f5PbZQ9fd
	wbAJkcHlmd5hw/1yPDJ/Lje6ZGuwoAivM9+CvaNE+2qRQnBT859zsXYyCfkF3HZo1b+ZxHB+ofv8a
	O87/rn3vF4jWxTepDsnbSTVNQs+xAlBoVX1OuY6Hel5yvcNxxVLrEGlt5GRFGCRzuc/H5uG3c1Klc
	sYXQfZgu+SUCmqJVxNVdDK11OnxcFWRCIrES4VLkFK6XSD3HSMc6sRiw2It2UWaKDdpSvfsY62ku+
	qy3OxilULrrRqcyIFXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ar-0000000GLQd-0zyo;
	Sun, 08 Nov 2026 15:51:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Al-0000000GLLA-3ASE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB5D3605CE;
	Sun,  8 Nov 2026 15:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016101F008A1;
	Sun,  8 Nov 2026 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153070;
	bh=4zGs0MAu44uv8puUtDn6PZJN2reOO3lIQ7Rpp8dP37c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kmLIMU2Zs5VQ8rnhydBGXjw5NhlMmAwJ3Mhs8ZOFqtiCT7YlPQcBKXRyhOWsbQOot
	 QCbm0whgwTDgFZ7fi2+P6q2B+zAjhcRC+Yz71h8eJMHbQcRuDMiDEd4qSdhy+Q34Xt
	 u/LbIUsk/2pXPOo9ynJru8SpCFnPPOtB55582dn8BrhlToqnl1DfcGiiBjdDzaNW4E
	 ltFo2pETX6yhaY5QR88DElUAwGbQXMQAQBFwrXxBDZfUz6msCHwugLEz5T7nZN4B+T
	 QcQWcZIaEw1ViFAIBcsTzft4pm/ENy1rFAT467PCmF8emRhqWT9hkpaPc0TyAc4Crz
	 RG4GU699hXuIg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:05 +0100
Subject: [PATCH v2 09/15] ARM: configs: u8500: Update media support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-9-13b701e66cbd@kernel.org>
References: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
In-Reply-To: <20261108-ux500-defconfig-update-v2-0-13b701e66cbd@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

Build Video4Linux as a module while disabling unused CEC, DVB, radio,
platform and camera driver classes.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 9dd60ff4192e..eb1236ad8f4d 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -154,9 +154,16 @@ CONFIG_MFD_STMPE=y
 CONFIG_MFD_TC3589X=y
 CONFIG_REGULATOR_AB8500=y
 CONFIG_REGULATOR_GPIO=y
+# CONFIG_MEDIA_CEC_SUPPORT is not set
 CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_CAMERA_SUPPORT=y
-CONFIG_V4L2_FLASH_LED_CLASS=y
+# CONFIG_MEDIA_SUPPORT_FILTER is not set
+CONFIG_VIDEO_DEV=m
+# CONFIG_DVB_CORE is not set
+CONFIG_V4L2_FLASH_LED_CLASS=m
+# CONFIG_RADIO_ADAPTERS is not set
+# CONFIG_MEDIA_PLATFORM_DRIVERS is not set
+# CONFIG_VIDEO_CAMERA_SENSOR is not set
+# CONFIG_VIDEO_CAMERA_LENS is not set
 CONFIG_DRM=y
 CONFIG_DRM_LIMA=y
 CONFIG_DRM_MCDE=y

-- 
2.56.0


