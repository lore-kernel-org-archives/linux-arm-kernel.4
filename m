Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950D606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RHmZsGZ2;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Jp5Z5iRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yDzaN8zNsYziiwwWnbzFQP17MdrMEIb33bW6UntLbrs=; b=RHmZsGZ2RXKTJmXathMdGgCA3W
	3jpAc12Toigp9k1oThpBoOa+u7aFRwZzbJW/KkYKvg6sdx6S8VOolf4sOjpu17gEpiGE/2fUGyyLt
	I2I4aa0jMfRv8tBKEy2EKOWN/jlzmmSUKwkploRPE1CdmJmjuaQZK6CWGYkTtU1v2VONigUL88Qm/
	wqW7wiaBT7wfJusprRgFmYz52lISZa9Z/0uiKJpZk3PzWZTPcvi3V0jNHQXgLry39eiUnFW9XHaY+
	h2l0OUSAprKcBJmGF93L7COnU5U3plzoxcOG/kBIBsTCuL7+bq+o6Gq1AX6SHF1M6gXiDxwN/X/JD
	pDY88nvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEnm-00000004vao-15Uw;
	Tue, 17 Nov 2026 08:44:30 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEnj-00000004vaH-1paW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yD
	zaN8zNsYziiwwWnbzFQP17MdrMEIb33bW6UntLbrs=; b=Jp5Z5iRzxtZlMcS2ld
	xFWPzopOzl3JXot4N0gjTFrK67x/ou5zovgVSab0aEAweoZKIznyuHGrBvvesnm1
	9BzkX86Q0teBISC4r1wHXQpM53oj3+rco7NJon5zVIEBpwtw+egI/P7askQHnzke
	Gb0ZXnH/UhDLvsAITjDpxMPRY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3X6evE_xq9TawGQ--.54072S2;
	Tue, 17 Nov 2026 16:43:29 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: sstabellini@kernel.org,
	linux@armlinux.org.uk,
	jgross@suse.com,
	boris.ostrovsky@oracle.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	oleksandr_tyshchenko@epam.com,
	david.vrabel@citrix.com,
	konrad.wilk@oracle.com
Cc: xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] xen/grant-table: fix resource leak in gnttab_init()
Date: Tue, 17 Nov 2026 16:43:25 +0800
Message-Id: <20261117084325.1241735-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgD3X6evE_xq9TawGQ--.54072S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy3ZF45uF4kJr1fAry3CFg_yoW5WrWrpa
	9xAryktrWrW347tFWaga4v9FWrCa97G3yIkrWUZwn8Zan7GF93Jr4IqFyjvr4kCrWkAF4S
	y3srKr15Jr48ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziO6pDUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hHKOWr8E7GLtAAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004427_843018_4056FC46 
X-CRM114-Status: GOOD (  12.64  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For x86 PV guests, arch_gnttab_init() allocates virtual address areas
and PTE pointer arrays for the shared and status frames. These
resources are not released if the subsequent gnttab_setup() call fails.

Add arch_gnttab_free() and call it on this failure path before the
existing cleanup. Provide an empty implementation for ARM, which
is also used by ARM64.

Fixes: 162e37171276 ("x86/xen: safely map and unmap grant frames when in atomic context")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 arch/arm/xen/grant-table.c | 4 ++++
 arch/x86/xen/grant-table.c | 9 +++++++++
 drivers/xen/grant-table.c  | 5 ++++-
 include/xen/grant_table.h  | 1 +
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/xen/grant-table.c b/arch/arm/xen/grant-table.c
index 91cf08ba1e95..69db80877bb5 100644
--- a/arch/arm/xen/grant-table.c
+++ b/arch/arm/xen/grant-table.c
@@ -56,3 +56,7 @@ int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status)
 {
 	return 0;
 }
+
+void arch_gnttab_free(void)
+{
+}
diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index 5f4060b5a40d..0a89e43d804d 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -149,6 +149,15 @@ int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status)
 	return -ENOMEM;
 }
 
+void arch_gnttab_free(void)
+{
+	if (!xen_pv_domain())
+		return;
+
+	arch_gnttab_vfree(&gnttab_shared_vm_area);
+	arch_gnttab_vfree(&gnttab_status_vm_area);
+}
+
 #ifdef CONFIG_XEN_PVH
 #include <xen/events.h>
 #include <xen/xen-ops.h>
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 957500dd309a..fc18fe4cf7a3 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1696,7 +1696,7 @@ int gnttab_init(void)
 
 	if (gnttab_setup() < 0) {
 		ret = -ENODEV;
-		goto ini_nomem;
+		goto free_gnttab;
 	}
 
 	gnttab_size = nr_grant_frames * gnttab_interface->grefs_per_grant_frame;
@@ -1707,6 +1707,9 @@ int gnttab_init(void)
 	printk("Grant table initialized\n");
 	return 0;
 
+ free_gnttab:
+	arch_gnttab_free();
+
  ini_nomem:
 	for (i--; i >= 0; i--)
 		free_page((unsigned long)gnttab_list[i]);
diff --git a/include/xen/grant_table.h b/include/xen/grant_table.h
index a33a60a2ea72..a635cadb61f1 100644
--- a/include/xen/grant_table.h
+++ b/include/xen/grant_table.h
@@ -203,6 +203,7 @@ gnttab_set_unmap_op(struct gnttab_unmap_grant_ref *unmap, phys_addr_t addr,
 }
 
 int arch_gnttab_init(unsigned long nr_shared, unsigned long nr_status);
+void arch_gnttab_free(void);
 int arch_gnttab_map_shared(xen_pfn_t *frames, unsigned long nr_gframes,
 			   unsigned long max_nr_gframes,
 			   void **__shared);
-- 
2.25.1


