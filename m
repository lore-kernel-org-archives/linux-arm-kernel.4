Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJl3UVOM;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMe7A6H7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZdxBaAP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=; b=CJl3UVOMBdWg15
	CazNpdqQSqCO7LDkq4opH/gu9elKsg4IpUfkdgsPQRX8CxQlzqa0JOgsnVrrbOj9/FZ2fqOtrYhXk
	nymhhElGgVSNrAVWmEu25TgEtRzGtnkfLVw1HsUgAaMeTJ9YlAhIT+GXmVHXujQ+LBR7ODiZ0YEXX
	F10tbFBP7xjfOE6EnqUh/V0XP7sM4pty2KWUcoOpRRtsWD5Yxwtaw4/rjYieFab5oGstYMCdpUMl7
	98zQGwV8+/oSYZS1G5cKtTzkQrBedoIZ9iwgl4ec+RICzFeU9crsBeAhag1bcMskEZvw+8ZiylxDd
	uzPQMzb3EHp3hVSROy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwcA-0000000GLFI-0LnN;
	Fri, 27 Nov 2026 14:07:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbp-0000000GL3H-4BAF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:07:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1TXc2472037
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=; b=bMe7A6H7rINkNX6B
	tJyA9vfBd9gPTs1oO/dYBnZpI3HzGyk7uzG12g2E88LZkqyOjF+LQiFT2XHonoe2
	zNkZnVcZxmGmWfXAgNOH5iTo7w/m5scnVAqaPbLWGXoSUxYoKL+smb2QWB6c05m7
	GD7Tu1rnekQv4hKH9gO06IDsoFiX9WN6OKmKrWD9kiRJfbVeYAqpcrQqR6Qp6Z62
	BDxYiLfTLKvNCTiWYZFe3oGrmfM6x/ef59MjmJshz8mCBFx061w1XR6iou0D7G5w
	HyBBSR+3St9M9O4cItvHhIkz79YUml+ZeRma1O+wPVpool7OBLn9QOJ9gKxu4kiA
	usJXlw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gass0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:07:28 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-71acb14d90aso161182eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788448; x=1796393248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
        b=ZdxBaAP3/hG9DMgvkOgxxEaRwuT0+i8Kl7IIla0T+YMoSEwCDFs6a1lMv6EPRY5AM7
         cUi0B/daE+zoREsvL6ND84DHyDpBFnE/ijzuQ3v/p+tZ0jKHj73EpCg9NO79X6k0UEI0
         Dr80zbUKMjWSKtnhnVXteJT2i4sHGzho7Ruz3fIaxFMno014Ft/oGycqTHYNT3mr7Rmy
         FsxbpWN03U9JUKFd3TH3rtyrsuIEylQ6JwLEzB8RQ7V1/uy1VDo0GgnVJ3HOtWhQCMO5
         gE8UtxC25PQ0eTuseX6KWdM5+7zfNLURgSaNOtYhrDqH4dP3ZGxi8avQmmFvLn/yrX/j
         ogyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788448; x=1796393248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
        b=fc6MmjH9Wcl0k97LXpwQGBJsn0x1WcHPm/TqX+9xuQETCxFAfnTvQmgf8ExWkjygRL
         JiYvRk5Nt0fYP2b7eCXZ2TRV4RpCP2dKLqIsXxIqGKeVb049eLD2x8jr1FB6WnSehUo5
         uI/+vqAEWjNH5vT+k4lxk7XGQJkAPPLojeqyhLRwpVJ2GSsfscFE10VsHJwBDayfNP6V
         x3FGPsecVvSx40bavd5LnjGtsppMtZp6TFJMMqx2qPS8aIx41moVU+Qoc8fkw1filRQz
         VgRzzBDtz88xP6O61PVVlyUrF/S+qX5QAEmacwjQlrMBGcYrz/XsFS3gOf47fjyBD/Zk
         jMNQ==
