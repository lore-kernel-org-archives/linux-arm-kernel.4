Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77644606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 07:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pUlK93rA;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LCSdGyGP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XDGSq+NYY9XzLBrI14hyUS/fB+/Exw2w2j7dzo+fazs=; b=pUlK93rAvZmbU7
	cvduKv29h4+yhM9JemqfOcfKHKYAMN7IuUat10lKXIOqEfKtmJHlnI7Bb5UOgCwj2rs4/xeHXttPE
	F0io0MITVVM1FVxUzkSTKo7erxUJGQP3ivzBopPxFO2lYf5o4q+RsrsP9OErahG1GBoTByKyRw4b4
	TiLvyBK3UHbUdm3OwKGuK+GJEo0/sVHzqq+GcA/74SzXc6hrx4pk+CzBYHDF8HBqLKUC2T4xTrPHE
	SudQtCUvMB42ZSvIbc3xDujA8p1AtzeBzwbzbdsV57lgQ6E+QjJSEsyXtu+vCo9ydwGxkqiqZJ6Gc
	kRzuwPJcRZq3aeKeR4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwws-0000000B6oL-217h;
	Thu, 19 Nov 2026 07:52:50 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwwo-0000000B6nm-2hIo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 07:52:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XDGSq+NYY9XzLBrI14hyUS/fB+/Exw2w2j7dzo+fazs=;
	b=LCSdGyGPdamq0ZtVH+kQdHhms9IgZI22Kjo79DM7xUImrxVEK+DP8tfMlYQ5/G9pKXP//eJpt
	hiHyy9nA5IKmAKkHxPR9kSEkq3RilXY3DPsQUifasfgYSS15KqerDXrYYPbjxP+UQ9aehn1f8Gu
	fSS+3VMnGKoM25dNCsLD0so=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jVVzd5Ky2z1T4Fr;
	Thu, 19 Nov 2026 15:51:57 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id C976C203AB;
	Thu, 19 Nov 2026 15:52:38 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 19 Nov 2026 15:52:37 +0800
Message-ID: <ceb91298-3d05-486e-a900-1291963dde24@huawei.com>
Date: Thu, 19 Nov 2026 15:52:37 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/15] KVM: arm64: Add support for FEAT_HDBSS
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>,
	<caijian11@h-partners.com>, <liuyonglong@huawei.com>,
	<tangchengchang@huawei.com>, <yezhenyu2@huawei.com>, <yubihong@huawei.com>,
	<linuxarm@huawei.com>, <joey.gouly@arm.com>, <kvmarm@lists.linux.dev>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>, <mark.rutland@arm.com>,
	<seanjc@google.com>, <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <skhan@linuxfoundation.org>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
 <20260929103655.85107-7-zhengtian10@huawei.com> <at-X_hFbsBU_Dsgr@LeoBrasDK>
 <a301e884-f6d1-4082-8551-8d8a17276dc3@huawei.com>
 <auSml6yTVYIQe7NZ@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <auSml6yTVYIQe7NZ@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_235247_442884_8E9ABFFA 
X-CRM114-Status: GOOD (  30.19  )
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



On 10/30/2026 10:15 PM, Leonardo Bras wrote:
> On Fri, Oct 30, 2026 at 10:53:57AM +0800, Tian Zheng wrote:
>>
>>
>> On 10/27/2026 2:12 AM, Leonardo Bras wrote:
>>> On Tue, Sep 29, 2026 at 06:36:46PM +0800, Tian Zheng wrote:
>>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>>> index 32102c3912fa..12fa37328dd2 100644
>>>> --- a/arch/arm64/kernel/cpufeature.c
>>>> +++ b/arch/arm64/kernel/cpufeature.c
>>>> @@ -2158,6 +2158,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>>>    	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>>>    }
>>>>
>>>> +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int scope)
>>>> +{
>>>> +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, scope);
>>>> +}
>>>> +
>>>
>>
>> Hi leo,
>>
>>> IIUC you run this on every cpu in the system, to make sure it's matching
>>> the feature. Is there any chance the kernel is in EL2 only on some of the
>>> cpus here?
>>>
>>
>> It's impossible for the system to have only some CPUs in EL2 and others
>>   not.
>>
>>> If not, maybe we can run it on system_supports_hdbss() instead, which would
>>> be easier for the user to understand it only runs in EL2, on top of not
>>> needing the above.
>>>
>>
>> However, The question is whether a cap should mean "this system can use
>> the feature" or "this hardware supports the feature". If the cap only
>> tracks hardware support, users may be confused when the hardware
>> supports HDBSS but the system runs in nVHE mode — they would mistakenly
>> believe they can use the feature.
>>
>> So I think we should keep is_kernel_in_hyp_mode() in has_vhe_hdbss(),
>> and add a comment in system_supports_hdbss() explaining this.
>>
>> Does that work for you? Looking forward to your reply.
> 
> Well,
> That's just my personal view of this:
> 
> If we have a function called "has_hdbss" it should only report if the
> system has the feature available.
> 
> On the "system_supports_*" we have to figure out if the system itself
> supports the feature, which checks the feature bits itself and could mean
> checking for other features being there, such as hyp_mode.
> 
> What do you think?
> 
> Thx,
> Leo

Hi Leo,

Sorry for the slow reply. I've been looking into how other cpufeatures
are configured on arm64, on and off, and that's why it took a while.

My reading is that detected: HDBSS should mean "this system can use
HDBSS", not just "the silicon has it".

Several caps already add conditions beyond the ID bits. CNP returns
false for kdump and under ARM64_WORKAROUND_DISABLE_CNP, NV and pKVM
match on kvm_get_mode(), and can_trap_icv_dir_el1() starts with
is_hyp_mode_available(). So in practice a SYSTEM_FEATURE cap answers
"can this kernel use it on this system".

HDBSS is EL2-only (HDBSSBR_EL2/HDBSSPROD_EL2, VTCR_EL2.HDBSS),
implemented only under hyp/vhe, and used only by KVM, so "the hardware
is there" is not the same as "this kernel can use it". That is why I'd
keep the gate in has_vhe_hdbss() rather than moving it to the consumer.

I'd be interested to hear how you see it.

Thanks,
Tian

