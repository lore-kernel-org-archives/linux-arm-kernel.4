Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE08606A687
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=liNDwXxh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XxzxEGl6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WsuwGey7RkQSop+XnrYKl3vcLnUZxAuob7/LeOfTYsI=; b=liNDwXxhbvMxYp22QocoWIqigf
	49n6roOqyhFRCsyu4aFVTdPsedSas2xz0nvH21Ow3jl55Y5SQJIRB6z7E6jJQy/PgOPZYdHEOAktq
	hvbPP+lMlYCqnfvuQxb+Cip+HR9D+vnlmNwp671kWlSG9Duv22csdl9GusydOXLIO+yvhtjO38Omb
	Do/KCFijxvuAhdMuPY0OhAHbV/grFHd1ICkdZGgh8fZ3dgGWeK1WBSxuz/wvZfJdczIVSw2THZNEO
	Yq2cm95zG0AjrWMtkg2jZP9SP4yZCvttBHvTZNYWTp4rLJR/TvOAkIsD6+stjFJXY4nzytG7XKa1I
	btSg80TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ0-00000001YbA-2U01;
	Sun, 22 Nov 2026 18:45:22 +0000
Received: from mail-pj1-f69.google.com ([209.85.216.69])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYm-00000001YQh-2ikn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:09 +0000
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so3624428a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373107; x=1795977907; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsuwGey7RkQSop+XnrYKl3vcLnUZxAuob7/LeOfTYsI=;
        b=XxzxEGl66pcgW5ra811RZPdahQTbQrOXOHhs+lfeWrh1iUjrkwMArtTofdQ/QjSiL6
         rr1haA9oOoWma9tRrGdxgm0htk/QQDXKpF+QKmBJ9s/BzeNUPKbxtl9lyOGm7r940sOi
         gtQ1jBZxxeIVkVerGYGgtJGG6nHpo3xb5HsgtTUMkIiOjWWpW9uaEYaw8wYuSsV/nnIE
         0JEj+GZnw7ZYEnqguXrlxg0sAcz5b7tXfy644rOpQb0k2PPOv6wDK8089+I0GLxdS1BV
         vwX5e+Ks4gt7J/DbF4aQQXIj95xtMRxLK1H3dHA3CdoaIMi0eOtxXfrjcCtAWRkFJOeO
         Ubdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373107; x=1795977907;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsuwGey7RkQSop+XnrYKl3vcLnUZxAuob7/LeOfTYsI=;
        b=TsGF0Yr14p+tbGXglTNIcFvkCAnsxy9LO9SAOzGhIhOxccFoinIQoQy8xP4T3B93N1
         4RzVmoSdIsylu3vjuG2R8LFMHt9Lsizyu2lpZJvYKsrUYRnmsm8db8MudI6gL99ajoFL
         ytbrMlzPPzjWUZzqnhq5iFKcovERmRfVGrxyeC3TFfSEqC9AlnsNex9ewwWA8fgHFOMn
         hn/hf8u0iXbL+m4hWHUAqnINa3/ahOqYCYWi7min50ykylTqFH2QAWMlqLzOXpkaRg4n
         Lm8gYmtLi9jvoKc7G/C3IYJ1CFgNqh3QYoiqk4f0NTaWCY4tLShVL0I6KgYHnp02lJbu
         q5Hg==
X-Forwarded-Encrypted: i=1; AL+hErGoaU1lGlqHhhpSH1MQuvawe6o1qZZMeMhfU2b+BAgAyUZxYM7+AMORXcVYSzUcn9jG6c23wpvvOyW1BlpYOXns@lists.infradead.org
X-Gm-Message-State: APuU4Z89B2be0mjHOko1UPblVVX+8tEzHpGz8v7GTjrohiruVQxIYzp9
	ZUxfRqtX22YRpAGV7f5T3bm/Pzn0dwt+eqrrIYn/9E3j7Sme7G2c/I7h9LKbp0z0U+0492rGX65
	hlkHWbWA43sgSX/h9sKQDkw==
X-Received: from pjbfs12.prod.google.com ([2002:a17:90a:f28c:b0:3b1:81f8:3b10])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c06:b0:3b3:c9d1:9b65 with SMTP id 98e67ed59e1d1-3b41c94d32emr8737375a91.51.1795373106544;
 Sun, 22 Nov 2026 10:45:06 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:41 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-8-jthoughton@google.com>
Subject: [PATCH v3 07/19] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
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
X-CRM114-CacheID: sfid-20261122_104508_705907_194498FE 
X-CRM114-Status: GOOD (  15.30  )
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

Architectures may need to configure the system at boot depending on
whether HVO is enabled. For example, arm64 needs all CPUs to support
hardware updates of the access flag to safely update the vmemmap in
place, and may want to refuse to online CPUs that lack it, but only if
HVO may be used.

Such configuration is only valid if HVO cannot be enabled later at
runtime through the vm.hugetlb_optimize_vmemmap sysctl.

Add CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO for architectures
to select. When selected, the vm.hugetlb_optimize_vmemmap sysctl is
read-only, so HVO can only be enabled or disabled with the
hugetlb_free_vmemmap= kernel command line parameter.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 3 +++
 fs/Kconfig                              | 3 ++-
 mm/Kconfig                              | 7 +++++++
 mm/hugetlb_vmemmap.c                    | 3 ++-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 3cb0138e850c..f29da7a35289 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -699,6 +699,9 @@ pages.  So, those surplus pages are still optimized until they are no longer
 in use.  You would need to wait for those surplus pages to be released before
 there are no optimized pages in the system.
 
+On some architectures, this knob is read-only, and HVO can only be enabled or
+disabled with the hugetlb_free_vmemmap= kernel command line parameter.
+
 
 nr_hugepages_mempolicy
 ======================
diff --git a/fs/Kconfig b/fs/Kconfig
index 70a1d0760d28..0c1a436280f8 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -267,7 +267,8 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
 	help
 	  The HugeTLB Vmemmap Optimization (HVO) defaults to off. Say Y here to
 	  enable HVO by default. It can be disabled via hugetlb_free_vmemmap=off
-	  (boot command line) or hugetlb_optimize_vmemmap (sysctl).
+	  (boot command line) or hugetlb_optimize_vmemmap (sysctl, if the
+	  architecture allows changing it at runtime).
 endif # HUGETLBFS
 
 config HUGETLB_PAGE
diff --git a/mm/Kconfig b/mm/Kconfig
index 18c0beafd4b8..c1c32d2c5cf8 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -466,6 +466,13 @@ config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	bool
 
+#
+# Select this from the architecture Kconfig if the hugetlb_optimize_vmemmap
+# sysctl must be read-only.
+#
+config ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO
+	bool
+
 config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b4d0311bcc4a..142f2975846b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -669,7 +669,8 @@ static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 		.procname	= "hugetlb_optimize_vmemmap",
 		.data		= &vmemmap_optimize_enabled,
 		.maxlen		= sizeof(vmemmap_optimize_enabled),
-		.mode		= 0644,
+		.mode		= IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO) ?
+				  0444 : 0644,
 		.proc_handler	= proc_dobool,
 	},
 };
-- 
2.56.1.809.ga0b61035b5-goog


