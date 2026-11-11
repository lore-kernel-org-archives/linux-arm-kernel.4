Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74918606A887
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zA/p9Yj4;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=G+/va11U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0yA9h3rkrGWUwNZM2GbnX6IgS2NUA31EDSsvcPpVQ64=; b=zA/p9Yj4hYRihH
	r5uABZhbMPFnUjf0nl3v/lk8pTdZu3rChJawXKQ5ODjgkPxNX2OqSpZ+vbdznohDn34a6p7B8OnCY
	ZhsRlFAkt9ZgCzfPwsxU2fx3AkdVG/18uTLl8klDE6DIL3HMY6NTx5Z/phSNqs+eqFPV/O8B5gh47
	hOdY7KAHECuwRqfsw5X2oUHzDEuT5Fk6gVwnB4AVtIU5JlPz+tpN44gvrF/SvVZ3UdnFmtqzYEoEJ
	/OoFmhX9D2knoEDH7F0NZhpYbgszIBd05hK7Lk0PJCqBZZJxmLb8V2ltiAGL0M8n+2sTBgrcBhaKX
	DEoKrGoy11t8hqqltIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRECG-00000007YUR-13Oc;
	Wed, 11 Nov 2026 19:41:28 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBl-00000007Xve-0wp9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:41:03 +0000
Received: from [10.4.158.9] (unknown [52.172.102.222])
	by linux.microsoft.com (Postfix) with ESMTPSA id 54CAD20B7166;
	Wed, 11 Nov 2026 11:40:45 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 54CAD20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1794426052;
	bh=0yA9h3rkrGWUwNZM2GbnX6IgS2NUA31EDSsvcPpVQ64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+/va11Uca+TJlQut2gfWo97vYuAIr4he/rj5Ckgh4c6vYKyd1cQMXUDy1zs31kaC
	 VZJ8MwQwAd9070qO/iFTXd8Qg1jWxu5gz6WoO1/0+6RzAENz1AI7crUTS2hKzewFwT
	 C2xvP4kfRLjDFNZuoUPWXciq0bs3mDglDDWDiesU=
Message-ID: <fe67b6bd-c2e9-47f7-8a11-f99c010dc479@linux.microsoft.com>
Date: Wed, 11 Nov 2026 11:40:47 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] arm64: hyperv: Add per-CPU RSI host call
 infrastructure for CCA Realms
To: Michael Kelley <mhklinux@outlook.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "will@kernel.org" <will@kernel.org>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
 <20261031001412.4150488-4-kameroncarr@linux.microsoft.com>
 <MN2PR02MB686375CB482F6EEA9D00F806D4712@MN2PR02MB6863.namprd02.prod.outlook.com>
Content-Language: en-US
From: Kameron Carr <kameroncarr@linux.microsoft.com>
In-Reply-To: <MN2PR02MB686375CB482F6EEA9D00F806D4712@MN2PR02MB6863.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_114057_404106_1F2FD50A 
X-CRM114-Status: GOOD (  19.80  )
X-Spam-Score: -2.8 (--)
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

On 11/11/2026 10:00 AM, Michael Kelley wrote:
> From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Friday, October 30, 2026 5:14 PM
>>
>> Arm CCA Realms cannot issue Hyper-V hypercalls via HVC; the guest must
>> route them through the RSI_HOST_CALL interface, which takes the IPA of a
>> per-CPU rsi_host_call structure as its argument.
>>
>> Add hv_hostcall_array as a per-CPU struct array and allocate it during
>> hyperv_init().
> 
> A quibble: This statement is a bit misleading. I think you mean it is a
> global array with an entry for each CPU.  The term "per-CPU" typically
> means something allocated out of the per-CPU area.

I agree. Earlier versions of the patch did use a per-CPU struct but it
was changed to a global array because the structure was small enough.

This series has already been applied to hyperv-next, but I can reach out
to Wei about editing the commit messages.

-- 
Regards,
Kameron

> Michael
>  
>> The allocation is gated on is_realm_world() so non-Realm
>> arm64 Hyper-V guests pay no memory cost.
>>
>> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
>> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
>> ---
>>  arch/arm64/hyperv/mshyperv.c      | 27 +++++++++++++++++++++++++--
>>  arch/arm64/include/asm/mshyperv.h |  4 ++++
>>  2 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>> index 82572c5..46ab2da 100644
>> --- a/arch/arm64/hyperv/mshyperv.c
>> +++ b/arch/arm64/hyperv/mshyperv.c
>> @@ -14,12 +14,16 @@
>>  #include <linux/arm-rsi-cmds.h>
>>  #include <linux/export.h>
>>  #include <linux/errno.h>
>> +#include <linux/slab.h>
>>  #include <linux/version.h>
>>  #include <linux/cpuhotplug.h>
>>  #include <asm/mshyperv.h>
>>
>>  static bool hyperv_initialized;
>>
>> +struct rsi_host_call *hv_hostcall_array;
>> +EXPORT_SYMBOL_GPL(hv_hostcall_array);
>> +
>>  int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>>  {
>>  	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
>> @@ -110,6 +114,20 @@ static int __init hyperv_init(void)
>>  	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
>>  		return 0;
>>
>> +	/*
>> +	 * The RSI host-call buffers are only ever used when
>> +	 * is_realm_world() is true. Skip the allocation on non-Realm
>> +	 * guests. A single contiguous array of nr_cpu_ids entries is
>> +	 * allocated; each CPU indexes into it by its processor ID.
>> +	 */
>> +	if (is_realm_world()) {
>> +		hv_hostcall_array = kcalloc(nr_cpu_ids,
>> +					    sizeof(struct rsi_host_call),
>> +					    GFP_KERNEL);
>> +		if (!hv_hostcall_array)
>> +			return -ENOMEM;
>> +	}
>> +
>>  	/* Setup the guest ID */
>>  	guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
>>  	hv_set_vpreg(HV_REGISTER_GUEST_OS_ID, guest_id);
>> @@ -131,13 +149,13 @@ static int __init hyperv_init(void)
>>
>>  	ret = hv_common_init();
>>  	if (ret)
>> -		return ret;
>> +		goto free_hostcall_mem;
>>
>>  	ret = cpuhp_setup_state(CPUHP_AP_HYPERV_ONLINE,
>> "arm64/hyperv_init:online",
>>  				hv_common_cpu_init, hv_common_cpu_die);
>>  	if (ret < 0) {
>>  		hv_common_free();
>> -		return ret;
>> +		goto free_hostcall_mem;
>>  	}
>>
>>  	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
>> @@ -150,6 +168,11 @@ static int __init hyperv_init(void)
>>
>>  	hyperv_initialized = true;
>>  	return 0;
>> +
>> +free_hostcall_mem:
>> +	kfree(hv_hostcall_array);
>> +	hv_hostcall_array = NULL;
>> +	return ret;
>>  }
>>
>>  early_initcall(hyperv_init);
>> diff --git a/arch/arm64/include/asm/mshyperv.h
>> b/arch/arm64/include/asm/mshyperv.h
>> index b721d31..aed0aa5 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -61,6 +61,10 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
>>  				ARM_SMCCC_OWNER_VENDOR_HYP,	\
>>  				HV_SMCCC_FUNC_NUMBER)
>>
>> +/* Per-CPU-indexed RSI host call structures for CCA Realms */
>> +struct rsi_host_call;
>> +extern struct rsi_host_call *hv_hostcall_array;
>> +
>>  #include <asm-generic/mshyperv.h>
>>
>>  #endif
>> --
>> 2.45.4
>>

