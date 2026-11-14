Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43271606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dIwDYbIv;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=QKdw25zN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NFb5ad8hqnTsa2E6F7F8LTT0h034t3fTlgBrnOuiBrM=; b=dIwDYbIvVnJQYu
	nrHhPFGAV50CzKBw3C1/f2uKSEqdGW7vtNEKc+DguPtbviMOAl7WAqKVG+Hfrx5NBoBIahqg+DlqF
	w5AlK1J7OLbbtB+2E/sTFGdXgJ+gPNO0LkmYtcWzjYjqkpC5YJm9oaprdIe78Zwx95bWbl66H6fWf
	72qxAnWSwQGnMtTvGU2SgpQ4Lzv19z0DIbUzxnfHF89Nk65OaBSAqZ7upYgXIB7RjTc8vVHfZndOx
	kKMggBIxzyK62R2nulj0CaPdOYvjUqFZ1OWqCUQDeuz2fnSh3+hglXoI2S1CB+NQrj6G9jAl/OAOd
	IcQo8tx1rwoVMq8NXGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS3zH-0000000F91X-2jmX;
	Sat, 14 Nov 2026 02:59:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS3zE-0000000F911-43MA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 02:59:30 +0000
Received: from [192.168.0.88] (192-184-212-33.fiber.dynamic.sonic.net [192.184.212.33])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4E87620B7166;
	Fri, 13 Nov 2026 18:59:22 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4E87620B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1794625162;
	bh=NFb5ad8hqnTsa2E6F7F8LTT0h034t3fTlgBrnOuiBrM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=QKdw25zNLEF8biGlipcQuqc/Hf1v1XGVvzmujIgi4qbe3v2Bp/stJfgVpyyz1S0n+
	 5dqCxUmzoCa1rvBmYCH5orTcGYkqe3PYhlJk/aDZTQz9e/RxEPIFdByDG+wvr4jY0+
	 gs1ssnMjFukTLsx9LHA1LY2agRF4FzOuDcZbn8bw=
Message-ID: <7ebf7187-bf42-fc11-e89b-b1aba96539d2@linux.microsoft.com>
Date: Fri, 13 Nov 2026 18:59:26 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v6 4/6] Drivers: hv: Mark shared memory as decrypted for
 CCA Realms
Content-Language: en-US
From: Mukesh R <mrathor@linux.microsoft.com>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
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
 <20261031001412.4150488-5-kameroncarr@linux.microsoft.com>
 <MN2PR02MB6863AA6357C8E0D4881F5FEAD4712@MN2PR02MB6863.namprd02.prod.outlook.com>
 <c6b7f583-878d-1f1e-60cc-e602e277d075@linux.microsoft.com>
 <af057438-a684-4840-815c-581b866678c1@linux.microsoft.com>
 <f74db23c-ee1d-e0b1-c463-55dad00f9c61@linux.microsoft.com>
In-Reply-To: <f74db23c-ee1d-e0b1-c463-55dad00f9c61@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_185929_040645_86B2DA22 
X-CRM114-Status: GOOD (  21.23  )
X-Spam-Score: -4.5 (----)
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