X-Forwarded-Encrypted: i=1; AL+hErE+Sj2wDvG1sg7A9sxxPzB4FCTA3K7XxaIdwabbop1eOQAQYqWcqknjJZvxAsltAwX+dgUA696gNEsJof0NFc3I@lists.infradead.org
X-Gm-Message-State: APuU4Z8eNVuJ4XINoM/fTXm7vRfdXjbnPa/FtCfCxiRASnrPl9Zq+WTH
	bCYwl00TlLkrHeb/98QXnv3MwcGgee3qbsdjIUaIovaBGwLDI5SF8oI0VWHZcYthAX9js6rYgZp
	U5N2B9pv2vfG0BaA1wXeB7AFkkTAX9iYG9XJCkGUQVEmGp4N77Z02zzZMWdXKSGNmYoGC0UqUPq
	rh3A==
X-Gm-Gg: AZFdTZfg9OzxXTXtyTVIywugR8J7XjA1EqyEKVNJn3/hWwtHBvEW8wEA2XnA0cQyu4c
	v+wKeK8uAvZmShXaC4EH7rCUEiBRIY9CFwrfKpcAb4W0x2Vd6m/qOjld+dqwTxHu4loc5zvcPKt
	Dpa2LIkcvpOYCe98Z8zRPSkPqhkoKvlk7lP+joKF4SrjgeBdDsy03Sr8UFEQu/qLTgYU1tOgV12
	o11zu3gMIr3rjmrcRLaUXJHFYJAff7sVx1nyncRHYeoYWNvERRk+cD+tC7LLQCbuvQZHXZ/eoMk
	5NJkvA307dCwlGgU28uoWKrLjRuahMRvUHQzIutpo0hSrByplMyLg97/+sxpee3fU7oFc1zVXW+
	0DypBiRst7wTvQ2Uwtlp77r+QglUO8n/TDjd4Mpi3Wr5xjxBbgHAgBuO7e9IxDaHuYVGA148=
X-Received: by 2002:a05:6820:c0db:10b0:6d9:f62c:2698 with SMTP id 006d021491bc7-71b392f5007mr22283736eaf.1.1795788448254;
        Fri, 27 Nov 2026 06:07:28 -0800 (PST)
X-Received: by 2002:a05:6820:c0db:10b0:6d9:f62c:2698 with SMTP id 006d021491bc7-71b392f5007mr22283631eaf.1.1795788447720;
        Fri, 27 Nov 2026 06:07:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0776edsm6211739e87.73.2026.11.27.06.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:07:26 -0800 (PST)
Message-ID: <da7b034f-d1e5-4e37-bdf2-22364d5c045c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:07:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZU_oFMxtI7k3gc2HSbrIY8DDhzMRSmfy
X-Proofpoint-GUID: ZU_oFMxtI7k3gc2HSbrIY8DDhzMRSmfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX2PYcMF5VGs9x
 KKlIdyR9SsZY8AmBdzYmOjz5YusjxocoHM/pkCOOkK34qBMtVEosHzeJnPw+6S30KbK+T3cVkLV
 3doemX182G4FXMhJVcb3KO1cuzKL1RfXxb5cTEoG7OYCnVqFUyQmgWKYDov35EK5FVd+kKWLViI
 4mrWWSF2DfzyohIRQVTtJNqSkE5Y0Jefh0g2WWRY1etBzHQNiiFS3UMC1PSmFldYQyxqNUeJSXm
 olDV+cD5dVHK9NUKDKDVfywnBxT1yYaiv2eDNkgfIHJ3jWrlR+HhRQEtuFr7qk4x0IpyD/jZV2k
 MBMu35p35O1BUyLimoo8jk5XxhtCtGGrkOjCHY1ib48DRxTK8DzbSQR8eQXFMUw5dQvG/XAsUm0
 TVNP7F7iLeISGPBLfsvJTRQRbCVkhSMTJuTqRPztE9TiCyjDYz56Nxu5cicEm+ysxKuII3dohvg
 MfNb7NpkvtHLiFhQasA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b098ea0 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX6rkLAEEzqeUy
 3/rZBOcvDgDW+6fWWrHBeg5KQPL+l3KHhvV380COp4G9cC42uQK6LssVt55f8aufHjAqYubqPJs
 nVrEt5G0kOvYfBiC7k9KbHfimUWKcDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_060730_147939_50F92674 
X-CRM114-Status: GOOD (  13.16  )
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

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

