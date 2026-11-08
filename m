Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C664606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ynR3J1P5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgGYvL2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qfisVVDNgGmbUcceJbM/Pn4bTngvvfB/OkGx5qb7SrA=; b=ynR3J1P5SkCiiB
	dopJjWerppPx4QC4betmAzRe1JQx/Vltk/82U3C7PGfOAyfTnakuF7s2bu+YAQy1kcy4OUX2RhnIf
	d0Lm8D0mAvAn/XosJQG74Qm93zpDOU53z/sxhlubjpx98NUA7+OJOQm4O3aGPo433xxvm6xgbxVwJ
	9nZCr6iFOtY+m9RH9jQ7FNiGi7/93so+p2wn/Lv0+fP5D646QACtAxGiebGxffhUOZnbyWOwibOiw
	w+PH5VJ2EwdaHgQY+1aN+drr+WzS4quylUG2X7iOf1DnpM4IgGQQDV3K9vKvofp9d/A1r/fj3+X5e
	XF+m8YrOM6YqdXA2yjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ar-0000000GLSA-2RkM;
	Sun, 08 Nov 2026 15:51:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5An-0000000GLMo-31aC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DDF460008;
	Sun,  8 Nov 2026 15:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3739E1F0089F;
	Sun,  8 Nov 2026 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153072;
	bh=qfisVVDNgGmbUcceJbM/Pn4bTngvvfB/OkGx5qb7SrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PgGYvL2LZwSZWdBk1VnhQM4/nmiSUz8hPvyZf/fQrHcO8ffLqpjtS8g26SCGKQvly
	 RFl2pK6edKBM3aqbWJYrYOnJstaE6oHmK+ncRIKQ2m6kTQrNZkOTXKs11BjtcAoU13
	 tZXO3mpGB6VxvJ+e/cYQ6egbAsQuBiGI7hThD/PUd7ESUb/ySLaGYC+FtKCgGB6jp/
	 iJ5DljHjVKV7aGCfFik2UMKNoGBZVBFrL1V+xRHLQVd+O/E/3G48STAI9Vb6DqCs6V
	 zdVyJE3cNwrpWyatuo3XBPc4Ke9EcCkXhI7lK4qB6/Y0us+llbTkSSDMCdXLXCJ+R+
	 i8ydrf/XIouNw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:07 +0100
Subject: [PATCH v2 11/15] ARM: configs: u8500: Build IIO sensors as modules
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-11-13b701e66cbd@kernel.org>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Build the accelerometer, gyroscope, light, magnetometer and pressure
sensor drivers as modules. Enable triggered buffers for sensors which
need buffered acquisition.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 782fc1444bac..ec9a8e3c107b 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -215,25 +215,26 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXTCON_FSA9480=y
 CONFIG_IIO=y
+CONFIG_IIO_TRIGGERED_BUFFER=y
 CONFIG_IIO_SW_TRIGGER=y
-CONFIG_BMA180=y
-CONFIG_BMC150_ACCEL=y
-CONFIG_IIO_ST_ACCEL_3AXIS=y
+CONFIG_BMA180=m
+CONFIG_BMC150_ACCEL=m
+CONFIG_IIO_ST_ACCEL_3AXIS=m
 # CONFIG_IIO_ST_ACCEL_SPI_3AXIS is not set
 CONFIG_IIO_RESCALE=y
-CONFIG_MPU3050_I2C=y
-CONFIG_IIO_ST_GYRO_3AXIS=y
+CONFIG_MPU3050_I2C=m
+CONFIG_IIO_ST_GYRO_3AXIS=m
 # CONFIG_IIO_ST_GYRO_SPI_3AXIS is not set
-CONFIG_INV_MPU6050_I2C=y
-CONFIG_BH1780=y
-CONFIG_GP2AP002=y
-CONFIG_TSL2772=y
-CONFIG_AK8974=y
-CONFIG_IIO_ST_MAGN_3AXIS=y
+CONFIG_INV_MPU6050_I2C=m
+CONFIG_BH1780=m
+CONFIG_GP2AP002=m
+CONFIG_TSL2772=m
+CONFIG_AK8974=m
+CONFIG_IIO_ST_MAGN_3AXIS=m
 # CONFIG_IIO_ST_MAGN_SPI_3AXIS is not set
-CONFIG_YAMAHA_YAS530=y
+CONFIG_YAMAHA_YAS530=m
 CONFIG_IIO_HRTIMER_TRIGGER=y
-CONFIG_IIO_ST_PRESS=y
+CONFIG_IIO_ST_PRESS=m
 # CONFIG_IIO_ST_PRESS_SPI is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y

-- 
2.56.0


