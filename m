Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6AB606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QGuVjvp1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ri6HXTyh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i72jvjXZYiuFvX2PVomJVIa3lpIvz23JTo9dsgI517M=; b=QGuVjvp15loRZE
	dCuw5vGhcIBoSU/ixWAlHqHC0futMHIejHwdsikmG6JSE0lFA84/atYI45HfihT/MMD1q8TovJCxb
	GfknEKShaPArVS9EOX3HmWwJ0zxyHbbEWBOtLpsPzLQsTpJ+tPnOfwRSnu5kvgYjhpCWPNLZS3fdx
	uyH85G2sDKocfmn0vc0VNuaS1q6XvhbO8WgOKAHszwmBU41rRbD+Lnz4DFETQdaqufccFdgP8l34U
	4Me/rpy8PYQYnE4PiqGDhTdiMmj7fG5vUo6dtRWWhqcFks/85nOnkWJQiLAIOjWSRkGdyXE18q4oz
	/ag3JOabP27zxVByTB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPWJ-00000000p8o-1ePx;
	Mon, 09 Nov 2026 13:34:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPWF-00000000p6G-36YR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:34:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7109955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794231282; x=1794836082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i72jvjXZYiuFvX2PVomJVIa3lpIvz23JTo9dsgI517M=;
        b=Ri6HXTyhxdXuqwKa7y9qgrGZ/TkWsyPJqpOA0kn4BfpELeAP3sr7V1YUWKaeBUifXP
         q3M8jgmS7lBIX2eyIfx3vYc18qPeh2RFp+FEHrshx0oSaFUSonkDBRni7Vjun0c7wekk
         JliWlarQA4/dOkRL2OnVAK6vEQ/uzEEbgZFJ5qw6hcyA2wj5BR0pWBJBHKORXa/vuMVU
         f7zbGGSvmCoFJI9jGifNDGYgy7sm1H00Eup3Xa0gqIATlMZjy1WQ0azDPr8nAKpwx+ut
         2CimWWTNxR8U6JKmC8uhKMyRz+pJaYEww6Ox3n8dGFPwwt5yv4tzmUU8reyR2+5FWIGY
         pYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231282; x=1794836082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i72jvjXZYiuFvX2PVomJVIa3lpIvz23JTo9dsgI517M=;
        b=v3kA0G+Xj1QsKgC8wTVKuPRk1xS8wRPsaMI+AD5D0ZmV+aOsDiJh1cY7XjGLSivqC3
         altyMv++XP/OxgH0NT9t+HO77keglUeU3Yt7yw7MW6x4DTfGUoS5vTeSlRh+DPwXtsMT
         z+5a38kcb66Zm+KxnJqyb7l7dbQlXV+dSXSa1qptLnltmsNcmiGCKLz8XpvIuJhX+AJB
         fIpSkHeuiUHqQ3lW6/2hXTwusKwJhsPBGFc0xy/FUzOC1tv9LJF9MdgA0zehvD1K6aLx
         LrSaex6Z2NTSm1P0JhWTxC2YPIryw/v4uSIUNDAnaEqByBaTDZXbws3koSGINyTmizb7
         i8ew==
X-Forwarded-Encrypted: i=1; AL+hErFwnedVijT84mFO5f9Vmr7pNwKBZdIDExiwUJgP2DIMYyc8oax6w0vY9g23cU8Ebim0ddaMrq5lJ7WhUN88XXRW@lists.infradead.org
X-Gm-Message-State: APuU4Z8lKwiPV/ekQ9O6nRAkOKzSE3z1ivDXsEY6Yie/6owKaPHDAcBJ
	6gL1C8Yct/WWgLIKOcwFGF2xtHsubMo2M204uRll+3p+jYMhMAMAKNXx
X-Gm-Gg: AYBFou0ZO62Q47luSx45P5g7yKCfBMfD5roZm8thCnOzUD7aqNAadFELpAAD0Fx6Aqn
	E+tywB2NqZZYTR8df9KNkWR0Ldk8PxRjqIoXK1vYmEcsPRVgEcwvWvLlLaNl68FSqXvtbA4N2Qq
	TKwoIN+XDXWHtmhKc1dWPEMIf24Bp8yQ+6Kox7oSUeGisVpJwxG/298uuiaEWt3H5xP5z+Ph9I9
	R8mnvJufeg4fu9DLUjVg1PWYh2/eO2d2hfp+BRExMl5GxEKTjFjsM8Nw0b9lvtlVWai3WcnQkwP
	uGRbsPM1RH1lYVSMLLAkwUnpIoFhETfSukMxRl6rbbHftFO5S19sbzDqAmLxLGRgjbcaERApPzm
	irfw81FKHreKWtZ+EqMMPQ748nqxPRwfXuRvg3jL8WNUc6nIyc43OsMlENjeD021ZOAt/aarzpR
	ctkbNJ9tmUrZ58KIpAtZQjg9mIS9awNne8zmC7tzl1gVeGjUimW0T4LHwHh+IxR5iIvRS1bZu3y
	FCJPOEY/JCTT49H2sF++buOugbt2Okt7BYNeau6Lwxx78GYEMRby3DQ38J3Zbw7eUEUnCGRQtgB
	rjLW+kvM7rdb110As3aW1UvOCeS1vqrS2lG6z6vf8KzhyCXenYn/QLeqdvvlHoefvXgA12bNYg1
	Iskx+ZyWZ0qwXObXA5/dDh9RUYQ==
