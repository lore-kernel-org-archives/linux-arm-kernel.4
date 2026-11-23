Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0221606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=io5+EjHk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dW4qkRhD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dp5Hw3fI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=; b=io5+EjHkWVw2cB
	yE2aBw2nzvd1MX6cV1X0H4L4nr5gQDeuJ6ueKx8MBmW69nPI05zF/MoN4NnKKpuUOxgBvAMKZfOeF
	ymjZL/tzL6hatq9Y6grSdev+f23RfrCqd0zmOiSEqbxWktFPNMuUGNRyAh4X4+y7SoK7dULhs4u7X
	yG4qRVn9eXiwHOSxZAr4JmB0NUcrYEsgmH8euuAUxq+NVdSN7JmOsIp11scSBBTTnsYgX8L6Hyx0r
	Ml7++Gaw0ppZbPBz/qACBbzS9jSLE54AfNKAD8h60CKOb/I/twVPq+kpWrSgGTpAs6B/6sadDMoZi
	puMOss8NT5y2Fp7+xO0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVwG-00000003yiD-0sbq;
	Mon, 23 Nov 2026 15:26:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVwD-00000003ygT-0eLu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:26:38 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLNCo445712
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=; b=dW4qkRhD6imxWpO8
	u5HFt+cbJ2A5mj1c1Ds7HXJFBiwHhG8/isQUmEVOmN7Q5yCgvPESuKphzSseuY4X
	F9YEIBVBT1rILBMztZWXjiPF+1SnhEwm5opt4/mrlJNr0M6zeY/dB36oxtnRyUoM
	tDMuRHv5ZaVAwy8If3ybdWC85Fbh0ZVD+q6ZeC2t2NuTIqYUGrLY3sdwXP2lBrbd
	Z9w4j5qU5t1595g8SPztX96GWeNFLLPFKdg3McdjKgraKLdhZahNnueNV0togGOP
	KfoZa9K1/Q+EdN7BO+S9pKid3qQllXMCtbsoH4td8IOMjY46VyK6qcXYVJWcNfBV
	OubzFg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7421v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:26:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecf0967947so92259e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447595; x=1796052395; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
        b=Dp5Hw3fIymNg5trqcesbIwuautiPu/pyPLgjMkhUMpWZ3e1hMiDaWwVje3c6HUDnlO
         ANIOFUozQaYj2QrSzfapIjGlJziY2V0J9hIQQE0TMbR1cvBI4prQAQANKBc3EYxT7p7i
         tfWDjeavsvsh3zcBkr8q3up9xdav1luc/MTCjZOaXXQtjS5zjmcA+961pX7YQRHjuW8d
         9I1HHIPzJf/MkuGcGo1kDGJWPn2cNDkzd+15LQMEVQJff4Zt+uy+3C5p5Er/NZFuzC9R
         VEqVt1fLyajqn2Smde3LRzW5X2J/Ckk9yWCi5RBgI+MrJtavFi+vi93zQEcO9DQOOSbB
         tUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447595; x=1796052395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuUxIXOTitidaH3hOzfbjH0n5miOrk3cJGjFf9YeLq4=;
        b=d2clc2HME70YPq+jEDMovMz/8Zz4msSifYTkbLpSG4SqYobfy1OnZ9CZj9LWN2n8ST
         WUpN/Xi8oMXlKJNDqBubV19/x1S9L4nM00Kj1L2FWpPeOD9K5DYWbTtW2oJUT12J4ruL
         dXV52QP9dkQYvXN3LXFmtpXPWEYkQz1afpt7Rdvm27sZdBYTf3MmZhAfoDwqzlw0DJZn
         ysmcokfTHDecTdxHXd4BoV5kTir7xGkCJinofjkeUtWBHO0M1y+CCmcZH8sBtFLKhGlm
         25EkAsda1I6XlIRRGC4pIe1z9hfN7SCDMAP0XiCwM7c1hnMF/wFCnRbUESCek9x3PXjp
         Jtag==
X-Forwarded-Encrypted: i=1; AL+hErERwgCeoCcEdoCiTiJQtmvEhsb8adFVipKBysbmmJzw5e6k5GbejDd5gnjP4lONjZwJD0+x181Z4OS9usgJFw3U@lists.infradead.org
X-Gm-Message-State: APuU4Z9xArge0NDJwwjacxl5rRMHqMjDLg5clCVm7ENGUqIaS7pLlG/e
	j31s23f1whjgHu3Zwm8LKB44Ya7im9QqpeqGtrGhvM2ELWng8n6/+kloW7vMynwf8Abs+O7O86g
	hVVndN6RF4wu3K3BNvBrECLNoSVyGiyVpmDNy2KxZZpQmM5fKswG9PVbTiDzJqZlJf/7Qqxs2T9
	Fb/w==
