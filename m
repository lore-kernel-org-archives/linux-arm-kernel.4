Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aAQndNIh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FODMQ6HF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+odsCpg7jpRsaCQXSZZ4yxoA+q2K8SnFUpM1JNTaGdM=; b=aAQndNIhVTaOMgKX2dcpUPiyGV
	+P1wPXaIhqqXVrhMk/So5WtsPAZ9/DkJjC96vOKmGVPtJZQ5LadA9Rgpp+HvZ85WjDkNBBut0w1aI
	z6IYOZZ4hYJwQn052g8eN0P7QkD1+Dx7sUYnpi6qvesALRaYPynT3hwKSsxlHa70TPkVdRejbCayy
	+AbMskY4vtFK2HRAMNDofnAe6JNVNtKJ56wErI/xfdk2e9oq1/EtsuL4q2saTOnrxLHTwCPr0gO/E
	oWQKjwrz0Qfu2M5yt2Ohl/P7ugxgrf4KjEgVZp4xijwWiumzbkVJIEU/GVOiwX8U4qBAPJDT5XQwm
	N0y86m3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSnW-00000001ITQ-325T;
	Mon, 09 Nov 2026 17:04:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSnS-00000001IOH-115y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:04:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B59CB439EE;
	Mon,  9 Nov 2026 17:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A7D1F008A1;
	Mon,  9 Nov 2026 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243881;
	bh=+odsCpg7jpRsaCQXSZZ4yxoA+q2K8SnFUpM1JNTaGdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FODMQ6HFrJPYbAiPnyWZS0/BhpGp22hllkW0FNfkoaK5CcC043UUfohcKcPk1gp16
	 +9rUSS5AA4O8P+dEykIPa8fswmqGJ0vYl2zVPKtNbC1dNy1YVwUbtIWWghnDLkPv4H
	 pfEuNOOx7qWMEfr3GxEDV18r56z+KZxWptqV+Z2+Ei9UoN4dbxPH9IMVswH7Fcd9ST
	 0kAiW09cm9cSKYdVE6hlg0yi5Uu18PRtwm/TOXAHJEMGfMP2/T5bBWkDZaG2hYpECf
	 JMe7NL5gOG3nRzUWGmhVvmYoVpBL3PYjuULhStALMsZ/6RHe4Yfzy1/B7YEbUsb+YW
	 e4jLSkMwebdeA==
Date: Mon, 9 Nov 2026 09:04:40 -0800
From: Oliver Upton <oupton@kernel.org>
To: Jinqian Yang <yangjinqian1@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, maz@kernel.org, fuad.tabba@linux.dev,
	yuzenghui@huawei.com, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, liuyonglong@huawei.com,
	wangzhou1@hisilicon.com, prime.zeng@hisilicon.com,
	tangchengchang@huawei.com, zhengtian10@huawei.com,
	linuxarm@huawei.com, liujian222@huawei.com
Subject: Re: [PATCH] KVM: arm64: Register irq_bypass consumers only with GICv4
Message-ID: <avH9KJ99im5Z2wEb@kernel.org>
References: <20261109112018.241298-1-yangjinqian1@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109112018.241298-1-yangjinqian1@huawei.com>
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

Hi,

On Mon, Nov 09, 2026 at 07:20:18PM +0800, Jinqian Yang wrote:
> kvm_arch_has_irq_bypass() on arm64 returns true unconditionally, so
> every irqfd assignment registers an irq_bypass consumer even when the
> hardware cannot perform GICv4 direct MSI forwarding. In that case
> kvm_vgic_v4_set_forwarding() bails out at its very first check, since
> vgic_supports_direct_msis() is false without has_gicv4, and the
> registration becomes pure overhead: every KVM_IRQFD ioctl takes the
> global irq_bypass mutex, which becomes a contention point when many
> VMs boot concurrently.
> 
> Gate the registration on kvm_vgic_global_state.has_gicv4, the way x86
> gates on enable_device_posted_irqs. Functionally this is a no-op:
> without GICv4 the consumer registration never did anything beyond
> acquiring the lock.  On a GICv3-only host booting 100 microVMs
> concurrently this cuts the average boot time by ~5 ms, matching the
> gain observed with CONFIG_HAVE_KVM_IRQ_BYPASS=n.
> 
> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 97332ffcb130..785d57388032 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1744,7 +1744,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>  
>  static inline bool kvm_arch_has_irq_bypass(void)
>  {
> -	return true;
> +	return kvm_vgic_global_state.has_gicv4;
>  }

This should just take a pointer on struct kvm then use
vgic_supports_direct_msis() since having an initialized irqchip is a
precondition of kvm_irqfd_assign().

Thanks,
Oliver

