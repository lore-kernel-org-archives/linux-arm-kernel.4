Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446A606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nzEj3j7A;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pccZ+g5B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XfeHrxqX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=; b=nzEj3j7AVKDvoq
	9FDfjtnUeNdlauplT4lcv56CP2p9DXICtblmwTdBjiU+MbuFcGhDTw/Q5SV1OOOx24kV07p9Tidbb
	xjLPEECSMPcWtHCNIMwwrc9F7LxKjaHGVjSxE9hMnJpyMZyEgx/r/quGCLj/lFQpP03RmyyuxK0kz
	7CQXT3aH7HDrFCV7XnDRYgpKWuecPmQEAmlfMGn7NSoxuNypb/y9nNLhQw5ea0Qt3qaCKI2tfrFP+
	JdKMrV1IA/hwvMGy8fFWKyanpEv1dAA5at7mQ0HfVhPiMjQLE//bH3RU3MevtLG6bZ/qyWtHF+GjJ
	Ed9BBvhki5C6K2Gim1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg2k-00000002nZy-0ViO;
	Tue, 10 Nov 2026 07:13:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg2e-00000002nXu-0Edp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:13:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAdf1330844
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=; b=pccZ+g5B8bNi6/gv
	byGX8aXLKOZRv456TpYR+WsMYwZif4FXQvaudpLIWegAEQmWeFKJhOCC6gT4NhWu
	HJgZKatPY/GzU4RNa784o9mMe9LssI6kF47gqz2lsYynCTEQAHydRm+U1rfZ26yO
	HMD5OADYkcwCRRUiBc+mumXP06zuiedmYXsATCtUw5EyBjAw00FMg40it6BkC2ds
	VqokwfaSeCHdyevjt+LoBcFbCLnFoikjy7ZdV8taEhIhV7jpEF8ZvhUm1Vvjdsop
	4O1OvU6PLo/Ko5wEsmyDwbNupgFKbFnKfm7T1Wb5SGKO695TR+3gOynmlqP0f6wO
	PjogAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcjc1da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:13:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1473669a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794294794; x=1794899594; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
        b=XfeHrxqX4400pgGQFKR2D6h2oc+45uXQNPeAVxv7HRqPIlBpmFQHG3ho39U8rK7ydk
         9QjqHwKJoPyXjnuXAiQRdJCMqgK9Nv2EQ91dFn1EjW7jkIJxkHi9mQnWCOoZUY2f8LSx
         Mx/vUw/eWB6xwz5dGe4my/+MwG6MWgNhvjKNKF3A49EsHFTUAL9ptKQ0xLtkR0M6G8M+
         8BkFGHbPe+QxcaxF+kDypuxaO9o0aJ/6v7DwMvTPyHxf8FxEeeSSkQRvkYXKI+sOEzrS
         gUjKX0J6MV7sRMhaG683qA7/WW8Ae4/2UyQuvNQavdhD5UqjB8j0kMfD8wqR6MZecMXB
         LMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294794; x=1794899594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7UXFVgKpvNjfKTFlHSJy5Szag8SKeYr2EcItqqOWiw=;
        b=EK34a6Gx1b+pP+4nlACmsllvZBZS3XxQPeLmLcaftM0LzqqSEB2b3pBaKnOirqjaNj
         XUaXLVTYY+FQPDD291t8sXvqEGrfcbB+m5ML+VuV0drJDBZtAPyY8hHki+6Exme6tzkt
         yZxmXiuws4S7F5IWoffdw2odlfTlp+cSXTS10d+0FYlITF9WlbdXmle51zLr+MfrAK4d
         tofNhQXriGoM1vKhHWpo7bnTEnb0hXyyG/7+Lf8V+J0vScR9N8XnZPO1bdLgf9ERlj2a
         CovXBFOePdNBR0QO3rlcYhaJwc//gSU60W4pZgd2u8wcfyQBlFe2EXI82LNOBZSuEXSX
         aF9g==
X-Forwarded-Encrypted: i=1; AL+hErHXWbAOCWPTC98V5KlIKf0E4nnvRu782Qu8tT1RkPokl7OoLbDred1lthnaUi6xsq5FyudX4gTGGvAiIBT1v5mB@lists.infradead.org
X-Gm-Message-State: APuU4Z8Sde5/03Udu79kNjOduj6ZeeQ+fspJzUi6B6YN4XbNa8TfK8Sp
	5l5RtnW0SVAcD6piw+xPYiX4UtUGhYNG1bkJ2qo/U7h4OYknqF5eRJ5ulaCqdnAwH2v/hvODAex
	NtOUuRgtH1+GHX5V9qjEeUGHcqN3OofD3XKEKD03F7C/+D0eg9uxsEMCd3WKLQWQe2SbYfwM/xw
	qqEQ==
