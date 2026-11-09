Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844ED606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uonqKGwN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dqKF4fZG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=uonqKGwNwBHVSn
	OEMDCQXzvcofjPwT33rpIhNxpDoYMG3i5LZdWR8GVl4zWEDVvJCkua9zAzUVyk5wetQQgIOd+GSAp
	O/1kpo+1QaVlhGvxpj9VmHWr4jJ8qgq+nXtKA822/93pzmXRbBNlBP1esA8xqnPetfHKsD8VlynKi
	sLL+SP/bxkfaU68OqvCnQliMVaW7gCHgNpa6WTB+ocMM9yh0HG61C5ftIEdl035wNApvxsMIjmxDl
	8SjxUyIC2uWWq07w4+I2hShXJh94NXKUOPn8Xwl2YolPGRWLM3yIhDJL1jSJ/5It6yAYPBHZdFuoK
	ROqnHxrjrhjxItQQ3C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQR2j-000000011Ll-0rmI;
	Mon, 09 Nov 2026 15:12:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQR2c-000000011Kc-1Vu7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 15:12:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFVpx337586
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 15:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=JVHA+WmS28WTu51A
	alo4QMvr0WoiXI1XjKsBEXyVuK1q94o60sR1tEhkiY2tviOamIxSXbW2e4SvWI0B
	FTkucu81+2EXGVGJ5suaNaLkGLtqVzxKWtq5ruWvOOwNBDZI8/88FOsPRUA5JBHv
	JACpPjvZIITH3FJcqZnm9Bm/J0R+cyiE6IYGLJFK8oO7l309Hp1OjCX0HhYMm7Po
	btMjZ1ALCHvtYmQq86wiBt9nEtv5ydZzL5OQA1dARTOb2/BpGIxuc2TxWsSA0U8s
	SRIa4+tiSHSiIPRLKDBLsxrgw25FmtzCpVrDJlCpin4RqaRpkTqQZu+KTy5h/1ec
	MSZ0kw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rutd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 15:12:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0ae52207so18558137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237133; x=1794841933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=dqKF4fZG2Df18McnYvKzYxzP2aZxHtgYbff/kFQg1wqAdTbUKsaHwfSHM0dmyrFMJE
         6mHUQ7Ko8MmAYEVArGXLp8X773JbXfgJhT9J0yTkaMHQynVvhOHVTEhjr7fnz7VQrcCV
         OF6gHaZdbAPUy6poKK23Ly4298KGmzFEhcSRxXcFs65EtkQqDMhsQ4ZNZw317bkRfYoa
         PYSsqju4TKWfGaJHQwzYc5/JaCzPRDKymvLowfzuMOXxOYaF0XhATAKzbjnh8owKmA69
         FTx/FHciPUGdP7zk7Pzh4/1oN3A7FvYdLWG814FrRnwAco50aVkv7nIew1kcHB6kmQYv
         cXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237133; x=1794841933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=EskhQPdJxt+bx3YeF4MyOQApyxcxGF5x3wr9t9WbMGqtZb54TM8lBaxjMQSge7nnLW
         XYjfNcSQM4GLeOj6ZihGxOk2SGRjy2szBriaXfbdKI5WP0hJD8kge3S2dHTGs0mNi1oq
         2+HbU5wt9OLkfJXnKmUxW4xi3STy8VAy98m71rshRoaBaSmeSpmS3ra2Hwecq9l/m97+
         Knd8onTB3HF6qGlmwwsgUOE4fmmvyRGqaYtbnbfP136TUDYuCLiBt6dayqS3H2V4o2vm
         S2vjNDBukXywDlfhNeLqd3CypFoIBr1JKIXE2O95LyxFypA2ELVVWt+2b/O10qdCs0AY
         NJNA==
