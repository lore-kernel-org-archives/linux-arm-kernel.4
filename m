Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA692606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DtDJ5l2R;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=btDetiEW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yzob3IjNhlkrELuFZotbKtg9maqB1cC/YQY8iPS0b0o=; b=DtDJ5l2RKyLYU8m6+31gf7jqi0
	nMllfvz/oHoZRa8qsRb5AGy9nJZBVgqiSNkdywoXz2z9Fh1yQmhsL/LP7jZfoyBXgYOipy6w5shJ/
	iOYpw85eiUbBHMKSpFesEP9wpc+jWJlj2M9pzVv0L8aGcla49NU2kB3rx0vtixkCn6pZHoLZiJvw7
	o4COFE0OlMvfWLU1pOSJWCqbpBcLDy4ArtSYvzo1UgWOPVLGUU8m0qRIX73BUtueOP3bBf8KM69wx
	9j+PbjhvKPOb9Oe0lBdnG3MNkd8cp1uEQeyeJq0DSzGTxnf31lJ55grDkzTGD6ouTZ5WdnLRpskMU
	gEdBqqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWE0V-0000000AALj-2Y2U;
	Wed, 25 Nov 2026 14:29:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWE0S-0000000AAL9-1UI0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:29:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA6FD2F;
	Wed, 25 Nov 2026 06:29:51 -0800 (PST)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF7893F763;
	Wed, 25 Nov 2026 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795616994; bh=irJ+SLW2diU+AhutWrsQkPmnPIapmN0EHmgj2AIri5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btDetiEW6iagg1Fl4BzF0k9NBnwE7C9i2RYKjvc2M9/Nkk1H4Od9YD9FWkoDGmaKS
	 2otJ3Vv1HcTLqwGA2kG3AzVGZ3yVGdT+UFEXcIh5+Hs/D7v4Z6f04gjeE61UswGTcQ
	 Y4zU6Yjv/ZMaIHmSEfJY21N/cuT66qe2B3dQbn3o=
Date: Wed, 25 Nov 2026 14:29:48 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Nico Boehr <nrb@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 02/23] KVM: arm64: Extract number of sys_reg_desc into
 a constant
Message-ID: <awbw3NyDifa0WjhZ@e143914.arm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
 <20261106-sysreg-v3-2-75e95980fb10@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-sysreg-v3-2-75e95980fb10@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062956_499827_E14BCF7F 
