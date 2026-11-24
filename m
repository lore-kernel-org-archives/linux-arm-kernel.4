Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E103606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JV9T2HAy;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Xgestkcp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6QXAXo10l0TvFvhpv3tVGjIuXn4/S262Qsw7qAFYFbM=; b=JV9T2HAyOmIY1Cf3H3Vq8p1xd4
	wqh79Crwm7ByfX40k4aKIXgI3LwBxGwgIaw8Yl+3gPSadhPIDQY97n7Yrg63RxwiSlu9s6Q4ui7jZ
	TFguRR3ya/J3Lxi1MfqDl9tXRiTBb3wEmvPPeJSNRZTm+roFTUbn/pbmUw2BI10G3Nq3iftyPTVMc
	DGEX+/ReKYGrIgVZAXwF99nLhTWfmbuS9KHQYSX1G7sO9Up0nGKwvY5+LAZHV947ZCibXjBq/2ARW
	tA+E0EKb2k+erguL+3jCmrgpQjFlg49CTXN74UJNP1oxa1k055dUjPC7NC1cnXZ8E49uxiMhSscXH
	xLn5ddfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkhF-00000005iQr-2Nup;
	Tue, 24 Nov 2026 07:12:09 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkhC-00000005iQS-2y8e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795504318; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=6QXAXo10l0TvFvhpv3tVGjIuXn4/S262Qsw7qAFYFbM=;
	b=XgestkcpHiDAz4+AfyKoGKA0vNwMyxG9SJIP26tQp/fHx+B+NB5VYj5KDd7EFl+e5Sk9QJWiVfd3d/zEl02D+WqA0895MelrmVCUJyFh9KpmIIlB/I/DXfLrR7nPM9OqjkSHcwJLvjs6w125mdJkz2T/KtCZWVDtJTUT+GPuQ2M=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XFNklbI_1795504317;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0XFNklbI_1795504317 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 15:11:57 +0800
Date: Tue, 24 Nov 2026 15:11:56 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Jia He <justin.he@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 3/3] KVM: selftests: arm64: Test KVM_PRE_FAULT_MEMORY
 before first KVM_RUN
Message-ID: <6gdla4edbwa6e2s36libskrg5h3glxq3tdl7blthke42sbuqb7@tpczgelv4vud>
References: <20261123150917.2679600-1-justin.he@arm.com>
 <20261123150917.2679600-4-justin.he@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123150917.2679600-4-justin.he@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_231207_803093_2F31737E 
X-CRM114-Status: GOOD (  28.26  )
X-Spam-Score: -15.6 (---------------)
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 03:09:17PM +0800, Jia He wrote:
> Extend nv_pre_fault_memory_test to exercise KVM_PRE_FAULT_MEMORY before
> the first KVM_RUN.
>

Hi Jia He,

> Without EL2, cover immediate_exit on the first KVM_RUN, retrying after a
> failed first KVM_RUN, and pre-faulting while the vCPU moves from the
> main thread to a worker thread for its first run and back to the main
> thread for its second run. The two threads are pinned to different CPUs
> when at least two are available.

I suggest to list them for better readability e.g:

Test cases for w/o EL2:
1. Immediate_exit on the first KVM_RUN
2. Retrying pre-fault after a failed first KVM_RUN.
3. Pre-faulting while moving the vCPU between 2 threads.
(more details of 3 can be given in code implementation there)

> With EL2, additionally cover an EL2 vCPU with ID_AA64MMFR4_EL1.NV_frac
> cleared to 0 and HCR_EL2.NV=1 at EL1h (the NULL vncr_tlb reproducer), an
> EL2 vCPU with a vEL1 context and asymmetric HCR_EL2.IMO/FMO staged before
> the first run, and the same thread handoff. An unfixed kernel reports
> the staged context case only as a WARN in the kernel log; the test
> itself still passes.
>
> Signed-off-by: Jia He <justin.he@arm.com>
> ---
>  .../kvm/arm64/nv_pre_fault_memory_test.c      | 335 ++++++++++++++++--
>  1 file changed, 298 insertions(+), 37 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c b/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c
> index 09c1db303856..6dbcf3b0ef13 100644
> --- a/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c
> +++ b/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c

...

> +
> +/*
> + * Pre-fault before the first KVM_RUN with ID_AA64MMFR4_EL1.NV_frac == 0
> + * (no vncr_tlb) and HCR_EL2.NV=1 at EL1h.
> + */
> +static void test_pre_first_run_no_nv2(void)

This may not necessary per Marc's comment on patch 2 ?

> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	u64 val;
> +
> +	pr_info("Testing pre-first-run pre-fault with NV_frac=0 and HCR_EL2.NV=1\n");
> +	vm = setup_test_vm(true, false, guest_el1_touch_and_done, &vcpu);
> +
> +	/* Copy the EL2 S1 configuration into the EL1 sysregs for vEL1. */
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL1),
> +		     vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_SCTLR_EL2)));
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL1),
> +		     vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_TCR_EL2)));

...

