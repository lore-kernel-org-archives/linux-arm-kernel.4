Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E85606BFAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltz3+JfQ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MnuHt9Sb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IFAfLDa2G0pobeptroxUQtjS8pyt7hWdsBfMuvMIm20=; b=ltz3+JfQB61dqy+d2r87/Fn1YH
	p1TCW70/U9xT/U6z/k12hTfsc3u7d9Uc/5X2JIBhdPu3QEd7hiPziewVFtXgW1mlcHkEf6DXR4qlB
	kbcRKfh7JhHwZJC9Tx15GGqdwqjFyB/PExMDQOIfZHaow/M2LnOLDDjQmlEB3/X1UpxvUjwktXWG9
	WgBhsAyw1Jn0ipCUbAK4a3M/P6JQ0VDp8d6jBvC8JAzicKxDjHobaDaZCys1qpjYpX9nVgs/t6ctO
	UQ1Q/3SZ5dlJIPbR9iTw9suzt194fJLRMQ0RShSSX/BkFNbfouYWjTLS6Df46ghjqov3ccumgBUxZ
	gjD6BcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMYh-0000000CzpR-2N2D;
	Fri, 06 Nov 2026 16:12:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMYe-0000000CzoK-2yB8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:12:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6034A143D;
	Fri,  6 Nov 2026 08:12:48 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F70A3F673;
	Fri,  6 Nov 2026 08:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793981571; bh=fXE743sIM/nQSiWcBGoUx8NbFyewBUf1llAQH/QXNJM=;
	h=From:To:Cc:Subject:Date:From;
	b=MnuHt9Sb+syEafyBaeM1VdRur+RFCBLMdc35HRKO0voFqYPihaxQ/0iuOxzGzwnyx
	 XO1HWEmbzX1i9JdIvtQzoL9m6uh+qWaKwoDrZ8MdF2Dl67cMz0RxWaf9kpnurUxmwp
	 f6b/zR92MB0nQ44lhocGA/na1WBmaZYVQ8UcSxJc=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v4 0/3] Optimize S2 hugepage splitting, introduce skip-level flags
