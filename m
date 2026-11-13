Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E1B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qUnDJWoW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kcECb506;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KDm/UVKq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=qUnDJWoWQaXnKb
	zk1faVybLAiQ4vscSXr2xiMOYg2l9KlkRh705a/IVsK3KYQ6VUQ9SHWBmsbeWKBw7RRlRbiAv+vB0
	FdnFMdEXVeaMVJOrzoJ5AIpM/FsWSFIbpIA35B8V0eIPwm8kfHNjUdMHnmWBF/r3WLEkDWogHOist
	tZrsT073r5NmHu2V9uiLE+jFOmM+gwqVRoyWcSwY8egUmrigTA4lDrdRpmPYbMKfVjtrgS3mrocIl
	Fob6Gwt++ywEsSIAoaTuP4IVwQlfI+udJ5zbgBod81sIVkX+z3HiKj69wVqUbXDRpvQZBLr2MAvP7
	JDOD62hplSd4zHUSWmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq7d-0000000CfUo-40ZP;
	Fri, 13 Nov 2026 12:11:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq7c-0000000CfTz-2fmY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=kcECb506EqLqtS1AkZ40tPaUh7
	iLL/7AI/xM9Ffz31W61Wmm6WXZfhckE8PGTSDIQzwJHLRqkX1C9Ut0ajkirC0Ehq3JxqoJnLhCgSg
	IjQYm4yNj8SyrHL9O0eGvXuUfvEdoLPD8X6oJEuIw/hjFISMUItztS3ll6Yt4Y/7DRQb/ZRZjSzJ3
	yn7bxfHxf/HcIJsN5gmCR/M1MovHpP9AJn29/sDAaadEkH/qlomELZVWZxZMGV25CgzqbrB/YMwZI
	hrpUlci3SGyqDIrWicaKMDJ2PIgAyZlKbw8arYRq22oLpwdSqDgfZjlcPQ6Xj7U4RZLX6XEPVpITF
	n9mAziMA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRq7Z-0000000BDY2-32GI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 12:11:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0jDr632013
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=TEFiQ7CgOeSRnQW/
	Se5AoZ7dU6cjjcaKCcUCdHvC6glfYOpUgtIi46FqA8lPXUVJgojFjfTr5Twfu4Mp
	CQbbN6g6pHf3PwdXgHahKEHyyYCJvFy3uK1ZrPlHyfhXCDZPXP7l2zI3/X6YRhr9
	P4cuWfILX/CScAZSIlXC+90djbPnxUYlMfurTNDWM2n9N5nRSr3Zm+vlX3pnFWhZ
	As8+Ov7kfmMtzFJB0joQo73uFu88E+LeiTT/JhxBaznhr2QHYE+waIvCpoMzvaU1
	mUm3VHg+zCXtMTkhyvJzq0nOEheAZ9Jegsrr/fM1r+Ndg83P6CJP2LKdzamirrDX
	+ZsSTg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufj7pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:11:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so47367e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571862; x=1795176662; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=KDm/UVKqofpwxXNhr3fXyTXt5sSvIj4IpDnNUy9Ge5LXDbkOHxcmi9bb7t9/QpPfuT
         ql+T5R/5uBXh2klK352fS3kb6kix+dnpEzmW6DuCydyZscGn74kns883tTzGaiB4s1kh
         NXXXlH7L4AzKm8CCmrR+1bLjeCLJXk/lK84wUOVes1clpumApxYohEhQsLA3JqSwEPQo
         nZax2XUyweFl+SqR1Xz1ja/7YAqkt9ykIF89e3ryj3Jvvo7LtTFDt3K3Ua07AiYRVy2r
         vDK5z1HZJpaMfvy3totiUqDJWR9sTOcFx753GrZw6/tjMAwHgpSkzisp1/4foKCR4TsG
         AKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571862; x=1795176662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=bdFWAOzIyrpN0ogCAICnIP/1lg//0f/yMKypkByCF6UwcFX1cWURa3lj6GmSQQ0LkY
         1XawwIt7l7BBcS9AF03XZhIz/lYBdGUcl7Szm1FB5Co8l/TMiyHDAROB39thk6jUoDwk
         0vr937Vu2+D1BEEhfdjveiExfbAjnzigzO1WNMyB/MMAuIhbsPof7lGo1Mm2z3hhduFT
         ViICpCs+p0NBc074+9SEkbU0BPdfEwk6Go36j/OQM+E5cQaxiFHA8tCE2Wo3UoH4hiIk
         ByPom49nB6I/fFl/wL7fAGNh6awnIGCHuS6Ip2ajX/XK4zZ7g3jGUEtiV1VE0DGezXTL
         YRtQ==
