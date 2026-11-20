Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2FB606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jDW2W9CM;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u8UQV2QT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yzbdGeu2fn9Y9C1c+3jErX28oGARGq2CQCtYtowsmfA=; b=jDW2W9CMS9BGKB
	S98VTnPqgf0yQBGAKbyiCb/IoCErqXQgMHF8b+H6F3EiyLwOnwfuu/yISsZAjqTrxXBLIENbgLL/C
	q5mPMvUChHy5tMnguVn0dIxOhoG8nD7rlSP39P7n269shv5Qs/hja7FLDAAKQO9IWJ/wn2v3EZFk4
	4A1jDujx+FJCuOvLGFAjQUyM2O3qlMUvqdC1p5Sd5raZajkDsBNpAP4nuSJU3tZxLje1kKdc1Fk7N
	E5SqucA/bdFMGgCLh7OvOtYMigxG2U3P7jbHCYa84gbCSfv1rB7hIoivGno2zxDGdTuEIpz6sxrUS
	IEfavp9lnTe9Ag33CuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL8a-0000000EUZU-2iMt;
	Fri, 20 Nov 2026 09:42:32 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUL7c-0000000EUM4-3EUJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:41:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yzbdGeu2fn9Y9C1c+3jErX28oGARGq2CQCtYtowsmfA=;
	b=u8UQV2QTaZykzbQnjwd0wnW5WSx2hpJjxpRDfV56W/g4Lbc5kPhrrMfWdQnkl9QnpdKT1i1lS
	2C39dUkWTA/76Q4eqIp0UHvtkafvwJITP/42FbHAZb3G/UeC6Lww4tB64npAja3ctVsuLcOpNyP
	jdH9+vGji2P+0NsyN75IChU=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jW9LR4mkZzpSvM;
	Fri, 20 Nov 2026 17:40:31 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C01240561;
	Fri, 20 Nov 2026 17:41:25 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 20 Nov 2026 17:41:24 +0800
Message-ID: <371fe5a8-d831-4a86-897e-3bf9541b0c26@huawei.com>
Date: Fri, 20 Nov 2026 17:41:23 +0800
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
 <ceb91298-3d05-486e-a900-1291963dde24@huawei.com>
 <av8xblyy3GzgbNwf@LeoBrasDK>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <av8xblyy3GzgbNwf@LeoBrasDK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_014133_509153_87DBAE93 
X-CRM114-Status: GOOD (  32.51  )
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



On 11/20/2026 1:27 AM, Leonardo Bras wrote:
> On Thu, Nov 19, 2026 at 03:52:37PM +0800, Tian Zheng wrote:
>>
>>
>> On 10/30/2026 10:15 PM, Leonardo Bras wrote:
>>> On Fri, Oct 30, 2026 at 10:53:57AM +0800, Tian Zheng wrote:
>>>>
>>>>
>>>> On 10/27/2026 2:12 AM, Leonardo Bras wrote:
>>>>> On Tue, Sep 29, 2026 at 06:36:46PM +0800, Tian Zheng wrote:
>>>>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>>>>> index 32102c3912fa..12fa37328dd2 100644
>>>>>> --- a/arch/arm64/kernel/cpufeature.c
>>>>>> +++ b/arch/arm64/kernel/cpufeature.c
>>>>>> @@ -2158,6 +2158,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>>>>>     	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>>>>>     }
>>>>>>
>>>>>> +static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int scope)
>>>>>> +{
>>>>>> +	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, scope);
>>>>>> +}
>>>>>> +
>>>>>
>>>>
>>>> Hi leo,
>>>>
>>>>> IIUC you run this on every cpu in the system, to make sure it's matching
>>>>> the feature. Is there any chance the kernel is in EL2 only on some of the
>>>>> cpus here?
>>>>>
>>>>
>>>> It's impossible for the system to have only some CPUs in EL2 and others
>>>>    not.
>>>>
>>>>> If not, maybe we can run it on system_supports_hdbss() instead, which would
>>>>> be easier for the user to understand it only runs in EL2, on top of not
>>>>> needing the above.
>>>>>
>>>>
>>>> However, The question is whether a cap should mean "this system can use
>>>> the feature" or "this hardware supports the feature". If the cap only
>>>> tracks hardware support, users may be confused when the hardware
>>>> supports HDBSS but the system runs in nVHE mode — they would mistakenly
>>>> believe they can use the feature.
>>>>
>>>> So I think we should keep is_kernel_in_hyp_mode() in has_vhe_hdbss(),
>>>> and add a comment in system_supports_hdbss() explaining this.
>>>>
>>>> Does that work for you? Looking forward to your reply.
>>>
>>> Well,
>>> That's just my personal view of this:
>>>
>>> If we have a function called "has_hdbss" it should only report if the
>>> system has the feature available.
>>>
>>> On the "system_supports_*" we have to figure out if the system itself
>>> supports the feature, which checks the feature bits itself and could mean
>>> checking for other features being there, such as hyp_mode.
>>>
>>> What do you think?
>>>
>>> Thx,
>>> Leo
>>
>> Hi Leo,
> 
> Hi Tian,
>   
>> Sorry for the slow reply. I've been looking into how other cpufeatures
>> are configured on arm64, on and off, and that's why it took a while.
> 
> I took some time to study it as well, and to be clear, my previous
> understanding of this was incorrect, and it looks like the has_vhe_hdbss
> (.matches callback) is only called once during boot, and once per hot-added
> cpu.
>   
>> My reading is that detected: HDBSS should mean "this system can use
>> HDBSS", not just "the silicon has it".
>>
>> Several caps already add conditions beyond the ID bits. CNP returns
>> false for kdump and under ARM64_WORKAROUND_DISABLE_CNP, NV and pKVM
>> match on kvm_get_mode(), and can_trap_icv_dir_el1() starts with
>> is_hyp_mode_available(). So in practice a SYSTEM_FEATURE cap answers
>> "can this kernel use it on this system".
> 
> Humm, or maybe "can this kernel, booted as it is, use it on this system"...
>   
>> HDBSS is EL2-only (HDBSSBR_EL2/HDBSSPROD_EL2, VTCR_EL2.HDBSS),
>> implemented only under hyp/vhe, and used only by KVM, so "the hardware
>> is there" is not the same as "this kernel can use it". That is why I'd
>> keep the gate in has_vhe_hdbss() rather than moving it to the consumer.
>>
>> I'd be interested to hear how you see it.
> 
> I agree, that looks better this way.
> 
> I don't think I understand enough of what 'system' means in
> system_supports_*(), but I think your version explains it enough based on
> other similar functions.
> 
> Thanks!
> Leo

Hi leo,

Awesome, thanks for taking the time to study it.

Thanks!
Tian

