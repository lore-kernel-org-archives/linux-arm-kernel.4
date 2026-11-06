Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C0F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n6ZgM/dd;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fQxMjKtQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X6oCZ8KMibXCNr1yDQP09IDW1MiX5SNSSfAmHFWcFuM=; b=n6ZgM/ddhObGvL
	i8FJRrKMTjv6G+BkVKAsoHYBCQYFb7YxCP1lAdujg/Z4nk5TLS+Yxc9hNZh7ToSgJ3TGgI4AixEml
	AzkIdt0SWT6BSgKylHHtYegknT5H0jw6QZI52Af1sa22a+dHhZjJOviU5ujaX2Lw8ws6q6hYGWxCy
	xRjjhuUY5xAQaOphUL1l/UIouOjOmRseqWuxhPR6gO3c4PqwE90g+HiDgiRIz00zT2Qssti+rxZhk
	51WMatF91McEut/jpyoNvFPEkUH0pMsXnPb0E5ky9aHHaMvbBQHSncRgo86LVlWqLbt4AyfpmKWhI
	Xy20+R35KabpySPdmw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPM07-0000000Cr1U-1TSL;
	Fri, 06 Nov 2026 15:37:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLzr-0000000Cquu-0lWh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:37:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F22051650;
	Fri,  6 Nov 2026 07:36:50 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E638C3F632;
	Fri,  6 Nov 2026 07:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793979414; bh=XhTj1ZqerFVvUKFrBdoT7z+FaNkZhZNX8C/KwXqfi4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQxMjKtQP13tykAE+L2nt7gsW2dFPZHgY5a2UhnFNKxU6LLOsJPGDvVyqyrLaJf3g
	 rnqVSo1tCLPaYbCB/JHGdo0YAiCdYF94rO9uZtgxKA4byJK0eOGUkjCjuRQLrU/2Um
	 Qr5BuxuawI84dtwHI4oxWrZiiNGlXsezx2dHHYsI=
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
Subject: Re: [PATCH v5 11/15] KVM: arm64: Reserve dirty ring space for the HDBSS buffer
Date: Fri,  6 Nov 2026 15:36:46 +0000
Message-ID: <au30DqzWIFny1tpr@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <afcbf19b-bd13-4afc-ab56-8bc50c793e50@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com> <20260929103655.85107-12-zhengtian10@huawei.com> <auikG0clmr19sAjh@LeoBrasDK> <afcbf19b-bd13-4afc-ab56-8bc50c793e50@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_073704_538876_088DC813 
X-CRM114-Status: GOOD (  31.53  )
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

On Fri, Nov 06, 2026 at 06:36:04PM +0800, Tian Zheng wrote:
> 
> 
> On 11/2/2026 10:54 PM, Leonardo Bras wrote:
> > On Tue, Sep 29, 2026 at 06:36:51PM +0800, Tian Zheng wrote:
> > > The dirty ring reserves room for CPU-side dirty buffers via
> > > kvm_cpu_dirty_log_size(). Report the HDBSS buffer entry count
> > > through it, so a full buffer flush always fits in the ring.
> > > 
> > > Pin the HDBSS buffer size to PAGE_SIZE when dirty-ring is enabled,
> > > via kvm_arch_dirty_ring_size_updated(): a larger buffer only
> > > shrinks the soft_limit and forces more frequent userspace drains.
> > > 
> > > Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
> > > ---
> > >   arch/arm64/kvm/arm.c | 8 ++++++++
> > >   arch/arm64/kvm/mmu.c | 8 ++++++++
> > >   2 files changed, 16 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index 9d7bdece149a..5a7046acb62e 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -215,6 +215,14 @@ static int kvm_arm_default_max_vcpus(void)
> > >   	return vgic_present ? kvm_vgic_get_max_vcpus() : KVM_MAX_VCPUS;
> > >   }
> > > 
> > > +void kvm_arch_dirty_ring_size_updated(struct kvm *kvm)
> > > +{
> > > +	if (!system_supports_hdbss())
> > > +		return;
> > > +
> > > +	kvm->arch.hdbss_buffer_size = KVM_ARM_HDBSS_DEFAULT_SIZE;
> > > +}
> > > +
> > 
> > On the same subject as a previous patch:
> > I don't think this is the best approach, on top of adding a new weak
> > function to take care.
> > 
> > Maybe during the dirty-ring allocation, on vcpu creation, we could take
> > into account the requested dirty-ring size, and just allocate the HDBSS
> > buffer taking that into account. That would make it simpler, don't you
> > agree?
> > 
> > Thanks!
> > Leo
> 
> Hi Leo,
> 
> The "set once" guard we're discussing comes from the patch that adds the
> ioctl, and it isn't really needed. We discussed this earlier [1]: we can
> just initialize hdbss_buffer_size to PAGE_SIZE at VM creation and let
> the ring reservation use it directly. **That also means
> kvm_arch_dirty_ring_size_updated() can be removed.** Thanks for your
> suggestion.

:)

> 
> As for why PAGE_SIZE is the right value in ring mode: the HDBSS buffer
> is flushed on every VM exit, so a larger buffer doesn't reduce the flush
> frequency. It only inflates the ring reservation (64 + size/
> sizeof(u64)), which shrinks the soft_limit and forces more frequent
> exits to userspace for the ring to be drained. Draining the dirty ring
> from QEMU is more expensive than draining the HDBSS buffer from the
> kernel, so the smallest buffer gives the best performance. In this mode,
> a larger buffer provides no benefit to users.

Humm, if properly dimensioned larger buffers would be benefitial for 
memory-intensive workloads, unless they are guest_exiting for other 
reasons in the meantime. 

> 
> In my tests, I also saw performance degrade when more space is reserved.
> 

Humm, what kind of workloads did you test? 
Did you have the chance to monitor what were the reasons for VM exiting?

I am not saying this is mandatory for the HDBSS implementation, but the 
whole idea of letting the user choose their own HDBSS buffer size is 
because different workloads may benefit from different buffer sizes: if a 
VM writes a lot to new memory, and exits very little for other reasons, 
then a larger buffer will cause the VM to guest_exit much less often.

Does that make sense?

Thanks!
Leo

