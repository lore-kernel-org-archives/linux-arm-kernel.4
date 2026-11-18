Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 04:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VYCjZ7ck;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwKLl0Jl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dEkABgsA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=; b=VYCjZ7ck29hSt5
	voR2tyzoq4fgMtKhU3EjYX8jvj3hxDXcdFmKr7zgfG0M5GgKHAML3jyTkxX+8l+yYijJXunXrVlJL
	ItcBkef7iJj9Hl/UfmpSRNmREjUIOxrho5ekzquPxOBRpqmMdPSKjkuc8OZrwupMZ/cuwJLRoRuVQ
	OKTxftzxqlDW8enIl80wrjH9Qacs8if271scNb/7YoBBQokhMVwQ06i9ogRZwddIjZ28L6stcTtBk
	4oh6RgcHQcHeZ6A3YjBSmqtaBmmkTYoxO57tWHyz6F5Mkc9Cd3HPH4B1Y4Hrogeg4tomwKRThlu5P
	FcLpEPLt+N4LJ0AhAfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTX5B-00000007gxP-3uUe;
	Wed, 18 Nov 2026 04:15:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTX59-00000007gwZ-3sp0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 04:15:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxMU1430528
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=; b=QwKLl0Jld8xitQup
	l+HsJF2Dv2+jTBtru7ZsdYqqX1NdfW0xBgn87bKfSnM9ZJLMF/kN9FpBAGdPKCHB
	uYeHUEIDc3sHm9wMyOQ27YYb+qqvkOUnoPDSIS5N+H97Xig1YLWL2IqcHFLunPry
	/EqNW2Q5csx24b8hEyrL3RIskz/46RkabyYrs85YIg6jAJBNIOQJB6XtFQODoQqG
	EaF5JtRDv9ifdpGkQLKwKUyAN5nqvWmS4xZtL3LAXGS+JW7gzkTXBwVHvDNoOh3Y
	DgOJZasNpMNlXve0huTRL4PRoUj5aVNigf3l6MTztQVYUxvQghspkm6WIEr/wb0d
	BsBqPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv914fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 04:15:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so432542a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 20:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794975338; x=1795580138; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
        b=dEkABgsAzzrEFu6xT+GmYhu/KXI5F/LCT1RISftrJ/8NU/uY9E9UkrKJc7f7V5r2xV
         5O/SE+Gw3fqHGgzvxgAM4nuaixUeYLbUxgctvKFmrNv8EDfndGahYMxuSCEeEU7OzyEZ
         5cqe5HYYIXL9HIUWMLKatMNacmJ3sJBdMMQSnVDVbxmNuJX3tlYhDVeccKJqQQm96Rih
         i6xvHs0wesYfngrJO7IU1yn5K7HdIDQpSIR6VtVnJNoDXLOjN41zz6ZrUbSqNlqpMy3f
         bXQx2D2KVm+xYn2F2DMZ//LxkHipH0jA/5pbCNjqiEtJW5keyszSaqD+R03JZGWEvlFg
         SDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975338; x=1795580138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNJaMwym5ZKKLsYL6cTFMXYIEs5/IfORKVL2O86kwWk=;
        b=w13iAQxEDcXf5GpPpkjCrDreZ7Jk3cvkinGmKB/Pg4FNKCl3dUXz4Sub2gZRYkZQX6
         9EvsPivP9+sVTj7Hn1pblq7Anq+5M+qHH112kxVwBWksQsOa4cZwY6NpqVm9WOTMLwse
         x/lnwki+rcB/8X1wBcNmkL4YOLYtTt19GfxNOEObx1GgJv+pU2LC869x9u48zH5VM0lQ
         evUuZbOziLt95iacJpY1BiM+PNltnoJKxZliCX0h6Gr2lPtrRztHWfuJwxsdK/gROKBl
         /91OxEx2CYDFqlAnvnQgWU2Z3XZGx0F5tkb8nsxEiTJRHsxbB4x5usWzRUaqfB6k+fm2
         2NJQ==
X-Forwarded-Encrypted: i=1; AL+hErH5HereC/Yn7lFWu/jIQqO+gQP3Di1wZRQLqkdcmhjXx8iQf80GLkTMOSrhp5Pri1Jzkil5WGPEdBBQ5NYzLqIY@lists.infradead.org
X-Gm-Message-State: APuU4Z9GArivEQAm7Kucw58WU9vI+neSj4l3Tjpgc1NVow/SEKpvUb1N
	2dISH4B8Ut1gJZDk3aczMioz6LDzBpx56yKKIIX9bUVjT9FLtnbXHWMmbGLLbW28tV1JGfYuO+I
	eJi8adpXqmPYWE1wUEyfcyjEtfHuS75KSnI7Lk18btX0UKN4t9ZL+bQ3KDDhMV1K/CQeRQRPEXt
	I2xQ==
X-Gm-Gg: AZFdTZf9SGk//KhH719eVDnd5E5s1ljNeSIloDHua6KfFnGj7NffD7CAR/M3u54W6Ki
	QW0We/aaivQeqQrm+1u4h/b9qVsmxUFLaOMibqQHR05GONgivr7muyH8Nq6aP4FPo3nPuAbHtjH
	fkWBnaBARXlx531cw1qTXkjf3Wd4Tdfe91L02vLa5XgdKtOD7z/13a3DyK/owOxS4QDU5Mdj1xM
	FDb8j4dtMyTrm3DtdKEJkbG2cCkDtx3rAxefA0Bt4HaNqIZl6Ap/NS2fDvZUPtT569jzso+Gmr3
	31VOT1GqntHP5xvnRbHMTuQmfSl4JQlmfZdRFgvKpi43WI5dOIlrRbCIRcCKCDSnFGuRZ1a+7a9
	KMaXFFB1uxx3fK+zVn5utZj1bruZFWkGcdeNrVWSs+5GM/PutV07E498iOzkSVK0FLd+mS5SV9/
	fSboxC440gs/m1YoMPj2mK0IabrXcLRx3vPbq1BeOl5w==
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr1481996a91.0.1794975338065;
        Tue, 17 Nov 2026 20:15:38 -0800 (PST)
