Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D8606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qVBIiuV5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dIGDXGok;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mFu6qDpc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=; b=qVBIiuV501rjOkcARqrvCRu5vn
	xWP/L0gS3Vkj8ra487DCZE6wrfbdhg9npfwvEJp6E5UwfVlOQ/ytLaxQa6HnoeXFbYcnePAsEFzk2
	OLXf1Sytg2Q64nj5U5ZLJ/faf+20kuL9D9dFhB/zLZxu8Pipi80rkCXetL2JWoXwzD50Omnawq1Vw
	oZzkbcwSaCXgt3m229ECfCPBRCh4nmNGmMcQPFPjT+vAPDnzL0zrwFOz3rmbEXmHao5+N4RErm8po
	9R064GPq4xSOg9fVCPf21VwHs2kN3H3SgDE2Hlb60/lA2h+c7WIfiQK7pVacP4Lz44am9P+HB2jBe
	ATSBCqmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ1-00000001YcX-1Ahl;
	Sun, 22 Nov 2026 18:45:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYr-00000001YTF-0XXa
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=; b=dIGDXGok7FENvk/8vnwMGN4WUR
	I4dK+9e3D+OA2PsaPb0agvCkTSVV4y+l8CanzoUsLM1S5HslO+SBzgGjC6VVgwILLryLqiemzB0BA
	EVQZgP8nuFDrsROt46ZJJfAyQ8EquDsWj5ZJNLiwu+arNBue7n3ZFIVr5hlVLFzQSkJowEBZJMVNX
	hfZ0dgiOYalVLXaToQT+FMaRnpniluFOg0HIx2zWmcars1zEyHaH/nZc/yeHHshw30jezrWk/btOn
	m17mexBOFTdDY5QL0K5xSPLZYQwq/pQZfr5VLCizSpsY+NuXQdupqFbXbEW1SgH0rBZ/szPo5CyI6
	4koDDkvQ==;
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYo-00000002RD3-0gg4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:12 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so4198847a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373107; x=1795977907; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=;
        b=mFu6qDpcqtxwH7Jz0vsP60HCoevGE9/XswIDFLnisdHXc3fdYIohcDUQSyrRn79tdo
         ArX7x/rSdSZxXYnd/tYIhZeH0abINtgTLKttzH4CuMo3KCphAeA3BRIN8TrfNj8XvW//
         0GYXbuRScBsSfL1kP3v1tpiLGxshpKy5ZyDTgEeO7P6KgVjjXTNehhEzQsLrSU0kbIKZ
         P69g8OmUyiocZH3CgaFIMF3HCNjpayK9sYLDPxdtKEXBxt80cevRbo7Oxz6wYhsSogkK
         TlpEWuJ2vVWZrg5NXvTOBJvLKMuf+ONreJgcbRbS4RcyHFIOt0UMFsfqDcbR/CJHnN4S
         NC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373107; x=1795977907;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy99F9v1h+ZocL+7gIZompqknwKF5VmSur7QJmb24aY=;
        b=WRvqCQw95+frUgcMvirHwiM94uS/p8vZ7R7+nwIUABeMuKj4P9mLHkW5mBtlu7g8Uy
         mUEY/FJtV+1+iRqPUMTzH5j/PgA6PTDPoevYKvrTQZ47BHRoStHW4FlKJ7vZWiopKdZd
         ZqIR5Ni3y1VA36SBD3T/95fVdOhqyOMJm9sqvVEKmHUeXWx9R48Gt5/Fm4dzv4s8BdrU
         nTVpetmK7Yvp2bGdy+iC2D1jJoaIQ9X7z58y9hPtnC/Ujcy10R5EhRe606KAN4u/VpGj
         AElkBYpyrhOSuOb9NoToKYyle3bMEXEPzps7lu8xy2WMVgH8eTz/i9D7WfJFGcBt6iIP
         4Raw==
X-Forwarded-Encrypted: i=1; AL+hErH5ZLEYY1eEywfXfOWU3wYqZTHkFXv2RfbMufx07rX1klFwAIjvIxZWE1e6sh2w9Qt8H09YGOUHpCeGX/bpM8T+@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZKqKl+Ww+6GnjvDikwLy/MTwTfCVbLsjtjTLrGMXqAWkl6A6t
	Exv4r/kIQKPr+nWAPkO6P4oidEHyVfXAOGRO6wlV8F8EFDZ9sfHNGZlkYRMHFQZHmjXM2jmkBDU
	w7buiwiYF26K0IfMFs7F7fg==
X-Received: from pgbx7-n1.prod.google.com ([2002:a05:6a02:63c7:10b0:cdc:b85b:3d46])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:57cc:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b41c9b2d2emr9616562a91.10.1795373107406;
 Sun, 22 Nov 2026 10:45:07 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:42 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-9-jthoughton@google.com>
Subject: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled to
 architecture code
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184510_639566_BFB609B4 
X-CRM114-Status: GOOD (  14.94  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Architectures that select
CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
system at boot depending on whether HVO is enabled, e.g. arm64 may
require all CPUs to support hardware access flag updates only if HVO is
enabled.

Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
declared before <asm/hugetlb.h> is included, so that it can also be used
from inline helpers there.

It only reflects the hugetlb_free_vmemmap= kernel command line parameter
(and the sysctl, when writable), not whether the architecture supports
HVO.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/hugetlb.h |  9 +++++++++
 mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 0d5414392d87..b2a6441bcd84 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -22,6 +22,15 @@ struct node;
 
 void free_huge_folio(struct folio *folio);
 
+#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+bool hugetlb_vmemmap_optimize_enabled(void);
+#else
+static inline bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/pagemap.h>
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 142f2975846b..fb6da64bd80d 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -452,6 +452,24 @@ static int __init hugetlb_vmemmap_optimize_param(char *buf)
 }
 early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
 
+/**
+ * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
+ *
+ * This only reflects the hugetlb_free_vmemmap= kernel command line parameter
+ * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the architecture
+ * supports HVO (see arch_support_vmemmap_remap()).
+ *
+ * The value is final once early parameters have been parsed only if the
+ * architecture selects CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO;
+ * otherwise it may change at any time through the sysctl.
+ *
+ * Return: true if HVO is enabled.
+ */
+bool hugetlb_vmemmap_optimize_enabled(void)
+{
+	return READ_ONCE(vmemmap_optimize_enabled);
+}
+
 static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
-- 
2.56.1.809.ga0b61035b5-goog


