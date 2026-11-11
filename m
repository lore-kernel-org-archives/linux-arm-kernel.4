Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA51606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wEGDdq3v;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hmuoLoP6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IbCldHU5Mwk7c5H3z6Uc6u4VrcQ6WVCcsNry6NcYtQ0=; b=wEGDdq3v2AwYQBFYVJO80hu/2t
	mU1g8nVVTY9eNFQrb1V0Ec6+aJJoRtPM54vQgC10Mrz7lLatlxVMjaOkvnf2YYjDObipZy+wu3XNn
	6L4XQA385a7XsAeOHJczS6T3aMB6jxegUnnFDTcA4XJuXY4s0brqZtyjE4UdTSqg7WS/AWJ2nzVqx
	AaSuTdzbGXw0jChPARWZ8Hp3YgGsqpfXu+4WjRyTeLqv0QZFImHOISvvF/bkA67RZKkXJmNCsJNXe
	807DhjI1Q29QBSe/73q+vgcFB1XzQUdKp5pEEQTkEq85XbNRYNLBSrFExP8S4tgGxQB8uOGcr6FKD
	y1kbjQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bo-00000006QmL-3mgO;
	Wed, 11 Nov 2026 11:08:28 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bl-00000006QlH-1xDI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:27 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso23266045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395302; x=1795000102; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbCldHU5Mwk7c5H3z6Uc6u4VrcQ6WVCcsNry6NcYtQ0=;
        b=hmuoLoP6Hr7ElVDlradgnnJRjAVnNYeIqLkLpkTiRGYUsN8f0leH+H2pbj8YFa4vSr
         0BWcd16R0NDLnOIQvADgqbYg9knXXElfnRl7GzQSzxg+t1xNr7WTyQ/5L1Xf5IgMDu9f
         Yfi+rHyv+DGxXG7Le5hNyHZkBWpW0w/Ib04pQbmn773vfmPWJtm5iOiYtIVKoE5SiRFq
         KMDFn5t0oj5G8l259MAsKSqkr1RywEHJlEqpd1IscjGIW3HcB2aDWGUFrBMN52GhNUtq
         3Tkz00vUUudr9m7zYj9i1YB9XxQVsLdP/v7Ns6mU5DX+861SfOMtGlaDdKhbIALP3Fix
         Bndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395302; x=1795000102;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbCldHU5Mwk7c5H3z6Uc6u4VrcQ6WVCcsNry6NcYtQ0=;
        b=CO2A7N1mwrvIdK8luV+w5TE1RkqaDdhakwQSihNyR2uW34hqyYoDPUanVq4fomkGqO
         KRu9L+SGf7kwbI/9hfB4VYpfxWt1q2WpGW0B/1IanARHtp4ocDmauGTHmMuH98nRgAVg
         xuVCu/HOl1b+gg/96wiaUcnLc+pu08j3yD37rhxTVTuaguLWjeibdjsZ5/TPbBhLlGSO
         0CDdkaSoqtLy+z52cYqqY7SNuPHs8fWA9kbTNkb+b5ez69lvSyHhu/KlM63Bb7/hl3/b
         q2TCwM6oX3K5Ndfs6eZAHU0nxP2POm+yfl9+96zHSyahqSAwC+zUM5xRC2eJCYAVSOu+
         6r7Q==
X-Forwarded-Encrypted: i=1; AL+hErE1jY5HSERuGymkRz2T3YUgE9Pp1l/0VCMh6ZvPTyluCbN5AKQhqJN5gd6udD2nk92ZmDBpWL3fWuzGyTfFAMk3@lists.infradead.org
X-Gm-Message-State: APuU4Z+SQJe0dkvPpmvNZmCCYopa/HSzg08/pVkH2CpuMzFujliKxV+m
	r0PND5yqoaCsmTI7i01fb2eVw8qFsk7A3pmUm+fq3HQNOUklCmGtTjRTYJ2xs078RDJG6qfQlv+
	D6B8sJaz6SMKgo3PkIbiIuA==
