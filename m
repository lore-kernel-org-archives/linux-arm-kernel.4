Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DBB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=goVspE4N;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eMI4vMkf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mkVu1BZEh13paTDpck3U+A16xbW48tKn8diy4BeXyyI=; b=goVspE4NGuAaNG9GuVgdhl2H0t
	T2Dem3pCZxzQlFOy4ZZNKORH7g2o6vqBi4GVhyOgVa8OuaUOx6f/nCytxdWLqdhcAaIFFB+2wtdHm
	9y5H6tkU7ZlSdd4F9dOsgQAAZes+ywvp/mHLDpRvf+9gKBkFrJYfkTRBbr0FCq3BzT1e7vHKHbKzq
	oGV6nniCKkbvYAkd2w9MfzU/9/W6hwQs97+scngaFijLCYQIFaW4zz10XEZtz25lvJ+KBNhWWG86z
	V38ELBHDFHBnTMw0MJvEcd9gmaCTCSBYVkWVs5rzP8BDUQDHPSI7n5fy3ZV0qGvGf2Tk+9USGCyC0
	sA21hxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYz-00000001YZY-3bUV;
	Sun, 22 Nov 2026 18:45:21 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYk-00000001YPT-2JIQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:08 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2f04004edf1so18194275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373105; x=1795977905; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkVu1BZEh13paTDpck3U+A16xbW48tKn8diy4BeXyyI=;
        b=eMI4vMkfoZ/IvluB8laQ+pGAtex5ETrGIg4fHg8/N4s1RGHaT2uwzhTndOBSkPuNwJ
         jz1nj3E51qoc5+IfO67zpq8bNPS5g7SXyIu7b7XreiiLpsa6aP5OqXbi9TZ9ysWNfETr
         jSA+N8JHTwfYhDUSk+qeqqmIUXQGQ7GYu/OmQFKKQFVTWRHAc87E3AxNZ2g3y/dzXx36
         9kC8w9BNNVQ14J80egsIHbBSrkvTcjz4UtPldFLL0bEBRT8OA4UnHiueVtknOE74Is27
         jJdS/uBVAzdg/bjY9YGN63Cz3t1Sa5Np6JrKFKCuHN3WMpKVXhLskn7AhK/1gKGv8npi
         ZZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373105; x=1795977905;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkVu1BZEh13paTDpck3U+A16xbW48tKn8diy4BeXyyI=;
        b=iba42Rlt3mlZIBfvYED6oclhPlMF43e4RbHA1H1HpRk5LsROXi1kdaaUhoVNztPwz2
         GuBO7/sWvY++gBMDHE85XFPCKjmj4teoXn5MeMixCLhkEntKJhOLONOuwk5f0UhiYr/0
         pFIaJmZX0+e9Mm3IE0/p4BlY8pM1r4I2fer10DmBjZovfbj35t17qA4SG5P/Bpet8pRn
         2vZAUqTkR6uXMy7+0TV5a1pKVuDBfSbMnKGax4bjJPMKGa/Hj79JiB8VGrKFFCoWiGFS
         XWu4EflQjYLlMsd0D319dp8dgeXuDVhRVRjax4IRaeK+Lrv76Bz4FZ1uRboBS4vdQTXo
         BbxA==
X-Forwarded-Encrypted: i=1; AL+hErF8IxmS0vsssOGEDA1p5BJNJq2PyQDdZmKTeR4/qWwUxojqCJnATkS9L21bbiweqqHu3UH2AT6Vw8J+EV3CSpW2@lists.infradead.org
X-Gm-Message-State: APuU4Z85HSiYt5pWmdAJZwMIkrlDu2UfGN+4M73wGXe+uP6r0taN4X1A
	QGaF87QxDy+uGWKAWs60RtivAjLQVt+YOhn+VUY3KvVB4RMoyRF/ldo53woq6JwwT3rZL61IoFX
	otT6AE7LCIRqj8XEA4fW3Tg==
X-Received: from plbz4.prod.google.com ([2002:a17:902:ee04:b0:2ef:d472:e87e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e80b:b0:2ed:ef1:f78 with SMTP id d9443c01a7336-2f03f11824amr92864975ad.21.1795373104623;
 Sun, 22 Nov 2026 10:45:04 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:39 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-6-jthoughton@google.com>
Subject: [PATCH v3 05/19] hugetlb_vmemmap: Allow architectures to dynamically
 disallow HVO
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
X-CRM114-CacheID: sfid-20261122_104506_611831_4E98D0F9 
X-CRM114-Status: GOOD (  14.65  )
X-Spam-Score: -9.5 (---------)
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

For arm64, only some platforms support HVO. Add an arch hook,
arch_support_vmemmap_remap(), to prevent HVO from taking effect if the
architecture lacks support. The hook is not HugeTLB-specific, so it can
also be used by other users of in-place vmemmap remapping (e.g. FS-DAX).

Check it in hugetlb_vmemmap_optimizable_size(), so that hstates are not
reported or treated as optimizable (e.g. by report_hugepages() and the
HugeTLB allocation and freeing paths) when the architecture does not
support HVO.

It may be the case that arch_support_vmemmap_remap() returns false at
first but eventually returns true. This is the case on arm64, where
support depends on a system-wide CPU capability that is not yet known
when bootmem hugepages are allocated. Such architectures cannot pre-HVO
bootmem hugepages, so they must disable the section-based vmemmap
optimization in their vmemmap population path with
section_vmemmap_optimization_disable(). Their bootmem hugepages are then
optimized when they are gathered instead.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/pgtable.h | 15 +++++++++++++++
 mm/hugetlb_vmemmap.h    |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index ab33df268955..8cf44120e2ed 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -480,6 +480,21 @@ static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
 }
 #endif
 
+#ifndef arch_support_vmemmap_remap
+/*
+ * arch_support_vmemmap_remap - Whether in-use vmemmap mappings may be remapped.
+ *
+ * Vmemmap optimizations, such as the HugeTLB vmemmap optimization (HVO),
+ * remap vmemmap page table entries while they are in use. Architectures that
+ * can only do this on some systems may override this hook. It may return false
+ * early during boot and true later, once system-wide features are known.
+ */
+static inline bool arch_support_vmemmap_remap(void)
+{
+	return IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 8b28063d78cc..440477288d19 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -48,6 +48,8 @@ static inline unsigned int hugetlb_vmemmap_optimizable_size(const struct hstate
 
 	if (!is_power_of_2(sizeof(struct page)))
 		return 0;
+	if (!arch_support_vmemmap_remap())
+		return 0;
 	return size > 0 ? size : 0;
 }
 #else
-- 
2.56.1.809.ga0b61035b5-goog


