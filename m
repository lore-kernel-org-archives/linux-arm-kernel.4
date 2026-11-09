Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D329A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aAntlaYg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMaCzYPp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y8obxuVM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=; b=aAntlaYgQ4ivAe
	n9GE60MS2NIfp9FBIJTeoJiSJthh7pUenMfBb+fRFFcRsrrEO2iOW48WSJ2GFmqYhdoOZ7JL67WZv
	ZJ1M5CACJoTD53UXQPMG6JYvxbpDs49gVeenEoeF/mOUuZdosoQKe/GVg8d/eJMgSsSxTDCpQH/Or
	iyYuDtxWzlxifx5VApJ99rn+30WzhWPnnIlIS0xD9+ULpsY1D9TyRxce10D0Z2epYbUn4jowGQWtM
	yfmMGdUIQubcSdvRdf4jRgJmG9Jjv4phFdHOeVCXzRfZXq0KBZFUIm+JQP76HQfGwOdTWIlh2iYVj
	FgwpGCJ73X6xWI5rptPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4h-000000007uh-269G;
	Mon, 09 Nov 2026 08:49:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL4a-000000007kw-1HxT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:49:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A1Cx3298157
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 08:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=; b=bMaCzYPpMpNVXf1S
	7+WyzE4sPjnuBFWGjXgoLoNYUX4/ZCOM0/bGHhEMV5LtnMVBVdQx6HrKhVHvmlzw
	Z2wByc0x6DbwTXzLv6rQ9ccMro+maUDqM84e8ejrVeB5DhyalPcKz0Bt2nLLEYl8
	SRXYKtt3ke9X8j05cXPZTpxL3zc0zMwPwiYR0BLZs+g1otL3OljoqSjSUECw09h0
	yMbWhvROjy8KsEhp/qm+o+GO3Cw4yvJybHKymHM4B3rdyR95L4PMyh8PM+ySxmBi
	1djmIdQrsn8lm9tFstmJe31V6XXpaYtg+bFIv8h5OBfuLt95wXTAMuSrg6j2pEnB
	RbG8mA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwkg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:49:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so658985a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214190; x=1794818990; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=;
        b=Y8obxuVMap77wDVs4V057Jpb6W7ZZ4GNlwYtd6cNAXoMg4XTxkhUrVFAFZA6mEDiM0
         yM19Z1qzObaiq1Zmz6Bhwnk7NL2mBM5XE8+obX39BgW5ziVwoXNosTwDrJm5JpUhILLo
         mYuuZ97PALc1qPnePXQvlmlyUjHo92zHy8ZpXucnb7R0s5Zs4IM1AGt0sZz3mNo5lPVl
         yq9Mo4KI2KTY0QomZI0iwcok55ebvteZluXZ+6+to553w6uR9TXGBP+0azABIIcanM6N
         SA153uxXFfo72hTGPBVwcRqF59VPH4OMAXNDx5D8KtE7fPnEonaqhF3ciD6Rwxg3c7/A
         qcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214190; x=1794818990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzfe7s6DAyzNIsq811zwWBT24yMnoqTMkgQnb4HzgjI=;
        b=A9hHuBqB9BmKpOUOjS0qI3+EfhBe4c0tPneSUvu9f31wIyCn8xGoqc17W7l8+XkI5b
         iloPhaVSixDCYmeAxf+/jSMorv5JygeRPd0zlz9aTWd2fBR4UJGDhlxWgVKlSu53jMen
         5phazZf6l1BR/4nTC+eVNmsC2kWnuEVTs61iONzwpYjbcW5Y8P+zRGRTSrdgWvu8jBuy
         F0Zi6yRoVH8hFUkJ2rWcGHLjjgoHbmRbXOuYASqcaQxGCT6iWBSZKVRdhqzqjoWm4HPP
         E02YrTQPQ8/ub73PdyODLapWoWM7WBVN3HO1qyA6omyXK/yIXfMle7DPrECO5DZkbwra
         F2og==
