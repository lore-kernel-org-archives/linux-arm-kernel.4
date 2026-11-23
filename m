Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C45606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x6XLF3gi;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xWfhXSM2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JNegrRp/NUexDN4FEoZ14wbn4iQ1tVQRQNeyZoOBH0s=; b=x6XLF3gidRpo+CiwiiI3H8JO+A
	aWVieKK6ksUVh6Yuq2bBLHrIc/1GZwIPPwjGCqYCdSeaZD/RbvDGUoUS5wvzeDIcRUQXEulh1Zjb6
	lFut7jCYSKzgLfvwfT17LdHVX4ajrrlOyBk74dsZuqgLP2SIyBd09iI27Yy/QObBbAbS3ETeaHcPH
	K2Scsd+iIuX0YLZ7ENIQE1ipSOvGntkDGnWxMAFxJIJWtJIuIajhryIzC290xOmbZzO3+e+F1Q6yg
	BFuAFMJU6Cmh8Yqes3T50iLjZLZuq5spL5DS8iwYlV5F+z7Njvop5x16Ev588Mps6Oz1Co2GPxmwL
	rUbLq9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROF-00000002yFN-2WiX;
	Mon, 23 Nov 2026 10:35:15 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVROB-00000002yDs-3KJv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:35:14 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=e7GMFbIO7ODomw2VAv04MqAxjpRjG/NYtGRnw2lyuKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430108; v=1; x=1796034908;
 b=xWfhXSM27ELGPggwdUiw9YbpsPUnExY7Y5Xk5r8Y8wed35kWjr36YcmXC1Ftx2QhChXgsdNP
 SF4Xq7aADZBFk5dwl4C1z9wF3CYrYGTLMCgL2SVVFBAegQAAAJzjAfR0B7IUbBgfEIS/PF/d9kq
 28o+GyIfDdkWPaSOnHaVuNAI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1b19a606ff982d8d;
	Mon, 23 Nov 2026 10:35:06 +0000
X-Mizu-Trace-ID: 1b19a606ff982d8d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/2] KVM: arm64: Fix stage-2 THP mapping on hosts with 2-level page tables
Date: Mon, 23 Nov 2026 10:35:03 +0000
Message-ID: <20261123103505.1006067-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_023512_603664_F454D3B9 
X-CRM114-Status: GOOD (  10.46  )
X-Spam-Score: -2.8 (--)
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

Hi folks,

A fix for how KVM maps a THP at stage-2 on a host with 2-level page
tables (64K pages with a 42-bit VA, or 16K pages with a 36-bit VA).
There, KVM also maps the host memory that follows a THP into the guest
if the guest's first access to the THP isn't to its first page.

transparent_hugepage_adjust() is meant to round the faulting pfn down to
the start of the THP, but its mask is a no-op when the PMD level is
folded, and has been since THP support was added. Before 6f745f1bb5bf2
("KVM: arm64: Convert user_mem_abort() to generic page-table API"), KVM
mapped only the THP anyway, which is why the Fixes: tag is on that
commit. Kernels before f583a53c2b8a ("KVM: arm64: Make fault_ipa
immutable") round the IPA with PMD_MASK, so only the pfn line of the fix
applies there.

Tested on QEMU with a 64K, 42-bit VA host kernel, where the new
selftest scenario fails without the fix and passes with it.

Based on Linux 7.4-rc3 (aebb727447640).

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Fix THP block mapping when the PMD level is folded
  KVM: arm64: selftests: Test a THP whose first fault is on a tail page

 arch/arm64/kvm/mmu.c                          |  4 +-
 .../kvm/arm64/stage2_block_transitions.c      | 56 ++++++++++++++++++-
 2 files changed, 55 insertions(+), 5 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


