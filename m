Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7612B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2OiLvbbL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=beZQtvH3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elejFW9S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=; b=2OiLvbbLDhSm9g
	QoaaQCrpM3D7vJyEeOETGwUzEA0/xz5O42OK4mn/aFpw6QxL5PlCv6hCqaW7GMPctPvCD2rcxCuzA
	LrmkvSHybZeKSIYiLN+azXz1pCeR5eivjOkZay1PUrMhrW22oMTur+kf0R24akRH3IJZBgcj6Im8k
	+DBDJBHcEyVBg+2S1FuEkLxV2d6h6bK2zFJxDHSpM5fccibnZhgzM0JTOl169QyJRQruytArONGUk
	frcCoeqmr6JKFwQ6WjqVJhtmWObA/bL8jxUhbflXolPMvkFYuJNgX3GWqt9dGG5ZlyMDwQ7fSGN8S
	uSo7edTIt4zerNGSjWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzIv-0000000BXts-44Ij;
	Thu, 19 Nov 2026 10:23:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzIt-0000000BXsD-2wbF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:23:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v6sY2030616
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=; b=beZQtvH3sJoaN870
	1xzUQgkcLknbaAM6tOw9AaP+i+/AHWFt0eLB26Y+hikYIKmpxqw1fBJzlFPJenWH
	m6rcZ0X2TQYbGQR6FIm4r7S2mnRPcL3n6hU8RLW8AVP9MjAniLH0S2uz8vZbQJHT
	7D/7pxDYih3AHmOQ/U3GebGVN1+5moN/mTQzCJzezYHG7eGU2WigiGZaNjnj0nWe
	alcdIunbDmplTRqz3JK9LM/Y01ZhVVFGX5WOfxRo+7/mnA3dSrG4NzuqzuOYMZYq
	JDSdSnIldwBY0L1IoB+0Xjh5CXyupWMbSotwRtMalPbdZ3do5PBBhtDQf2W6qkjG
	UE5Fwg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3kv0sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:23:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1558919a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 02:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795083821; x=1795688621; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
        b=elejFW9Se/qWNnqyEqpFA7gyW3BGQaeuZevk0FkMWSzedcnLUr17BNwjDcuxUVwZrn
         Ze1ZlX2QhDHSeSwcz5WYkTXRk3iBaaPXgHlSN7vAKug84a5l5E3V7+vFQZwwF4WMpp+l
         gzOHiPGQa3FulbH74cAkhhbwkdlE/QOGOPYtsqS61jEs9fxw+AkuECxZmAm9UhUmV3Yq
         9EQfqIpGPt8unLNKZsxfySQzIHih3joi0Kyzk+WxOXJGRMf5W/7P+qHY2KrzWFGIvQH6
         gCX6D95N6EqkTHTu+uE/Z0PmBDm4rREXrsMvYGlSjLExWKsu4o8e7XO6FPc+aYb1zUT5
         IQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083821; x=1795688621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9wzeMh9irMYC60fEm/+/11KvCaec7jakGgh6z+vDXw=;
        b=iAVGzQyq0eNgdFHHkNuZGZ+mk/0x5JSoxxtFz7xxImXc0iZYu8LSSTDP/H83LtNo+Q
         BbHp8uDSAuBqf24vH0/OifpauFVNCNtfURdvkzrsxd2gzUxMukvZh+JbhqyginHaKZPG
         VzlbiTaIHI9uA+9Q7m7JrdKd+4D/hKjLGYepnQkCFdl54+DLNr4BxbQ9wGUlNqN3vEyb
         wJg6A4AOWi9AbBZ01+HYiQAHkYDrcKpQ46mpUH4Yyo+Fp1Z9fGhXkFpJzUdMTnCt0nSj
         GqCCMQv1PIvGh+RWcrncr7hWONkDwpMZiGV2viRUXev8VpMrgr45i2YIerX2D3IYgR53
         dvxA==
X-Forwarded-Encrypted: i=1; AL+hErGBO3lU7TyIsCxit9wmd86LR7RInpbkiR0h0ikmzMDhyxb8/DvcOrdgsgDnFkVe9iobnw4u0VxM4OU6HpnVnQb4@lists.infradead.org
X-Gm-Message-State: APuU4Z9HPi5F6RWoXGiGkjF+HpWTxuONfWFd8qAmGHkU4GKEjHf+B3kc
	RZe5ebYq1XWCXdAEJyzGWZzEI+MPyjVxqveBCFQSfw52dYnaaDeKesnXVI2A1tVvwwbcD6UtPhi
	jl9DFiaQVeJZnOxfX9dvqATUU0GvXXyLNCMAaJfbkIFDuizHBUT8erBWslpDGBHOgH82es5U00P
	enDw==
