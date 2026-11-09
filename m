Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCF1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k/E3XgJe;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ackz3tAf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3Wv9QWz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=; b=k/E3XgJene5SJB
	KKRFG1wD/IeGDXIL818M8Q1pTtt7KG6hfp8PFFYMz4mlIh+7yNGLk8f3XOgF/5m+NDk6iWHskPb2F
	rN4aP/2/15elhqflXYCC2+tnqK3EP7KDkVTAkCh3CfPGkARagOYCVgH48SDbUDZ37FinqfrrUB7cC
	BcdEi0G9J8Ftoo8IFzlXTj0oorpkdDly/rLUf+O76P/xcXTpVOx/Y2dNt0XDjc9mLRK83ArBbkm9i
	M1lYH2xTKlyDIBks75e//PUL2afBIrO69GLP9pBx31c3GuyZQErnIiBLB4YyJsLV2UXow2HnmQBat
	9NZro+47vVeL27yba9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEBu-0000000H3C5-4AkO;
	Mon, 09 Nov 2026 01:28:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQEBq-0000000H3An-0R1D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 01:28:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H0jU3503098
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 01:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=; b=ackz3tAfiM4/zl87
	Ld39IzD1AEbuHDgxufhcnw5RwBF3Pg+jB5yWwfsXb84NTi2ocAyIk0DUX8NPcPIu
	APsg+ms/uoswnDvy321Hq0xgxGR/jQSxWd7XrI6JbLrgNqZO7WqdUKUxgXtuSLus
	HSjMSqFjy8S+DpFV4zuJUV+hz0fS8awXt4sUZotS/Icgpfl+teG7mqJVTjHPur/y
	YQ4387WrpIz23vZNFv/fb4WSWhfe/7cyDG/lCIDh1CS4nIKj9J0DQ38MGnNlIJ9f
	Yf9AUm5btNDcEkS4KVqteQyVWHn0Xed6e5xtUowVVU/d+QYPcRWHVU9lnaMGa3AM
	gG1+Ow==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm1103-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:28:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed02a00b24so3914705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 17:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187732; x=1794792532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=;
        b=P3Wv9QWzCRtUs6WZfJfSffNCcSqwpunPf2PCN889H/GdlxqXW66O5JOQVxvw6A1CNV
         D9zCXE1I6K0Vk5rvCZZ46H7/jxaW4lLx+GlHy73v+JICR2KNBeKx+qZkO6iK+Jh9uwSl
         wK604gmm+zF3Woc5Z+8PiwB5WDrpSD5c6ijKIO/TckA0Gcfg8x5ya1nBu2EfAITxu3Bg
         d9krEqv7vSfTqWiwSvU06NOTRa/2f6seZhgGEffqC6SkfrRsOpsy1qXjPvbJImivtB1o
         z2+WBrSPjmpKo6Is0ivho7TN0d09q9/VhTWEK2RJxrSzshOacfNUS8YCKy3zocVd1lrD
         9SLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187732; x=1794792532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1vqXWzE+0WPp+dRQIYusXTpkNgynB9O9I7bhcdFXY4=;
        b=sNxaJ7UnmSR+jSs5NxysCgp7UnwRRzg73r/nOJPQx2C4uk64jmvCLBemt9JrhVQxYL
         5LRo3DTwQdf70RXqFtrmrMFl72JS6u0QqYcF6Os1egTJQzdYed1DaMoJAt/CRoM/T9ZW
         aWcZikr2u/cJlG+jjeM2gOVK0C5cOGWhVGZFrhhieQtAMfDZdQ5BxzpkcTkvuxbR20Gx
         s5X18EMXGl1Y/aXm5YiFQdWJzmf61iKXNuSZ98/oLgKxZs/sJ0x78zM7n+m+c+qXhzSc
         O8AMIq21wfcRwHPHKNMV1aaTFPifR+HT+l3y6fYawcqmSDKahRtINrBhRmugY3/Ars5w
         ptOw==
X-Forwarded-Encrypted: i=1; AL+hErE/w6R6gHTwv+MrztzYgcm4ZXhZv2ryUKjdrsWgNDrxF/22KgmZSuaNh8ULHoktJZlcA/CxK1Qdz5pTxaV7eRU8@lists.infradead.org
X-Gm-Message-State: APuU4Z8nQaUECeHk9Nc6bEm0hB4371DaRBOeENKZtj/Y2XzTeMfPYBl5
	fQjwMAq59jKX0CLvWq5E0jMhSF7UlQGcac7cC9mF1mMJoLx9Mw93pM+YXZiFjZTGOlh8m6xNSan
	94HbUlScXjQtvRK/Fe+xTrdOmwrZNC8KcgfO08DT9/rmHnzpAlSwhynGUL2yrIPQgrk0rvjXqoJ
	wHeA==
X-Gm-Gg: AYBFou1QjoSwS/KnxmQsOAylrUm/DeDloCuPFQKsCg7dzqnbSiGqvyD48KMlQYGt750
	TJRRX4h3gkoEVAda9jKt4KppaiujkYOO25uIuLAuhyNfNMKPLdGSaPKxL0phP4A1Ttr5dxy2bZl
	JscJyWbj04bThL/kyd90SKkTQIpVuThQghPFH2cr3K6SJfHCqDu01vlRABab6KCplQ701+HrSYs
	ZtczDfqTTGVsihhuH3PuaZtzaksJ3sLn4dmdFICygSDRanRDKihUdeFhPN24BCSS/8ECl4+SZEU
	CB7vSTX1KtPON9FDIKRQ58+lQXsm81DTzVydxoNWlFdmLeWT6ieoaV5fX/Ofkltcg/XD0+pddG8
	aLmaGHvr9KdTV4Bwz8kDL6AbsMNXWX6pMkU/dQffh3DDjwo0FUVttJMdsi8N7A48XvGO/
