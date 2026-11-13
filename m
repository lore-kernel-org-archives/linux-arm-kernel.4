Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5434606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P11K1u2x;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ObBtv92B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0ZOqK6K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=; b=P11K1u2xkgfOgV
	oEhRGfQoC7r3b5Eon2kQ2CWGzz+4vLljBGsnrl6fFxBJMZDbLsxbCQM/P+gf9YcTPr2TyQD+6DAou
	vABMFPY1B3cDB6jU4HaaVWXBZMTAhbRQtv1lcYChhjxFc4MZE5vljfPYGMzzLPeUujBsMlimO71ys
	UQyyWcv8gi1Zm0qSL0hy8r6Xg/tQyD50IFV002EgXIO3gadasyvJyWivNsM+pLkO5dNWlQaiuTgLA
	MaKDl4zBCRhDDtu13xTJWmrUr2qhWHdWGZAAr0A85bhjzfUDrXCZCThOS0TMZOs9YqN+cVroP7xJa
	VEskznvNlt0niDSbQhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq79-0000000CfN7-49kC;
	Fri, 13 Nov 2026 12:10:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq74-0000000CfLz-2apc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:10:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0xWg005449
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=; b=ObBtv92BXUpOERJ+
	2WgyEdl4lbkD7pOLZH5GrGlE+98lvcAtyZbrkhFvxZIDGjJzZVfGGQmQjOzKKPqb
	9K3j6lvWgfinVvqZG47jlC4w4AXyt/jPlZVU3WapMHA5Sy+vPNw8jOIillPbbq6L
	wKuOh5azgiMcnunj/Z40CesmKcHwMvZhU5R0KC1cbbj3u36fdS1l5b/z7PXJ2iY+
	zLZIH7q5h76zuRurP7DnTiUTYFek03tFCNYM1cnBI3UTlIm+56yJ1kG7RpaJMMys
	1+TvvsDds1L1WqJ+1M8yRZjaLK3jgQVzjL33ANFBF7C2BLbiqj6+tEyCd7ssXpN/
	08SwdA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwawnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:10:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2ec12d9e6so11282137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571837; x=1795176637; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=B0ZOqK6Kvu+e9ycJoKEiB+N7F4Y5SWmblZyqSoEpf4geMCOIfPBLXj1dB4Kragkbji
         WffFGT+vBNLbpEWuTqYObkjzDaEdedoTp2FYB8SkpxM6oxtDg7eeef8B5Kmg4CZI+PBe
         pm+zztWbromr1n6ri5uWXcVDXPAWxJDyPLJof09S6zIIbzFgC2ZNq4tPT9NQADgZ+Q31
         q80F/H2ayXwEd3FoZmZrXkrG11GWWj5VxH1ptm5CZn9GDwrS7Ng0fqWuFiQidT7VoCna
         ZqDAwGKt7Ufy+MNaatG13PrCaMifH4LHPfswxBgr6HTcTQ3If1K9RKkH1CnAFcg5bCEP
         UQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571837; x=1795176637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hEbvuDKTvq5Xc54WAfLx4GkA5m8TdMCxYJefmo5WTU=;
        b=DEk/wdyVGWbY/mJmmLpgZ7sbWtruXVs1g/2AtxewmrGbvH6riVJ6Ga+i/RSsDnP47J
         wuBIoy2LE32896ZE8kWA8yxTLruM1sfH6nJEVaXN/YJIv53LxrKkqTuWz5n+gzZaaeAF
         c156tQsjUyy6ou26r+sPvfBmqhP0dm3Mb+bspLArBo+LGdou4p4zc5dxzXG6OLIxtGFL
         YX0e+NgkRiVe0xxx0BHmk9OaZ2kSHq/X6fz/qR15DntTR+1R5xu08viuYxoqjMYZRBW5
         P8NDb2BThIfwM2kJmysF2ZbpVhvlCxvMw6yW5ZMWBPH4SNNbCugqrdqUaaJ9TxOjd6H2
         nJRw==
X-Forwarded-Encrypted: i=1; AL+hErHFW5FdvPYwPFfoGhccIxJUU9jXEfvOpHAdOiz5nCPUi1/Suek0QpBGpoth+Tex1LK+iNHotrDx7X2892bMzIOi@lists.infradead.org
X-Gm-Message-State: APuU4Z9uMpTpCTWOfNWHrBBxV9Uc6xmJTO+mgZfwAbmJjaAZGZcg87al
	zIoZzpT89i7rtpn53ihE0wNpz2ttItHTH7/gyMm9PQgJAaIcuObkM7zoPQ0pxnRTxDrNNfnqTB1
	VOOkIcUhVBiYf50kgP+kHzwvctLDb6FWN/8dLLk6JPDgbQWgP4aebIFO/pK2R9JjFKBrRI1RcJh
	50pg8Sr7faDA==