X-Received: by 2002:a05:600c:19d3:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4b9633cf337mr78658475e9.9.1794231281628;
        Mon, 09 Nov 2026 05:34:41 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.57.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39899sm9140435f8f.3.2026.11.09.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:34:41 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: maz@kernel.org,
	Oliver Upton <oupton@kernel.org>
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	fahad.arslan@siemens.com,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] KVM: arm64: nv: Skip empty spans when unmapping a shadow S2
Date: Mon,  9 Nov 2026 18:34:30 +0500
Message-ID: <cfa77cdbf14d9fd24c22ab1ef9b940a0d7411699.1794229714.git.haseeb.ashraf@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109133431.185154-1-haseebashraf091@gmail.com>
References: <20261109133431.185154-1-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053444_604121_B4FB24FC 
X-CRM114-Status: GOOD (  27.21  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Emulating TLBI VMALLS12E1IS unmaps the whole shadow stage-2 of the
guest hypervisor's current VMID by passing the complete nested IPA
range to kvm_stage2_unmap_range(). That walks the range in chunks of
the largest block size and calls kvm_pgtable_stage2_unmap() on each of
them, mapped or not: 262144 chunks per shadow MMU with 4kB pages and a
48-bit PARange, each ending in a range TLBI when FEAT_TLBIRANGE and
FWB are available.

Guest hypervisors such as Xen issue this TLBI while creating domains,
and an empty table is charged for the whole IPA space. A full-range
unmap of one shadow MMU takes 0.87-1.06 s on AmpereOne (Xen on KVM,
4kB pages, function_graph). On Graviton4 (Xen-on-KVM, 48-bit IPA),
twelve VMALLS12E1IS traps took 1.46-9.50 s each (median 3.09 s), all
of it in stage2_apply_range():

  22)   4.180 us    |              } /* kvm_pgtable_stage2_unmap */
  22) $ 2278329 us  |            } /* stage2_apply_range */
  22) $ 2278329 us  |          } /* __unmap_stage2_range */
  22) $ 2278330 us  |        } /* kvm_stage2_unmap_range */
  22) $ 2278331 us  |      } /* s2_mmu_unmap_range */
  22) $ 2278337 us  |    } /* kvm_s2_mmu_iterate_by_vmid */
  22) $ 2278347 us  |  } /* handle_vmalls12e1is */

Add kvm_stage2_unmap_all(). It uses kvm_pgtable_get_leaf() to find the
entry covering the current address and, if that is a zero descriptor
at least as large as an unmap chunk, skips to the end of the span
without entering the unmap walker. Everything else is unmapped chunk
by chunk as before, so populated chunks keep their unmap, cache
maintenance and table reclamation ordering. Non-zero invalid
descriptors are never skipped, as they can carry software state.

Populated chunks use the tracked unmap, and the guest stage-2 records
of a skipped span are removed under the same mmu_lock hold: nothing is
mapped there, so they are stale. Dropping them after the walk would be
wrong if mmu_lock was released, as a concurrent fault could have
mapped something behind it.

The helper ends with a VMID-wide TLBI: VMALLS12E1IS also invalidates
stage-1 translations, which the per-chunk invalidations used to do
even for empty tables. mmu_lock may be dropped between spans if the
caller allows blocking, as for the range unmap.

Only the VMALLS12E1IS handler is converted here.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 arch/arm64/include/asm/kvm_mmu.h |  1 +
 arch/arm64/kvm/mmu.c             | 80 ++++++++++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c        | 20 ++++----
 3 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 32392abf2e21..45655a669bd7 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -184,6 +184,7 @@ void __init free_hyp_pgds(void);
 
 void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 			    u64 size, bool may_block);
+void kvm_stage2_unmap_all(struct kvm_s2_mmu *mmu, bool may_block);
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end);
 void kvm_stage2_wp_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end);
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..af45c4226b31 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -409,6 +409,86 @@ void kvm_stage2_unmap_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 	kvm->arch.vm_s2_ops->vm_stage2_unmap_range(mmu, start, size, may_block);
 }
 
