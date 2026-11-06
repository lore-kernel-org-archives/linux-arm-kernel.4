Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF29A606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BQ2HAOm2;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=llAlWz7x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HuObySZLDxE9+LLAkaqrBSP5vceAa33bCHj1KNG2i7A=; b=BQ2HAOm2bTALEv
	sUhEmG2MWygK3xxKSkapN0q+wes48L+WO46Ug9CMKIWlFJtAgz2Qs/espHzB7LZ4RyMfmYOA+6tao
	qDt+DAZfUzmxDJ0VoCSajZLb9oyNZ8963xiwRKOiEZjO3y786nOUzE1t3rfVnIdHuL0vNIrRck8Kt
	DWgKRxiF3gZbCAFieJ9jnG/+SZ5QvHpRGwAhZMUehgxek3GkceKSf6u5ren7RZ+wB4CU+Ula09ECS
	wV8y1+XhYTkVKU+mKMLAJY8qAuJTOc5fiBh3ScP7f6qhABM/RJ8KbMrAUgn4flzNwkrfaWanjMTQY
	fqFwFCyryH5OUwcKg12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM0k-0000000CrK3-37aZ;
	Fri, 06 Nov 2026 15:37:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM0c-0000000CrHu-1R6R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:37:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475C81650;
	Fri,  6 Nov 2026 07:37:38 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 113BC3F632;
	Fri,  6 Nov 2026 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793979461; bh=qXWXkuBVBxZ9xT4eUDdfxaF2UuiBGoMjIIlVYYrkttg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=llAlWz7xlnBHxmmVTz87IEUBT+U3kyH9YObDETp6fosKhKB5oJhxN2dhuPXDLEEsX
	 DVL7yW5Oevy7iKyPxCGohG1kCXByNMZVwjct//ZIvQOmSyP2HF+mq413aZkhu0GgXL
	 wbI2QCexMI+/E09pwLD219X0IgawLZpU1REqS810=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	pbonzini@redhat.com,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	tangchengchang@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	fuad.tabba@linux.dev,
	mark.rutland@arm.com,
	seanjc@google.com,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v5 13/15] KVM: arm64: Add HDBSS buffer size ioctl for dirty-bitmap mode
Date: Fri,  6 Nov 2026 15:37:33 +0000
Message-ID: <au30PSHX_UBIIx_Y@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5a096cca-713a-4449-83dc-c763dc06c085@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-14-zhengtian10@huawei.com> <auioRICO9Frhk-zT@LeoBrasDK> <5a096cca-713a-4449-83dc-c763dc06c085@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073742_496950_92486523 
X-CRM114-Status: GOOD (  29.05  )
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

On Fri, Nov 06, 2026 at 06:27:27PM +0800, Tian Zheng wrote:
> 
> 
> On 11/2/2026 11:12 PM, Leonardo Bras wrote:
> > On Tue, Sep 29, 2026 at 06:36:53PM +0800, Tian Zheng wrote:
> > > In dirty-bitmap mode, a larger HDBSS buffer lets the guest dirty more
> > > pages between VM exits, at the cost of memory. The default of one page
> > > per vCPU is a reasonable starting point, so allow userspace to opt
> > > into a larger buffer via KVM_CAP_ARM_HDBSS_BUFFER_SIZE.
> > > 
> > > The size is specified in bytes through KVM_ENABLE_CAP and must be a
> > > power of two in [PAGE_SIZE, SZ_2M]: the upper bound is the largest
> > > HDBSSBR_EL2.SZ encoding, and the power-of-two requirement matches the
> > > buddy allocator. It must be set before any vCPU is created: -EINVAL
> > > after vCPUs exist, -EBUSY if already set.
> > > 
> > > The capability is rejected in dirty-ring mode, where the size is
> > > pinned by kvm_arch_dirty_ring_size_updated().
> > > 
> > > KVM_CHECK_EXTENSION returns the configured size for a VM, or SZ_2M
> > > when queried globally with a NULL kvm.
> > > 
> > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > ---
> > >   arch/arm64/kvm/arm.c     | 34 ++++++++++++++++++++++++++++++++++
> > >   include/uapi/linux/kvm.h |  1 +
> > >   2 files changed, 35 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index 5a7046acb62e..eadbf3a88d31 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -19,6 +19,7 @@
> > >   #include <linux/kvm.h>
> > >   #include <linux/kvm_irqfd.h>
> > >   #include <linux/irqbypass.h>
> > > +#include <linux/log2.h>
> > >   #include <linux/sched/stat.h>
> > >   #include <linux/psci.h>
> > >   #include <trace/events/kvm.h>
> > > @@ -203,6 +204,31 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
> > >   		r = 0;
> > >   		set_bit(KVM_ARCH_FLAG_EXIT_SEA, &kvm->arch.flags);
> > >   		break;
> > > +	case KVM_CAP_ARM_HDBSS_BUFFER_SIZE: {
> > > +		u64 size = cap->args[0];
> > > +
> > > +		if (!system_supports_hdbss())
> > > +			break;
> > > +		if (kvm->dirty_ring_size)
> > > +			break;
> > > +		if (size < KVM_ARM_HDBSS_DEFAULT_SIZE ||
> > > +		    size > KVM_ARM_HDBSS_MAX_SIZE)
> > > +			break;
> > > +		if (!is_power_of_2(size))
> > > +			break;
> > > +
> > > +		mutex_lock(&kvm->lock);
> > > +		if (kvm->created_vcpus) {
> > > +			r = -EINVAL;
> > > +		} else if (kvm->arch.hdbss_buffer_size) {
> > > +			r = -EBUSY;
> > > +		} else {
> > > +			kvm->arch.hdbss_buffer_size = size;
> > > +			r = 0;
> > > +		}
> > > +		mutex_unlock(&kvm->lock);
> > > +		break;
> > > +	}
> > >   	default:
> > >   		break;
> > >   	}
> > > @@ -500,6 +526,14 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> > >   		else
> > >   			r = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
> > >   		break;
> > > +	case KVM_CAP_ARM_HDBSS_BUFFER_SIZE:
> > > +		if (!system_supports_hdbss())
> > > +			r = 0;
> > > +		else if (kvm)
> > > +			r = kvm->arch.hdbss_buffer_size ?: KVM_ARM_HDBSS_DEFAULT_SIZE;
> > 
> > This whole thing of allowing hdbss_buf_size to be set only once makes
> > everything more complex. Why do we have this limitation again?
> > 
> > I mean, if we want to restrict size changes after the first hdbss buffer
> > gets allocated, it makes sense, other than that, I would like to understand
> > the reason for that.
> > 
> > Thanks!
> > Leo
> 
> Hi Leo,
> 
> You're right, I re-examined the whole flow and the "set once"
> restriction isn't actually needed. I'll remove it.
> 

Awesome, thanks!
Leo

