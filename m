Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4336D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wjaQNZqm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PU/drbVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=; b=wjaQNZqmOY46sJ
	rIjZ+EYFRt6wj7Mql/Cx00k8EvDxkmflIiInyuTOCZpx0KUuTvLA9DPbuD76mFwE7iCFnKDa4nn7a
	QpjXSWoSwmAFHKpoobs/uzJpmhwiElJIGalWSISqZ9aCYlETSFvpBWm2GPgY5cxDp7ud8J+o3Jm9j
	0OjYVgISP9zkknL/bQqPsD6GN18o1xn4zFNF7Rw7VGCNLmvGP8IeenXV53rVwwxZbRo7WzzpVKg61
	BF7bank9lZuGG5fHSS+kxSUehGqUm+jrTZ+Vs2B/Irhiy+LViU3xudWiulAOlfPZkT/3O8OenVEpk
	9Rrg4nosdaZVdurDp3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrvx-0000000FM9r-2vXX;
	Fri, 27 Nov 2026 09:07:57 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrvu-0000000FM7S-1P9L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:07:56 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2ed408b0d0bso44646165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770473; x=1796375273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
        b=PU/drbVn8E8rA/MpeHbbKSl+Qm/Y/ZiP4J8X/inbr9H2t4cB67XSOg7nuWRaayumc8
         ckJrPNq59Jj4fhwCQ/qn0deln8GV23hjQI2qTy6c2SLnkZ0C71kDWs2balS88NvRKVLQ
         kweqZ2eegoTmpI/s2dYd1BhpeuABNgnHrVgsezvStdpf/opVSh6B9SNvUfy/Y6rizjG5
         O4ytQvVrrR0B9XQ5q+b0WmTdNZb2wWESwtnJ/uwLm3S+gBV3yLwWw5kkbbXa1M9ZLpIc
         fk8A5ZF7424+s7PDhJgqemAqbfNPL6ZeVA4vLypLZj/YGAyjLA/j4ukiJEk1OOV3b5Hs
         vWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770473; x=1796375273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
        b=Nz19710xq34vAbCKgt7o3J5vCT87S4PPCYuDZUI+qvA+oLcpf92hx2wLqNubfFqcUq
         od5i1avYYyGTxifXQVH2qXj+VJFzuFri2rVbKPRvdparq4pfJ9siYvb1dOKS8l8/kbUa
         rh1wfI8+PedJHxuawAP6bO5UBxoHArCBf5wWq39brESl/XW85UoGt5pjhRSt+fdhCtaf
         Kd7mdJvDwm+8WNEtKtbCk1FSFWl//+P1QVadxJCqzum7pwBCcC77tRGmw9wBZK16/+c9
         J9LgaJKdX28VTUOsZE9Spwv8DCxWsqeAd8sUM0qK1pa5ukVxDt/r3n27j59t4kqG7iVq
         DMbA==
X-Forwarded-Encrypted: i=1; AL+hErF3XnyvYv8kQ4iWRdSzPr6b71k+hMFv08lgMDHqy6sbI2QViKMFkL7g0IjbCfKGHXXgVWzPeBkmTM3t2RH2Ijrt@lists.infradead.org
X-Gm-Message-State: APuU4Z8INp5JCe4TTv/fAyNt2aCwq7oG7kO/PecdJIpOuWrUaCqniEsP
	ZBFl2vLGpjm62udxfqP8lGjZeaE1bW9k/ww0RI17RztVNFcvy/dfAKq+
X-Gm-Gg: AZFdTZeIeYVi9r51FD5JYv+M0zywpznMxKpBPIKwXCmUinDinVNMgBVOjiji93NEo3z
	UcqDlSUm75O+ic3D73DcJWKuMQtOaVMsM2JXmnvpKapqSQGtLsNGWeAHK3OGzWjwJfzB7ugXZJ7
	8Oz2OIlbchQItKKpD4+xM46Dr//5nbdIIghDmEUpv8wuKB2K/MwP6GPwprBHEkJEgvx8ULGxzMG
	tjApsU6b0FyJJPDHEar0mLAbHfZ0nzp2Hmrir4bs/DdNXCGr2RDeRh1JmoC/7WNm+sZWfIzDQJ3
	Ad7OqzblpqNt3/UkDhB8qTdJWAhxq2MMCoyk0kM7hlqe6c+xb1h59qt1waihwk0I/mSb4p+o37t
	sAiNcE5mmZ35rwFa1OYU2HZV6129FLs/pEt33GX6kMtQAmSA7mlqwJU4U2KJVEGCCyoMFU4oNi/
	MErWZVclp+cHYcK5wdA1Bo+AQtDQw1IesaEPDNAPul9Enkl3n9GNhHbSNHN02bny+L0n6mwJy5B
	3vcj5L8Ow9l4vjDkRkhaYOd3TBpkhk4sBC8+vqgEj1TKZTGXMcC6CtSPCY/cl+tuakfBU7hopq8
	IHARMVgtsoIp2EGq5XrFwdAngKhaf4HevMPsW/WeLQ==
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id adf61e73a8af0-40283cbd05cmr14085693637.27.1795770473349;
        Fri, 27 Nov 2026 01:07:53 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:52 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 27 Nov 2026 17:07:16 +0800
Message-ID: <20261127090723.741253-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_010754_376260_0155ED08 
X-CRM114-Status: GOOD (  12.07  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffef6b903e1..0a426475a9fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..dad7f02365d3 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	phys_addr_t start, end;
+	u64 i;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	phys_addr_t start, end;
+	u64 i;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0