> +
> +static void *first_run_worker(void *arg)
> +{
> +	struct handoff_args *h = arg;
> +
> +	maybe_pin_self_to_cpu(h->cpu);
> +	pre_fault(h->vcpu, TEST_MEM_GPA + SZ_1M, TEST_MEM_SIZE - SZ_1M);
> +
> +	vcpu_run(h->vcpu);
> +	expect_ucall_sync(h->vcpu, 1);
> +	return NULL;
> +}
> +
> +/*
> + * Pre-fault in the main thread, run the vCPU for the first time in a worker

Minor: the pre-fault happens in worker thead yet, see first_run_worker().

> + * thread, then pre-fault and run it again in the main thread. This changes
> + * vcpu->pid both before and after the first run. If at least two CPUs are
> + * available, the two threads are pinned to different CPUs.
> + */
> +static void test_thread_handoff(bool has_el2)
> +{
> +	struct handoff_args h = { .cpu = -1 };
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	cpu_set_t allowed;
> +	int cpu, cpu0 = -1;
> +	pthread_t thr;
> +
> +	pr_info("Testing pre-fault across a thread handoff (%s vCPU)\n",
> +		has_el2 ? "EL2" : "EL1");
> +
> +	CPU_ZERO(&allowed);
> +	kvm_pthread_getaffinity(pthread_self(), &allowed);
> +	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
> +		if (!CPU_ISSET(cpu, &allowed))
> +			continue;
> +		if (cpu0 < 0) {
> +			cpu0 = cpu;
> +		} else {
> +			h.cpu = cpu;
> +			break;
> +		}
> +	}
> +	if (h.cpu < 0)
> +		pr_info("Only one CPU available, not testing CPU migration\n");
> +
> +	maybe_pin_self_to_cpu(cpu0);
> +	vm = setup_test_vm(has_el2, false,
> +			   has_el2 ? guest_code : guest_el1_code, &vcpu);
> +	pre_fault(vcpu, TEST_MEM_GPA, SZ_1M);
> +
> +	h.vcpu = vcpu;
> +	kvm_pthread_create(&thr, NULL, first_run_worker, &h);
> +	kvm_pthread_join(thr, NULL);
> +
> +	pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE);
> +	vcpu_run(vcpu);
> +	expect_ucall_done(vcpu);
> +
> +	kvm_pthread_setaffinity(pthread_self(), &allowed);
> +
> +	kvm_vm_free(vm);
> +}
> +
> +static void test_pre_first_run_el1(void)
> +{
> +	int feature = KVM_ARM_VCPU_SVE;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	int ret;
> +
> +	pr_info("Testing pre-first-run pre-fault with immediate_exit\n");
                                             ^^^^
The vcpu->run->immediate_exit = 1 happens afte the pre_fault, thus
s/with/then/ looks more accurate here if this is the desired behavior.

> +	vm = setup_test_vm(false, false, guest_el1_touch_and_done, &vcpu);
> +	pre_fault(vcpu, TEST_MEM_GPA, vm->page_size);
> +
> +	vcpu->run->immediate_exit = 1;
> +	ret = __vcpu_run(vcpu);
> +	TEST_ASSERT(ret == -1 && errno == EINTR,
> +		    "Expected -EINTR on immediate_exit, got ret=%d errno=%d",
> +		    ret, errno);
> +	vcpu->run->immediate_exit = 0;
> +
> +	pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE);
> +	vcpu_run(vcpu);
> +	expect_ucall_done(vcpu);
> +	kvm_vm_free(vm);
> +
> +	if (!kvm_check_cap(KVM_CAP_ARM_SVE)) {
> +		pr_info("SVE not supported, skipping failed first KVM_RUN test\n");
> +		return;
>  	}
>
> +	pr_info("Testing pre-fault after a failed first KVM_RUN\n");
> +	vm = setup_test_vm(false, true, guest_el1_touch_and_done, &vcpu);
> +	pre_fault(vcpu, TEST_MEM_GPA, vm->page_size);
> +
> +	ret = __vcpu_run(vcpu);
> +	TEST_ASSERT(ret == -1 && errno == EPERM,
> +		    "Expected -EPERM before SVE finalisation, got ret=%d errno=%d",
> +		    ret, errno);
> +
> +	pre_fault(vcpu, TEST_MEM_GPA + vm->page_size, vm->page_size);
> +	vcpu_ioctl(vcpu, KVM_ARM_VCPU_FINALIZE, &feature);
> +	vcpu_run(vcpu);
> +	expect_ucall_done(vcpu);
>  	kvm_vm_free(vm);
> +}
> +
> +int main(void)
> +{
> +	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
> +
> +	test_pre_first_run_el1();
> +	test_thread_handoff(false);
> +
> +	if (!test_supports_el2()) {
> +		pr_info("EL2 not supported, skipping nested tests\n");
> +		return 0;
> +	}
> +
> +	test_nested_post_run_pre_fault();
> +	test_pre_first_run_no_nv2();
> +	test_pre_first_run_nested_ctxt();
> +	test_thread_handoff(true);
> +
>  	return 0;
>  }
> --
> 2.34.1
>

