Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D7B606A882
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gonXhh3g;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m60zK7vG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YpD6TbcY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d7YWesD+GB5nb3CzhEof/BBuTYLIyzteOBuwYIYlxlc=; b=gonXhh3gIqFdz2tIanc3skwlf4
	MsXBi5bu3gvmVk29GDyGq+fuzzWqSduaUlFeAPWTdzMg4GuxmFKiFXPmo0dy1uT27TOxdSuJ0a3Ce
	NKZZDsiiyc5o0iFj71pkuIoobkpRibZSixZj5Wln3f9uii3iIX5C8AEpBXElXIy8Sy8yDtpV8mrjQ
	3kPsYnUNVhhkBhWShqjiMPvYEhyaWileGPCTmEe1YxpH8lIw+vfFHYyodYYtiNs1JKNVHnfCi0ypj
	CTJPVFvlRba8LuKbptvussfwt7Qg6I4qmuTi4pfo7l8JqqMplR3m70BxR8Yw6DgMUnlOfJpdJtGLA
	SuMoPsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9XN-00000006zo3-1o9e;
	Wed, 11 Nov 2026 14:42:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9XK-00000006zma-3knV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:42:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEGwNS1573246
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d7YWesD+GB5nb3CzhEof/BBu
	TYLIyzteOBuwYIYlxlc=; b=m60zK7vGf7P45pIBeebd2jgoWwsaVJEBqLy+qMlQ
	ATunjdolsf/BzEMj8aILHeChoKDKty60foKGj44UDIVwuMi/PcjFgDgKKLJ0vr+n
	CpywMkm21mSC/wwEJr/q5RdQzd8hIa9cQPUu8guE9kkFW4irIADzRAqMCkE0cz2n
	ivHcf2NBQFaXpVxOXsBFg6qKnxg0KFVBV5SsTBpoSVWOLKDZYLWJQKtTmUMhRDzR
	vs/eG/XCUj8g0yfHMH7vg0D75kA+Utf5CmPUDfzA2A+X72za1QFMzeZAbPxFO0vE
	v6KXoT0w3cMIxGYiihrByu+6D+L3dkfRsMNiV2Ggb269cg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pspwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 14:42:54 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99062be02ddso508116241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408173; x=1795012973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7YWesD+GB5nb3CzhEof/BBuTYLIyzteOBuwYIYlxlc=;
        b=YpD6TbcYMrsMGQfIfovewc0OaYzuOQ4Qa89p1TOm4VV+2vAtO6nhk+gJ/XQKsL/Nup
         YrG5P2NpXjL75YqYMsRrWxSZi0DPspt+CfTOxYPDusVRZSUnR+7oGTZ856Bgkks47npV
         ErysgR9txSQQ/GUXRClhnCsDsH1ETJcx1UL8fwOqoMicHOJ6sT5YSqSB8Dd78QNj61IF
         ItB/d8dFS9Rqg35pmebN0UwVdH7zKL3oW7Whqhal2pCdMHzcZ7hgctiZYLJ0sLSIHL4Q
         56blnhKkMOEK4+oGSamFzeK6UhEEpay41j+Y35H3g/LxAA/WxwjnbCuKkOKJe/LY9dtv
         weJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408173; x=1795012973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7YWesD+GB5nb3CzhEof/BBuTYLIyzteOBuwYIYlxlc=;
        b=q0BR/RKynkWG3v3ULyWD41xesmfX/GgCDrG2D4rn4YghtVmGTN8AbGybNgLSeg584X
         fsDMMLaajHUmtI+m60TMpniaGaylVJxz4iAMDWfTYKGN8UU3pTx1qyxxKenhBqf2CjcA
         dfKrOOthjl3D9wqZYncv4q87y8QDSuyB0+vJGUYDZ4Ou0xjYAuNasche1CVT8SIzc64M
         uk0RkbP6RqWTCxYl8smP8tZ/o55t0X1S11J6NzxG+Z9RgC0DXL5BPvZoMontQKGuMXtT
         n7c/I6M3hWvWZrnnrxCb8KDoLqMKKVhUVR1Knebr02Rcda95Vxo1I8+vFs2TELlU6tI+
         OhRw==
X-Gm-Message-State: APuU4Z+raz83YRDCl5qm8YQuc4reWDTf/BJvHWA55pWo/sA5VbpwYaYq
	AlPkzjeyQtNYPyHGlPy+GqSjs2qwMDlFVt2HjzzJwdhQvO/gKbUreCttDYZqSX4zWwiarsaqZFu
	FmwHMA9e8ujb7WbKRz/c2xsIFUJmBLI01BQPoct64q+60Nnb3WR+jjBcsg0w2l8CGIQNm1Jj7z2
	Ue/Q==
