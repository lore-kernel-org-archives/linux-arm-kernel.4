Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DeVixUu8;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXlxouF5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XIXUacG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=; b=DeVixUu84d3neY
	thFImcDOekE6ClBCkoFb5v6fghoaJQwkliFUlpTQodSpq/pjnKHB8ORYSwj3pMvZQ0//kzmxaaj5w
	t4Fyk7qo3IzBDJI9EfSR++zqRdtJVbZiKKZNvCR3W+AxQ92kcjqGSShkRKKgqJ15QJLC5G7tOuJV2
	B+KJfZ7mz9GU8W7rRYdOiA7Yd0TM8QyWWvaSmb6fZ3RxRu+ziTsoDDmUF4+UABLGyOlz9eLObmsX+
	X4mjDkdXehPpmuSFRCO9xo7poChjffffjQ1GwTbz2kiwTDHNtvkUK5jRkUFVocoe/ySlpZp/WB5vB
	DVAatKopvtDlCIlfV81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMQQ-00000000NtB-2Dm2;
	Mon, 09 Nov 2026 10:16:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMQO-00000000Nsq-0110
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:16:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usJN4131031
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=; b=NXlxouF5IGxXoiTH
	50V/SYfTdmP9WAzj9hMz/9CSK4E4ap82vuPHkP9piINQ4H3a1nqz+CbsHHDFLzLT
	Vj6Ssz8yD3PBfHyxlsZ6h8vph/HcfeyShlFjCHe/zkhot77Egxv+s+vFx9Y9krhA
	zAYG+PlDmvRbcLIU2pV1IE6r6/BJdzQsc5kMc1fj5Ruz8OtUum6Rp3Gqr1/bzGZD
	0AeDJH6dDUXcY4u/t6arryEtou0wcn0JRlt+CHSYyw1Oj/RVvvK6LHMq17nrWFUb
	6q0EYpzwtv4D3fmS0bms7doswiGzPJLTKj0swbyIRxJpgSx2TyMTI51kqHW1bvbU
	wS0TBA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h6x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:16:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so693282a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219386; x=1794824186; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=;
        b=XIXUacG5xTuoA0bPirpFwGIhb2m9vtgvLysMWgK3bE9551GNyw5ObAH8t1ulR4qO0I
         2jgdrKealcSnkGwKTgvcHX/aDDd+oqMTSjolxYVLA2fz1R2is+zTQJCvj1u82YebL8b1
         siUqWiv1kT6mXKY/QWp4KV65tiIGKMN6sVSx+KKrSC2oKt1xkbNN7cIgBMyeB89lXmup
         WXnqXW2+2uTJAuPslPRzbLh6YAQB4CxYhevAizwtUPutxo/6IAdh4OwkJCsUjqVlvqjN
         ceLk+7baKkHNPwkX2v+Gtkleab2KQS0trfIwutVzNscUYpxZ/y76VJkkp8aRBL01ViIW
         Jj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219386; x=1794824186;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sU6Tteo7EgsZGvRvlD7HYXLZDGynQ8f3jIkOaXQPzOg=;
        b=oEU4UggQRprrNcWYbJi5ekp1u8DqWTZDbGYVFSjB2z38ztZXZNqKUP6EkgFO8rp85p
         yBfOL1kfmBnp3UAhRctGDpGIaVLcuWrv+ijFo29pfAEcldEaGcwPFNWgA00Czj30uPKY
         810UEUDF2qJPO9iuCjrJqVpg9dOsdCpkE2X0QqvJJAWAxVE8f479EqylHK+CYWuKTTYU
         Q7B2lTauSdAdNkr/nYrIXPC9vu83vutHmHl4XvpRtyhXKQiADM+TlHunBKXjtmAurBde
         dl+F0YYzqY8HwQ+GucRJjm2v7vNYeD4+rsFKq8uSNXcbwLXFaLM0+zGytwggrWARpIE5
         5KXw==
X-Forwarded-Encrypted: i=1; AL+hErEu1qlOQ+jx0pmJ0lQvDiS/C+QTraqmR21CKTf0ec26HWhFTvcRj1QEEAuzjQZGRwlSMmHyvpOqD7o+I+439kK1@lists.infradead.org
X-Gm-Message-State: APuU4Z/JwpzhetsgxQ5VpR/bHEclA3j8y8neY+Ouh5Wj3wvrhucqT/aU
	V/HBzAl3+XM4kzAlwXit+0whpaAH22S80PED58grJJPcoQyNlNDEUTZ+D6iHs0MSOxur+oVH5IL
	eZ5kM91GkM2JWcPzL9JzlBwPxUj1F4hJ6TKYq53kfGQyoajjs13xtXh/B79wCArXLPGq/oWjJYi
	j61w==