X-Forwarded-Encrypted: i=1; AL+hErFDvZq7bid6RAElmLjfJV/w1f7fucEw6IyluvPVoNdhHWe06KlV1dWpbYxgTSCc8t3W0vhXveMWHwoO4yP/sfoW@lists.infradead.org
X-Gm-Message-State: APuU4Z/Gdlh+fjFvv3xPLnUutKFK15T4jT8ABuP8/ZS0Sh/oYzDCov2n
	m9IO7H4azYb91Ga8c5Fq5S2Gdt5dcOFncuYVrcUL1sfm9kd5Fp/jkGywQtuJJZ+EFuglY5wpesS
	2c93OaRTeXdGXNUs82h8fj3YVjKXH7ME10U7X9qoeqy+CVDlgQyC99L+oEUpPZf+UzKnfMnPmbA
	6X/g==
X-Gm-Gg: AYBFou2qNGdeHGqNhIN8I5F/DW37hI27wZd2tgcfqfTmPhRCzeIk9MALHHXv6cVs/WG
	afBK6K0bBOHYR2EHNgHKtf/7F8hSvdXr6Px6BhhPIM9bd7MBkPGTCVsBqZPUvCrHf39OQXiScaX
	DI1XZeUoxCAgGSVXzNHiiG9MOzkv1ml1N6ELtmBxmQDZYddmrv2vkvVdRS0opX9exMrQ1uYaunE
	jvi8Rx3iaq6joNBtDXfDmizMzt3vikfXJ9zvefrv1TeXQ7jtbhWXWEWR2zR+1ylQ4umPFyhYYOl
	K7XiQ4sfTxoL3kxz+b9OhzXBK9ZKu6aYKVGs4bKTqYPOGbzyXXDWka/nc/0pmJu5qkAtuKNo0Py
	uLxjuy+XMyMdrJcJNG6r7zTiQA9hcqSq/3ujSmo4G6nU6oXyB0yPfuGsN9XSOEKS5+J26ORbNM7
	InbBN6TdQLMxKQOyABABrVTN2Ed2fkt9ttuSwfYFM1sB7u
X-Received: by 2002:a17:90b:1c0d:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b12d3fd6d4mr2346579a91.10.1794214189887;
        Mon, 09 Nov 2026 00:49:49 -0800 (PST)
X-Received: by 2002:a17:90b:1c0d:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b12d3fd6d4mr2346559a91.10.1794214189215;
        Mon, 09 Nov 2026 00:49:49 -0800 (PST)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm10211580a91.2.2026.11.09.00.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:49:48 -0800 (PST)
Message-ID: <26ae8391-2a4e-464b-9ef9-fcd2845f18eb@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:49:37 +0800
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
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <9d450f18-2300-4ead-981b-94bd9eea9126@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX0ErgzRqeSt56
 YSG/ukj7hnzRD+Nqbqz3QG5l3y7x1bybCCanWigecdTYvUxJVuQqCS8J0YqSUSJq1nUhX8Ay4FX
 wyE1tv2lazFBXeZuZDVmSVqKJYtdhTbzyz701nOelxckIvIp2UX+AaeoEm8r5pPs8sGoYTGfW4Z
 idZqWgQojz3SMIJ9JYPioVopNKGjP5kO+Hn87HcmmExDcplRKvNWbZC495zdWRH7O5AnyWl/SDI
 yiBYaGupc/j7sWOnmR2HlUVVwVWREuWt1Yt057Mjtsn6e9CI98PCREzzg4zeuPQx5t7Ge1kINyh
 +ZNAk9pYgwN7WA9FT2NNTLDilNyM5PvtDR+YAztrW0dYpBP2eEmVCzsfJzU0lXJ3uEIaEzbFLol
 /a0CHA2uxBIrXcQJj3fYda6S+2vZTzZ1vM59Y2m70102mQDmvyXpnBraj97PM8yiQWVcNBflRoH
 Ftzc3r2MDkMJOrQaRXg==
X-Proofpoint-ORIG-GUID: qcw1kuGrBso1hqtQtNBlDxm9DS-eZlD8
X-Proofpoint-GUID: qcw1kuGrBso1hqtQtNBlDxm9DS-eZlD8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX9IFe/gTN/2N1
 wh0jXm20pwzMZ8YVfSHVCyy8wURg69EBywpEISmSIWS/9aNvoyNYiy2sq8+dbSzW666O6Q2M1Rt
 ipWnxxO2vg7DBbqwP8PIdx5w5jOHfi0=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af1892f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ghw8QdvxafpMmiwnoqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_004952_511351_1068D4F0 
X-CRM114-Status: GOOD (  25.26  )
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


