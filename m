Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E680606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fMZfNbEm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8X6098/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u54rEfb520SwNzNNfSnZJAnzlYWMToY3fokyxB+VcEw=; b=fMZfNbEm9C7ZSr
	+EvuPaqVjDWWPmCfnpzJ59aYnpQq3X650liTTxP5xKCUTNgX13NOzPSRsrLN9lwCreIPaV/yAxwKl
	EDJNRgwgF3zZl4y0yFu//80Wvnn2w+NIU3wcj9vbCzLJ8UoCHDkFME9QJhOcY5/JIFAlrJ9krlB2t
	YdKDpHXr8HEeQdFoqofcOlPlE/bLAACdk/jYVdbNuotCZDWauENkAnAUsYSLZ0CAuNhdw+O35P9yF
	WPJy9TmW7tR1mLGkP/WqQpHB61pRZKoV+MsKUyD2lMTUoqMoIFsWXv+8LW7I6eK4Ly43yVp4tAbbV
	LGx+BXgWLY9/Wcc0/CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ah-0000000GLHR-1mBv;
	Sun, 08 Nov 2026 15:51:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ5Ae-0000000GLFj-1KpD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 15:51:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19E5D42215;
	Sun,  8 Nov 2026 15:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6261F008A2;
	Sun,  8 Nov 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153064;
	bh=u54rEfb520SwNzNNfSnZJAnzlYWMToY3fokyxB+VcEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R8X6098/h8rj4iEP5MaIB2LNvJAZQGncNdQv5+ORygfjJqlLONt9SwBwSynFtBDNv
	 NZpznHRcVTkmhoVFoZHObMN+C+D6HfbC/hi+ngkDovaq5T9yAd0B2ReAvQKkyfczX8
	 cIdGNyisbWCUVjPC9CJaS8sC7X5BZghci9Rgzgyt0aYthna6Mth9naC+/taxfsSbGF
	 26FLpc3ektrrYurP9Aij2ZAt2OGef8Y+rHR58rf4AyB9EqWYVvKatMWmR08oPD8ahY
	 fFqQgMU5YvQ5aNuzCJtRCtXFSlBV0kSyQ8e3ebhrdNQQ44H6G1G0YSpZAe4MSryEVn
	 FLCoNhhhYzf0A==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 08 Nov 2026 16:50:59 +0100
Subject: [PATCH v2 03/15] ARM: configs: u8500: Enable control groups and
 namespaces
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-ux500-defconfig-update-v2-3-13b701e66cbd@kernel.org>
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

Enable the memory, block, CPU and BPF control-group facilities along
with user namespaces and checkpoint/restore support.

Add POSIX message queues, the cgroup process-count controller and block
I/O throttling for distribution and container workloads.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 196968747912..4d0bb77fab7f 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -1,6 +1,8 @@
 CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -9,6 +11,18 @@ CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_PSI=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_PIDS=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_PERF=y
+CONFIG_CGROUP_BPF=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
@@ -29,6 +43,7 @@ CONFIG_NEON=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
+CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_SWAP is not set
 CONFIG_CMA=y
 CONFIG_NET=y

-- 
2.56.0