X-Gm-Gg: AYBFou2bSIH51uw43qa5GodvpTacmFSdP6D5WyNSu5l/Y2d2/Co1jUYBaPCFh7BT6i6
	apG5hF/AycQz/+AoQupn6WwMfx4k8QQ6Cx4vNVtTB0H3oxGIyRPWmyoJqTx/jqE+dIvxlih7BoG
	GeUcQ6oMRAUspIT3TEIwYYDdcQQihM0AStDJGQhngNrRiEISlA/RVveTUvrI9hreA0pv2N/PceS
	ENhQdRHSbDG7pbZEiLvMKrKu9Y0Aqqudd/KvqiO4Pn1XeqkqSdWeLpo/0W2bMbZLGvCRI2ssJqK
	odA1ftpuNzJKGDmUJ7fk1Gx7AdJpLYAFeogsAWQpLGanZKyrEVVF1qOSdZJdVjpn+3YgLnvFv2p
	F+k24p2jpFI0PTU/1i04IcbTD/3as+5l8Ax+QdZZE7hU045mcU3BtvFZ2DPyz/o57WOlGPUMXoQ
	==
X-Received: by 2002:a17:90b:1c8e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b166cd3dfamr1883544a91.44.1794294793480;
        Mon, 09 Nov 2026 23:13:13 -0800 (PST)
X-Received: by 2002:a17:90b:1c8e:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b166cd3dfamr1883528a91.44.1794294792977;
        Mon, 09 Nov 2026 23:13:12 -0800 (PST)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678d1f42sm2761077a91.7.2026.11.09.23.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 23:13:12 -0800 (PST)
Message-ID: <b75ff010-305a-492a-bd16-b27fb8a4e064@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:13:07 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VulJwZdIaXFfbRt29z-Y28iWhyoVcUO7
X-Proofpoint-ORIG-GUID: VulJwZdIaXFfbRt29z-Y28iWhyoVcUO7
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2c40a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ih06bLOFWD0XbLq0AFAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyOCBTYWx0ZWRfX/uul44LPOQzo
 //Dv0Wzxfv1BSkJpH0oAMJqLB7+G7c4o3y82oMW0OrdxmNrVDqVdNbyRjahj5VnxXlwyG7N+EfP
 CpS+TqeKPPQaNsk2uBJe/X/WDLVQxtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyOCBTYWx0ZWRfX16Y4lkDEY6jo
 mSqy8OrizLrJ4uTWJyYUEpqtRAor+fAbzloxHZk+j0oQdVJvo//AFA6IelI57PPkxFXqEGtDX03
 cfKlSpiHckL7gzXzCMa9CUIeMPFVBvJJ0tKXc+J4mV7wEwSwxhfniO5pl4raSEa0vqm7FllweuG
 kZLWvsDg+yPSz77o/nlBED9/9VhEIvy7Nm70PFQVn9rimaaUDm14WH1DnRlLj7VgoepXqHnIgDb
 I2CyAX0xtnZD3y9C99C4LxAraT/pgDjlmqV5/1Sb8sPPFsTszumfBgPrxYXkQjl8FRVJvaTx98x
 VU38sS9mdykZ9+cp/6XGoEFGduFAZ3W8/+2ayCABV1RpFMxC1nZBGHmXR6CIbVGfLlbxdra5sjP
 yPAWLcequxiVLpDXNcPLY1s947lQvQYp4ViJTvjDGpovjYawiXhHbrF2BwGu7xEGvakTUUGiuTq
 o37PM+afIFccmAgoxew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_231316_110254_1EB6C8FA 
X-CRM114-Status: GOOD (  21.20  )
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



On 10/31/2026 6:04 AM, Dmitry Baryshkov wrote:
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
> 
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 21d18ce67b98..54130c32056a 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -479,14 +479,22 @@ static void qcom_iommu_flush_iotlb_all(struct iommu_domain *domain)
>   		return;
>   
>   	pm_runtime_get_sync(qcom_domain->iommu->dev);
> -	qcom_iommu_tlb_sync(pgtable->cookie);
> +	qcom_iommu_tlb_inv_context(pgtable->cookie);
>   	pm_runtime_put_sync(qcom_domain->iommu->dev);
>   }
>   
>   static void qcom_iommu_iotlb_sync(struct iommu_domain *domain,
>   				  struct iommu_iotlb_gather *gather)
>   {
> -	qcom_iommu_flush_iotlb_all(domain);
> +	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
> +	struct io_pgtable *pgtable = container_of(qcom_domain->pgtbl_ops,
> +						  struct io_pgtable, ops);
> +	if (!qcom_domain->pgtbl_ops)
> +		return;
> +
> +	pm_runtime_get_sync(qcom_domain->iommu->dev);
> +	qcom_iommu_tlb_sync(pgtable->cookie);
Optional cleanup: pgtable->cookie is already qcom_domain. Could both 
callbacks pass it directly to the TLB helpers and drop the pgtable 
variable and container_of() lookup?

> +	pm_runtime_put_sync(qcom_domain->iommu->dev);
>   }
>   
>   static phys_addr_t qcom_iommu_iova_to_phys(struct iommu_domain *domain,
> 

-- 
Best Regards,
Yijie


