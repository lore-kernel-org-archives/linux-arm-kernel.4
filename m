Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E2cPMyrM;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Px7FysZ0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X7v2LWAu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=; b=E2cPMyrMEl49UC
	MV8IXouIoTkOuSFKzoBR9YH9xk6Y3ECDclTX1en7kMJSqfYxlplwUFipMTIxc7e6gQpVMcye3/4MX
	bklAGOF6ZB95AJ9BBLTCkGgYJrmBCGNTGiYDxAhkSQhJ4BVkKmtIT59cnMh5E/G8pW6Liy1F7GNXo
	KtW/zumGvMq47p0VExgabfYBmc3BPvx833fr30K2UlDhkYJAmgFZ682g/29s5D7Q5Fff/hjM/WGM8
	YigWjL6mlc21bSKm33TLXIe8L474u6hUHUzXX5KXKXiiDJYzBbrEiGPeUv8DUGYqolnHsRXM2Fv6J
	/1q9alS6MyKerQ0dh1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaMm-000000023Zv-36JR;
	Tue, 10 Nov 2026 01:09:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaMj-000000023Za-2pGC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:09:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jHNM2474766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=; b=Px7FysZ0MEyB1p42
	YwwdorVfIUZwtRGk5wcyOWnl1KQ8OzUWiiOdai/ABaU4EqQB3al+osZ0gWnEgQDK
	wPlgwV2cnhf9m34vPX38E3VtudabuDgtZFGdAqUiqfDz91Y88w2HHlOigXS/1+xr
	6WMBGYsgGkWIgXQ5TUh3OQv3OlxPSX/vRUpISq5YFD/WU+OiSvq41kaErdXas6Q5
	MwX2h380INakGywuEpDJEXpFiFbZTWnhJBa4dNbniLFUhpG6IpFFF7m3duQ66VAI
	euqjjLc1DrFV3AKRZoGmqKijWh0sXFLXknnFe9Bj+xLqiCMOvHHBRz4VzqmUUxgO
	O2sFHQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0ys3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:09:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f84753b43so1086247b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794272975; x=1794877775; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=X7v2LWAu4D8s4FJcD8G4QcgcOWnNQrI2i19hdalkPH4fo+8ZOkw3gRCH0F8ac0bC+8
         hm+sBkw77q56APyye83cZNtkY3Xjn2PekiRu5wXED3LZAvVs8NXiMw0hcnYNEzq78RXP
         Ltt2XzIAEuF57R+1VgSzMeRnqWN/55aAow4SRYO1OelL90cUaZNsWXGuB3qn+QeWfRkC
         VGvCdGNED6BN9/OIwbBBSkw61zG2GXW9KicGju7nN3ffRbC2Zl3bWOp18m6K6JdTljQp
         ZVsZxBkiISUjH1BZO/9PEdU0lndsm9tUr8kj8K5JTZjVAgY81RtSPKzEQAgYokHwW27c
         CVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272975; x=1794877775;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n85Xlm/7B1FojUQlZFdWSNmevhZsF19PWyww70IK4II=;
        b=vbkdLyzA/4zO3whGeZm6G1mbme8M7iSxqU5ntYD5lhEDKIQtZev/9dGvXCTwwqCv4w
         tcWiDG6lQ3Ra9lgScBR4iTex4I1+HaRAwmv4/4me4j/CKaHDxNK2jJ6hIvBUqr6sgP1C
         gtfUffQY3FZUTXpgtKhiz0rrku9J/3Zl6M0dytkQIibyBhweLQRoOg5uSRmSWwQd2Vf4
         O64wdK2Rq5DfvgoTauchuOoNmExem56b+LOHWUoEgzPWMLjsUg7NUapr/0YD93UHRcuk
         ZGrAc5b3aesQbkL8WcugJSbori1VhDTOIU2vuZE5u49AJayTDg3Dx1mU4Cn+TBy+2Zdp
         icKA==
X-Forwarded-Encrypted: i=1; AL+hErGSpxA9LvEoRPCjIvEJomceNXgUQP/8ArxESH14tpMa0J15IwO1j9K12U5TVMd5SyiCoMKvyMwfdcXRCdceHc56@lists.infradead.org
X-Gm-Message-State: APuU4Z8qenSucFff1yFxseREevVv9O3Kp57LoBZepgvW3BlBF3J31xVh
	TAjN6S0bGImQb6F+ZHgM/21pLJtPE0JVaIJqWIMk0+Uc+wIAHhmAqldiLKItT6M2ne634HdqOSC
	9xPzmXXEs2z+fuDIZgqt/Nv4RV+MBgAlZxdO0/l0NVMv59Gq65yj/sPFohMxpuUayelVYB+jbgS
	Onsw==
