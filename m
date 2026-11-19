Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C735606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4a6+wUF0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kZ8wpik8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7XEKogt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=; b=4a6+wUF0NK+lAO
	mj55xyzVXc/SXZ4cJn+xmC+cas3sdysNU6vB0Mvxhf3vAj0uMSGY0ywIhxOOPPqh6GCgbl8Wn46T3
	7zaQX57qqT0Hc35UX2GdYBxj+y/eUa3+dVtQ0MbFI3V0S4i+KV1o+g64henLXqmas3yOK2yyVF+mj
	l0xlewYa8jZSkChCpysUoDte5HSBMWv1JPCRsUVSk0wmOMtbCeQZGY4wbmMgEe/EsCxTV4QeYPJti
	THqnbuSSzgAPx8YPXFXrxouN87YhCxQXmuwQA8PRRV5WGy+OblzIGz00jGYeuQvUpOPbfB849TsO5
	+dCSSuqYykhdPDBDkTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrNt-0000000AfCC-3lrT;
	Thu, 19 Nov 2026 01:56:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrNs-0000000AfBq-0RmS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:56:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1UfG6854863
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=; b=kZ8wpik8onPn1ay1
	52A6TCbS4W9+XlkiWdsPyfWSuxJj7taFv8LgkonOq98O4rWuoWz8Nskywf0+CrLg
	VejOGf2iQOhf8gpjiN6XJftitR2ZrrugxNA17yYMxnLojAVEVwHXMJBkO0+MH5ro
	0pZuwOchR2ycYmJ8u4TQNOzZISdcIHpP9wsWsb5FDiQXlfgjKEmc/njxQw2hZ+OG
	3xbES7Gy2pWxFPzN9uqTRq3PZQng1/S8NNlcw1wfeWa0yWhg1ybGsPHm876t8+VA
	usTu90r5khXpIGMcXXzsbZJJB3KdGv18wZMzHrQq3LQ8IlePiy5SCzC3c71HzcMv
	1jn17w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg29rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:56:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb96533adfso1098388a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795053378; x=1795658178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
        b=R7XEKogtlxAiGVjfbOm85DQpGrD4re0Dadw1rSZATfNU90pHbNa54MfBKzjv2wFpLj
         G+On07UQDIa8D0gPDZ3T5ZxwkhU2+9Cu9rEn0l9gJUMzm51ko9tEqKF5g+Dtaq64bCAL
         nVsbDUtm7EzwbcselcH4toLDeTlASogBjls7kXOHA1uUI3+STuvtRsTPOKAHXeCFdLOZ
         txh9J5s3TtEn1UHiFrnTwOlfeUEA0LDmGmLWlP+H3iWAo/LFZajyz4Iq+W6HJ+/5h945
         ZLgodtp+T0R4Le0YdHupbMbgh6HLQ9g37FCUYdw0o8R9tZOJJtKeAwGSye8jIsSgZv/s
         /8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053378; x=1795658178;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yl2h4k/xuVYhrOAOG9IZzB/HdGSXRVoh8NW9NbiJQUg=;
        b=okFzhNsYxy8uftIOj1W9+K1/0BTPm7h82PKsrVMExxisOQtBlC3KIc1hNNbP81ZUhS
         91Xy0at2PiZcmUtvkcx6RNCBlErES3oVU0rP0NuWWeZeKwkxI9Uqgx9tSRYyUZg8Q+R+
         G9wdk6Rr5jnWczXlGseHU6QKPCzxGRFkRLgXpj4bLATSGDhpKiONR+SDVVR+xL6eq+gh
         yPS8A0nNe7MByCRM+7K0FkpKDsc5y7oy2+1syBn5eEIuavoclTXmo83AmbKkYQvmzvkV
         rLU3QhkPUfBHorpL0B3PRbngY1qoGcrpSPuLTdzbpxSq6MXTW4ibHr3I/B9l5heUu5Gj
         FSog==
X-Forwarded-Encrypted: i=1; AL+hErELDlTi9vw0IjVeM6lam1luf0z5R19EfGq08jQ5QbpsmcC26vYHqm2VB13O3UKhRh4/m25fFqJzhOJgO2F5Nw3q@lists.infradead.org
X-Gm-Message-State: APuU4Z+H/qpWZltHmN2jDIRGG8pEf5CMuFChOfG+aMVrO3tTwxsFCiAF
	h6m+YZTcW6cGk3CUNbv6ZftPQHlGOCMSPyK4BjCKpV1SPk3Q5NZYfm0WfXoUJixikDV7hcef00w
	igSZeSsXlYG/amlkbEBvxwS8JdP7edSTThP8qVs82CYXiymsniwNZ/L701j+BHs3zFsKugFcc8i
	6M8A==