X-Forwarded-Encrypted: i=1; AL+hErGw6HOvzfVpaPMBwvr0lnCu/QNvGiteKjUBBnmOny+GSUYtVNe2UYxmXLEMJlQZT+j/DDv3ndGbXa48gRnin3Cf@lists.infradead.org
X-Gm-Message-State: APuU4Z+0YB/CG9j6mwT3BZeDv9cM4cCiipSmG0A0eswpT9jTvU0Je4oM
	0AsLdEnbS0OcBwqn8lvL+sMdiDEfCls5l9YrUgvtw1rBNfWj5TkkNyecU/RAqiG5dVLrUV7dMWa
	cnSBif2nvzZEGNn+PuhbOjr5L374TyWQEMrQ3A5t3aeG/x1pHUxe5ThTQTXmjOc6VQJMH27Ebes
	jHzA==
X-Gm-Gg: AYBFou3gX6Ava8xy9loLyS5BgETmmE5KR3976uODGEujYtws4Dw4zCDf2g7NrQDsM7Q
	pt/BEpTDqNjWggnxPpRdAQtR+HbvBNQ8kEI2jsqa6Q48dp3+RHIDPxM5Gcj3t1aFp5iDZh2Mwm4
	jygy8th06aDe0dlpbXwBNuJ2MxqYqXdIoTtoq4tlWYVxt52zD88lTMXwFNMOvZhqc/GNrd4aVc5
	e88SdlV7DSCZeaU8/18GcM09bWO7g4hdCKkSm+fexKJC9E5E535M2fkoo14zewmZrzvW1BbZS4A
	PQy3dTo65iDyx9OM/chkIsDv+/EAlhufFSwb+YgZtsghpC/I6gX7rG1FTuSyFHLcLGWnQnv9vaJ
	Rz19DDiq7gHpxjN5XRkHLyUaZfEFAioUCfJVs3qh8CbjGygHGSFGZ3Ae5+sQ21BJVKM7lpg==
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229171137.0.1794237132815;
        Mon, 09 Nov 2026 07:12:12 -0800 (PST)
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229073137.0.1794237131982;
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1765456a12.26.2026.11.09.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Message-ID: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:12:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
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
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX+ErDVvu05cdQ
 UNN9UQ+BXR9TRrIRhFlS6Fhcl/arQncolnzZYvGYx2pplkfYAwQHty5WbctkyCZ6jar6LxvHfIQ
 aDINC3rDbtl4HWBMuUgOFBLNOsrW0NY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX+UHHN+XzJVuw
 TK56NpUXl+U8cgMMiWBlimhSv8nerZOA928ggT/x+9yHeAGmMY/u0emHqCDpkEZTdzPXEdaDKBk
 8OKxcbOc3pEfK2R4+rEy3xQzSYJlZYdjXjT7LIGmNtMsnRWgsbMWTpmoeRegzokKg4Bmj9AxdqW
 50aCfrPBcqrkPB2aJRquXn/h1D4c1XJCsptbYkfEBUplircXUAwzk+y4mS2dQIaEUeA5oq7Vnd7
 frd6SKdsJ4ttoG5OJLqiMF2yZrG7LdPekbcPXPQ5WT3cI5UE6rQ0LuX1bzv/qhLn4ZsF1pHHa++
 PU9dzFVa4WP9DMbx/MYTc4jTTkFgufy/G4NXQIAtlb8Wu2hizHynzZddakPwIHrbbq6Yff70mwl
 mUdhQArF9xQrMD3HPhYwcjylI1O/m29UtNg/uctdlvKmDGSHIiV0WPtKNo8PL+FUHmdRmr8+e4F
 IXb/TnlmwURN57xcMTA==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1e2cd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=Xzw-RmQiYhs1fFvV6_MA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: ps_WUNpZHsszdUQKwkYF4sWCGAyc-Lru
X-Proofpoint-GUID: ps_WUNpZHsszdUQKwkYF4sWCGAyc-Lru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_071215_521927_24D211BE 
X-CRM114-Status: GOOD (  14.18  )
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
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]


> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / dp altmode in hardware?

Konrad

