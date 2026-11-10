Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E564606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c663XfHW;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=za9EC74p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AA4e/95fbAm29CcIL61TsgvVzn4oBxp+/bcnK79b1/I=; b=c663XfHW7oJFPN
	5RAbSgAguZJzcKyLRCPUIxFa1sna3cvDfNKt89Up35DLLRRuBhzOmbqb8g+FRSpvegTh6a7YO4+b/
	iRqYmhleOMSPsABgSt5BwHvbyV50sRsfw1GuAli5z7DnYcrr2dsi5jXHHZhvTiISJsBfp9IlNShtD
	/dLbeoxWU8ql9VxxQj9EhOjmiQ3AEmeLio4wlG/TapwXwBqwcQGBBPjU0kgQuiyYb0LxQLHWuTgvI
	7WtOp8Q70bUoXHGhx5WTNxzlTRabyolVc3hHhyh19NCFyf2Zp4Z2nMxAs3cvXBh7dGxDoD55y6yyI
	WpW9y54yqFmXYT2TNmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaKX-000000023T6-21vv;
	Tue, 10 Nov 2026 01:07:21 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaKT-000000023Sk-0myg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:07:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AA4e/95fbAm29CcIL61TsgvVzn4oBxp+/bcnK79b1/I=;
	b=za9EC74pTHdI2rna0DdXk9IEvtvfJmWHwkIZSNcKEQeh1gjHQqInj0oAZv5qJOBMf/qsknc4D
	47+pqMBhc8NzrAmF+oq9MkAuvsBzk9cJ/bd14JRi0DwK8uJvud9Eb5qe/M+Rg70vrg3hF1h5/qA
	YEZKS8zpPRJ0shLwK4QPjCg=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jNpQS6DQsz1cySM;
	Tue, 10 Nov 2026 09:06:56 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id 84FA34048B;
	Tue, 10 Nov 2026 09:07:11 +0800 (CST)
Received: from [10.67.121.183] (10.67.121.183) by
 kwepemk300013.china.huawei.com (7.202.194.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 10 Nov 2026 09:07:10 +0800
Message-ID: <2feaca55-e2f5-4494-b13a-3790efa1eb81@huawei.com>
Date: Tue, 10 Nov 2026 09:07:00 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Register irq_bypass consumers only with GICv4
To: Oliver Upton <oupton@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <maz@kernel.org>, <fuad.tabba@linux.dev>,
	<yuzenghui@huawei.com>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<tangchengchang@huawei.com>, <zhengtian10@huawei.com>, <linuxarm@huawei.com>,
	<liujian222@huawei.com>
References: <20261109112018.241298-1-yangjinqian1@huawei.com>
 <avH9KJ99im5Z2wEb@kernel.org>
From: Jinqian Yang <yangjinqian1@huawei.com>
In-Reply-To: <avH9KJ99im5Z2wEb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_170717_882251_D1BA9B80 
X-CRM114-Status: GOOD (  16.51  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026/11/10 1:04, Oliver Upton wrote:
> Hi,
> 
> On Mon, Nov 09, 2026 at 07:20:18PM +0800, Jinqian Yang wrote:
>> kvm_arch_has_irq_bypass() on arm64 returns true unconditionally, so
>> every irqfd assignment registers an irq_bypass consumer even when the
>> hardware cannot perform GICv4 direct MSI forwarding. In that case
>> kvm_vgic_v4_set_forwarding() bails out at its very first check, since
>> vgic_supports_direct_msis() is false without has_gicv4, and the
>> registration becomes pure overhead: every KVM_IRQFD ioctl takes the
>> global irq_bypass mutex, which becomes a contention point when many
>> VMs boot concurrently.
>>
>> Gate the registration on kvm_vgic_global_state.has_gicv4, the way x86
>> gates on enable_device_posted_irqs. Functionally this is a no-op:
>> without GICv4 the consumer registration never did anything beyond
>> acquiring the lock.  On a GICv3-only host booting 100 microVMs
>> concurrently this cuts the average boot time by ~5 ms, matching the
>> gain observed with CONFIG_HAVE_KVM_IRQ_BYPASS=n.
>>
>> Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 97332ffcb130..785d57388032 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -1744,7 +1744,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>>   
>>   static inline bool kvm_arch_has_irq_bypass(void)
>>   {
>> -	return true;
>> +	return kvm_vgic_global_state.has_gicv4;
>>   }
> 
> This should just take a pointer on struct kvm then use
> vgic_supports_direct_msis() since having an initialized irqchip is a
> precondition of kvm_irqfd_assign().
> 
Yes, vgic_supports_direct_msis() is used as the gate in
kvm_arch_irq_bypass_add_producer->kvm_vgic_v4_set_forwarding, and
kvm_arch_has_irq_bypass should be consistent. This will be modified
in the next version.

Thanks,
Jinqian

