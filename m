Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88F606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l39SA2iP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a/VVEDZ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XjEaU5iZiIoWZWXI3lEp1cSCckG214xKlxFgGMZy1WQ=; b=l39SA2iPAdxNeTAUcvskmd8H50
	AC7ngGiydShlVwrToW+UmD/WpTAg2e3gBestwiltvoVl55AhgWkCS0cXkDinLLgVlDb4dC0TBxVJE
	FOSuJ23TPpbvFBJXnyTnyY0Eol+El0wMMFbiWm38RJuZGM4T3UQw3S47Lu6fyA/iOSc7uUbbeqOwi
	m3d1rDA1ZRfoA3DVGxMq4OdxmVDVCzRDjVC6MRmQpkz7HAudlDHRJHsEFAq4Zz+7EtfFRpEr1kYzD
	DQqKYupxUJiZIqZwCLd45PXvc/28mp9B859eHMeR/ULTeuDfcQaNwQrQMzxvv0tXB0z7yvXvjaHNL
	ats8P7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKnW-000000003xi-0OPZ;
	Mon, 09 Nov 2026 08:32:14 +0000
Received: from out-229.mta0.migadu.com ([2001:41d0:1004:224b::e5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKnS-000000003vx-2qoa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:32:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jOYOI4w8TbsJs0zAnXNNJjeqeD+Qjc1ew2XDbtbhPHw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213125; v=1; x=1794817925;
 b=a/VVEDZ2Ix9/H1yhrbaHu+Si2FsbyKGLGYbK4OeWf1L1x64SlHnSwR8v+ZHhe03BZYNwwV4U
 myQQb8NSOiu62kVPCTBEvAH3BoHk5dIdEt/j4swG0ag6JCoW46D+Obz/+H3kO5XFU2hwrk6L+gx
 sHSpbVBchMdJPiIR0aw0iSNw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b213c8f6249ab49b;
	Mon, 09 Nov 2026 08:32:05 +0000
X-Mizu-Trace-ID: b213c8f6249ab49b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] KVM: arm64: Support debug, SVE, MOPS, PIE/POE, FPMR and more in protected VMs
Date: Mon,  9 Nov 2026 08:31:49 +0000
Message-ID: <20261109083205.806619-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003210_923005_3BF3BFFB 
X-CRM114-Status: GOOD (  11.33  )
X-Spam-Score: -2.1 (--)
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

With most of the groundwork now merged, bringing protected VMs up to
the features we support for them in Android turns out not to be a big
series. So this folds self-hosted debug [1] and SVE [2], which I posted
separately last week, into one series with the rest. Both are small,
and keeping them apart would only leave a few conflicts where they add
neighbouring lines to the pVM ID-register code. The debug and SVE
patches are unchanged from those postings.

  01:     Self-hosted debug.
  02-05:  SVE, with EL2 owning a protected vCPU's SVE state.
  06-07:  Compute a protected vCPU's fine-grained traps at EL2.
  08-16:  Advertise TCR2, SCTLR2, S1PIE, S1POE, MOPS, FPMR and the
          features EL2 already handles for non-protected guests.

Tested on QEMU, in hVHE and nVHE, and on FVP for S1POE and the fields
QEMU doesn't model (CLRBHB, RPRFM, ECBHB, LSFE, LSUI, HAFT, ETS3 and
F16MM). v2 of the pKVM selftests series [3] will cover debug, SVE,
MOPS, PIE, POE and FPMR.

Based on Linux 7.4-rc1 (6628e7d4c6b25); it also applies to 7.4-rc2
(7475ea8b58616).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261102093950.2922035-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20261105130456.1617185-1-fuad.tabba@linux.dev/
[3] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/

Fuad Tabba (16):
  KVM: arm64: Add support for self-hosted debug in protected guests
  KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
  KVM: arm64: Allocate a protected vCPU's SVE state at EL2
  KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
  KVM: arm64: Allow protected VMs to use SVE
  KVM: arm64: Move the VM's FGU initialisation into config.c
  KVM: arm64: Compute a protected vCPU's fine-grained traps at EL2
  KVM: arm64: Advertise TCR2, SCTLR2, S1PIE and S1POE to protected VMs
  KVM: arm64: Advertise MOPS to protected VMs
  KVM: arm64: Advertise FPMR to protected VMs
  KVM: arm64: Advertise HBC, CLRBHB, RPRFM, CSSC and LUT to protected
    VMs
  KVM: arm64: Advertise FAMINMAX, LSFE, LSUI and FPRCVT to protected VMs
  KVM: arm64: Advertise AFP and RPRES to protected VMs
  KVM: arm64: Advertise ECBHB, TIDCP1, TTST and LVA to protected VMs
  KVM: arm64: Advertise FP8 and F16MM to protected VMs
  KVM: arm64: Advertise ECV, HAFT and ETS3 to protected VMs

 Documentation/virt/kvm/arm/pkvm.rst    |  13 +-
 arch/arm64/include/asm/kvm_host.h      |   2 +-
 arch/arm64/include/asm/kvm_hyp.h       |   6 +
 arch/arm64/include/asm/kvm_pkvm.h      |   1 +
 arch/arm64/kvm/arm.c                   |   5 +
 arch/arm64/kvm/config.c                |  32 ++-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |   1 +
 arch/arm64/kvm/hyp/nvhe/Makefile       |   1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |   6 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c         |  51 ++--
 arch/arm64/kvm/hyp/nvhe/switch.c       |   1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c     | 349 +++++++++++++++++++++++--
 arch/arm64/kvm/reset.c                 |   2 +
 arch/arm64/kvm/sys_regs.c              |  17 +-
 14 files changed, 413 insertions(+), 74 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