On 11/12/26 16:46, Mukesh R wrote:
> On 11/12/26 09:49, Kameron Carr wrote:
>> On 11/11/2026 6:43 PM, Mukesh R wrote:
>>> On 11/11/26 10:01, Michael Kelley wrote:
>>>> From: Kameron Carr <kameroncarr@linux.microsoft.com> Sent: Friday, October 30, 2026 5:14 PM
>>>>>
>>>>> In hv_common_cpu_init(), the per-CPU hypercall input/output pages need
>>>>> to be marked as decrypted (shared) for confidential VM isolation types.
>>>>> This is already done for SNP and TDX isolation; extend the same handling
>>>>> to Arm CCA Realm guests so that the host hypervisor can access the
>>>>> shared hypercall buffers.
>>>>>
>>>>> is_realm_world() is declared in include/linux/arm-rsi-cmds.h which only
>>>>> builds on arm64 (it includes <asm/memory.h>), so using it directly in
>>>>> the arch-neutral drivers/hv/hv_common.c would break the x86 build.
>>>>> Introduce a Hyper-V-specific helper following the established
>>>>> hv_isolation_type_snp() / hv_isolation_type_tdx() pattern.
>>>>>
>>>>> On architectures other than arm64 the weak default keeps the existing
>>>>> behaviour.
>>>>>
>>>>> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
>>>>> Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
>>>>> ---
>>>>>    arch/arm64/hyperv/mshyperv.c   |  5 +++++
>>>>>    drivers/hv/hv_common.c         | 17 +++++++++++++----
>>>>>    include/asm-generic/mshyperv.h |  1 +
>>>>>    3 files changed, 19 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>>>>> index 46ab2da..da6c3aa0 100644
>>>>> --- a/arch/arm64/hyperv/mshyperv.c
>>>>> +++ b/arch/arm64/hyperv/mshyperv.c
>>>>> @@ -182,3 +182,8 @@ bool hv_is_hyperv_initialized(void)
>>>>>        return hyperv_initialized;
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
>>>>> +
>>>>> +bool hv_isolation_type_cca(void)
>>>>> +{
>>>>> +    return is_realm_world();
>>>>> +}
>>>>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>>>>> index 31256cb..a60c92c 100644
>>>>> --- a/drivers/hv/hv_common.c
>>>>> +++ b/drivers/hv/hv_common.c
>>>>> @@ -476,6 +476,7 @@ int hv_common_cpu_init(unsigned int cpu)
>>>>>        u64 msr_vp_index;
>>>>>        gfp_t flags;
>>>>>        const int pgcount = hv_output_page_exists() ? 2 : 1;
>>>>> +    const size_t alloc_size = ALIGN((size_t)pgcount * HV_HYP_PAGE_SIZE, PAGE_SIZE);
>>>>>        void *mem;
>>>>>        int ret = 0;
>>>>>
>>>>> @@ -489,7 +490,7 @@ int hv_common_cpu_init(unsigned int cpu)
>>>>>         * online and then taken offline
>>>>>         */
>>>>>        if (!*inputarg) {
>>>>> -        mem = kmalloc_array(pgcount, HV_HYP_PAGE_SIZE, flags);
>>>>> +        mem = kmalloc(alloc_size, flags);
>>>>>            if (!mem)
>>>>>                return -ENOMEM;
>>>>>
>>>>> @@ -499,14 +500,16 @@ int hv_common_cpu_init(unsigned int cpu)
>>>>>            }
>>>>>
>>>>>            if (!ms_hyperv.paravisor_present &&
>>>>> -            (hv_isolation_type_snp() || hv_isolation_type_tdx())) {
>>>>> -            ret = set_memory_decrypted((unsigned long)mem, pgcount);
>>>>> +            (hv_isolation_type_snp() || hv_isolation_type_tdx() ||
>>>>> +             hv_isolation_type_cca())) {
>>>>
>>>> Could this big "if" statement use "hv_is_isolation_supported()" instead
>>>> of explicitly testing for each CoCo VM type? I ask partly because
>>>> Mukesh Rathor has just submitted a patch [1] that introduces a new
>>>> function that does something almost exactly the same as
>>>> hv_is_isolation_supported() and uses it here.
>>>
>>>>> +            (hv_isolation_type_snp() || hv_isolation_type_tdx() ||
>>>>> +             hv_isolation_type_cca())) {
>>>
>>> With my change, this will become:
>>>
>>>          (hv_isolation_hw_cvm() || hv_isolation_type_cca())) {
>>
>> Any reason you wouldn't change hv_isolation_hw_cvm() to
>>
>>    return hv_isolation_type_snp() || hv_isolation_type_tdx() ||
>>      hv_isolation_type_cca()
>>
>> That would seem more logical to me.
>>
> 
> We could, I just don't know if on cca, the repeat hypercall has same
> behavior. I was leaving that for the arm team. Anyways, I sent question
> to the hyp team, if they say yes, i can update my patch to include that.
> 
> Thanks,
> -Mukesh


Confirming, arm has same behavior and needs the fix also. So, we can def
expand the check to include _cca.

I just sent V1, renaming hv_isolation_hw_cvm() to hv_isolation_type_hw().
If your patch goes after mine, you just need to add to your 0004*:

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 4fdc26ade1d7..67a16b4d2235 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -134,3 +134,8 @@ bool hv_is_hyperv_initialized(void)
         return hyperv_initialized;
  }
  EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
+
+bool hv_isolation_type_hw(void)
+{
+       return is_realm_world();
+}


OR, you could pick mine 0001-* and make it part of your series, and I
can drop it from mine and make it dependent on yours. But mine is small
enough that it has higher chances of going in first.....

Thanks,
-Mukesh