X-Gm-Gg: AZFdTZdb0UU7BZYn9wSLuphIqRz0jdwzryNGzLJms1/kO2ZlAIHS6xNss2jjMR2V4YJ
	NnDGLXyG8c79Andx7JBFZOskaDUrlYSZ/jl5UPF7AOkC7HiYvKSyDwibYT81ibQf5wdLJL1jXGK
	V1XKtM2w16svi/1JxCIfQgxknnYvUijrNEFJRCal5ruhqKFJuVm2GiCIYwN7BRY/TtSjgcYBWgQ
	K+cA17IvFAuJ3fAZvcIYI5LivmpcZIrchoO2lMAZptFZekZJ6nCCnGq/I0M/9vaAYgrB9N8thr6
	STfJ8Fgx66DjI6U+j2QCQfM5omTCXCVmHm0EEphTLl8Xrlu29Vn2tK5giK1lsgst528/a50zYkn
	YYMOQnUb1Mv5Libf5rFJ7CPhdANFiWfOT8ExY65tI5LQj1+5Wfm2O3jsxZufZqZi7fZfcllo=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7291730e0c.4.1795447595296;
        Mon, 23 Nov 2026 07:26:35 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr7291684e0c.4.1795447594833;
        Mon, 23 Nov 2026 07:26:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm420926666b.11.2026.11.23.07.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:26:34 -0800 (PST)
Message-ID: <8560f4a8-41e4-4f78-bd0f-3aabe731b79a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:26:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/qcom: Disable clocks if restoring the secure config
 fails
To: shyckless@gmail.com, joro@8bytes.org, will@kernel.org,
        robin.clark@oss.qualcomm.com
Cc: iommu@lists.linux.dev, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261122-qcom-iommu-v1-1-ecb20a28871f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-qcom-iommu-v1-1-ecb20a28871f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7_lpDy2egPB3Bvskxk5h9SMDd9UHJjlT
X-Proofpoint-ORIG-GUID: 7_lpDy2egPB3Bvskxk5h9SMDd9UHJjlT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXz1q0eFYaI6cW
 nw56ZofJhN9KA0siX3YhvSuIHo7afuExwvswziKNEi5xf3A/yw3waoLJLQ5Tjk4KdUw+fc8+XPg
 k9JSp6tdX2PMdDAzjjkV3ubj/FE8rTg=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045b2b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_2H1bLmklXDtjbdw0hQA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX2PzUGy7ol/nu
 xDsKjFlBVy7qo/W8xKDMDb1tibasJanFOAP8rFtmSPj1Cl+1it3VbmuPHNaL9Phz8wfy+j+n2JI
 Qhxr8rcjWSgSzY2w2cTOgm9SDtiToOB8n0+2Nljq56I3OkDJvP91mZhr0meFSIIO/iXlMxu4faY
 IhdPrL3byx8rVqFTOmmq9PBBCCi2TLDyPaEm0PyqJ+rTQYULkiV9BiRAxnXtFE0S3BNYXkG1dE1
 Q5yEEdR2r6q5TnMaQ0zLDjNiJymgUUW3eS9358Qvr4/uPjyEvlBf0qT8vvRdyNGJtOk3a9NfSBF
 Sb9f6lMrskuy1ptDCGWMRf/BJOJhs8iia1jdWSwSBkN+el79JKF4W9SvQoeckZv1y9ocBs3vWm5
 PoQ8VRjvJh6STb7bVBcMG7vlARGWjARixa3vUJsR++cwMmRcaaprNd8xh4MZtTy5lPJ4fbNsf+y
 snrWGbBPqwx3N5ppZvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072637_324110_09DBE48D 
X-CRM114-Status: GOOD (  14.03  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/22/26 11:11 AM, Suyuan Wang via B4 Relay wrote:
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> qcom_iommu_resume() enables the clocks and then, for an IOMMU with a
> power domain, calls qcom_scm_restore_sec_cfg(). If that call fails, the
> error is returned but the clocks stay enabled. The PM core then treats
> the device as still suspended, so qcom_iommu_suspend() will not run to
> turn them off.
> 
> Disable the clocks again when qcom_scm_restore_sec_cfg() fails.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 268dd4edb748 ("iommu/qcom: restore IOMMU state if needed")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> ---
> Compile tested on arm64 (W=1). I don't have the hardware.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