+/**
+ * kvm_stage2_unmap_all -- Unmap a whole shadow stage-2
+ * @mmu:       The shadow stage-2 MMU to unmap
+ * @may_block: Whether or not we are permitted to block
+ *
+ * Remove every mapping from a shadow stage-2, as unmapping its whole IPA
+ * space with kvm_stage2_unmap_range() would, but without entering the
+ * unmap walker for the (usually vast) parts of the IPA space that are
+ * already empty. A span covered by a zero descriptor that is at least as
+ * large as an unmap chunk is skipped; everything else is unmapped chunk
+ * by chunk, exactly as before.
+ *
+ * Like kvm_stage2_unmap_range(), this must be called with mmu_lock held
+ * for write, and may drop it between spans if @may_block is set.
+ */
+void kvm_stage2_unmap_all(struct kvm_s2_mmu *mmu, bool may_block)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	phys_addr_t addr = 0, end = kvm_phys_size(mmu);
+	bool lock_dropped = false;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
+	if (WARN_ON_ONCE(!kvm_is_nested_s2_mmu(kvm, mmu)))
+		return;
+
+	do {
+		struct kvm_pgtable *pgt = mmu->pgt;
+		phys_addr_t next;
+		kvm_pte_t pte;
+		s8 level;
+
+		/*
+		 * We may be raced on PGT teardown when we drop mmu_lock.
+		 * That's fine as the PGT is legitimately no longer present.
+		 */
+		if (!pgt) {
+			WARN_ON_ONCE(!lock_dropped);
+			return;
+		}
+
+		/*
+		 * A zero descriptor at, or above, the unmap chunk level
+		 * covers an empty span. Do not skip non-zero invalid
+		 * descriptors, as the unmap walker may have to clear the
+		 * software state they carry. Finer-grained leaves keep the
+		 * chunk-sized unmap, so that a populated table is not
+		 * processed one page at a time.
+		 */
+		if (!kvm_pgtable_get_leaf(pgt, addr, &pte, &level, 0) &&
+		    !pte && level <= KVM_PGTABLE_MIN_BLOCK_LEVEL) {
+			next = __stage2_range_addr_end(addr, end,
+						       kvm_granule_size(level));
+			/* Nothing is mapped here, so any record is stale. */
+			kvm_remove_guest_s2_mappings(mmu, addr, next - addr);
+		} else {
+			next = stage2_range_addr_end(addr, end);
+			if (WARN_ON_ONCE(kvm_pgtable_stage2_unmap_tracked(pgt, addr,
+									  next - addr)))
+				break;
+		}
+
+		if (may_block && next != end) {
+			cond_resched_rwlock_write(&kvm->mmu_lock);
+			lock_dropped = true;
+		}
+		addr = next;
+	} while (addr != end);
+
+	/*
+	 * Skipping empty spans must not skip the invalidation that the
+	 * guest operation implies: a TLBI VMALLS12E1IS also invalidates
+	 * stage-1 translations, and a context that does not use the shadow
+	 * page tables can have TLB entries tagged with this MMU's VMID
+	 * even though they are empty. The per-chunk range invalidations
+	 * used to provide this as a side effect.
+	 */
+	kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+}
+
 void kvm_stage2_flush_range(struct kvm_s2_mmu *mmu, phys_addr_t addr, phys_addr_t end)
 {
 	stage2_apply_range_resched(mmu, addr, end, KVM_PGT_FN(kvm_pgtable_stage2_flush));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 850eba167aad..58c221e7c710 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4124,26 +4124,26 @@ static void s2_mmu_unmap_range(struct kvm_s2_mmu *mmu,
 	kvm_stage2_unmap_range(mmu, info->range.start, info->range.size, true);
 }
 
+static void s2_mmu_unmap_all(struct kvm_s2_mmu *mmu,
+			     const union tlbi_info *info)
+{
+	/* See s2_mmu_unmap_range() for the rules when dropping mmu_lock. */
+	kvm_stage2_unmap_all(mmu, true);
+}
+
 static bool handle_vmalls12e1is(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 				const struct sys_reg_desc *r)
 {
 	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
-	u64 limit, vttbr;
+	u64 vttbr;
 
 	if (!kvm_supported_tlbi_s12_op(vcpu, sys_encoding))
 		return undef_access(vcpu, p, r);
 
 	vttbr = vcpu_read_sys_reg(vcpu, VTTBR_EL2);
-	limit = BIT_ULL(kvm_get_pa_bits(vcpu->kvm));
 
-	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr),
-				   &(union tlbi_info) {
-					   .range = {
-						   .start = 0,
-						   .size = limit,
-					   },
-				   },
-				   s2_mmu_unmap_range);
+	kvm_s2_mmu_iterate_by_vmid(vcpu->kvm, get_vmid(vttbr), NULL,
+				   s2_mmu_unmap_all);
 
 	return true;
 }
-- 
2.43.0


