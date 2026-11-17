Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3sziXul0;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GFKR6AR/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U0C2c5C1ky8GXUFhcagNmONxfQIKKMC4L5ZXkx5S6y8=; b=3sziXul0aBFmCFojATK+rX0Vj5
	cZwOkg2JlAJFj8Bw6craxe1FAiDCrTFt4/UhY5rkaDgfWl578yPtne0jugg/tgqJIy1D9R02gW41G
	YmQRkjHHk1QU83R4J0wsUgkgiDHtQjdsHoqMd6B/I/7jsh7KdElBXN+sgIERs5xBsm1jOJHRZOozC
	BUkQhC+UlYNzT55HiebQcH1TSdclax5Ude/6uRHtTI4pLrVkbZE6L5yp+gR3PasupXbcSBbh4s1GT
	Wn2rRt9oNXF1GWyUNq8bO6oEKRaYgB+OcJdxTtSfJSe5nMcbRi2WedNSkVY+MQCAyNAoFWG3NQE3A
	pRhiswog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNED-00000006dn6-1mv7;
	Tue, 17 Nov 2026 17:44:21 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNEB-00000006dly-1ZKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:44:20 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-48fcb657f32so10770f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937457; x=1795542257; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0C2c5C1ky8GXUFhcagNmONxfQIKKMC4L5ZXkx5S6y8=;
        b=GFKR6AR/nHItqf9G4troHVACHBv7CsCgHr244wKSOuy1c5rPoGrMJRc6C9E4P+Sjdu
         y26jL66ZfFJNtjrVrIC9VdlNBJHCZI16dbMn67sZ9usSH6htOJENegx523WlHxaDakni
         A2yxCf7HkDuds/GCwFVdrS+sSSeesxVfG0s/eyRZ8C2t8cr1xwCvsVcZWKkfxjS0fTf4
         r+BkSGvMPY+ZvJwA23y9M6KORw0+Xfj7miB//VQ24NLBg20dh28qTffMx+cjku8butKr
         Oj6n4y4pba58VzsGNoR7KML3NEFRRjyuyw4/S9PGDoJptLnuYZuWo/EYa/Q3GIYlJgg1
         /AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937457; x=1795542257;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0C2c5C1ky8GXUFhcagNmONxfQIKKMC4L5ZXkx5S6y8=;
        b=MTZtQmiPri+aJv9r6ezziInJtCp9/T9gnsqRxMkb1JL7z/D8j1qNueHbWVGRgsx7xg
         aYuq4Vcs/UDblV4gECkJShvhkB3nPM6VEuUe493vz14SGnG/seXQx58hINJzqAKKbceb
         3xY+SlExiqQs2I3Dnh9dPxe1DkAK8he77WxOBCuDfgrq3toOLU3EXSu2jWDbAqXoM3WG
         UFmOyCVxBeIkhpnHrfddgy6kZ5OVYEQZz/+WpIEeVAqPHClrPqrwBFWaHqTwKdJeQC+w
         aJcyZ5LlMrB/bf9K6d8ahlKJi8pd5SAPcIFSgnBhHVULPRKycDLyMubwhtRziJ/AUwnK
         sGmw==
X-Forwarded-Encrypted: i=1; AL+hErF8T+B07vAglYmmnoVLMCG/3wSv0mpT0cJm5pYq21tjeYoRBl7DFzE5D59izRpStDNcqQlIv9UWDa7vGBEyF88F@lists.infradead.org
X-Gm-Message-State: APuU4Z8H7KgM/kjXsEyXpC9n4tmQOnMoZ8slt7wUQfKvca1onU+QNbI2
	krGp6SGYpW+AiC6y65NfxQlJpywCEdajFuWuIvdHctCNqER9W6MOUfOljo4ikroosHxeym5v8dz
	1nZd/FPnmq87vkC9QxiSC0g==
X-Received: from wmbeb10.prod.google.com ([2002:a05:600c:678a:b0:4a2:826:6d11])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:12:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb6d61b56fmr164962325e9.35.1794937456737;
 Tue, 17 Nov 2026 09:44:16 -0800 (PST)
Date: Tue, 17 Nov 2026 17:43:39 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117174403.58762-1-vdonnefort@google.com>
Subject: [PATCH v4 00/23] Huge mapping support for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094419_473531_B066F9DE 
X-CRM114-Status: GOOD (  15.94  )
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, pKVM handles stage-2 mappings and ownership tracking strictly
at the PAGE_SIZE level. This series extends pKVM to support PMD_SIZE
block mappings, thereby enabling Transparent Huge Pages (THP) for
protected guests. hugetlbfs is currently unsupported as it does not
appear as swapbacked.

Summary of changes:

1. Enable host stage-2 block-level annotations:

The host stage-2 being annotated with the GFN of the guest on the
host->guest donation transitions, we allow block-level annotations to
ensure the host stage-2 mapping size matches the guest stage-2.

2. Expand ownership transition HVCs:

Enable the ownership test to work with PMD_SIZE so we can test
transitions supporting more than PAGE_SIZE.

3. Implements the PKVM_HYP_REQ_SPLIT hypervisor request:

Allows the hypervisor to ask the host to split a mapping. This ensures
the guest s2, pkvm_mapping tree and host s2 are always using the same
mapping size.

4. Wires up THP support for protected VMs:

Use a PMD_SIZE mapping for protected VMs whenever
transparent_hugepage_adjust() acknowledge the presence of a huge-mapping
in the VMM stage-1.

Changelog:

v4:
  - Pass level instead of size to kvm_pgtable_stage2_table_install(),
    check addr alignment, and fix kernel-doc (Sashiko)
  - Wrap host_stage2_split_gfn_meta() with host_stage2_try() (Sashiko)
  - Drop PKVM_HYP_REQ_SPLIT from pkvm_memunshare_call() (Sashiko)

v3 (https://lore.kernel.org/all/20261102204628.401871-1-vdonnefort@google.com/):
  - Move get_page() in stage2_map_prefault_idmap() from PATCH2 to PATCH1 (Wei-Lin, Mostafa)
  - Set map_data.phys in kvm_pgtable_stage2_annotate() (Sashiko)
  - Propagate -EHWPOISON and -EAGAIN from pkvm_pin_user_pages() to protected_pkvm_mem_abort() (Sashiko)
  - Fall back to PAGE_SIZE when a PMD_SIZE mapping overlaps an existing PAGE_SIZE one (Fuad)
  - Reject !nr_pages in pfn_range_is_valid()
  - Use mmu_invalidate_retry()
  - Rebase on 7.4-rc1

v2 (https://lore.kernel.org/all/20260911135053.146435-1-vdonnefort@google.com/):
  - Reorder patches to make the series bisectable.
  - Check memcache and WARN_ON if stage-2 split fails in __pkvm_host_split_guest()
  - __pkvm_pgtable_stage2_split(): return 0 if the block is already split.
  - kvm_pgtable_stage2_table_install() to let mem_protect handle the stage-2 splitting.
  - Refactor fix_host_ownership() (Wei-Lin)
  - Handle non-linear mappings in fix_host_ownership()
  - Drop _page_ from __pkvm_host_reclaim_page_guest and __pkvm_reclaim_dying_guest_page() (Wei-Lin)
  - Make a separate patch for hyp_poison_range() (Wei-Lin)
  - Use folio_add_pins in __pkvm_pgtable_stage2_split() (Wei-Lin)
  - Hold the mmap_read_lock() for transparent_hugepage_adjust() (Sashiko)
  - Catch 2MiB fault on existing 4KiB fault (Sashiko)
  - Add share/unshare testing of split blocks.
  - Rebased on 7.3-rc2

v1 (https://lore.kernel.org/all/20260803100904.3563942-1-vdonnefort@google.com/)

Keir Fraser (1):
  KVM: arm64: Prefault host stage-2 entries on block split

Vincent Donnefort (22):
  KVM: arm64: Propagate host stage-2 annotated entries on block split
  KVM: arm64: Allow block-level stage-2 annotation
  KVM: arm64: Use block-level annotations when setting up the host
    stage-2
  KVM: arm64: Make pKVM ownership selftest an HVC
  KVM: arm64: Reject zero-sized ranges in pfn_range_is_valid()
  KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
  KVM: arm64: Add a range to __pkvm_host_donate_guest()
  KVM: arm64: Add a range to hyp_poison_page()
  KVM: arm64: Add a range to __pkvm_host_reclaim_guest()
  KVM: arm64: Add a range to __pkvm_guest_share_host()
  KVM: arm64: Add a range to __pkvm_guest_unshare_host()
  KVM: arm64: Handle huge mappings in
    __pkvm_host_force_reclaim_page_guest()
  KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
  KVM: arm64: Add a range to pKVM ownership selftest
  KVM: arm64: Warn on pKVM guest stage-2 block collapse
  KVM: arm64: Add vcpu conduit for pkvm_hyp_req
  KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
  KVM: arm64: Add __pkvm_host_split_guest HVC
  KVM: arm64: Extend pKVM page ownership selftests to cover guest block
    split
  KVM: arm64: Add PKVM_HYP_REQ_SPLIT
  KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to host sharing
  KVM: arm64: Stage-2 huge mappings for protected VMs

 arch/arm64/include/asm/kvm_asm.h              |  14 +-
 arch/arm64/include/asm/kvm_hcall.h            |  10 +-
 arch/arm64/include/asm/kvm_host.h             |  31 +
 arch/arm64/include/asm/kvm_pgtable.h          |  13 +
 arch/arm64/include/asm/kvm_pkvm.h             |  35 +-
 arch/arm64/kvm/handle_exit.c                  |   3 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  25 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |   5 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   6 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |  12 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  43 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 591 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  41 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 165 +++--
 arch/arm64/kvm/hyp/pgtable.c                  | 140 ++++-
 arch/arm64/kvm/mmu.c                          | 128 ++--
 arch/arm64/kvm/pkvm.c                         | 247 +++++++-
 arch/arm64/kvm/trace_pkvm.h                   |   4 +-
 18 files changed, 1113 insertions(+), 400 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.708.g77570a6a1d-goog