X-Received: from wmba9.prod.google.com ([2002:a05:600c:6dc9:b0:4a1:b748:caa2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b78:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4ba0938fdf4mr37001375e9.31.1794395302318;
 Wed, 11 Nov 2026 03:08:22 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:30 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-1-vdonnefort@google.com>
Subject: [PATCH v3 0/8] arm64: Unmap FF-A lent memory from direct map
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030825_534980_0246C901 
X-CRM114-Status: GOOD (  18.64  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series is a follow-up to the discussion that has started here [1].

When memory is lent to the Secure world via FF-A, CPU speculative
accesses from NS to the lent pages can still occur as long as it retains
a cacheable mapping to it.

Ideally, lent memory would be "no-map" but that would mean giving up
MiBs of useful memory, so let's try to do better with the help of a CMA
pool.

On arm64, modifying the direct map at runtime is generally restricted
because the linear map defaults to block mapping and splitting blocks at
runtime may trigger fatal page fault, unless the CPU implements BBML3
or the entire direct map was mapped at page granularity from boot.
Forcing last-level mappings system-wide incurs a severe penalty we want
to avoid. Instead, this series introduces targeted last-level mappings
for designated memory regions, along with a generic "lendable-dma-pool"
CMA driver to manage unmapping and remapping on lend/reclaim transitions:

1. memblock:
   - Introduce MEMBLOCK_PTEMAP to force PTE mappings only for a specific region.

2. dma-mapping:
   - Introduce the "lendable-dma-pool" CMA reserved-memory driver, along with
     generic dma_zap_direct_map() and dma_restore_direct_map() APIs to unmap
     pages from the direct map and restore them.

3. arm64 direct map support:
   - Implement the "lendable-dma-pool" hooks.

4. OP-TEE support:
   - Hook OP-TEE dynamic protected memory allocation (tee_shm_alloc_dma_mem()) to
     dma_zap_direct_map() and dma_restore_direct_map().

Testing:
========

Tested with QEMU v8 using OP-TEE OS (built with CFG_CORE_DYN_PROTMEM=y)
under both SMC and FF-A transports [2]

static void dump_direct_map(const char *label)
{
	printf("\n=== %s ===\n", label);
	fflush(stdout);
	system("sed -n '/Linear Mapping start/,/Linear Mapping end/p' /sys/kernel/debug/kernel_page_tables");
	fflush(stdout);
}

int main(int argc, char *argv[])
{
	int heap_fd;
	int dmabuf_fd;
	struct dma_heap_allocation_data data = { 0 };
	size_t size = 1024 * 1024; /* 1MB */

	if (argc > 1)
		size = strtoul(argv[1], NULL, 0);

	dump_direct_map("BEFORE ALLOCATION");

	heap_fd = open("/dev/dma_heap/protected,secure-video", O_RDWR);
	if (heap_fd < 0) {
		perror("open /dev/dma_heap/protected,secure-video");
		return 1;
	}

	printf("\nOpened /dev/dma_heap/protected,secure-video\n");
	printf("Allocating %zu bytes of protected memory via DMA heap...\n", size);

	data.len = size;
	data.fd_flags = O_RDWR | O_CLOEXEC;
	if (ioctl(heap_fd, DMA_HEAP_IOCTL_ALLOC, &data) < 0) {
		perror("ioctl DMA_HEAP_IOCTL_ALLOC");
		close(heap_fd);
		return 1;
	}

	dmabuf_fd = data.fd;
	printf("Successfully allocated %zu bytes! dmabuf_fd = %d\n", size, dmabuf_fd);

	dump_direct_map("DURING LEND (EXPECT HOLE IN DIRECT MAP)");

	printf("\nReleasing dmabuf_fd...\n");
	close(dmabuf_fd);
	close(heap_fd);

	dump_direct_map("AFTER RECLAIM (RESTORED DIRECT MAP)");

	return 0;
}

[1] https://lore.kernel.org/all/20260807-tegra-vpr-v4-7-5510d16af89e@nvidia.com/
[2] https://optee.readthedocs.io/en/latest/building/gits/build.html#qemu-v8

Changelog:

v3:
  - Replace "arm,ffa-lend-pool" and OP-TEE "memory-region" DT binding with generic
    "lendable-dma-pool" compatible with "linux,cma-default" (Sumit).
  - move conflict check to flag-setting time in memblock_setclr_flag()
    (Mike)
  - Rebase onto v7.4-rc1.

v2 (https://lore.kernel.org/all/20260921110050.3977591-1-vdonnefort@google.com/):
  - Rename MEMBLOCK_LLMAP to MEMBLOCK_PTEMAP (Mike)
  - Warn on conflicting MEMBLOCK_NOMAP and MEMBLOCK_PTEMAP flags (Mike)
  - Drop DT "ll-map" property and mark MEMBLOCK_PTEMAP from ffa_lend_pool_setup() (Rob, Thierry)
  - Drop "reusable" and "no-map" property checks from ffa_lend_pool_setup() (Rob)
  - dt-bindings: Document arm,ffa-lend-pool (Rob)
  - Rework the Optee support with a separate ffa_lend_pool.c file.
  - use walk_kernel_page_table_range_lockless() for
    can_set_direct_map_range() to fix folded page table (Sashiko)
  - Add missing TLB flush in ffa_prepare_lend()
  - Disable hibernation
  - Rebase on linux-next (next-20260918) to use the new set_direct_map*() ranges (Mike)

v1 (https://lore.kernel.org/all/20260902104712.2399797-1-vdonnefort@google.com/)

Vincent Donnefort (8):
  memblock: Introduce MEMBLOCK_PTEMAP
  arm64: Add support for MEMBLOCK_PTEMAP
  dma-contiguous: Expose rmem_cma_ops
  dt-bindings: reserved-memory: Add lendable-dma-pool
  dma-mapping: Introduce lendable-dma-pool
  arm64: Introduce direct_map_is_ptemap()
  arm64: Add support for lendable-dma-pool
  optee: Add support for lendable-dma-pool

 .../reserved-memory/lendable-dma-pool.yaml    |  58 +++++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/set_memory.h           |   6 +
 arch/arm64/mm/dma-mapping.c                   |  71 +++++
 arch/arm64/mm/mmu.c                           |  22 +-
 arch/arm64/mm/pageattr.c                      | 121 ++++++++-
 drivers/tee/optee/protmem.c                   |  48 +++-
 include/linux/dma-map-ops.h                   |   9 +
 include/linux/dma-mapping.h                   |  16 ++
 include/linux/memblock.h                      |   9 +
 kernel/dma/Kconfig                            |   3 +
 kernel/dma/Makefile                           |   1 +
 kernel/dma/contiguous.c                       |   4 +-
 kernel/dma/contiguous.h                       |  10 +
 kernel/dma/lendable.c                         | 243 ++++++++++++++++++
 mm/memblock.c                                 |  39 ++-
 16 files changed, 630 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/lendable-dma-pool.yaml
 create mode 100644 kernel/dma/contiguous.h
 create mode 100644 kernel/dma/lendable.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.542.g3ef89b7020-goog