On 11/5/2026 9:01 PM, Suzuki K Poulose wrote:
> On 30/07/2026 09:07, Songwei Chai wrote:
>> Like circuit of a Logic analyzer, in TGU, the requirement could be
>> configured in each step and the trigger will be created once the
>> requirements are met. Add priority functionality here to sort the
>> signals into different priorities. The signal which is wanted could
>> be configured in each step's priority node, the larger number means
>> the higher priority and the signal with higher priority will be sensed
>> more preferentially.
>>
>> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>>   drivers/hwtracing/qcom/tgu.c                  | 189 +++++++++++++++++-
>>   drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
>>   3 files changed, 328 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu 
>> b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> index 36ab64f1e301..7dd24314592d 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
>> @@ -7,3 +7,10 @@ Description:
>>           Accepts only one of the 2 values -  0 or 1.
>>           0 : disable TGU.
>>           1 : enable TGU.
>> +
>> +What: 
>> /sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
>> +Date:        August 2026
>> +KernelVersion:    7.2
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai 
>> <songwei.chai@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set/Get the sensed signal with specific step and 
>> priority for TGU.
>> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
>> index 9c7dd4a09f02..0e88b437f191 100644
>> --- a/drivers/hwtracing/qcom/tgu.c
>> +++ b/drivers/hwtracing/qcom/tgu.c
>> @@ -15,14 +15,144 @@
>>     #include "tgu.h"
>>   +static int calculate_array_location(struct tgu_drvdata *drvdata,
>> +                    int step_index, int operation_index,
>> +                    int reg_index)
>> +{
>> +    return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
>> +        step_index * (drvdata->num_reg) + reg_index;
>> +}
>> +
>> +static ssize_t tgu_dataset_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +            container_of(attr, struct tgu_attribute, attr);
>> +    int index;
>> +
>> +    index = calculate_array_location(drvdata, tgu_attr->step_index,
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    /*
>> +     * Serialise against tgu_dataset_store() and tgu_enable(), which 
>> read
>> +     * and write the same priority array, so the value is not observed
>> +     * while being updated concurrently.
>> +     */
>> +    guard(mutex)(&drvdata->lock);
>> +
>> +    return sysfs_emit(buf, "0x%x\n",
>> +              drvdata->value_table->priority[index]);
>> +}
>> +
>> +static ssize_t tgu_dataset_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf, size_t size)
>> +{
>> +    struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(attr, struct tgu_attribute, attr);
>> +    unsigned long val;
>> +    int index;
>> +    int ret;
>> +
>> +    ret = kstrtoul(buf, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    guard(mutex)(&tgu_drvdata->lock);
>> +    index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
>> +                     tgu_attr->operation_index,
>> +                     tgu_attr->reg_num);
>> +
>> +    tgu_drvdata->value_table->priority[index] = val;
>> +
>> +    return size;
>> +}
>> +
>> +static umode_t tgu_node_visible(struct kobject *kobject,
>> +                struct attribute *attr,
>> +                int n)
>> +{
>> +    struct device *dev = kobj_to_dev(kobject);
>> +    struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
>> +    struct device_attribute *dev_attr =
>> +        container_of(attr, struct device_attribute, attr);
>> +    struct tgu_attribute *tgu_attr =
>> +        container_of(dev_attr, struct tgu_attribute, attr);
>> +
>> +    if (tgu_attr->step_index >= drvdata->num_step)
>> +        return SYSFS_GROUP_INVISIBLE;
>> +
>> +    if (tgu_attr->reg_num >= drvdata->num_reg)
>> +        return 0;
>> +
>> +    return attr->mode;
>> +}
>> +
>>   static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>>   {
>> +    int i, j, k, index;
>> +
>>       TGU_UNLOCK(drvdata->base);
>> +    for (i = 0; i < drvdata->num_step; i++) {
>> +        for (j = 0; j < MAX_PRIORITY; j++) {
>> +            for (k = 0; k < drvdata->num_reg; k++) {
>> +                index = calculate_array_location(
>> +                            drvdata, i, j, k);
>> +
>> + writel(drvdata->value_table->priority[index],
>> +                    drvdata->base +
>> +                    PRIORITY_REG_STEP(i, j, k));
>> +            }
>> +        }
>> +    }
>>       /* Enable TGU to program the triggers */
>>       writel(1, drvdata->base + TGU_CONTROL);
>>       TGU_LOCK(drvdata->base);
>>   }
>>   +static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
>> +{
>> +    int num_sense_input;
>> +    int num_reg;
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
>> +    num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / 
>> LENGTH_REGISTER;
>> +
>> +    if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
>> +        num_reg++;
>> +
>> +    if (num_reg > TGU_MAX_PRIORITY_REGS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d priority regs, clamping to %d\n",
>> +            num_reg, TGU_MAX_PRIORITY_REGS);
>> +        num_reg = TGU_MAX_PRIORITY_REGS;
>> +    }
>> +
>> +    drvdata->num_reg = num_reg;
>> +}
>> +
>> +static void tgu_set_steps(struct tgu_drvdata *drvdata)
>> +{
>> +    u32 devid;
>> +
>> +    devid = readl(drvdata->base + TGU_DEVID);
>> +
>> +    drvdata->num_step = TGU_DEVID_STEPS(devid);
>> +
>> +    if (drvdata->num_step > TGU_MAX_STEPS) {
>> +        dev_warn(drvdata->dev,
>> +            "DEVID reports %d steps, clamping to %d\n",
>> +            drvdata->num_step, TGU_MAX_STEPS);
>> +        drvdata->num_step = TGU_MAX_STEPS;
>> +    }
>> +}
>
> Why not combine setting the num_step and num_regs in one go ? You are 
> reading the DEVID anyways, and such macro level functional split is
> useless.
confirmed, will update.
>
>
>> +
>>   static void tgu_enable(struct tgu_drvdata *drvdata)
>>   {
>>       tgu_write_all_hw_regs(drvdata);
>> @@ -104,6 +234,38 @@ static const struct attribute_group 
>> tgu_common_grp = {
>>     static const struct attribute_group *tgu_attr_groups[] = {
>>       &tgu_common_grp,
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>> +    PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
>>       NULL,
>>   };
>>   @@ -111,6 +273,8 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>   {
>>       struct device *dev = &adev->dev;
>>       struct tgu_drvdata *drvdata;
>> +    unsigned int *priority;
>> +    size_t priority_size;
>>       int ret;
>>         drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> @@ -128,8 +292,31 @@ static int tgu_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       if (ret)
>>           return ret;
>>   -    drvdata->enabled = false;
>
>> +    tgu_set_reg_number(drvdata);
>> +    tgu_set_steps(drvdata);
>
> As mentioned above, combine both ?

confirmed.


>
>> +
>> +    drvdata->value_table =
>> +        devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
>
> Could we not embed this in the drvdata without dynamic allocation ?

confirmed. The priority and following array will be embedded directly in 
drvdata.


>> +    if (!drvdata->value_table)
>> +        return -ENOMEM;
>>   +    priority_size = MAX_PRIORITY * drvdata->num_reg * 
>> drvdata->num_step;
>> +
>> +    priority = devm_kcalloc(dev, priority_size,
>> +                sizeof(*drvdata->value_table->priority),
>> +                GFP_KERNEL);
>> +    if (!priority)
>> +        return -ENOMEM;
>> +
>> +    drvdata->value_table->priority = priority;
>> +
>> +    drvdata->enabled = false;
>> +    /*
>> +     * Create the sysfs groups only after the backing storage is fully
>> +     * allocated, otherwise userspace could open a priority 
>> attribute and
>> +     * have tgu_dataset_show() dereference an uninitialised 
>> value_table.
>> +     * This also keeps the error paths above free of sysfs teardown.
>> +     */
>>       ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>>       if (ret) {
>>           dev_err(dev, "failed to create sysfs groups: %d\n", ret);
>> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
>> index ebba49402a20..7a3e1161c4cf 100644
>> --- a/drivers/hwtracing/qcom/tgu.h
>> +++ b/drivers/hwtracing/qcom/tgu.h
>> @@ -6,10 +6,137 @@
>>   #ifndef _QCOM_TGU_H
>>   #define _QCOM_TGU_H
>>   +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +
>>   /* Register addresses */
>>   #define TGU_CONTROL        0x0000
>>   #define TGU_LAR        0xfb0
>>   #define TGU_UNLOCK_OFFSET    0xc5acce55
>> +#define TGU_DEVID        0xfc8
>> +
>> +#define TGU_DEVID_SENSE_INPUT(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(17, 10), devid_val))
>> +#define TGU_DEVID_STEPS(devid_val) \
>> +    ((int)FIELD_GET(GENMASK(6, 3), devid_val))
>> +#define TGU_BITS_PER_SIGNAL 4
>> +#define LENGTH_REGISTER 32
>> +
>> +/*
>> + *  TGU configuration space                              Step 
>> configuration
>> + *  offset table                                         space layout
>> + * x-------------------------x$ x-------------x$
>> + * |                         |$ |             |$
>> + * |                         |                           | reserve   |$
>> + * |                         | |             |$
>> + * |coresight management     | |-------------|base+n*0x1D8+0x1F4$
>> + * |     registers           |                     |---> 
>> |priority[3]  |$
>> + * |                         |                     | 
>> |-------------|base+n*0x1D8+0x194$
>> + * |                         |                     | |priority[2]  |$
>> + * |-------------------------|                     | 
>> |-------------|base+n*0x1D8+0x134$
>> + * |                         |                     | |priority[1]  |$
>> + * |         step[7]         |                     | 
>> |-------------|base+n*0x1D8+0xD4$
>> + * |-------------------------|->base+0x40+7*0x1D8  | |priority[0]  |$
>> + * |                         |                     | 
>> |-------------|base+n*0x1D8+0x74$
>> + * |         ...             |                     |     | 
>> condition  |$
>> + * |                         |                     |     | select    |$
>> + * |-------------------------|->base+0x40+1*0x1D8  | 
>> |-------------|base+n*0x1D8+0x60$
>
> minor nit:                       ^^^
> s/base+0x40+1*0x1D8/step[0] + 0x1D8 and so on, for the above

confirmed.


>
>> + * | |                     |     |  condition  |$
>> + * |         step[0]         |-------------------->      | decode    |$
>> + * |-------------------------|-> base+0x40 
>> |-------------|base+n*0x1D8+0x50$
>> + * |                         | |             |$
>> + * | Control and status space| |Timer/Counter|$
>> + * |        space            | |             |$
>> + * x-------------------------x->base x-------------x base+n*0x1D8+0x40$
>
> Also for each frame, you don't have to describe "base+n*..." that makes
> it unnecessarily crowded and complicated to read.

confirmed.


>
>> + *
>> + */
>> +#define STEP_OFFSET 0x1D8
>> +#define PRIORITY_START_OFFSET 0x0074
>> +#define PRIORITY_OFFSET 0x60
>
> From the diagram, it is CONDITION_SELECT ? Having two offsets named 
> after PRIORITY is confusing.
confirmed.

Renamed |PRIORITY_OFFSET| (|0x60|) to |PRIORITY_STRIDE| to avoid confusion.

>
>
>> +#define REG_OFFSET 0x4
>> +
>> +/*
>> + * Upper bounds on the DEVID/DEVID2-derived per-region counts. The 
>> TGU register
>> + * layout is fixed by the offset macros above and mirrored by the 
>> static sysfs
>> + * attribute tables in tgu.c, so these are the largest counts the 
>> driver can
>> + * both address within the mapped window and expose to userspace:
>> + *
>> + *   TGU_MAX_STEPS            static tables define step0..step7
>> + *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
>
> What are these ? PRIORITY regs is 0-3 ? Do you mean each priority has 
> 0-17 registers ? (See, the description using base+n*.. for the "step" 
> frame is making this worse). You may move it down as a separate figure.
>
> From my maths:
> For pritority[0] -> 0xD4-0x74 = 0x60 => 0x18 => 24 registers! not 18!
>
> What am I missing ?

You're right. I mistakenly treated the hexadecimal value as decimal.

Sorry about that. I'll fix it in the next revision.

>
>
>> + *
>> + * A device whose DEVID reports counts above these bounds is 
>> clamped, so writes
>> + * never fall outside the ioremap()'d window or spill into an 
>> adjacent region.
>> + */
>> +
>> +#define TGU_MAX_STEPS                  8
>> +#define TGU_MAX_PRIORITY_REGS          18
>> +
>> +/* Calculate compare step addresses */
>> +#define PRIORITY_REG_STEP(step, priority, reg)\
>> +    (PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>> +     REG_OFFSET * reg + STEP_OFFSET * step)
>> +
>> +#define tgu_dataset_rw(name, step_index, type, 
>> reg_num)                  \
>> +    (&((struct tgu_attribute[]){ {                                   \
>> +        __ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
>> + step_index,                                              \
>> + type,                                                    \
>> + reg_num,                                                 \
>> +    } })[0].attr.attr)
>> +
>> +#define STEP_PRIORITY(step_index, reg_num, 
>> priority)                     \
>> +    tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>> +            reg_num)
>> +
>> +#define STEP_PRIORITY_LIST(step_index, priority) \
>> +    {STEP_PRIORITY(step_index, 0, priority), \
>> +     STEP_PRIORITY(step_index, 1, priority),  \
>> +     STEP_PRIORITY(step_index, 2, priority),     \
>> +     STEP_PRIORITY(step_index, 3, priority),  \
>> +     STEP_PRIORITY(step_index, 4, priority),  \
>> +     STEP_PRIORITY(step_index, 5, priority),  \
>> +     STEP_PRIORITY(step_index, 6, priority),  \
>> +     STEP_PRIORITY(step_index, 7, priority),  \
>> +     STEP_PRIORITY(step_index, 8, priority),  \
>> +     STEP_PRIORITY(step_index, 9, priority),  \
>> +     STEP_PRIORITY(step_index, 10, priority), \
>> +     STEP_PRIORITY(step_index, 11, priority), \
>> +     STEP_PRIORITY(step_index, 12, priority), \
>> +     STEP_PRIORITY(step_index, 13, priority), \
>> +     STEP_PRIORITY(step_index, 14, priority), \
>> +     STEP_PRIORITY(step_index, 15, priority), \
>> +     STEP_PRIORITY(step_index, 16, priority), \
>> +     STEP_PRIORITY(step_index, 17, priority), \
>> +     NULL                   \
>> +    }
>> +
>> +#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>> +    (&(const struct attribute_group){\
>> +        .attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, 
>> priority),\
>> +        .is_visible = tgu_node_visible,\
>> +        .name = "step" #step "_priority" #priority \
>> +    })
>
> Please could you move these macro magic to the .c file ?
> 1. Nobody else reuses them ?
> 2. It is really difficult to go back and forth to check what each 
> macro means, given how complex it is.
>
Confirmed.
>> +
>> +enum operation_index {
>
> why are we calling it operation_index ?

It is called |operation_index| because it is not limited to priority 
indices.

Other operations, such as |TGU_CONDITION_DECODE|, will be introduced in 
following patches and represented by the same enum.

>
>> +    TGU_PRIORITY0,
>> +    TGU_PRIORITY1,
>> +    TGU_PRIORITY2,
>> +    TGU_PRIORITY3,
>> +};
>> +
>> +/* Maximum priority that TGU supports */
>> +#define MAX_PRIORITY 4
>> +
>> +struct tgu_attribute {
>> +    struct device_attribute attr;
>> +    u32 step_index;
>> +    enum operation_index operation_index;
>
> u8 priority ?
confirmed.
>
>> +    u32 reg_num;
>
> u8 reg_num ?
confirmed.
>
>> +};
>> +
>> +struct value_table {
>> +    unsigned int *priority;
>> +};
>>     static inline void TGU_LOCK(void __iomem *addr)
>>   {
>> @@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>>    * @lock: Mutex serialising enable/disable and the associated PM 
>> runtime
>>    *        reference counting against concurrent sysfs access
>>    * @enabled: Flag indicating whether the TGU device is enabled
>> + * @value_table: Store given value based on relevant parameters
>> + * @num_reg: Maximum number of registers
>> + * @num_step: Maximum step size
>>    *
>>    * This structure defines the data associated with a TGU device,
>>    * including its base address, device pointer, the lock serialising
>> @@ -46,6 +176,9 @@ struct tgu_drvdata {
>>       struct device *dev;
>>       struct mutex lock;
>>       bool enabled;
>> +    struct value_table *value_table;
>
> Why this ? why not
>
>     struct value_table value_table ?
>
> Surely, we seem to be dynamically allocating the priorities etc from 
> there. But do we need dynamic allocation for value_table field as
> such ?

I'll use a statically allocated array here.

With the existing compile-time limits, the maximum size is 8 * 4 * 24 = 
768 |unsigned int|s, or about 3 KB.

I think this small and bounded memory overhead is a reasonable trade-off 
for simplifying the implementation and avoiding dynamic allocation, 
extra indirection, and the associated |-ENOMEM| handling.

>
> Suzuki
>
>> +    int num_reg;
>> +    int num_step;
>>   };
>>     #endif
>