X-Received: by 2002:a17:90a:d2d0:b0:3b3:b621:4026 with SMTP id 98e67ed59e1d1-3b3d04d00e7mr1481969a91.0.1794975337581;
        Tue, 17 Nov 2026 20:15:37 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56f6657sm547501a91.4.2026.11.17.20.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 20:15:37 -0800 (PST)
Message-ID: <c310d7ef-28cc-4ad0-9414-8b5ead52f53c@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 12:15:32 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: mediatek-hw: Release resources when hardware
 enable fails
To: Haoxiang Li <haoxiang_li2024@163.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, hector.yuan@mediatek.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261118034205.2002363-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261118034205.2002363-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNiBTYWx0ZWRfX5ejiDY4ft9Ro
 QEx2g5WNX9ieBA4pbjFP5zS8xb4UceJ8+2nd7wQezqVarNybm/cOGg4kcPPXDzCc1gHB+Di2WtB
 Uq4Iog8dE89la3jyUyLHZC4jXXWemmrVQylVyth8VLVHmU2tzmxdSk4FgrS64PunfR7fU/M/sst
 X3OMPbGb2vGqmlmtIkmysZhsmMT4MgLldBvvzsohQqzLrEqUWUZWMTeRXKhPiLBRxvFfjlF8BI1
 0Rs4wcGUri/9eHu4IrtZdhWJWZuaNW7S8/woVssY58A/qvl49tEkgUVXV7y+zrQhkTtnD2NJLmt
 gnAzuUka7Zu9x7Z6moCvFQfwOzsT23rDVFRmBsFGufyW5LvO9MsbIy9+YkbCt8Q7ZXGkAHTPxet
 PDNofxySl9WZxgDwvfIBsIWqQ3FNakxkh9PvBwXY4utQkhowO7yx/ufGoGd+TQ4lhWw5DvHbI5/
 XQ+VCqm5FLktE/4Htdw==
X-Proofpoint-GUID: 6SbDz9knEjsurdRS5oucj2GGJMwbtrng
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNiBTYWx0ZWRfX26sFY4Gs2CD9
 77YMmufj0Oh7PGAMxfeokEG48tEU7qkfL4NJd6hhFH6g91epEr0L22o43Kj2nE38jcqGHXF3Zua
 Zjc8ZfE38oyRQ3kh4z4d3H7sykxm01s=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd266a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Byx-y9mGAAAA:8 a=ae5kI6K66oS_w7Z61gEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 6SbDz9knEjsurdRS5oucj2GGJMwbtrng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_201539_984297_23AE4541 
X-CRM114-Status: GOOD (  23.07  )
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/2026 11:42 AM, Haoxiang Li wrote:
> If the CPUFreq hardware fails to become enabled, mtk_cpufreq_hw_cpu_init()
> directly returns -ENODEV without releasing allocated resources.
> 
> Reuse mtk_cpufreq_hw_cpu_exit() on this error path to clear the hardware
> enable request, unmap the registers and release the memory region.
> 
> Fixes: d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case")


The same commit also introduced a leak in mtk_cpu_resources_init():
when mtk_cpu_create_freq_table() fails, it returns without iounmap()
and release_mem_region(). Could you fix that path too, as a separate
patch in a v2 series with the same Fixes tag?


> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 2c57371ad502..65f15fe935db 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -289,6 +289,18 @@ static int mtk_cpu_resources_init(struct platform_device *pdev,
>   	return ret;
>   }
>   
> +static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> +{
> +	struct mtk_cpufreq_domain *data = policy->driver_data;
> +	struct resource *res = data->res;
> +	void __iomem *base = data->base;
> +
> +	/* HW should be in paused state now */
> +	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
> +	iounmap(base);
> +	release_mem_region(res->start, resource_size(res));
> +}
> +
>   static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   {
>   	struct platform_device *pdev = cpufreq_get_driver_data();
> @@ -321,6 +333,7 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   		if (!(sig & CPUFREQ_HW_STATUS)) {
>   			pr_info("cpufreq hardware of CPU%d is not enabled\n",
>   				policy->cpu);
> +			mtk_cpufreq_hw_cpu_exit(policy);
>   			return -ENODEV;
>   		}
>   
> @@ -330,18 +343,6 @@ static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   	return 0;
>   }
>   
> -static void mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> -{
> -	struct mtk_cpufreq_domain *data = policy->driver_data;
> -	struct resource *res = data->res;
> -	void __iomem *base = data->base;
> -
> -	/* HW should be in paused state now */
> -	writel_relaxed(0x0, data->reg_bases[REG_FREQ_ENABLE]);
> -	iounmap(base);
> -	release_mem_region(res->start, resource_size(res));
> -}
> -
>   static void mtk_cpufreq_register_em(struct cpufreq_policy *policy)
>   {
>   	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);


-- 
Thx and BRs,
Zhongqiu Han

