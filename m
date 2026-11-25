Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86221606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GGZVaD4a;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=cPy9shWy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ec2abqXUKspUvFH12/nCiZwBysoielu6/ZVveaDMOS8=; b=GGZVaD4ab42OqP
	yAe/cWiLfJ8i7ABn407pGbvYlq9nPNL+8qInGUEtiFqSvD3uRLsch5BHSfObugqn28zoBuiWEZQhd
	dwc96ecQkFCcTkARY7JuCoimMBEcj56j9Lu+OVBH2KWGjPoNlUTQLklvEuNeccOQMD+A6Xq84b+nf
	2fp+ZEUgk0mrpuyhIrNpYv5S0q0Mb8plt5BDS2taOF2dShPdGfHGMJZmZoRMngoFu3U/4hNe3hohz
	dot0qCVgafSGmY+ulk4jSK7WNsW0ZG2IGrtkTLkEBAoXlebmqtWrRtw+X2OlgbvrTHMqk0M76VoCf
	XfW6Ofu3+gIs7Pq8JV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6wc-00000008lZz-3sKd;
	Wed, 25 Nov 2026 06:57:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6w7-00000008lKj-2bjz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:57:00 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so49148815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589818; x=1796194618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ec2abqXUKspUvFH12/nCiZwBysoielu6/ZVveaDMOS8=;
        b=cPy9shWyhv2l0TKV7I8117zBy/MCRU4m4C845OtD8EB1ItdbLT9wF9fOIyNHM+QlRj
         c0+/osg39jzjDnhM3hztAUGpB6BYl4tLicbTxE2ob7y51aN4kvkuIggPYE1AhisgLx3s
         Emtu78RAjb5LKuQ/hM4xbqFLx5YCCv+CuMyhbtd2+MqzYLQtK30UfOHsXxZ7pCMfJJ/u
         rYYlMozgOWQ5b7vVwDZlLIB/+S8bC+6PjqGqHSjdOWdg1ZDGpqRyZeJ6cgfbURqzqM1Q
         3k9Mu7uaaIDRvC1L6l+Co/ZIesVrtq5k0GoFgx6t3FjM2uyrljwwkbZC7ianp3de+44Z
         wldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589818; x=1796194618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ec2abqXUKspUvFH12/nCiZwBysoielu6/ZVveaDMOS8=;
        b=Gise+DmSKpBSpoNezjz22v67t3UD26k1qQomaM0lYKj7Rs3OHu4VuNsO6FpEVXyIP2
         CyT2l7WtthqAUfyHD1GF3LW0bGSIIvmPN6JgTPahVkBCtwnOYsAzd7CuGtlwErcP12kF
         PDc+vCOUeSKceKTf883E1aWaoyIe7LSLNXmrz3ON8pL1zoomJcjKB7VmfJ3y504q/WmE
         yEhgDaryagtA5FQwnGDuHLwyexIiL88j4riwKbeNgFi4BnwgjYLBljqZkel7DO3Pim1F
         mwpAJdiT8HZBFE+Rk2ADosiN08F/up6O4psyu5y+hlLxjxqsouvvG+2A0/QecsJJnGyd
         9AuQ==
X-Forwarded-Encrypted: i=1; AL+hErEdeCXtHYKdo2kUNAMwDkYcbHh7isi26MBtpqjJKPiE4lC6UAj7zleYvzoGhGs8EliYce0MxrRYUvyQRtr+n6N/@lists.infradead.org
X-Gm-Message-State: APuU4Z8I/tPrxjbsvUjpfHI4jpgBX98DDSQQzNcCLJpdQQKY+zyLh/ay
	MgydPavIouQ48qezDkxcqGXxjTS0IOLUSjiPWd3UCp+JBhJid7LieonUeikHe4RZkxg=
X-Gm-Gg: AZFdTZe3i7qRKbRwPo+9eZyGOaC0zybQBfjtKkHUuvX4rlNpNoVG4jTxXqDKGKqO14Y
	ByVcxSe550Nk/ByiCyNfJumAXPd+1kvkq7Kvgu8usEVTpZp9kDdPfNmh8LeEwzdIkQDLS0NUOH3
	t4yfyPX1MiqhFnTKN3WxTLIttP3QxamUjBjf44jclN2/BMKubNLtzh1C5I/remC/FqdkK0/+MxC
	Jr4Xn/+Kx/GzVoO2qMbMxmpWw5vWsNl0F/r4lnkFB/smI1/AClspFjLjX+AqMW53ain6yCcti9p
	ikDzrgLgLn3SGOH9N760+sNkaZVom+wzWV+1jwMRJnrdYT3pw6mqLMblhcT+4Bn0glbelD727EK
	Poy1V5O8fn7ytioq+iCy1ArC1/FSoebTNh7HL9+xtU+LxAWN8ubHjSMRclEUUlULV+0L2ziPtZY
	y70irtRF2q4nD2i90hOxHZYJMbn4lUt9EOhfHsrhD8kU/JSbOUN3ghWjIms+6gYgz8j5eT+j52f
	Z9x4uZpHqWRcHU8+cZkKJ3gP0AnW3T7OdeIJjTLXJDYIjY7EO4M72JCyh1nmpbdJJ0qpb2j1r3U
	tCMlLX/ckH1/5czmJqg=
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr426651375e9.15.1795589817865;
        Tue, 24 Nov 2026 22:56:57 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm482555715e9.10.2026.11.24.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:57 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:23 +0300