Date: Fri,  6 Nov 2026 16:12:35 +0000
Message-ID: <20261106161240.1345126-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4418; i=leo.bras@arm.com; h=from:subject; bh=6jIvAO7qm3jjgSq+Dla4mVhMhm4SWwAU9Gn4g47wvek=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLe/smqfXdr3/QC53L1aX8mMvmf+DYhfPHizStCGDTN9 9+ce7y4q6OUhUGMi0FWTJFF9tH8VTzfp2QcufJjAcwcViaQIQxcnAIwkWtzGBl+nDzL6qf1XndL v2DdF9XkSQ3iDCXR6UtPaD+YVmBqKreZkeHv5rbfu1j/qv3Y1Lm9O1PN9JSoVuGXkyldK0+WnWU Ne8gMAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_081252_928976_9773D865 
X-CRM114-Status: GOOD (  13.11  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


While playing with dirty-bit tracking, I decided to take a look on how page
splitting works. Found out all entries are walked, even though we don't need
to walk the level-3 entries, as they don't need to be split. 

This patches' idea is to introduce new walking flags to skip pagetable
levels 0-3.

Optimization measured on two scenarios involving eager-splitting on a
VM with 32 memslot of 2GB (total 64GB), and vcpu per slot:
- Scenario 1: No manual protect, whole memslot split at dirty-track enable
  (KVM_SET_USER_MEMORY_REGION2 ioctl with KVM_MEM_LOG_DIRTY_PAGES)
  - Split happens only once, whole region
  - Evalutes improved batch performance of splitting
- Scenario 2: Manual protect, split happens during every dirty-bit clean
  (KVM_CLEAR_DIRTY_LOG ioctl), average for 2 iterations.
  - Split called multiple times, for smaller 64-page sections.
  - Evaluate improved performance for multiple calls

Scenario 1, improvement on dirty-track enable ioctl for the memslot:
- Memory was already split (4k pages):  -47.82% runtime
- THP backed memory:                    -27.50% runtime
- 64x1GB hugetlb memory:                -28.47% runtime

Scenario 2, improvement on dirty-log clean ioctl for the memslot:
- Memory was already split (4k pages):  -44.72% runtime
- THP backed memory:                    -29.80% runtime
- 64x1GB hugetlb memory:                -30.01% runtime

For collecting above numbers, the following script was ran in both vanilla
and patched kernels, with kernel parameter 'default_hugepagesz=1G', on an
TX2 with 128GB RAM.

--- dirty_test.sh
#!/bin/bash
filename=$(uname -r |cut -d'-' -f 4-)

run_test(){
  base_test="./dirty_log_perf_test -b 2G -v 32 -m 6 -m 8"

  # Manual cleaning disable
  ${base_test} -g
  ${base_test} -g -s anonymous_thp
  echo 64 > /proc/sys/vm/nr_hugepages  
  ${base_test} -g -s shared_hugetlb
  echo 0 > /proc/sys/vm/nr_hugepages

  # Manual cleaning enable
  ${base_test}
  ${base_test} -s anonymous_thp
  echo 64 > /proc/sys/vm/nr_hugepages  
  ${base_test} -s shared_hugetlb
  echo 0 > /proc/sys/vm/nr_hugepages
}

run_test 2>&1 | tee ${filename}
---

Above dirty_log_perf_test command is the standard kvm selftest found in the
kernel tree. It tested the following guest modes:
Testing guest mode: PA-bits:40,  VA-bits:48,  4K pages
Testing guest mode: PA-bits:40,  VA-bits:48, 64K pages
(Modes with PA-bits:36 were discarted in this version, given the amount
of RAM being used for testing, and the similarity of previous results)

Performance numbers from above modes were used to calculate average showed
in the optimization improvements.

Changes since v3:
- Check if root level should be skipped,
- Improve commit messages (Marc)
- Improve skip_level documentation (Marc & Wei Lin)
- Improved skip_level code (Marc)
- Dropped skip_children explanation in the cover letter (Dev)
- Rebased on top of v7.3-rc5
v3 Link: https://lore.kernel.org/all/20260708134101.2514759-1-leo.bras@arm.com/

Changes since v2:
- Rebased on top of v7.2-rc1
- Improved testing, added more memory, re-tested
  - Now: 32 vcpus @ total of 64G
  - Before: 1cpu @ 16G
v2 Link: https://lore.kernel.org/all/20260618131447.764085-1-leo.bras@arm.com/

Changes since v1:
- Fixed inverted flag verification priority (Sashiko)
- Fixed incorrectly skipping POST call if level was skipped (Sashiko), and to that
- New pre-patch that changes goto-out -> return to avoid re-testing walk_continue 
v1 Link: https://lore.kernel.org/lkml/20260610202112.2695205-2-leo.bras@arm.com/

Changes since RFC:
- Changed approach from return value to walk flags (Will Deacon)
- Discarted skip_child approach (Oliver Upton)
- Measured in real hardware, and from userspace perspective (Marc Zyngier)
- Better explanation of what and how numbers were collected
RFC Link: https://lore.kernel.org/all/20260515195904.2466381-1-leo.bras@arm.com/

Thanks!
Leo

Leonardo Bras (3):
  KVM: arm64: Avoid re-testing walk_continue
  KVM: arm64: Introduce KVM_PGTABLE_WALK_SKIP_LEVEL* walk flags
  KVM: arm64: Make stage2_split_walker() skip unnecessary walks

 arch/arm64/include/asm/kvm_pgtable.h | 14 ++++++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 25 ++++++++++++++++++-------
 2 files changed, 32 insertions(+), 7 deletions(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.55.0