X-Gm-Gg: AYBFou24RDQ30zwO3JEdl9NCVmQr69UtEdiR04gfUiLVz9GI57HjII7anpodp4Tw5SW
	9eZT1y+L4OsRnmVwlU6i3f44j8q/7xqVPmiBaXcgMUkk+QwqY5OFefIRUtLkWQ/u3BpbH1UGyiN
	aHKGJx0F6HEYIvTVq4qb1bMRw88/Y7XOiIp0nOQL/+b78HNe6lKcYv0IOKwjCRXYDbEbBLZ2mO+
	69KtkqkhjyS5GIYgZrifTEgxLX9weij4P7xSwVxNoNXu5CebbW3gGNNuswi14S0g+Xt9QvtHXqZ
	cb+XFTHESdkPcHq0qszAHQ29DaaXx8HIjtBDVAnVIvwhbuwpPs+lpe4Mq5casd0yl6dY1bAeJxv
	kg/y9+Iw+GXoQzYTTZCeoYAjEkhgwBnL9vXMo75/xbavNKaAw+CdFJ0SsXtrHGK2m/YsD0tDqpA
	cfv/VrFPbZn/7L+wSm+cD75FScij68fg/KKxyJ/HITXg==
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5626914637.47.1795083820938;
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
X-Received: by 2002:a05:6a20:2590:b0:3e2:2c81:bc6a with SMTP id adf61e73a8af0-3fe8a218d9cmr5626893637.47.1795083820409;
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde5336844asm1476471a12.4.2026.11.19.02.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:23:40 -0800 (PST)
Message-ID: <03531283-aedf-47ca-ba19-6756819d7b14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 18:23:35 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek-hw: Fix initialization resource
 leaks
To: Haoxiang Li <haoxiang_li2024@163.com>, viresh.kumar@linaro.org,
        rafael@kernel.org
Cc: hector.yuan@mediatek.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119052811.2877720-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261119052811.2877720-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX9lJv5gn15fUr
 Lgh4NkdmPS3/wCcmFBjXv4pTOIWspaFEzjJWu6JMEI6Q0pDfF6dv1lHCvxIbi49eUdsb2p3gpkQ
 SSQyJm5M6RqMylv6R4HR4BOqNL+X/9VZwd6PveJOlxqBWhmr0Ms6eRtZGr25cG7L7G7niswQH6/
 vnXyBqYOcbWfUorD3F6Otjgc9JHsOPS0Sq2ZuAjwYX+xb40OvMSR/m3831ILm35MU4kE3bLvPrS
 ECYFzKjp21/ZMp+V6n0sOpmLln47o4HbFopJdxHiebulNSTGXkARpaQFuJ9qKoRJt/aCrHxox4T
 4Zo/igBg1lsmL7kMI3lOZwPAsq9IEtquFsUF0fWT4b0sFTjtw9SOyMXWKRowKeThLryAkUCDP5G
 +1jrqgXvWDLUxcHUgeEm/yqDN855Ohr7Pp7+GMAQQg2znNpyGCf3/Q3mFz789vhN8kXtYp/CcWX
 7fyiWE6kwTfKeD2raoA==
X-Authority-Analysis: v=2.4 cv=Wom+otfv c=1 sm=1 tr=0 ts=6afece2d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yEmRr5OKUZuCAoPvvFgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfXwpF7u/TSdiJV
 eBwCw24xT8qYLrOTpX8WI5lzYckyzo/3cXS7gNwh0W1OD1D557pcLz4ansVkBfBdXNEuSqguVia
 Lo/kvtseycdBhvQZXoSGOFRhstadC30=
X-Proofpoint-ORIG-GUID: 5l4MGS-JSXG0gRTZOkUCOi_YFMzqewwj
X-Proofpoint-GUID: 5l4MGS-JSXG0gRTZOkUCOi_YFMzqewwj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_022343_857917_90AC2F1A 
X-CRM114-Status: GOOD (  18.27  )
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

On 11/19/2026 1:28 PM, Haoxiang Li wrote:
> This series fixes two resource cleanup omissions introduced by commit
> d776790a5536 ("cpufreq: mediatek-hw: Fix double devm_remap in hotplug case").
> 
> Patch 1 releases the resources when the CPUFreq hardware fails to become
> enabled.
> 
> Following Zhongqiu's suggestion during review, patch 2 handles the
> additional failure path where mtk_cpu_create_freq_table() fails after
> the registers have been mapped and the memory region requested.
> Thanks to Zhongqiu for pointing out this omission and suggesting a
> separate fix.
> 
> Changes in v2:
> - Keep the original hardware enable failure fix unchanged as patch 1.
> - Add patch 2 to clean up on frequency table creation failure, using
>    the same Fixes tag.

Thanks for the update.

Side note on 1/2: if a domain's HW never comes up, subsequent CPUs of
that domain (and every CPU of it on later hotplug/resume) no longer
fail fast with -EBUSY at request_mem_region() in
mtk_cpu_resources_init(); each of them now waits for the full 300 ms
timeout. That said, HW failing to come up is already a broken platform
state, so the extra delay may not need special handling, unless
someone else sees a reason to. The code itself looks good to me.

For the series:

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>


> 
> Haoxiang Li (2):
>    cpufreq: mediatek-hw: Release resources when hardware enable fails
>    cpufreq: mediatek-hw: Clean up on frequency table creation failure
> 
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 31 ++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4


-- 
Thx and BRs,
Zhongqiu Han