X-Gm-Gg: AYBFou1ky52tB6fyvKjQhybCn46IrnxrZnrFPX9we88Dj+438X2Yrb7iu7S61nmFckJ
	hFI25JqrKkjYrTd0565jDDUYSQXYGsCfcWzO3FreywwooyXoPJe0fvYKM8hIW8piEqgQ8riEvob
	78WpWQSrMGDf74YLejRMG0uwt7hXQuOAhnXEnx0Zzm3UqidMlAFQcsMA514xQebLaUSYOqcE7J/
	ShuveXUlv+9Z+5uQhZyzmsC7jKuAVG7y83P32sXcXAZGYbThJMLvLDYpK4qmxtqp4gfzj3yzjUv
	EgpZdolaRasZL5aPp/sbZpytFzA9jpUJMKpPfCs8azDNK9Z+jpixw3QMPYZsJ+jwnGNbwAD1xxs
	Ii1MBC0abHEJLCSvKaTECuoIjVSCKWEt8MTBwOZO7DoUqp2cvz5ee3UhoZcFLmQzQvAXiw9RodU
	/3u0VPeyFLOqdUJUdgRLDL5JW/XB37KcrN7r/Jb30K1lM=
X-Received: by 2002:a17:90b:55cf:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3b12d582e7cmr3322427a91.57.1794219385857;
        Mon, 09 Nov 2026 02:16:25 -0800 (PST)
X-Received: by 2002:a17:90b:55cf:b0:3ac:8897:7b92 with SMTP id 98e67ed59e1d1-3b12d582e7cmr3322403a91.57.1794219385318;
        Mon, 09 Nov 2026 02:16:25 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105904951sm10442480a91.16.2026.11.09.02.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:16:24 -0800 (PST)
Message-ID: <093f7cda-c6ef-43ab-bf79-8200a40bbc7f@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 18:16:15 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/7] qcom-tgu: Add signal priority support
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
 <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
 <f1e4f462-2aba-470d-84e4-87a12c2a13d3@arm.com>
 <75364e56-62d3-4d3f-bf79-03ddeaee1121@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <75364e56-62d3-4d3f-bf79-03ddeaee1121@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af19d7a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=600ImXwT8V8y3K12yXwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX7/G47WLcw1D9
 dW9C9fxgMWBLU3uEEGXmkojHrmYjgWgDbeqXkQYQW6qS89yrJuTjUwZ0BnMAIVkYGjDy46mgPZU
 DHP53dEfz/AOEiWRR9eBCx5izLPbAI2qu4cb+1iFjP3lQi/5kXhwdXWDY11wZJxoJ8f2C0+xMOu
 4L+eucOUeUnAgIMQEL0aTGGDiFXzNPobAbiFZdKeWAyJCYOsGLuucf3XauL+2BP5ol2+K+euHrN
 zS+h3bX5o8hO0RzZ7gym8050IHPdceiWJQvHe268rnWGoqEcjADQfJ1ZgI7NYffdxD2WW3gv0FY
 LYHl5CfkUZdNIZXZDv9oAMJAsLSMWtgtS+SSGBj7ywEmCg1UaGdUptkBJo7JsY27Ltm2LMRs4gu
 brhY6kGRfxDcfZ4UaKWRcOPxSGFxm2g4gPUOyhCZr7srdu3d3UiFYaCUgyOo6XCcZ9RA3Cg8kPc
 EoXzoCcliFgmGiYCdWQ==
X-Proofpoint-GUID: EEHXFAicbEdpcPo4y6izNhKMKUgfGg3b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0OBoGH0Tm9Cq
 QUnsOpGr1ir8EnNyJMuunFMiK2A/4Em+tpaYyrzRN2sYAKJmuSd/i8UfPVEnwmcdFL7gvdSBrQf
 vpUr2iDgwVA5ZBd3ulz9p3b6W6fjXT0=
