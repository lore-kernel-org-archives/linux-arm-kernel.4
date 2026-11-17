Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89B7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DcY9Lab0;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=swNs1Ok3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CUBa3JrKm9epugz/h6AhQXjaE++SEn+EIH8O82h1Ucg=; b=DcY9Lab0bia7z2
	uxJqFEo/PpzcW9RYjHjGM8DXCMhUDs+UJaLSQg9ejU6+WV2aJ7Nz0myf6JuoZkv7i7hlt7Wm+rRvH
	DmSy1Qpw+swOXBCsrGzeUKGC4ZF9jkvyT3ri4sHTE9XIk71q53mUSdfoGHMFcFn6Ib0yxXMkIfvBG
	E/Q6ukmYFo8Coz7M4Uy5OQwgP3GflQmtXfCQ/L3jW+HWnCs4TZur9Nu34ZGENPjh4cu277WRg3lhg
	iYa6d1YjFFzus2kPeSHT7aOG08CoecF78yjjd6Ds+NbogokpyxpuYb8fPsk38HFbfIXHD1sIdospL
	X0QZmpyZ5aRlTu7KoUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGXh-00000005Hgv-27Hz;
	Tue, 17 Nov 2026 10:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGXb-00000005Heb-2rCr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 10:35:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845C41476;
	Tue, 17 Nov 2026 02:35:51 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E69C3F763;
	Tue, 17 Nov 2026 02:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794911754; bh=sGpkum0bjez5dkPBVcc56aaH2V4M3Z/8iWCyxbdcqTc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=swNs1Ok3HM52gv4LK+pUD5QC0FAfKmdNAXJPkgcOotFJ2MjQfYfidCUeXHthlXj9L
	 faVlRdxjzI5TEMMx9DTxa7TGMEPRRyFK2b8E5qjm5J1xTzmqhWpF+cozMhgov7uN0F
	 3h3lykE2a3pQ0gElfqlX9VKEhH+kSYZRFZnrPGDk=
Message-ID: <ce03205e-6405-4269-a061-266ef6d67e1d@arm.com>
Date: Tue, 17 Nov 2026 10:35:50 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Jinjie Ruan <ruanjinjie@huawei.com>, Gavin Shan <gshan@redhat.com>,
 james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
 <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023555_836266_F304E195 
X-CRM114-Status: GOOD (  24.06  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gavin, Jinjie,

On 17/11/2026 03:31, Jinjie Ruan wrote:
> Hi Gavin,
> 
> 在 2026/11/13 7:42, Gavin Shan 写道:
>> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>>> requested, even one that has no MPAM cache controls. Mounting resctrl
>>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>>> configuration and monitor arrays and program out of range PARTIDs into
>>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>>> disabled.
>>>
>>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>>> as x86 does, so the mount fails instead. Only the enable path is checked,
>>> since unmount disables CDP on both cache levels to restore the MBA
>>> control.
>>>
>>> A system where only MBA can allocate, or that only has monitors, now
>>> fails a mount with CDP as well: CDP hides the MBA control because
>>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>>> aa2c-3c90fab5853d
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org> # 7.1+
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>> mpam_resctrl.c
>>> index 573617ba09df..afa3c084c475 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>>> resctrl_res_level rid, bool enable)
>>>       if (enable && mpam_partid_max < 1)
>>>           return -EINVAL;
>>>   +    if (enable && (!
>>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>>> +        return -EINVAL;
>>> +
>>
>> x86 only checks 'cdp_capable', so this check isn't exactly same as to
>> what's
>> done on x86, as claimed in the commit log?
> 
> Sorry, the commit message is somewhat misleading and need updated.
> 
> In my opinion, CDP is a feature related to resource allocation, and it
> is always reasonable to check alloc_capable.

Hmm, I know the patch came from my suggestion but I think the reason
that x86 only checks cdp_capable is that alloc_capable is that the
alloc_capable flag is also used to indicate that the resource is fully
setup and can be used.

In resctrl_arch_set_cdp_enabled() we manipulate alloc_capable for
re-enabling the MBA resource and the added !alloc_capable check would
mean that we'd never be able to do that manipulation. resctrl doesn't
call resctrl_arch_set_cdp_enabled() for the MBA resource but to be more
resilient the MPAM interface allows it.

In the future, once we start adding more controls for resources we'll
have to be careful to do the cdp enabling and hiding of features at the
control level rather than the feature level.

Thanks,

Ben

> 
> Best regards,
> Jinjie
> 
>>
>> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>> {
>>         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
>>
>>         if (!hw_res->r_resctrl.cdp_capable)
>>                 return -EINVAL;
>>
>>         :
>> }
>>
>>
>>>       /*
>>>        * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>        * false on error and unmount.
>>
>> Thanks,
>> Gavin
> 