X-Received: by 2002:a17:903:19c5:b0:2e9:84f2:3738 with SMTP id d9443c01a7336-2ed833c4a02mr24027115ad.6.1794187732116;
        Sun, 08 Nov 2026 17:28:52 -0800 (PST)
X-Received: by 2002:a17:903:19c5:b0:2e9:84f2:3738 with SMTP id d9443c01a7336-2ed833c4a02mr24026965ad.6.1794187731523;
        Sun, 08 Nov 2026 17:28:51 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8146da74sm6248625ad.10.2026.11.08.17.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:28:50 -0800 (PST)
Message-ID: <a34ea028-77f9-4e01-a7dd-eb4811c97845@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:28:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure
 on non-AMBA tnoc
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX6vcthUjTjFiE
 m3XEgD3ElWT4z2ZYABHFCNzebJtnYaqZUZY7X7Y4zOtSxFddiBywUcC5nlkF3PLhBFQGOJ7EDfD
 SW39VZcagmaxzXnfTEeECv0499DP7UQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX6XvpXAO3SxmC
 SHN7dVFMe35XonoIcHngy3HIHn3Lm/6xRLlnm+/SKnHytpFU0aBbYnPDWtj1c4wPA546IIqB5ky
 CmBzioKGU42ku546ZrnDVrG8iQFeR6N7cNsJFOJmOeAQL28YYOiyVhieHbAAwwCfZIm8QHDkqDQ
 7v4sDsG5W0n7i6ZRZ54kHGIyDiDhJNnsaaTZRFJbFJFhYO6GcDqHbeYDcl7HFKr940Zxeg/M9Wj
 KZ7LwygHCSMjmEF/Dv+xybvKUxW9CqUveFGpkVQJ9Hnrr+if3cKm6GZ3neKc7MuQ1DFvsUR4g0r
 SwVrMf+AUiKxBrQ414W/dSa8X6d9fEZ0ZLXke8vK9RG0782TDVVv2KoFSHFQHXe1DbC413p4JbZ
 LNs9Ie07xrUgMgjnCaGDluVig1YFEGgvPgDkmVm9KeWRwtni9sA5/3W3V0sqI8ri9ZxFMlx8Djh
 aeQe8ssDPnaFU23yuNQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af121d5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4trN4h-55o6o6AafmxoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: KjQv1__F4r64buyLyMs0aqMdW_qPyykg
X-Proofpoint-ORIG-GUID: KjQv1__F4r64buyLyMs0aqMdW_qPyykg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172854_264568_0DE702A4 
X-CRM114-Status: GOOD (  28.51  )
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



On 9/2/2026 5:41 PM, Jie Gan wrote:
> For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
> trace_noc_id() returns this value directly to
> coresight_path_assign_trace_id(), which only treats a literal 0
> return as "this device has no ID, keep searching the path" -
> any other value is checked against IS_VALID_CS_TRACE_ID() and
> rejected. A negative atid therefore made path assignment fail with
> -EINVAL instead of falling through to the next device in the path
> that could supply a valid trace ID.
> 
> Use 0, the same sentinel coresight_path_assign_trace_id() already
> recognizes as "not allocated", instead of -EOPNOTSUPP.
> 


Gentle ping


> Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v2:
> - fixes the issue in TNOC driver instead of in generic framework.
> Link to v1 - https://lore.kernel.org/all/20260817-fix-trace-id-assign-issue-v1-1-b2164e33f9fa@oss.qualcomm.com/
> ---
>   drivers/hwtracing/coresight/coresight-tnoc.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 9e8de4323d28..8924b61ad076 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -51,8 +51,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>   {
>   	u32 val;
>   
> -	/* No valid ATID, simply enable the unit */
> -	if (drvdata->atid == -EOPNOTSUPP) {
> +	/* 0 means no ID assignment, simply enable the unit */
> +	if (drvdata->atid == 0) {
>   		writel(TRACE_NOC_CTRL_PORTEN, drvdata->base + TRACE_NOC_CTRL);
>   		return;
>   	}
> @@ -130,10 +130,8 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>   {
>   	int atid;
>   
> -	if (!dev_is_amba(drvdata->dev)) {
> -		drvdata->atid = -EOPNOTSUPP;
> +	if (!dev_is_amba(drvdata->dev))
>   		return 0;
> -	}
>   
>   	atid = coresight_trace_id_get_system_id();
>   	if (atid < 0)
> @@ -166,7 +164,7 @@ static umode_t trace_id_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
>   
> -	if (attr == &dev_attr_traceid.attr && drvdata->atid < 0)
> +	if (attr == &dev_attr_traceid.attr && drvdata->atid == 0)
>   		return 0;
>   
>   	return attr->mode;
> 
> ---
> base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
> change-id: 20260902-fix-trace-id-error-in-tnoc-driver-eda88ea30662
> 
> Best regards,