X-Gm-Gg: AYBFou1sJZ7Vh7ATVpuOvuiFFtKU3CCkqhc1xWC6+Uwbsd3RB6q4WGioJttBSjb0Gzc
	m3ceXnz9gpcp7+bOMb6XjqZKzQdcMDuXZCV6LbP6hyKaNJta4e6QB6E6Q031CpSGrJ+QNvT/0H8
	ANXDtsJihBcyTb6D2nSo6KvcXYyPvib9Sjxr/4zp6kVlSb/opejO3PFloTjCh8oDI5c/NjOuYCY
	h/8jz8ScfyhrDYK+rWKWEl5YAL0m0Tw83VuNNkMxPYn59Wp6N+T1fngfhapoiq1AwS+pzZ+kPFI
	uAHF02x+/6kb8SycqCACUdIHXxFXEhF1YFLnYJ5yauSg5YGf/o807tzMnzs0nJCT9Dho0tobt3P
	6Wx7Z2uJYYHlUVUNiqPjD06ZeUDA8TNEfMa29fCOrn6M1QeJUjxEWhO1OlPz+zx8B3eAtf6o=
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550101137.2.1794571836905;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
X-Received: by 2002:a05:6102:61d6:20b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7d64d6c510emr550065137.2.1794571836420;
        Fri, 13 Nov 2026 04:10:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23ddf82sm870968a12.26.2026.11.13.04.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:10:34 -0800 (PST)
Message-ID: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-16-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6fe3d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=U5E2jiqv92kUeAjINO8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: FhOLITWdCmaxGFRxJY5BIhRyL6b1LPHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXwWyyAH76lFm5
 JMjC77D19VTrLO9DKzea6nq2+wipXjO/EMGveWHJEqNK9FOgoIkCralSB9nMA/1eYONxQXPdXmc
 N8zCcknffuxhiN01DJaS+vJhyFgp5pfRZnjIvlQErPms2LzYeruyQT0cMdlRgMTvSGx2jIR+xng
 dMGbWReKTewVnTpjRyLHL7U6Rbfi8Ecrnka2FmH7R8BlKEf3p6wTq+aYxhO26VjSuLM8Ha2J7oh
 uDal28ULGtXxhcNkOCXGhl9vBEyibnjZquIpxZl8Eh8i+l/v2+LagaCE48uw2MSecrJdkbdGyXb
 OvZm+Sq1CqS3X0pESePcgrMMkqS0z3eni05W/QzM2tiQGG0X0PPlN4IcX81wVGrDkRk+m5UNpVN
 jjLztT+GUwNIa4OjmL8utt0uH0wqPjJ9u5QxJSnXqXU4jHaoNiIRyMk6oShqWZ/AgNnhKgDhvSx
 FoEJnF1K+fQd7ian16g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXzyRe+/Ub3Z4E
 mLln9AGZnq2aIJZYc01KSq5xzGQFvPg/7ndQNq9lDgHcnbT1x/8CINOhH4L2Vd42mybI6VU2amo
 Q7MyD9SH0rSkw3/f4PXwjazBJVseI10=
X-Proofpoint-GUID: FhOLITWdCmaxGFRxJY5BIhRyL6b1LPHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_041038_831959_B73416A6 
X-CRM114-Status: GOOD (  15.54  )
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

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
> 
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			gold_cpu_sleep_0: cpu-sleep-0-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "gold-power-collapse";
> +				entry-latency-us = <400>;
> +				exit-latency-us = <1400>;
> +				min-residency-us = <2207>;
> +				local-timer-stop;
> +				arm,psci-suspend-param = <0x40000003>;

Please add the other idle states (D4 and E3) from the downstream
devicetree and match the order of properties (psci-suspend param)
to glymur.dtsi

[...]


> +		usb_1: usb@a600000 {
> +			compatible = "qcom,halliday-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0xfc100>;

Please use '0x0' for zeroes in reg values

[...]


> +		spmi_bus: spmi@c400000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0 0x0c400000 0 0x3000>,
> +			      <0 0x0c500000 0 0x400000>,
> +			      <0 0x0c440000 0 0x80000>,
> +			      <0 0x0c4c0000 0 0x20000>,
> +			      <0 0x0c42d000 0 0x4000>;
> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";

Let's break up such long lists into one-a-line

Otherwise lgtm, very nice!

Konrad