X-Gm-Gg: AYBFou04y5pvee/to73rcO2iFUHrL3dgiot5M1SR/xR2/pcyt5lYrva3Vu253dA8pmm
	MrQhgqGbjPfGV3SnoUh8L1oIV1vqCBqfZuU5My//RGlpX3pKkUPodVTnfTbw/IuWRu/CsnMZIIu
	ayIi9MIeVonNK7UXaDlqkSsXk0iNqO7u8e886i7/0S4Hyec0RU4rdJGDdkq6EeZwCPasArNL6Y8
	k/aNmoI2PIstQkzWAbzUECnkbWaJwa2ZKI6vt3cQy91Jp72q1FrAGgu/k4HEFRMQsRUEA7tV2Lf
	Ya3pbkVRWrx2LlsXZmQ5N9T7fSNoJ7saa0+V1j2PqpB9rUJnZbqQLalwL49HiH/z2cXZ2pT0JG5
	VDI1pr2/alNzDVCNBRo7c4wN2LEJ3Wa2esUPvwfJdpki5xpLhKE7oE6KCEwP3qrGjtS3MEXBBYx
	4yCvxM7lhYTRdIc5GLklPqWwMjssp8myt3qAj4
X-Received: by 2002:a17:903:3bd0:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2eff72f018cmr37060825ad.21.1795053377880;
        Wed, 18 Nov 2026 17:56:17 -0800 (PST)
X-Received: by 2002:a17:903:3bd0:b0:2ed:146c:cbba with SMTP id d9443c01a7336-2eff72f018cmr37060565ad.21.1795053377401;
        Wed, 18 Nov 2026 17:56:17 -0800 (PST)
Received: from [10.133.33.89] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm21473375ad.17.2026.11.18.17.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:56:16 -0800 (PST)
Message-ID: <d94a7c66-9dba-4513-9776-2aade1e74709@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 09:55:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-3-67fd9db6bc0e@oss.qualcomm.com>
 <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <878eabf1-0742-45ad-892a-4c6a7b615d1f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CCmVxP5_GT17fEvN6BGghXNFhx-I7HtN
X-Proofpoint-ORIG-GUID: CCmVxP5_GT17fEvN6BGghXNFhx-I7HtN
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe5742 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EU-12QLy5lNSyVwEbFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwNyBTYWx0ZWRfX9HFgcsTkvmzU
 NTRBzCkrnbbXnSUdYYWqvX1NTU0Ic9UP0ux6HDauK+vZ+FEmtks4miiqO8FfvmBTq3HeaTK5/aA
 mGVUKICW7KNzuIo4+vySHNYlBUT+/Jk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwNyBTYWx0ZWRfXyCCCSi7ZGxq7
 zEdJpNflS6xzNMG0Rhp+CkuPye3rvIa70VH6IbTP1MunBVyBPexc64f/LjbIhJVyx3yjpSYoQ//
 UdB1ZeQrTmNB4SJj50CMvTPbPJpB7vLPXS0vOyLiAcS+Ra7yIJI1XGvxjV3mUKow/OCk95ZeyNK
 f+ZidsDo+7zfTFE7i/ooysXWTjDy1+LQaMCSPMVp7jM3xPpWygBUEsFDth0dWIy9FI9H/KfApkO
 vFa1QjHVGyBnAju9kJQnrIpek0zFR682DcPGNLJzPsGH2Ac8+yrErjMq2oxKJLldhGayvGxiFY7
 fodwJnErhtslUl5L8Vs+RM1PS9WAyFYdtSrCWSMR3r92LuY0QmuBekxCDi+PXHOxLhTRlsCh4sC
 vlviPnIRbpC+trwYW8PnBC1Hvbeh17HmvWwGl5ufkMpnoxa4g0T37/k4UIkw57YkmMWeKZSaoff
 5nYx7ckhFHBCAkFw7Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_175620_263459_214E8396 
X-CRM114-Status: GOOD (  28.68  )
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



