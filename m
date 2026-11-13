Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D113606A8B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q8u/hbE+;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=wKqlIfso
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jnDAeo7CmnNaA/656fOLCkXGnntEEKJb98BwVbdJVSA=; b=Q8u/hbE+EKYy78
	4PiJLDTYKXy7cajRTTfjlyJBlcG4hjAsUKL5WCHW0QSW9P0N/N7YBSZRaVLzDks1fRm12TDz2U4Rh
	aumCtbfcxSWU2pBBGlzkH52o/HcT+fC8+9gGzEp69DG7X1YkUSuabpiMJSXB6lGsb3AQA+b3T4qe4
	sqBHvA4t08MkjsRhKr7tJEWnk1ddvLfiLNQa2AcEA1+BC7HZ1WlsKCk2dvDc2uoF98oTaPg0xNDb1
	QlxT5NBpI+n4TtPLn47ID+0/2lp8tBeTNLecKd2UmpVZR5ky8W21WIoC6HKDYwqAUC7/HFmeerut/
	v3EeY8z+4O7YC7eBUsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwIa-0000000DzR1-0cPs;
	Fri, 13 Nov 2026 18:46:56 +0000
Received: from out-50.mta0.migadu.com ([2001:41d0:1004:224b::32] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwIX-0000000DzQD-0rz1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:46:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YRNPDyKnF5AAnH1Nkcj0IpcYyCLG3qMSgftkaQIlJjM=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794595610; v=1; x=1795200410;
 b=wKqlIfsoAs0iiPyqGpYb1eUg2O8du+8UjqsDMtpATzTB6foPKYrKEZW3X/GCT6x0Htk3RdMS
 rYqKk+9j35v5d7UF3Lgka/03jO7vWIae3pT1pqTd3i4mQfDNs8KV5Ho9Rdi1FIH34bCAKLKvKOz
 Xpm868QO4MtJl7TzQeub6Z4v2Sin4Ltb5EMgyE6mw2mhX8JMm5q7T7KHupDQ5lM0SIvgtD1QKEB
 yDfLlLnJSWRsFseTjO/pr746/CI5K1dLg8uSdw1YRFRXnF8Iuxl+fqd+QTIRhwy73cr0NDLmqtG
 kF8OuSRi46q4kYjbqTbjjdB5YLwzVG2yLa+YGTyNhu13g==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e856afca2a42441d;
	Fri, 13 Nov 2026 18:46:50 +0000
X-Mizu-Trace-ID: e856afca2a42441d
X-Migadu-Flow: FLOW_OUT
Message-ID: <4ce436ed-63b7-4764-afc5-dc5ffa4f0ba1@packett.cool>
Date: Fri, 13 Nov 2026 15:46:40 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
 <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
 <ak5qkRKk2eHHLYmo@baldur>
 <2c21041d-f84c-4fa7-a977-555f9203d8b5@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <2c21041d-f84c-4fa7-a977-555f9203d8b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_104653_694628_9C9B0BFF 
X-CRM114-Status: GOOD (  28.49  )
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

On 7/17/26 8:40 AM, Bibek Kumar Patro wrote:
>
>
> On 7/8/2026 8:56 PM, Bjorn Andersson wrote:
>> On Wed, Jul 08, 2026 at 03:31:07PM +0530, Bibek Kumar Patro wrote:
>>>
>>>
>>> On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
>>>>>
>>>>>
>>>>> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>>>>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its 
>>>>>>> registers
>>>>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>>>>> leading to intermittent probe failures and runtime issues.
>>>>>>>
>>>>>>> Add the required interconnect to ensure reliable register access.
>>>>>>>
>>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>>>>     1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi 
>>>>>>> b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>>> index 90e50c245c0c..721526f023dd 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>>>>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>>>>>>                 power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>>>>                 dma-coherent;
>>>>>>> +            interconnects = <&gem_noc MASTER_GPU_TCU 
>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>>>>
>>>>>> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY 
>>>>>> and
>>>>>
>>>>> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
>>>>> preventing gem_noc going to sleep when icc_set_bw is being called.
>>>>
>>>> _why_?
>>>>
>>>
>>> Now when i think of where we implemented the hooks, ALWAYS is not 
>>> needed. We
>>> should keep it ACTIVE_ONLY since we are already voting it
>>> back in resume pah. I'll fix it in next revision.
>>>
>>
>> The path is between the SMMU and DDR, so clearly it has to do with the
>> TCU's ability to fetch things from DDR.
>>
>
> Yes as you rightly mentioned, this series is helping to resolve the 
> race in TCU DDR clink
>
>> ACTIVE_ONLY states that the vote should only be applied when the
>> application subsystem (CPUSS) is not in low-power mode (CPU is active).
>>
>> So, are you saying that in all cases that cpuidle might select such
>> low-power state the GPU TCU is "stopped", and does not need to perform
>> any memory transactions?
>>
>
> I rechecked the architectural block diagram, GPU TCU is
> independent of the CPUSS, unlike system TCU.
>
> This means CPUSS can be powered down while the GPU TCU remains voted 
> up. While this series was intended to avoid a DDR voting race between the
> GPU TCU and its clients, using ACTIVE_ONLY could have possibly
> introduced a race between CPUSS and the GPU TCU itself.
>
> Thanks for catching this in my reply Bjorn.
>
> ACTIVE_ONLY would have been suitable for system TCU (apps_smmu)
> for which the interconnect field is anyways not needed, but
> unsuitable for GPU TCU.
>
>>
>> To me these two are orthogonal and TAG_ALWAYS is logically correct, but
>> perhaps there's some practical dependency that I'm missing?
>>
>
> We can ignore my acknowledgment [1] on previous response, Dmitry.
> ALWAYS TAG is correct here instead of ACTIVE_ONLY in the interconnect 
> field for adreno SMMU. 


This series seems to help with a really annoying bug on Kodiak phones 
like sm7325-motorola-dubai where often boot would hang when initializing 
the display panel (so it took a few reboots to successfully boot the 
device).

And indeed it only helps with the ALWAYS tag..

I've had this patch applied for a while (without even realizing that it 
fixed that!! thought the issue was gone because of something else) and 
today I went around kodiak.dtsi trying to remove unnecessary ALWAYS 
votes… first boot after changing this tag to ACTIVE_ONLY and boom, hang.


Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai

(for patch 2 i.e. the driver code as well)


Thanks,
~val