Subject: [PATCH v2 8/8] KVM: arm64: selftests: Test that a vcpu reset
 clears the vcpu's state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-8-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_225659_736047_660CACB2 
X-CRM114-Status: GOOD (  24.47  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a test to check that KVM_ARM_VCPU_INIT (which resets a vcpu) has
reset all the things it was supposed to.

The test dirties as much of the vcpu state as it can, resets the vcpu,
and compares every register in KVM_GET_REG_LIST with a freshly
initialised vcpu.  The are a few things which we must not clear such as
MPIDR_EL1, which userspace configures and the reset keeps, and the
CLIDR_EL1 and CCSIDR counters which keep counting.

The test runs with and without EL2.

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 tools/testing/selftests/kvm/Makefile.kvm       |   1 +
 tools/testing/selftests/kvm/arm64/vcpu_reset.c | 210 +++++++++++++++++++++++++
 2 files changed, 211 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 95867977beb3..cbd05070a2e3 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -201,6 +201,7 @@ TEST_GEN_PROGS_arm64 += arm64/sea_to_user
 TEST_GEN_PROGS_arm64 += arm64/set_id_regs
 TEST_GEN_PROGS_arm64 += arm64/smccc_filter
 TEST_GEN_PROGS_arm64 += arm64/stage2_block_transitions
+TEST_GEN_PROGS_arm64 += arm64/vcpu_reset
 TEST_GEN_PROGS_arm64 += arm64/vcpu_width_config
 TEST_GEN_PROGS_arm64 += arm64/vgic_init
 TEST_GEN_PROGS_arm64 += arm64/vgic_irq
diff --git a/tools/testing/selftests/kvm/arm64/vcpu_reset.c b/tools/testing/selftests/kvm/arm64/vcpu_reset.c
new file mode 100644
index 000000000000..cdc051e4b897
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/vcpu_reset.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vcpu_reset - Test that resetting a vcpu that has run with KVM_ARM_VCPU_INIT
+ * puts it back in the state of a new vcpu.
+ *
+ * Before the reset, the vcpu has an MMIO read waiting for userspace and a
+ * pending SError, and userspace has written to every register it can.  After
+ * the reset, every register must match a new vcpu's, except the ones in
+ * preserved_regs[], which must keep the value userspace wrote, and the
+ * counters, which keep counting.  No SError may be pending, and the next
+ * KVM_RUN must not complete the MMIO read.
+ */
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define MMIO_ADDR	0x8000000ULL
+#define MAX_REG_SIZE	256
+
+/*
+ * Registers that a reset keeps: the configuration that userspace sets for the
+ * vcpu, and the counters, which are VM-wide and change on their own.
+ */
+#define DEMUX_CCSIDR	(KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX | \
+			 KVM_REG_ARM_DEMUX_ID_CCSIDR)
+
+static bool is_preserved(u64 id)
+{
+	if ((id & ~(u64)KVM_REG_ARM_DEMUX_VAL_MASK) == DEMUX_CCSIDR)
+		return true;
+
+	switch (id) {
+	case KVM_ARM64_SYS_REG(SYS_MPIDR_EL1):
+	case KVM_ARM64_SYS_REG(SYS_CLIDR_EL1):
+		return true;
+	}
+	return false;
+}
+
+static bool is_counter(u64 id)
+{
+	return id == KVM_REG_ARM_TIMER_CNT || id == KVM_REG_ARM_PTIMER_CNT;
+}
+
+static void guest_code(void)
+{
+	READ_ONCE(*(u64 *)MMIO_ADDR);
+	GUEST_FAIL("The MMIO read completed");
+}
+
+struct regs {
+	struct kvm_reg_list *list;
+	u8 (*val)[MAX_REG_SIZE];
+};
+
+static void get_regs(struct kvm_vcpu *vcpu, struct regs *r)
+{
+	u64 i;
+
+	r->list = vcpu_get_reg_list(vcpu);
+	r->val = calloc(r->list->n, MAX_REG_SIZE);
+	TEST_ASSERT(r->val, "calloc() failed");
+	for (i = 0; i < r->list->n; i++) {
+		TEST_ASSERT(KVM_REG_SIZE(r->list->reg[i]) <= MAX_REG_SIZE,
+			    "Register 0x%llx is too big", r->list->reg[i]);
+		TEST_ASSERT(!__vcpu_get_reg(vcpu, r->list->reg[i], r->val[i]),
+			    "Can't read register 0x%llx", r->list->reg[i]);
+	}
+}
+
+static void free_regs(struct regs *r)
+{
+	free(r->list);
+	free(r->val);
+}
+
+/* Write the inverse of each register, or failing that, flip its bit 0 */
+static void dirty_regs(struct kvm_vcpu *vcpu)
+{
+	struct kvm_reg_list *list = vcpu_get_reg_list(vcpu);
+	u8 val[MAX_REG_SIZE];
+	struct kvm_one_reg reg = { .addr = (u64)val };
+	u64 i, j, size;
+
+	for (i = 0; i < list->n; i++) {
+		reg.id = list->reg[i];
+		size = KVM_REG_SIZE(reg.id);
+		if (__vcpu_get_reg(vcpu, reg.id, val))
+			continue;
+		for (j = 0; j < size; j++)
+			val[j] = ~val[j];
+		if (!__vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg))
+			continue;
+		for (j = 0; j < size; j++)
+			val[j] = ~val[j];
+		val[0] ^= 1;
+		__vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	}
+	free(list);
+}
+
+static void assert_reg_eq(u64 id, const u8 *got, const u8 *want, const char *what)
+{
+	u64 size = KVM_REG_SIZE(id);
+	u64 g = 0, w = 0;
+
+	if (!memcmp(got, want, size))
+		return;
+
+	memcpy(&g, got, size < 8 ? size : 8);
+	memcpy(&w, want, size < 8 ? size : 8);
+	TEST_FAIL("Register 0x%llx is 0x%lx after the reset, %s 0x%lx",
+		  (unsigned long long)id, (unsigned long)g, what, (unsigned long)w);
+}
+
+static struct kvm_vm *create_vcpu(bool el2, struct kvm_vcpu **vcpu)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vm *vm;
+
+	vm = vm_create(1);
+	kvm_get_default_vcpu_target(vm, &init);
+	if (el2)
+		init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
+	else
+		init.features[0] &= ~BIT(KVM_ARM_VCPU_HAS_EL2);
+	*vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+	return vm;
+}
+
+static void test_reset(bool el2)
+{
+	struct kvm_vcpu_events events = {};
+	struct regs new, before, after;
+	struct kvm_vcpu *vcpu, *ref;
+	struct kvm_vm *vm, *ref_vm;
+	u64 i, id;
+
+	/*
+	 * A new vcpu: initialised again to undo what the library set up, and
+	 * through its first KVM_RUN without running any code.
+	 */
+	ref_vm = create_vcpu(el2, &ref);
+	vcpu_ioctl(ref, KVM_ARM_VCPU_INIT, &ref->init);
+	vcpu_run_complete_io(ref);
+	get_regs(ref, &new);
+
+	vm = create_vcpu(el2, &vcpu);
+	virt_map(vm, MMIO_ADDR, MMIO_ADDR, 1);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_MMIO);
+	TEST_ASSERT(!vcpu->run->mmio.is_write, "Expected an MMIO read");
+	memset(vcpu->run->mmio.data, 0x5a, sizeof(vcpu->run->mmio.data));
+
+	events.exception.serror_pending = true;
+	vcpu_events_set(vcpu, &events);
+
+	dirty_regs(vcpu);
+	get_regs(vcpu, &before);
+
+	vcpu_ioctl(vcpu, KVM_ARM_VCPU_INIT, &vcpu->init);
+
+	vcpu_events_get(vcpu, &events);
+	TEST_ASSERT(!events.exception.serror_pending, "An SError is still pending");
+
+	/* Completes the MMIO read if it is still pending */
+	vcpu_run_complete_io(vcpu);
+	get_regs(vcpu, &after);
+
+	TEST_ASSERT_EQ(new.list->n, after.list->n);
+	TEST_ASSERT_EQ(before.list->n, after.list->n);
+	for (i = 0; i < after.list->n; i++) {
+		id = after.list->reg[i];
+		TEST_ASSERT_EQ(id, new.list->reg[i]);
+		TEST_ASSERT_EQ(id, before.list->reg[i]);
+
+		if (is_counter(id))
+			continue;
+		if (is_preserved(id))
+			assert_reg_eq(id, after.val[i], before.val[i], "userspace wrote");
+		else
+			assert_reg_eq(id, after.val[i], new.val[i], "a new vcpu has");
+	}
+
+	free_regs(&new);
+	free_regs(&before);
+	free_regs(&after);
+	kvm_vm_free(vm);
+	kvm_vm_free(ref_vm);
+}
+
+int main(void)
+{
+	bool el2 = test_supports_el2();
+
+	ksft_print_header();
+	ksft_set_plan(el2 ? 2 : 1);
+
+	test_reset(false);
+	ksft_test_result_pass("reset without EL2\n");
+
+	if (el2) {
+		test_reset(true);
+		ksft_test_result_pass("reset with EL2\n");
+	}
+
+	ksft_finished();
+}

-- 
2.53.0


