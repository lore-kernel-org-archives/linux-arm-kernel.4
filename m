Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A3606A6A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dBiHKfx2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lW139yi/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tLn9NlBdSVUSz58JdtDu+F9qp+vEUxjH2T7H0cAfX+E=; b=dBiHKfx2Mq6CPh
	dP+Qo0XDuG6nfcWc9dkvdlPcAWkf0xl/00QuT+Tgc2AA5L4qC3IXu12YxAMx0dOI02hys/5SKMIOV
	IkhOaXIHJXOKty0kAuHq00N3QX9NYIrRJsIoFW50VsrzIM/tQtN9HE3gQnxpoGD4HdErAjNk7dwLT
	QKqAnLOsTDql98EOrtheH+6zIiGjJqh+6n9aZOXfBd38XdrDKxMgG2aHBqCTc6uL2eIdYOejsX4q0
	CtRrscpt8f2D8cUlaF9N+2JL9AuTanS9Nf6qRb575JTfrLKb8DXzehf/FtLNGiH88MiwC7z+XVg3I
	tyrveCImFo1biPojTjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx61-0000000Gauy-3YO2;
	Fri, 27 Nov 2026 14:38:41 +0000
Received: from out-136.mta0.migadu.com ([2001:41d0:1004:224b::88] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx5n-0000000GaqO-1uJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:38:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8AxK7nkx6Q25xccXZzMNTLYsT/LG228EyrVgmqLTQ9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795790305; v=1; x=1796395105;
 b=lW139yi/SVGyw6xlKY050XNGYJjgtfTAzD56ebhNHSE/TOd8QtAtYnxbfj2qzH7yJ9HXtsum
 04rZa4FBJRtI1Mf4FjVr8KMFrDMTg7HWY9N2FkcpwajaWmrIZmk5823HU0raLFyAu57zaeJdzU3
 Oe0mwkGWgWG6fEQSJVXutI1A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a1f3988772b981e8;
	Fri, 27 Nov 2026 14:38:25 +0000
X-Mizu-Trace-ID: a1f3988772b981e8
X-Migadu-Flow: FLOW_OUT
Message-ID: <aa937018-0454-4dbb-9e32-a65b46fc7635@linux.dev>
Date: Fri, 27 Nov 2026 14:38:24 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Leonardo Bras <leo.bras@arm.com>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, maz@kernel.org, oupton@kernel.org,
 fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com,
 rkeilty@meta.com, atish.patra@linux.dev, dgreid@meta.com
References: <20261124152842.2634495-1-usama.arif@linux.dev>
 <awcXhk885lqDRAHy@LeoBrasDK> <06a69a4f-59bb-49b8-9ed0-f4cfe0ecad37@linux.dev>
 <awcoCklLOKeuXPhh@LeoBrasDK> <e7bdcfa9-bbd8-4649-8318-2f6dc236db15@linux.dev>
 <4jxdf2pkuu2f7dftvf6ltpv27jctfuvvrfcrbfxudsgnp3hdfk@taur55wftexq>
 <awhH1Dpu0uIwP6ea@gremlin> <awh5pmXCbNoFP5Ez@LeoBrasDK>
 <awmDZoqzL_t6A7go@gremlin>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <awmDZoqzL_t6A7go@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_063827_641578_D90BA197 
X-CRM114-Status: GOOD (  15.24  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 27/11/2026 05:29, Lorenzo Stoakes (ARM) wrote:
> On Thu, Nov 26, 2026 at 06:25:43PM +0000, Leonardo Bras wrote:
>>>>> diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
>>>>> index 9a126b9e2d7c99..5b61285d317e28 100644
>>>>> --- a/arch/arm64/include/asm/kvm_types.h
>>>>> +++ b/arch/arm64/include/asm/kvm_types.h
>>>>> @@ -2,7 +2,12 @@
>>>>>  #ifndef _ASM_ARM64_KVM_TYPES_H
>>>>>  #define _ASM_ARM64_KVM_TYPES_H
>>>>>
>>>>> -#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
>>>>> +#define KVM_PGTABLE_FIRST_LEVEL		-1
>>>>> +#define KVM_PGTABLE_LAST_LEVEL		3
>>>>> +
>>>
>>> The -1 isn't needed here at all right? So why not just import
>>> KVM_PGTABLE_LAST_LEVEL and do:
>>>
>>> #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE       KVM_PGTABLE_LAST_LEVEL
>>>
>>> ?
>>
>> Well, it kind of is :)
>> The lowest level we have in a PGTABLE is level -1. (See RKSBQV)
>>
>> It could now be mathematically correct, but it could break in the future if
>> we got a level-2, for instance. We could have (LAST - FIRST - 1), if that
>> one page makes any diference.
> 
> Yup it's level -1 but isn't that only something meaningful for stage-1 I believe
> due to concatenation? As per stage2_pgtable_levels() [where ipa is the number of
> bits not the ipa... :)].
> 
> But you make a good point re: future changes!
> 
> Anyway, Marc has made it clear he wants something based on
> kvm_mmu_cache_min_pages() at runtime, so it's all moot anyway, this needs to be
> reworked for that.
> 
> Usama - I assume you are looking at that now?
> 

Yes, sorry I didnt see this discussion until now, I was trying to prototype
something that fit Marc's suggestion [1] and measure potential cost of it.
Hopefully its reasonable.

[1] https://lore.kernel.org/all/d2b6e735-a685-4e79-bb39-2fb75ebecd09@linux.dev/

> --
> Cheers, Lorenzo