X-CRM114-Status: GOOD (  26.25  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 05:07:35PM +0100, Steffen Eiden wrote:
> Define the constant `num_sys_reg_descs` which stores the number of
> elements in the sys_reg_descs array. Replace all occurrences of
> ARRAY_SIZE(sys_reg_descs) with the new constant.
> 
> This refactoring eases the integration of handling system registers for
> arm on s390. s390 needs code from the shared code to define the
> sys_reg_descs. But also the shared code needs the definition of the
> sys_reg_array and we cannot forward declare arrays and use their size
> before it is properly defined. This patch solves this chicken or egg
> problem. For the time being s390 cannot process the full arm64 defined
> sys_reg_descs array.
> 
> No functional changes.
> 
> Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
> Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

I see later in the series, the include of sys_regs.c into s390 is done
before the s390 sys_reg_descs array is defined.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

> ---
>  arch/arm64/kvm/sys_regs.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 0f0b0495b710..2b28b929f9f3 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3976,6 +3976,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	EL2_REG(SP_EL2, NULL, reset_unknown, 0),
>  };
>  
> +static const size_t num_sys_reg_descs = ARRAY_SIZE(sys_reg_descs);
> +
>  static bool handle_at_s1e01(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  			    const struct sys_reg_desc *r)
>  {
> @@ -5187,7 +5189,7 @@ static bool emulate_sys_reg(struct kvm_vcpu *vcpu,
>  {
>  	const struct sys_reg_desc *r;
>  
> -	r = find_reg(params, sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
> +	r = find_reg(params, sys_reg_descs, num_sys_reg_descs);
>  	if (likely(r)) {
>  		perform_access(vcpu, params, r);
>  		return true;
> @@ -5205,7 +5207,7 @@ static const struct sys_reg_desc *idregs_debug_find(struct kvm *kvm, loff_t pos)
>  {
>  	unsigned long i, idreg_idx = 0;
>  
> -	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
> +	for (i = 0; i < num_sys_reg_descs; i++) {
>  		const struct sys_reg_desc *r = &sys_reg_descs[i];
>  
>  		if (!is_vm_ftr_id_reg(reg_to_encoding(r)))
> @@ -5268,7 +5270,7 @@ static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, loff_t pos)
>  {
>  	unsigned long i, sr_idx = 0;
>  
> -	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
> +	for (i = 0; i < num_sys_reg_descs; i++) {
>  		const struct sys_reg_desc *r = &sys_reg_descs[i];
>  
>  		if (r->reg < __SANITISED_REG_START__)
> @@ -5370,7 +5372,7 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
>  	struct kvm *kvm = vcpu->kvm;
>  	unsigned long i;
>  
> -	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
> +	for (i = 0; i < num_sys_reg_descs; i++) {
>  		const struct sys_reg_desc *r = &sys_reg_descs[i];
>  
>  		if (!r->reset)
> @@ -5594,8 +5596,8 @@ int kvm_arm_sys_reg_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg
>  	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_DEMUX)
>  		return demux_c15_get(vcpu, reg->id, uaddr);
>  
> -	return kvm_sys_reg_get_user(vcpu, reg,
> -				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
> +	return kvm_sys_reg_get_user(vcpu, reg, sys_reg_descs,
> +				    num_sys_reg_descs);
>  }
>  
>  int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
> @@ -5634,8 +5636,8 @@ int kvm_arm_sys_reg_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg
>  	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_DEMUX)
>  		return demux_c15_set(vcpu, reg->id, uaddr);
>  
> -	return kvm_sys_reg_set_user(vcpu, reg,
> -				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
> +	return kvm_sys_reg_set_user(vcpu, reg, sys_reg_descs,
> +				    num_sys_reg_descs);
>  }
>  
>  static unsigned int num_demux_regs(void)
> @@ -5723,7 +5725,7 @@ static int walk_sys_regs(struct kvm_vcpu *vcpu, u64 __user *uind)
>  	int err;
>  
>  	i2 = sys_reg_descs;
> -	end2 = sys_reg_descs + ARRAY_SIZE(sys_reg_descs);
> +	end2 = sys_reg_descs + num_sys_reg_descs;
>  
>  	while (i2 != end2) {
>  		err = walk_one_sys_reg(vcpu, i2++, &uind, &total);
> @@ -5772,7 +5774,7 @@ int kvm_vm_ioctl_get_reg_writable_masks(struct kvm *kvm, struct reg_mask_range *
>  	if (clear_user(masks, KVM_ARM_FEATURE_ID_RANGE_SIZE * sizeof(__u64)))
>  		return -EFAULT;
>  
> -	for (int i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
> +	for (int i = 0; i < num_sys_reg_descs; i++) {
>  		const struct sys_reg_desc *reg = &sys_reg_descs[i];
>  		u32 encoding = reg_to_encoding(reg);
>  		u64 val;
> @@ -5957,7 +5959,7 @@ int __init kvm_sys_reg_table_init(void)
>  	int ret = 0;
>  
>  	/* Make sure tables are unique and in order. */
> -	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), true);
> +	valid &= check_sysreg_table(sys_reg_descs, num_sys_reg_descs, true);
>  	valid &= check_sysreg_table(cp14_regs, ARRAY_SIZE(cp14_regs), false);
>  	valid &= check_sysreg_table(cp14_64_regs, ARRAY_SIZE(cp14_64_regs), false);
>  	valid &= check_sysreg_table(cp15_regs, ARRAY_SIZE(cp15_regs), false);
> @@ -5980,7 +5982,7 @@ int __init kvm_sys_reg_table_init(void)
>  
>  	check_feature_map();
>  
> -	for (i = 0; !ret && i < ARRAY_SIZE(sys_reg_descs); i++)
> +	for (i = 0; !ret && i < num_sys_reg_descs; i++)
>  		ret = populate_sysreg_config(sys_reg_descs + i, i);
>  
>  	for (i = 0; !ret && i < ARRAY_SIZE(sys_insn_descs); i++)
> 
> -- 
> 2.56.0
> 

