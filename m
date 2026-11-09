Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF160735D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IGnlxcg9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gBVNH3Zz;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qGQ/gftV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RKQQUYkySIuWXQVY7MpCGDxE52luhCcCeJyJckRYrE0=; b=IGnlxcg9WpU7Sg
	tlliDpC2a1tOKKPmgt1E8B9OfICSZ2j1/wgHEfVW4GtfRqRGWmimYqczOsK+SiSWxCpiGAJ14zpEs
	1zQCaK9rsPgr1wlsUQ+AJKoxsw/VekiIznyS0ldqIrtBfE5lE4LqUEZJ8OoMfZ3N69Z3rjOVDS4Fl
	2NAzLtzAbFoo5xKDVl2gEbORRh6RhDhyhLs31n361HgclDOXyXwRv6ThdrhJbr2qV8CqnbmBRD37B
	PBLoCAsO/UQmbHO5L1ngUerdDpN8+zf7JTVWT9k7aHRkdLcwh7N16oeh8Semfyhy0gR3I4Be1sZKV
	G1/cw0IIKklb21tn9Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4q-0000000086e-25Dx;
	Mon, 09 Nov 2026 08:50:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4j-000000007vw-0vBE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Nov 2026 08:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RKQQUYkySIuWXQVY7MpCGDxE52luhCcCeJyJckRYrE0=; b=gBVNH3ZzAgVj0rP1wiG7Ps+cko
	hqnyL/UG+NFld/DWQqod9UX3hHYgxibJj3W52QrTSha0lhhGrxaLaK6RqYdbc3XELif8FwjZ4z5/A
	+kTNhpOqSBpwH+YRFqy5/8rvL4jn7SaWlJnYXQc0dbGV8Q9RmkIVSBq4tOZp1QRklAlScqJkmK/X2
	VNMlN73H4FElVynkWXgccmkT4tZgVl4xPC37TG8ij7XGm12zSmLKCYHpyj/Wr9m0O+HSUPxz+U57e
	CGzMChyPBqqiJmSzwyc0hJGkNkVeRykV9zgH+xquogQyu4IcK6S61mMljaK/RNDDN2SdDC2P1NqOM
	SEJCnyxA==;
Received: from out-82.mta1.migadu.com ([95.215.58.82] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4g-00000006Tck-0UT4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:49:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pvY9wx5XSdLlCtF08ytiK5bki8t7g1hmkb8W5MfUPHI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214196; v=1; x=1794818996;
 b=qGQ/gftVTTbGZfwL+l0GXJMRIfJWWbLu4dDKaOxOwWKqhPjKDITZMN/GCgSvkST5Arbyxm3H
 P1FBQQH4FWbh6uqFtyiGxcqT1P0+ffs/dsSQ83mYrEji940IrrVKgQdFFxhAnPoXevAjufXWgjU
 wN+KWBJqJ3PrwLZIigGQ7BCw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 72df1d8da48c0203;
	Mon, 09 Nov 2026 08:49:55 +0000
X-Mizu-Trace-ID: 72df1d8da48c0203
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/19] KVM: arm64: selftests: Check MOPS, PIE, POE and FPMR in a protected VM
Date: Mon,  9 Nov 2026 08:48:54 +0000
Message-ID: <20261109084854.840576-20-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_084958_312598_71E97CF4 
X-CRM114-Status: GOOD (  16.36  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For each of MOPS, S1PIE, S1POE and FPMR that a protected VM's ID
registers advertise, EL2 has to set up the HCRX_EL2 enables, the
fine-grained traps and the context switch to match.

Check from the guest that each feature works when its ID field is set
and UNDEFs when it is clear. Working means the registers read back what
the guest writes, and a SETP/SETM/SETE fill completes. At v7.4-rc1 pKVM
advertises none of the four, so only the UNDEF cases run. Also check
that ID_AA64PFR2_EL1, ID_AA64ISAR3_EL1 and ID_AA64MMFR3_EL1 expose
nothing beyond the supported features, and that WFxT and the 128-bit
System register features stay hidden.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/arm64/pkvm_id_regs.c        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c b/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
index 93ed557a30bc6..7a8367af3e009 100644
--- a/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/pkvm_id_regs.c
@@ -33,6 +33,11 @@
 #define DBGBCR_VAL	((0xfUL << 5) | (1UL << 1))
 #define DBGWCR_VAL	((0xffUL << 5) | (3UL << 3) | (1UL << 1))
 
+/* Allocated encodings only: a reserved one reads back UNKNOWN. */
+#define PIR_PATTERN	0xeca87653210eca87UL
+#define POR_PATTERN	0x76543210UL
+#define FPMR_PATTERN	0x2a5a55c000UL
+
 extern unsigned char brk_insn;
 
 static volatile bool undef_seen;
@@ -132,6 +137,20 @@ static void assert_id_regs(void)
 	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64ISAR2_EL1) &
 			(ID_AA64ISAR2_EL1_APA3_MASK | ID_AA64ISAR2_EL1_GPA3_MASK), 0);
 