X-Forwarded-Encrypted: i=1; AL+hErERMzcc0sMZMwn7EJOsgR0VPNkda9LtHP/t6nfssJVwXmJp3npEYiix5qZnqVq5mALFqiAJ1OTYAlV0LsS2yRZW@lists.infradead.org
X-Gm-Message-State: APuU4Z9uQk3f1xp/3jwLhHVUlayRECtc1C7gaF2DyGE10IKgnTxWQqi8
	XEe1l6hGlzimXhQCNKkxiHFKIwxEySHRVaNWejCAs/PS78vh1cXKOoQTkqe+CWkh1P1Qabz8yXz
	9dIChq8eHQIVmolqMWGvFF4LE1XymiWSqi6mjEoaL281WZ3Xx5ZtZAA6/CTCH5bhlIDbLDQrPfV
	9bCw==
X-Gm-Gg: AYBFou0IfFaVMWVQjrP7gAPZPptywMR3Di2Q/VteYc56nbGCOU3WofrJkTRZJ3daGKd
	zlXFIVF+rtEChegkm6RX0pxHE+yM6rM7e0IJnNcd98LHQ1k+JnB/46Wk1WQPF6zfhymWJrndXku
	zJotAB6KO/UM/5/f3fJ7r8d+/ne+JtN0Si9OPILIFLtfE0Df1PXpuK7g4NwYC/pF+KQs6VikZP7
	WUGMVosOQ29reiazdv2kFdFSTMwQwyKjDCi8zSYZOioL7Q1W35PIY8NLiXkvqnacEA/szhOnZIv
	nQguviiayTiIaA4y+MHrPjDL4jlv2Kh67/dnfYA4TtqaIrSnz32DHlNm/n2famVUdWzH9L+msLL
	rXptaO9lVC7owgyd2XRL3CJXMWmpp0vqVX47BDMEhyqw2UZ46nTINx9TyjsBTLtbQjyqicqU=
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738734e0c.2.1794571861723;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738699e0c.2.1794571861279;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm86814566b.47.2026.11.13.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:11:00 -0800 (PST)
Message-ID: <03d75b49-dea4-4736-a662-27ef64682157@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
 <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
 <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xDQIjBxr5gTOVAYBb5HX6HOIkQzpL6uo
X-Proofpoint-ORIG-GUID: xDQIjBxr5gTOVAYBb5HX6HOIkQzpL6uo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX/c0AM0HK/yOs
 V6keR/19u2lRtTl3qFTLs7bGbXzLTXxfDbqisMwCHrN+0udEo1wDJodq08TWtHIlR3K1KJfgZaM
 LbJLgSy1kxYJsyoHYdQai79SC2Z1Xa3/OvFXeGcv/cbS+pIvhtiDzj6hgpC8ma+Ess8ZVdbn1kM
 9qosODeYNDwC3YWhqtwrb9c7JQGZAYKzV6D/qtz21CFSDK2boAUADM91TYoJqhf0JhKHozCSiFw
 rampLdaGbtRFWI+KKoXk5kQls3s7WV1SIQs7QLr5/uXek7m/bgS08r5NMPAMPtpmfqA/XXP14+2
 p0gfcde7LatLLdKS9GWHJ8EvPEi8R1MjtAJvujc4KPO03270j1JVTQxDIq9hIxOhBhO9AuMhrF4
 W9xsgS9C2RlwZuFVms82QQUZfcawVgTs+0sW3nKpmx0WaRKarWvQFJWBlc6KdBKH5FPsKZRdXEP
 80Sribkfx5hRD5uHemQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6fe5b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VS6XN_di3_qKZAQ5k78A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX/Nk+cdKYq+V7
 fywpgC7uK2a2AytFEDhHk+F+dmHL4O2nif4LH4+ytBUpczHWR8ukwNJe7FrK+2w7Neb20dZEhj4
 54yd4k7go/tU5F8gn/R7v0kTdnKu7Dk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121110_071128_81D0C40F 
X-CRM114-Status: GOOD (  14.59  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 6:04 PM, Stanislav Aleksandrov wrote:
> On 09/11/2026 16:12, Konrad Dybcio wrote:
>> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>>> +&usb_1 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / dp altmode in hardware?
> 
> The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
> port, I just haven't brought them up yet. It seems we need a new driver
> for the Type-C controller.

OK, we can do that incrememntally

Konrad

