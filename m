Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KleTc6lN;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JNIKzsA7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VTjupcSpYzzr9KNGDPSXl6giQ6oG/6POX/XFEkVBgNI=; b=KleTc6lNJZm0md
	4fis9zCxHFVXGlKw+vWfGnzqfJkEkHYeJrpZ5If+UBKf1rn+o1xd/ogUwrAEeOeod2YPqD7EJ+lkC
	JHl+88YWGgvGTevXw7KUMOC5AwZkoTjfIZxzsfNFCGwKjkJwF6AfPYd47q6w1KEiNsmOSF5eCOM5i
	EStpX0zzWPjpHMldQfe3NxJ/cgj52c879TzKHZQSqR3+HNa95KdkXMS2MTlsUI0ionTj8dv6l8WX0
	y76/jc8KIvmzmx8BDuh9bdV/I1xSJNEURHeMHp4r71vZPZxA4Cf3w1AqO7q/Uo31RzRMTAVN4l77j
	4iur04Sy18enlF12Y7Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1U0-0000000BtgL-0GzO;
	Thu, 19 Nov 2026 12:43:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Tv-0000000Btf2-23uf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:43:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 832531575;
	Thu, 19 Nov 2026 04:43:11 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A714B3F673;
	Thu, 19 Nov 2026 04:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795092194; bh=za+fnZdRLjQ9PKrb6uwhGlDBXDw9fZ4MnLIhFVL6BzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNIKzsA7khRH6ciHshwEpQaxgEJx0ylRea4TEFqPmd2mz2FADg3u7HLX9Loa7iP+7
	 UQwv+5Xl+3qKHLc2EmOSUs0W+UVmpR3HsUt/P0iTQmpgt3fMLzOz6tCXS0A9rJ+n4R
	 oUYw6W1zWmGp/2AEgQQoUurRtb131TZ3eO/Vcd/M=
From: Leonardo Bras <leo.bras@arm.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_NV1
Date: Thu, 19 Nov 2026 12:43:10 +0000
Message-ID: <av7u3vWHUBzcgSSg@LeoBrasDK>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118203625.743428-3-coltonlewis@google.com>
References: <20261118203625.743428-1-coltonlewis@google.com> <20261118203625.743428-3-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044315_598102_FCFF7A9E 
X-CRM114-Status: GOOD (  19.16  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 08:36:25PM +0000, Colton Lewis wrote:
> In a VHE-only EL2 guest (KVM_ARM_VCPU_HAS_EL2 without
> KVM_ARM_VCPU_HAS_EL2_E2H0), KVM advertises ID_AA64MMFR4_EL1.E2H0 as
> NI_NV1, making HCR_EL2.E2H RES1 and HCR_EL2.NV1 RES0.
> 
> Extend hello_el2 to attempt clearing HCR_EL2.E2H and setting HCR_EL2.NV1
> from userspace via KVM_SET_ONE_REG, verifying that HCR_EL2.E2H remains
> RES1 and HCR_EL2.NV1 is masked to RES0. Add a comment explaining why the
> check is performed from userspace rather than inside the guest.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>  tools/testing/selftests/kvm/arm64/hello_el2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/hello_el2.c b/tools/testing/selftests/kvm/arm64/hello_el2.c
> index bbe6862c6ab16..3bd3596f5fb1e 100644
> --- a/tools/testing/selftests/kvm/arm64/hello_el2.c
> +++ b/tools/testing/selftests/kvm/arm64/hello_el2.c
> @@ -45,6 +45,7 @@ int main(void)
>  	struct kvm_vcpu *vcpu;
>  	struct kvm_vm *vm;
>  	struct ucall uc;
> +	u64 hcr;
>  
>  	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
>  
> @@ -66,6 +67,20 @@ int main(void)
>  		TEST_FAIL("Unhandled ucall: %ld\n", uc.cmd);
>  	}
>  
> +	/*
> +	 * Verify RES0/RES1 enforcement from userspace rather than inside
> +	 * the guest. From the guest's perspective RESx bits may be
> +	 * stateful (reading back as written) even though their value is
> +	 * ignored, whereas KVM_SET_ONE_REG applies the effective masks
> +	 * directly.
> +	 */
> +	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
> +	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
> +		     (hcr & ~HCR_EL2_E2H) | HCR_EL2_NV1);
> +	hcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2));
> +	TEST_ASSERT(hcr & HCR_EL2_E2H, "HCR_EL2.E2H should be RES1");
> +	TEST_ASSERT(!(hcr & HCR_EL2_NV1), "HCR_EL2.NV1 should be RES0");
> +
>  	kvm_vm_free(vm);
>  	return 0;
>  }
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 


The VMM tries to set NV1 and clean E2H, and it should not work.

Current kernel should pass this test, as vcpu_set_reg() will call a 
KVM_SET_ONE_REG ioctl, going down to __vcpu_assign_sys_reg() which will, 
given vcpu_has_nv(), will apply RES0 to NV1 (patch #1) and RES1 to E2H, as 
per this line:

NEEDS_FEAT_FLAG(HCR_EL2_E2H, RES1_WHEN_E2H1 | FORCE_RESx)

FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