+	/* WFxT and the 128-bit System register and instruction features are hidden. */
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64ISAR2_EL1) &
+			(ID_AA64ISAR2_EL1_WFxT_MASK | ID_AA64ISAR2_EL1_SYSREG_128_MASK |
+			 ID_AA64ISAR2_EL1_SYSINSTR_128_MASK), 0);
+
+	/* Of these registers, only the fields of the features pKVM supports can be set. */
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64PFR2_EL1) & ~ID_AA64PFR2_EL1_FPMR_MASK, 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64ISAR3_EL1) &
+			~(ID_AA64ISAR3_EL1_FPRCVT_MASK | ID_AA64ISAR3_EL1_LSFE_MASK |
+			  ID_AA64ISAR3_EL1_FAMINMAX_MASK | ID_AA64ISAR3_EL1_LSUI_MASK), 0);
+	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64MMFR3_EL1) &
+			~(ID_AA64MMFR3_EL1_TCRX_MASK | ID_AA64MMFR3_EL1_SCTLRX_MASK |
+			  ID_AA64MMFR3_EL1_S1PIE_MASK | ID_AA64MMFR3_EL1_S1POE_MASK), 0);
+
 	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64DFR1_EL1), 0);
 	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64AFR0_EL1), 0);
 	GUEST_ASSERT_EQ(read_sysreg_s(SYS_ID_AA64AFR1_EL1), 0);
@@ -217,6 +236,56 @@ static void assert_undef_regs(void)
 	GUEST_ASSERT_UNDEF(asm volatile(".arch_extension sve\n rdvl x0, #1" : : : "x0"));
 }
 
+/* setp [x0]!, x1!, x2; setm; sete */
+static void mops_set(void *dst, u64 len, u64 val)
+{
+	register void *d asm("x0") = dst;
+	register u64 n asm("x1") = len;
+	register u64 v asm("x2") = val;
+
+	asm volatile(".inst 0x19c20420\n\t.inst 0x19c24420\n\t.inst 0x19c28420"
+		     : "+r"(d), "+r"(n) : "r"(v) : "cc", "memory");
+}
+
+/* A feature's registers and instructions work when it's advertised and UNDEF when hidden. */
+static void assert_feature_access(void)
+{
+	u64 mmfr3 = read_sysreg_s(SYS_ID_AA64MMFR3_EL1);
+	u64 buf[4] = {};
+	int i;
+
+	if (SYS_FIELD_GET(ID_AA64MMFR3_EL1, S1PIE, mmfr3)) {
+		GUEST_ASSERT_RW(SYS_PIR_EL1, PIR_PATTERN);
+		GUEST_ASSERT_RW(SYS_PIRE0_EL1, PIR_PATTERN);
+	} else {
+		GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_PIR_EL1));
+		GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_PIRE0_EL1));
+	}
+
+	if (SYS_FIELD_GET(ID_AA64MMFR3_EL1, S1POE, mmfr3)) {
+		GUEST_ASSERT_RW(SYS_POR_EL1, POR_PATTERN);
+		GUEST_ASSERT_RW(SYS_POR_EL0, POR_PATTERN);
+	} else {
+		GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_POR_EL1));
+		GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_POR_EL0));
+	}
+
+	if (SYS_FIELD_GET(ID_AA64PFR2_EL1, FPMR, read_sysreg_s(SYS_ID_AA64PFR2_EL1)))
+		GUEST_ASSERT_RW(SYS_FPMR, FPMR_PATTERN);
+	else
+		GUEST_ASSERT_UNDEF((void)read_sysreg_s(SYS_FPMR));
+
+	if (SYS_FIELD_GET(ID_AA64ISAR2_EL1, MOPS, read_sysreg_s(SYS_ID_AA64ISAR2_EL1))) {
+		undef_seen = false;
+		mops_set(buf, sizeof(buf), 0x5a);
+		GUEST_ASSERT(!undef_seen);
+		for (i = 0; i < ARRAY_SIZE(buf); i++)
+			GUEST_ASSERT_EQ(buf[i], 0x5a5a5a5a5a5a5a5aUL);
+	} else {
+		GUEST_ASSERT_UNDEF(mops_set(buf, sizeof(buf), 0x5a));
+	}
+}
+
 static void assert_host_handled(void)
 {
 	/* Host-handled registers reach the guest with no UNDEF. */
@@ -236,6 +305,7 @@ static void guest_baseline(void)
 	else
 		assert_debug_raz_wi();
 	assert_undef_regs();
+	assert_feature_access();
 	assert_host_handled();
 
 	asm volatile("brk_insn: brk #0");
-- 
2.47.3