X-Proofpoint-ORIG-GUID: EEHXFAicbEdpcPo4y6izNhKMKUgfGg3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_021628_188473_35459A54 
X-CRM114-Status: GOOD (  26.64  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/5/2026 10:32 PM, Suzuki K Poulose wrote:
>
>
> On 05/11/2026 14:14, Suzuki K Poulose wrote:
>>
>> On 05/11/2026 13:01, Suzuki K Poulose wrote:
>>> On 30/07/2026 09:07, Songwei Chai wrote:
>>>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>>>> configured in each step and the trigger will be created once the
>>>> requirements are met. Add priority functionality here to sort the
>>>> signals into different priorities. The signal which is wanted could
>>>> be configured in each step's priority node, the larger number means
>>>> the higher priority and the signal with higher priority will be sensed
>>>> more preferentially.
>>>>
>>>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>>>> ---
>>>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>>>   drivers/hwtracing/qcom/tgu.c                  | 189 
>>>> +++++++++++++++++-
>>>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>>>> b/ Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>>> index 36ab64f1e301..7dd24314592d 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>>>> @@ -7,3 +7,10 @@ Description:
>>>>           Accepts only one of the 2 values -  0 or 1.
>>>>           0 : disable TGU.
>>>>           1 : enable TGU.
>>>> +
>>>> +What:        /sys/bus/amba/devices/<tgu-name>/ 
>>>> step[0:7]_priority[0:3]/reg[0:17]
>>>> +Date:        August 2026
>>>> +KernelVersion:    7.2
>>>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei 
>>>> Chai <songwei.chai@oss.qualcomm.com>
>>>> +Description:
>>>> +        (RW) Set/Get the sensed signal with specific step and 
>>>> priority for TGU.
>>>> diff --git a/drivers/hwtracing/qcom/tgu.c 
>>>> b/drivers/hwtracing/qcom/tgu.c
>>>> index 9c7dd4a09f02..0e88b437f191 100644
>>>> --- a/drivers/hwtracing/qcom/tgu.c
>>>> +++ b/drivers/hwtracing/qcom/tgu.c
>>>> @@ -15,14 +15,144 @@
>>>>   #include "tgu.h"
>>>> +static int calculate_array_location(struct tgu_drvdata *drvdata,
>>>> +                    int step_index, int operation_index,
>>>> +                    int reg_index)
>>>> +{
>
>>>> +    return operation_index * (drvdata->num_step) * 
>>>> (drvdata->num_reg) +
>>>> +        step_index * (drvdata->num_reg) + reg_index;
>
> I am confused by this, probably amplified by the bad naming of num_step,
> num_reg ?
>
> I perceive num_step => numbe of steps in the hardware
>
> num_reg => number of registers (or controls) in a given priority field ?

yes, correct.


> If that is the case, shouldn't the index be :
>
> step_index *  (drvdata->num_step) * (drvdata->num_reg) +
> op_index * (drvdata->num_reg) + reg_index ?

It can be thought of as a flattened three-dimensional array, with the 
three dimensions representing which priority, which step, and which 
register, respectively.

Hope this helps clarify the layout and the indexing logic.

>
> ...
>
>>>> +
>>>> +struct value_table {
>>>> +    unsigned int *priority;
>>>> +};
>>>>   static inline void TGU_LOCK(void __iomem *addr)
>>>>   {
>>>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>>>    * @lock: Mutex serialising enable/disable and the associated PM 
>>>> runtime
>>>>    *        reference counting against concurrent sysfs access
>>>>    * @enabled: Flag indicating whether the TGU device is enabled
>>>> + * @value_table: Store given value based on relevant parameters
>>>> + * @num_reg: Maximum number of registers
>
> Where ? in a priority ? in a step ? Why is this maximum ? Isn't it the
> number of "registers implemented on this hardware"
In a priority,

The comment will be updated to clarify this.

>
>>>> + * @num_step: Maximum step size
>
> Number of steps ? not step size ?
It should be "Number of steps implemented", will correct it.
>
> Suzuki
>>>>    *
>>>>    * This structure defines the data associated with a TGU device,
>>>>    * including its base address, device pointer, the lock serialising
>>>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>>>       struct device *dev;
>>>>       struct mutex lock;
>>>>       bool enabled;
>>>> +    struct value_table *value_table;
>>>
>>> Why this ? why not
>>>
>>>      struct value_table value_table ?
>>>
>>> Surely, we seem to be dynamically allocating the priorities etc from 
>>> there. But do we need dynamic allocation for value_table field as
>>> such ?
>>>
>>> Suzuki
>>>
>>>> +    int num_reg;
>>>> +    int num_step;
>>>>   };
>>>>   #endif
>>>
>>
>

