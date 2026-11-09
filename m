Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD345606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zosk8VVs;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JYmoB1rv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n7dKS3uLxqz3hFWxQ/Hr/z79HJ4aXd4+1+IODE3lfqg=; b=zosk8VVsNongYL
	STSY9fjSwzE6Sd8fW+MwudmdWkYTgODM+fjTHlkZgrckmG3AoRAX7GqDdsyloRWicFtBnEyszu+qy
	ohBatHiJt62Ff2GK4IMeFjbFTiVzBLGEu51r1WB+V4ve5K8lt5Yel3a4luA4KhB+yBOzliJQ4tzat
	sFVwH2xOZitJAHxpGBSsFvKR6ojLwpQ0ivb+FF5baVlZPIwx072VEbL9BEtvZXfIddhoIwcytBn+w
	jb29ixxOxuKgVKSpfv5v8hwcbArnmp/pmCdUc9EbqdZ+HIpFY9RfP/LtPKsyoR+kAxRdq6ViMaIj/
	QqAAGclAolXm4lc0/WvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3n-0000000077A-0S7W;
	Mon, 09 Nov 2026 08:49:03 +0000
Received: from out-149.mta0.migadu.com ([2001:41d0:1004:224b::95] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL3i-0000000074d-27m9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:48:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZJp1sWID1Y8h4yq9sHvxEkK5gbfl1wOQbzOgvALLC6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214136; v=1; x=1794818936;
 b=JYmoB1rvb1NwrRmhDmfRkFPQsb7Ofvk+pfQwPzft0tj53oNTU9Q2T2h959A+ZfnOr1izEMM1
 c7+Mei6o3PKNMYEZ57XqIUhxHCCE44FJsU1fXN17A64PbOvHKMmGm0XzHmLzZ1mRBbQCTK7TfZe
 GIEHXnvnMo+r1HKdpcklITR8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f659de905a07cf78;
	Mon, 09 Nov 2026 08:48:56 +0000
X-Mizu-Trace-ID: f659de905a07cf78
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
Subject: [PATCH v2 02/19] KVM: arm64: selftests: Inject an abort before a vCPU's first run
Date: Mon,  9 Nov 2026 08:48:37 +0000
Message-ID: <20261109084854.840576-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004858_683660_26483F10 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM commits an external abort injected with KVM_SET_VCPU_EVENTS
immediately, even before the vCPU's first run. For a normal VM on a pKVM
host that path panicked the hypervisor until commit a2bb5f5c67a95
("KVM: arm64: Pin the host vCPU before adjusting its PC under pKVM"). No
test injects before the first run.

Add one, checking that the guest takes the abort at its entry point.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/arm64/external_aborts.c     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index 1a858d0d82968..45c9300b2ca0e 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -113,6 +113,26 @@ static void vcpu_run_expect_sync(struct kvm_vcpu *vcpu)
 	__vcpu_run_expect(vcpu, UCALL_SYNC);
 }
 
+static void test_sea_before_run_guest(void)
+{
+	GUEST_FAIL("Guest ran before taking the injected abort");
+}
+
+/* Test that an abort injected before the vCPU's first run is taken at its entry point. */
+static void test_sea_before_run(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_sea_before_run_guest,
+							expect_sea_handler);
+
+	expected_abort_pc = (u64)test_sea_before_run_guest;
+	sync_global_to_guest(vm, expected_abort_pc);
+
+	vcpu_inject_sea(vcpu);
+	vcpu_run_expect_done(vcpu);
+	kvm_vm_free(vm);
+}
+
 extern char test_mmio_abort_insn;
 
 static noinline void test_mmio_abort_guest(void)
@@ -420,6 +440,7 @@ static void test_serror_amo(void)
 
 int main(void)
 {
+	test_sea_before_run();
 	test_mmio_abort();
 	test_mmio_nisv();
 	test_mmio_nisv_abort();
-- 
2.47.3