On 11/18/2026 7:33 PM, Suzuki K Poulose wrote:
> On 18/11/2026 08:02, Jie Gan wrote:
>> Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
>> etr_buf_list without disabling the sink. It returns the node of the
>> switched out etr_buf, so its synced data can be read while the ETR keeps
>> tracing into the new one.
>>
>> Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
>> done in one critical section. Otherwise tmc_disable_etr_sink() can run
>> in between and leave drvdata->etr_buf out of sync with the hardware.
>> Provide the sequence as a TMC helper, so callers don't need to know
>> about the locking of the ETR state.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index e9213f456834..5032f5598e15 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct 
>> tmc_drvdata *drvdata)
>>   }
>> +static void tmc_etr_reset_sysfs_buf(struct tmc_drvdata *drvdata)
>> +{
>> +    u32 sts;
>> +
>> +    CS_UNLOCK(drvdata->base);
>> +    tmc_write_rrp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    tmc_write_rwp(drvdata, drvdata->sysfs_buf->hwaddr);
>> +    sts = readl_relaxed(drvdata->base + TMC_STS) & ~TMC_STS_FULL;
>> +    writel_relaxed(sts, drvdata->base + TMC_STS);
> 
> see below
> 
> 
> 
> 
>> +    CS_LOCK(drvdata->base);
>> +}
>> +
>> +/**
>> + * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the 
>> etr_buf_list.
>> + * @drvdata:    drvdata of the TMC device.
>> + *
>> + * Stop the ETR, hand over the current buffer for reading, switch to 
>> a free
>> + * buffer and restart the ETR. All of this is done with @drvdata- 
>> >spinlock held,
>> + * so it can't race with the sink disable path.
>> + *
>> + * Return: the node of the switched out buffer, or NULL if the sink 
>> isn't in
>> + * sysfs mode or there is no free buffer. The ETR is left untouched 
>> in both
>> + * cases.
>> + */
>> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata 
>> *drvdata)
>> +{
>> +    struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +    if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
>> +        goto out;
>> +
>> +    list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
>> +        if (nd->sysfs_buf == drvdata->sysfs_buf)
>> +            curr_node = nd;
>> +        else if (!picked_node && nd->is_free && !nd->reading)
>> +            picked_node = nd;
>> +    }
>> +
>> +    if (!curr_node || !picked_node) {
>> +        curr_node = NULL;
>> +        goto out;
>> +    }
>> +
>> +    __tmc_etr_disable_hw(drvdata);
>> +
>> +    /* The switched out buffer is free again once it has been read */
>> +    curr_node->is_free = true;
>> +    curr_node->pos = 0;
>> +    curr_node->reading = true;
>> +    picked_node->is_free = false;
>> +    drvdata->sysfs_buf = picked_node->sysfs_buf;
>> +    drvdata->etr_buf = picked_node->sysfs_buf;
>> +
>> +    tmc_etr_reset_sysfs_buf(drvdata);
> 
> Why are we doing this, when the following __tmc_etr_enable_hw() already 
> does the right thing ?
> 

Sorry I missed the part.

SoC-600 supports save-restore, so the __tmc_etr_enable_hw will program 
the registers properly.

SoC-400 doesnt support save-restore, driver doesnt need reset the pointers.

Everything already done properly when the driver re-start the ETR.

Thanks,
Jie

> Suzuki
> 
> 
>> +    if (__tmc_etr_enable_hw(drvdata))
>> +        dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
>> +out:
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +
>> +    return curr_node;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
>> +
>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>>       __tmc_etr_disable_hw(drvdata);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 7c604b9f92e5..30b15c38b080 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -212,12 +212,15 @@ struct tmc_resrv_buf {
>>    * struct etr_buf_node - node of the etr_buf_list
>>    * @sysfs_buf:    Allocated sysfs_buf.
>>    * @is_free:    Indicates whether the buffer is free to choose.
>> + * @reading:    Indicates the buffer attached to the node is being 
>> read by
>> + *        the user.
>>    * @pos:    Offset to the start of the buffer.
>>    * @link:    list_head of the node.
>>    */
>>   struct etr_buf_node {
>>       struct etr_buf        *sysfs_buf;
>>       bool            is_free;
>> +    bool            reading;
>>       loff_t            pos;
>>       struct list_head    link;
>>   };
>> @@ -465,5 +468,6 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>   extern const struct attribute_group coresight_etr_group;
>>   void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>>   int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int 
>> num_nodes);
>> +struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata 
>> *drvdata);
>>   #endif
>>
> 


