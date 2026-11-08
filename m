Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD60606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wkWMay1J;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tvzs50se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VNa7mfJ80kd2SaYgow1VrwKJvKqH4vPk2SeTmAsK88o=; b=wkWMay1Jx2Fjzj
	Dzso/aFXz0OYmGUSzXiLy+mf1IASotvlsaj9hWkJ/2a6QnBgF/Qx4ZGozfPwstMJ6JTvut74horca
	wIbE7k30g4aMhv3R9aMZy731hvNkYaijVhIGbL9UN3kvCHmGsqYVQ1+xt2HOAdRNDMEogciqViwUT
	etPd8oDbBgxZO6eY57PoYLVD7Jx81RQzzGPGHI3YzzM7I397yenIWCuWF6IrJ5b84BqLyU60wIQ/F
	4K5txbdb5ayaSBvix7/W5X9PxM5/p1nKaJWqN3nqT7O/4mpKXF0TZf+wwAoukuBeJUCbgFl3xBn2q
	AjxTQYJ1/C+CNljRJ34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ar-0000000GLTR-3xBI;
	Sun, 08 Nov 2026 15:51:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ap-0000000GLOF-1sVT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 393F843E52;
	Sun,  8 Nov 2026 15:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9751F0089F;
	Sun,  8 Nov 2026 15:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153075;
	bh=VNa7mfJ80kd2SaYgow1VrwKJvKqH4vPk2SeTmAsK88o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tvzs50se6tOkT6ekLaZ2npbYUGsdA4o+EIJw/gzxfzBZPR07O/okHG3JgdOJlrrOO
	 mQgLJGZdwrstDClEeq7015Mnh4LuTWbiD228TI+74zWz0/fEsuyIX2/MWtwXlkD60k
	 1Tv0ZFLyuApbNTT9uSoMEuYFC07tyNnI1Ku5veXvjRhmgaGD0dpUw8lDcbpXQX9drf
	 ixHi3voj7gFf22G4cgXCTlo18IjXx+bn3HR/YfsNU6AxG4XrNILPw19ic2kQUDiwWF
	 DvERLi+g5QGKDrV78NkFZbjPb68BImMjuc76wVXfL72oMvrP4woVsn9OKXhX3iAbnN
	 gVYnwDQ4trMrg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:51:09 +0100
Subject: [PATCH v2 13/15] ARM: configs: u8500: Update debug and CoreSight
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-13-13b701e66cbd@kernel.org>
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

Expose the running kernel configuration, build the CoreSight components
as modules, and disable unused generic debugging and runtime test
facilities.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 704bc2290411..15cf96e4fdcc 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -12,6 +12,8 @@ CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_PSI=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
@@ -272,12 +274,13 @@ CONFIG_CRYPTO_DEV_STM32_CRYP=y
 CONFIG_XZ_DEC=y
 CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
 CONFIG_CORESIGHT=y
-CONFIG_CORESIGHT_SINK_TPIU=y
-CONFIG_CORESIGHT_SINK_ETBV10=y
-CONFIG_CORESIGHT_SOURCE_ETM3X=y
+CONFIG_CORESIGHT_LINKS_AND_SINKS=y
+CONFIG_CORESIGHT_SINK_TPIU=m
+CONFIG_CORESIGHT_SINK_ETBV10=m
+CONFIG_CORESIGHT_SOURCE_ETM3X=m
+CONFIG_CORESIGHT_STM=m
+CONFIG_CORESIGHT_CTI=m
+# CONFIG_RUNTIME_TESTING_MENU is not set

-- 
2.56.0


