Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D227D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0hiJldCr;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=ekwSiq4a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=23fFU0O+rXserzO3o7D7RV3GbnE7B9R3sHZLTrVXSyk=; b=0hiJldCr+ZSPqfX8+fUF04Xr5X
	ZsjykMoF+TEqM+3V0CWqa6LBafFlup15rZHxdPi8T0vc/qfF2tP7kIr5ECjIeGcjIEmGAqdIBX4FT
	F+STD+SWI0NIoas8GOXglitbSt9swGbRdb39k09kxFrt8TPwyaxfDjNYKwU5a4QxIx0s/o/ba+UZq
	v/yMg+IIf7MQdJUwsPB5C52hRRxZte+KXgaaCtq4bbBAX5URYTh2ze3D83tasU1xBg7RCZ/ng8yUa
	jtksuXH0U7s70ZIcsDM6YKf9VWp9SpyvEgcjheXRkRLp/OJXzrAM0qrDivN3xvZE+QQkdlksh+I2e
	nT8iZcqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3W5-00000008Ho7-0kHG;
	Wed, 25 Nov 2026 03:17:53 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3W1-00000008Hni-1cks
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 03:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795576669; x=1827112669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P+2esJNoADXhVcXnXeX/GpZHHYhnsn3OGqjyBJ5lLUY=;
  b=ekwSiq4aBnxvIMBltrA06kEV5NFI2bca9XfV1O7MEue21QPFdxayCd/Y
   dZre8PiBGvbK4bDnd1vq/+qcDrs2N3dUcfNjrhBkbtpgpYhuHFxDrT9pb
   umUlv4qu+1F/46fZJu9osZLDYLi6MZozyiSs72I7/4j3CHQJZrQV6Qm0y
   4SjSoljcm1CM/IvXfP8z5auVCybuUS3FF2JpZP9SyVNYmmbZZWkM4L0wP
   3ZBKCN8HDDHZGcIGxZ3syq9MUzQK3VODTTto6bS774HqsNBNeBiYAo5Wz
   46eEUKCYFaFQ8zVsPLMzFPKpdFKG40nPW+xT5c+Ke28ybKVrNWu+gMA2h
   A==;
X-CSE-ConnectionGUID: iRLYLiJaQaGa93YQnY1jZg==
X-CSE-MsgGUID: ANQFdfFuSEmrZ5sLKqKU1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="249189419"
X-IronPort-AV: E=Sophos;i="6.27,232,1786978800"; 
   d="scan'208";a="249189419"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:17:45 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D1F4F1C05DDF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:17:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 845E31400602
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 03:17:45 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.162.75])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id 6E08D18021BD;
	Wed, 25 Nov 2026 03:17:39 +0000 (UTC)
Date: Wed, 25 Nov 2026 12:17:38 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, cgroups@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/2] KVM: arm64: CCA: Add support for configuring
 the Realm MEC policy
Message-ID: <awZR98W3sP9g12wh@FCCLS0092175.localdomain>
References: <20261112-mm-v1-mec-v2-0-0d1dd260a588@fujitsu.com>
 <20261112-mm-v1-mec-v2-1-0d1dd260a588@fujitsu.com>
 <090662ee-0d8d-48b5-83f2-8a4d225bef08@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <090662ee-0d8d-48b5-83f2-8a4d225bef08@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_191749_939295_302494EC 
