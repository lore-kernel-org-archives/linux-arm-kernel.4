Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zRZsQhqq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iw6aThOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6/DLXPBrbtU9LS1HF/M0qfXTXxbdB8QOPCEhdcJtkX8=; b=zRZsQhqqVUe3V9
	OunextypE4iPu4H1HcnAEP4KXsXDyfgHwgfgapTpScJefYwZNC8ZWOK0Yu7xw+epoVQ1nFsuc24YY
	f5ulZcAnxG9gt9kng5JdANIb7wlYMda2l6uYjea8Zs6umfTl8cXJa2PjO9XusK+CYHM3wYG2h4iYZ
	C9YmqOenE3atIXvf3jc2GpcAnzT8E+Ya50pfofLujVbJ1Jhcndmn4YdO8guYrWzzzVNDkmdljPCDK
	JNhSpKxGjIJo+zuVFPO3lITwwyRUf1MsbisAQmkjL6CnQP3Po8dw0uiioKDxseYfHLK+iFXNh/9fP
	Yqdo299bVzP/NMi6e5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ah-0000000GLH1-1MBL;
	Sun, 08 Nov 2026 15:51:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ad-0000000GLFS-0tF3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1F6743BD2;
	Sun,  8 Nov 2026 15:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F261F0089F;
	Sun,  8 Nov 2026 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153062;
	bh=6/DLXPBrbtU9LS1HF/M0qfXTXxbdB8QOPCEhdcJtkX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iw6aThOn1ViNvpibA1ISr9snYq0qCRBXC3ZyRTtz0hwba33oMq2U7czkLeh87g2bc
	 blfOQUm4+3wKI9LAmjVJjj3JWyCmXUzayB66lKnVX14zQZgSsX5ts1WuGhJXf99wkR
	 D/nX7/aQ/yP9qMsROLt+J20EHMVBR40KLwq/TCJx9En24N7Cb8LKWvDHHen7IrbG07
	 3VH/P2oPoIbUB98ASUBWalmtOGTxoOKRRhKMB0Vz/qcgfrYA7xZC4aGHSPIRxnOQaA
	 Cp4qkC4DJnWemnAEv6hCGTv0OavcZDbhiDXrJ395Qx6sHHZN1QkB14hO5vMuJuD7/6
	 ZhMPTmspyNkOQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:50:58 +0100
Subject: [PATCH v2 02/15] ARM: configs: u8500: Update scheduling and
 accounting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-2-13b701e66cbd@kernel.org>
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

Select preemption and enable task accounting. Drop the ondemand CPU
frequency governor in favor of the default governor.

Use the timer events oriented (TEO) cpuidle governor for U8500.
Leave the MENU governor disabled so its higher rating does not keep
it as the default governor when TEO is enabled.

Enable pressure stall information so userspace can monitor CPU, memory
and I/O contention.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0614445fdfe4..196968747912 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -1,6 +1,15 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_PSI=y
+CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_U8500=y
@@ -11,9 +20,9 @@ CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CMDLINE="root=/dev/ram0 console=ttyAMA2,115200n8"
 CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_GOV_ONDEMAND=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_U8500_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y

-- 
2.56.0