X-Gm-Gg: AYBFou3+miHnQlFfTWPbTOTvVxanIjt3HfqGQ768ub9l8C7KvR19qItSzaXhfZQ5+WM
	uOhtdS0g4LdIAfxt0qXC78rA55wV4TXHH2sj7pBjaCMfKL+WsqWIripeiqsJNZR8bBConCGo/FY
	TjWV742cINezqv5dYPawxUolW2QkTCAVWEn4ulgNT1bDszAFv0qzzX0ajtbTaBaVcviWJ3gNeh6
	f3tnsGf85IMYW9qw3NSBk40wIhiqpdpls19S1dR9kbp734QPN9t4SP6nEGaqja1TIYTbaKmrdLi
	6jCpIMnx+F9ky1bPEz10K3V/bETZwcUN41d/qn4XHhduzAbQkE/bgVhzXeKgjOz+2xTi7HfjQkL
	/S3qaFyFxeUewqsR8jposHExkjbplcdsmYXbvYvIG8CBf9bKMnuXMTG1P6VTsekGc
X-Received: by 2002:a05:6102:5cc8:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d505fa8765mr740498137.21.1794408173171;
        Wed, 11 Nov 2026 06:42:53 -0800 (PST)
X-Received: by 2002:a05:6102:5cc8:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d505fa8765mr740488137.21.1794408172442;
        Wed, 11 Nov 2026 06:42:52 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5219bdsm1014835e9.14.2026.11.11.06.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:42:51 -0800 (PST)
Date: Wed, 11 Nov 2026 16:42:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the
 ACPI tables
Message-ID: <vfggukocakkxuzb4ghmiecig2jdelmm6tp44xwehgepn56phe2@kf46kuamtvzl>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-13-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-13-ardb+git@google.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX6YhkRo8MOKky
 Za7fyjljGlBlASZ3MmMJQCYKeNCyf1NrfMaSKXyzNdpV5dQKAc582WbMrQxy58dtIQZnQwLPk5P
 jGpx+Pv/DsJZWKBHmgj2ObJGJGYQUIE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX+u3dENu5FGKs
 IYlEI/ZHlK2wiQ6BtOWjziIMOaZoBhoVn8/pBPHQH9PG65/14Sr4XmmbBiBve/E5MCI9WSI9oQI
 kUztLokAs8KAuy2sfoG8poeMPJtTpgbkAJMF+9usQsWwCnBl2mkHaxRMyTnQeMwqSocy91cijBL
 Q4mCtbKHlUK+mZ7nmjpTXugZWCwEe0s9yNDEqTesanaahJttomRSEQhvTxS1/3OJJdnRC3xmXxp
 iOS6FhTUhm2wRYjNSVMiL1aKaWHsURlKIE5cqd3LKG2RaMlPt+Kr8MxegoS8vAPbK08BUiIbNI7
 wIpxrwh5gy9dCKpuUdcQCG7C3nXydso9Dml85YfPhgyHYqtHKAL5FxxHzLXlxa/HVmigeUGGSSQ
 o2lBz5AaD7nLK2+vuTovoyc39mdLCjqxiLRa+N82QYYu+5BlylYiVx1fFndtkETBFxDxz4V8fbr
 3Mtf8dxKxVUMT2qNXUg==
X-Proofpoint-GUID: aJ4olVTUc3_zP5bQTreG7XesBpuiJ4I8
X-Proofpoint-ORIG-GUID: aJ4olVTUc3_zP5bQTreG7XesBpuiJ4I8
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af47eee cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eEVhis-_e-4xrOTO_4YA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064254_958919_72EB1A25 
X-CRM114-Status: GOOD (  18.70  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-11 12:53:08, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
> PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
> cluster idle state, as the C630 would occasionally reset with the sdm845
> default. However, the firmware refuses the resulting value of 0x41008244:
> the cluster power domain is never entered, in EL1 or EL2, and the last CPU
> of the cluster keeps retrying instead, including during suspend to idle.
> 
> In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
> besides powering down the cluster, this state also puts the rest of the
> SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
> display is off, e.g., right after locking the screen, makes the C630
> reset.
> 
> The _LPI objects in the C630's DSDT describe the states that Windows uses:
> on top of CPU state C4 (0x40000004), the cluster container has
> L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
> platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
> powers down the cluster and its L3 cache, as the cluster idle state.
> 
> Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
> which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
> It differs from the sdm845 default in bits 11:8, which are 3 rather than
> 2, like in the corresponding states of newer SoCs and of the sc8180x and
> sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
> to keep the runtime governor away from it: suspend to idle always picks
> the deepest state that satisfies the CPU wakeup latency QoS constraint,
> regardless of its residency.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