X-Gm-Gg: AYBFou29DmL3Bqd7JFJg3dHI6tYkLZjtYnzi/NebCE4Cgr+sLw4aKZvUHgGCEBZxIun
	rDo2lXOj8ZXLyAwRy4xtGTGl1ZnjSPMigHlCMwpZ1DgWSnwJZQfU3xaQjAwb++5Jol4KbLo8M5G
	BL4bN4L4MPQYnAYGWpB2ZimsniI7dVJ09dauS9wmHlpDGbgZTeyhEwbEOOzZ9m9ofoD9po674mU
	iRqO7smEn09JgW9mXo0aLVu0DizRddCmr5CAnpuxkHaAls0PCYcD32f5jzK4QB3JhwunF1TnCwI
	LOcd/Z5y9ZJNIC4KfZZhAHaIi6w3djN26XcayB5mmUd3XSSr4HdVOvM8WlEyEGtEVZsybTu0avR
	WWQ69W+cLR/ROz4i5Q9ZgaoN86THsQl+EnITLZphbKqX7NrduGmY6YJ4hovyWXBpNRBt4mA==
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173075b3a.38.1794272975507;
        Mon, 09 Nov 2026 17:09:35 -0800 (PST)
X-Received: by 2002:a05:6a00:464e:b0:89f:9ea6:1dd9 with SMTP id d2e1a72fcca58-8ba864bfac4mr1173013b3a.38.1794272974879;
        Mon, 09 Nov 2026 17:09:34 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e25esm246899b3a.37.2026.11.09.17.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:09:33 -0800 (PST)
Message-ID: <eaef1b2c-687c-4dbb-a50f-a40ef1c72f8e@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:09:25 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
 <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX5eyUF9gVIqqi
 7GkQLfarg0fBHZmBNJn3mUF/9qh7g6trl1SwKAQLK6rBu++wLcD5eoHtJ4ubsRHi+EASuKH9ft4
 E9iWIcV31ffmn9rLLwlPF7Yz4vAGur2NzuUYs83ef5KL08jOzjwlKEO015S9r+zz862YEJVNik/
 jqFnabW16dh3/huC96JwrzUzKV7uf9FtQ1hYmxNP0ItYDTHN7UnH4Q5+53V78bqfQ+lFZouT9y1
 x1z6ec+SKtpt8A4d3JanadkTNx19x4ad9Kpa+iig2Wg7GAA6FIaPcpxK+kqkNkdTbrJuUMYJWtF
 ebwj54lBINnLPBcWq1ZrXqNEqbXHJSilbGvTV6yF4HgymewX68e57MfM6HgojbUQQui2lokyXtG
 VpP0abEvNaSEPA/+2wZqpJkj28dtsAo5LcYyGVmERNComw1yXr26TPxC8BkyPQnS9dk5HYZNa4t
 7oAD/JRKobEYQpJxehQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNCBTYWx0ZWRfX+rW3oZkrI8XW
 ZszSQVl8Z9y7Fbz8h9VNL0ss1cwQDSyWw/Kb2Ws6oTB5UDXDaOSw5Q7lDCsan2HAln7SXNPutFW
 myA/7kOr22J4wkRHgMuCjS2VxrMc62I=
X-Proofpoint-GUID: 8nUIMLr_bO-k-cI-ZVEGiSBwq1wb0Bzo
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af26ed0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=MgS9wdN22aEW9VH1XIcA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 8nUIMLr_bO-k-cI-ZVEGiSBwq1wb0Bzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_170937_882571_22D0045E 
X-CRM114-Status: GOOD (  19.63  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/2026 6:46 PM, Suzuki K Poulose wrote:
> On 09/11/2026 01:25, Jie Gan wrote:
>>
>>
>> On 7/10/2026 10:38 AM, Jie Gan wrote:
>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only 
>>> allowed the
>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>> forces the device onto the AMBA bus, where the driver must read the
>>> peripheral ID from the device registers during probe. On several QCOM
>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>> never probes and its trace path is unavailable.
>>>
>>> This series drops the "arm,primecell" entry and turns 
>>> "qcom,coresight- tnoc"
>>> into a standalone platform compatible. Without "arm,primecell" the 
>>> device
>>> is created on the platform bus and probes through the platform driver by
>>> compatible string, bypassing the AMBA peripheral-ID read while 
>>> remaining a
>>> fully functional Aggregator TNOC that allocates a system trace ID 
>>> (ATID).
>>>
>>> The series is organized as: binding first, then the driver support 
>>> for the
>>> platform-bus compatible, followed by the per-platform DT fixes that 
>>> switch
>>> the affected nodes over to it.
>>>
>>> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
>>> "qcom,coresight-tnoc" a single standalone compatible, and updates the
>>> example node accordingly.
>>> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
>>> match table and renames the itnoc-specific names to generic tnoc names,
>>> since the platform driver now serves both the Interconnect and 
>>> Aggregator
>>> TNOC. It also restricts the ATID-unsupported handling to
>>> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform 
>>> bus is
>>> no longer wrongly covered and correctly allocates a trace ID.
>>> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
>>> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
>>> fixing the probe failure on those platforms.
>>> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
>>> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
>>> tn_ag_* endpoints show aggregation), so it should expose a system trace
>>> ID rather than being treated as an Interconnect TNOC.
>>>
>>
>> Gentle ping.
> 
> Apologies for missing this. Please could you resend it based on v7.4-rc,
> as this doesn't apply cleanly on coresight/next

Sure, will send v7 to rebase the patch series.

Thanks,
Jie

> 
> Cheers
> Suzuki
> 