X-CRM114-Status: GOOD (  37.38  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Suzuki,
Thank you for reviewing.

On 11/24 15:08, Suzuki K Poulose wrote:
> On 12/11/2026 03:36, Kohei Enju wrote:
> > Introduce the KVM_ARM_VM_RMI_CTRL device attribute group to allow
> > userspace to configure Realm VM parameters before the Realm is created
> > using KVM_SET_DEVICE_ATTR.
> > 
> > Currently, KVM_ARM_VM_RMI_CTRL_MEC_POLICY is the only supported
> > attribute. Its value can be KVM_ARM_VM_RMI_MEC_POLICY_SHARED or
> > KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE. Reject the private policy if the
> > platform does not support private MECs.
> > 
> > If userspace does not explicitly configure the MEC policy,
> > KVM_ARM_VM_RMI_MEC_POLICY_SHARED is used by default.
> > 
> > Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> > ---
> >   Documentation/virt/kvm/devices/vm.rst   | 25 +++++++++++++++
> >   arch/arm64/include/asm/kvm_rmi.h        |  5 +++
> >   arch/arm64/include/uapi/asm/kvm.h       |  4 +++
> >   arch/arm64/kvm/arm.c                    |  4 +++
> >   arch/arm64/kvm/rmi.c                    | 57 +++++++++++++++++++++++++++++++++
> >   drivers/firmware/arm_rmm/rmi.c          |  6 ++++
> >   include/linux/arm-rmi-cmds.h            |  1 +
> >   tools/arch/arm64/include/uapi/asm/kvm.h |  4 +++
> >   8 files changed, 106 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/devices/vm.rst b/Documentation/virt/kvm/devices/vm.rst
> > index 78e63eb9994e..b0bd30750aa1 100644
> > --- a/Documentation/virt/kvm/devices/vm.rst
> > +++ b/Documentation/virt/kvm/devices/vm.rst
> > @@ -418,3 +418,28 @@ will reject attempts to define a filter for any portion of these ranges:
> >           0x8000_0000 0x8000_FFFF
> >           0xC000_0000 0xC000_FFFF
> >           =========== ===============
> > +
> > +7. GROUP: KVM_ARM_VM_RMI_CTRL
> > +=============================
> > +
> > +:Architectures: arm64
> > +
> > +7.1. ATTRIBUTE: KVM_ARM_VM_RMI_CTRL_MEC_POLICY (w/o)
> > +----------------------------------------------------
> > +
> > +:Parameters: Pointer to a ``__u8`` value
> > +
> > +:Returns:
> > +
> > +  =========  ===========================================================
> > +  ENXIO      The VM is not a Realm VM
> > +  EBUSY      The Realm has already been created
> > +  EINVAL     Invalid MEC policy value
> > +  EOPNOTSUPP Private MEC policy is not supported by the platform
> > +  EFAULT     The value could not be copied from userspace
> > +  =========  ===========================================================
> > +
> > +Configures the MEC policy for a Realm VM before the Realm is created. The value
> > +must be either ``KVM_ARM_VM_RMI_MEC_POLICY_SHARED`` or
> > +``KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE``. If userspace does not explicitly set the
> > +MEC policy, ``KVM_ARM_VM_RMI_MEC_POLICY_SHARED`` is used by default.
> > diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
> > index 3933f8d834b8..08c1f6d0671d 100644
> > --- a/arch/arm64/include/asm/kvm_rmi.h
> > +++ b/arch/arm64/include/asm/kvm_rmi.h
> > @@ -59,6 +59,7 @@ enum realm_state {
> >    * @state: The lifetime state machine for the realm
> >    * @ia_bits: Number of valid Input Address bits in the IPA
> >    * @stage2_unmapped: The Realm stage-2 mappings have been removed
> > + * @mec_policy: MEC policy for the Realm VM
> >    */
> >   struct realm {
> >   	void *rd;
> > @@ -73,6 +74,7 @@ struct realm {
> >   	enum realm_state state;
> >   	unsigned int ia_bits;
> >   	bool stage2_unmapped;
> > +	unsigned int mec_policy;
> >   };
> >   /**
> > @@ -109,9 +111,12 @@ int kvm_realm_teardown_stage2(struct kvm *kvm);
> >   void kvm_destroy_rec(struct kvm_vcpu *vcpu);
> >   struct kvm_arm_rmi_populate;
> > +struct kvm_device_attr;
> >   int kvm_arm_rmi_populate(struct kvm *kvm,
> >   			 struct kvm_arm_rmi_populate *arg);
> > +int kvm_vm_rmi_has_attr(struct kvm *kvm, struct kvm_device_attr *attr);
> > +int kvm_vm_rmi_set_attr(struct kvm *kvm, struct kvm_device_attr *attr);
> >   enum kvm_gfn_range_filter;
> > diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> > index 65ee09bd1463..aa1e6fe6192e 100644
> > --- a/arch/arm64/include/uapi/asm/kvm.h
> > +++ b/arch/arm64/include/uapi/asm/kvm.h
> > @@ -403,6 +403,10 @@ enum {
> >   /* Device Control API on vm fd */
> >   #define KVM_ARM_VM_SMCCC_CTRL		0
> >   #define   KVM_ARM_VM_SMCCC_FILTER	0
> > +#define KVM_ARM_VM_RMI_CTRL		1
> > +#define   KVM_ARM_VM_RMI_CTRL_MEC_POLICY	0
> > +#define     KVM_ARM_VM_RMI_MEC_POLICY_SHARED	0
> > +#define     KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE	1
> >   /* Device Control API: ARM VGIC */
> >   #define KVM_DEV_ARM_VGIC_GRP_ADDR	0
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 8e94f1bff830..be676c13e219 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2329,6 +2329,8 @@ static int kvm_vm_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
> >   	switch (attr->group) {
> >   	case KVM_ARM_VM_SMCCC_CTRL:
> >   		return kvm_vm_smccc_has_attr(kvm, attr);
> > +	case KVM_ARM_VM_RMI_CTRL:
> > +		return kvm_vm_rmi_has_attr(kvm, attr);
> >   	default:
> >   		return -ENXIO;
> >   	}
> > @@ -2339,6 +2341,8 @@ static int kvm_vm_set_attr(struct kvm *kvm, struct kvm_device_attr *attr)
> >   	switch (attr->group) {
> >   	case KVM_ARM_VM_SMCCC_CTRL:
> >   		return kvm_vm_smccc_set_attr(kvm, attr);
> > +	case KVM_ARM_VM_RMI_CTRL:
> > +		return kvm_vm_rmi_set_attr(kvm, attr);
> >   	default:
> >   		return -ENXIO;
> >   	}
> > diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
> > index 0d254fb80cde..01ac8d4fec7c 100644
> > --- a/arch/arm64/kvm/rmi.c
> > +++ b/arch/arm64/kvm/rmi.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/arm-rmi-cmds.h>
> >   #include <linux/kvm_host.h>
> >   #include <linux/overflow.h>
> > +#include <linux/uaccess.h>
> >   #include <asm/daifflags.h>
> >   #include <asm/kvm_emulate.h>
> > @@ -586,6 +587,9 @@ static int realm_create_rd(struct kvm *kvm)
> >   		params->flags0 |= RMI_REALM_PARAM_FLAG_PMU;
> >   	}
> > +	params->flags0 |= FIELD_PREP(RMI_REALM_PARAM_FLAG_MEC_POLICY_MASK,
> > +				    realm->mec_policy);
> > +
> >   	r = realm_init_sve_param(kvm, params);
> >   	if (r)
> >   		goto out_undelegate_tables;
> > @@ -1481,6 +1485,57 @@ int kvm_arm_rmi_populate(struct kvm *kvm,
> >   	return ret;
> >   }
> > +static int kvm_vm_rmi_set_mec_policy(struct kvm *kvm, u8 policy)
> > +{
> > +	guard(mutex)(&kvm->arch.config_lock);
> > +
> > +	if (!kvm_vm_is_realm(kvm))
> > +		return -ENXIO;
> > +
> > +	if (kvm_realm_state(kvm) != REALM_STATE_NONE)
> > +		return -EBUSY;
> > +
> > +	if (policy != KVM_ARM_VM_RMI_MEC_POLICY_SHARED &&
> > +	    policy != KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE)
> > +		return -EINVAL;
> > +
> > +	if (policy == KVM_ARM_VM_RMI_MEC_POLICY_PRIVATE &&
> > +	    rmi_mec_count() == 0)
> > +		return -EOPNOTSUPP;
> > +
> > +	kvm->arch.realm.mec_policy = policy;
> > +	return 0;
> > +}
> > +
> > +int kvm_vm_rmi_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
> > +{
> > +	if (!kvm_vm_is_realm(kvm))
> > +		return -ENXIO;
> > +
> > +	switch (attr->attr) {
> > +	case KVM_ARM_VM_RMI_CTRL_MEC_POLICY:
> 
> minor nit: Could we reject this if the rmi_mec_count() == 0 ?
> Default policy is "shared" mec, as long as it is documented, this
> would work only on a system that supports Private MEC.

With SHARED as the default, how about making this a boolean attribute
named KVM_ARM_VM_RMI_CTRL_MEC_PRIVATE? Then gating its availability on
rmi_mec_count() > 0 would make sense to me.

Thanks,
Kohei

> 
> 
> Suzuki

