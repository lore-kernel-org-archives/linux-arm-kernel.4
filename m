Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC44606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 01:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AKL1S2RX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTh0kznI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F8xqm18u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=; b=AKL1S2RX+R4Llz
	Z5E6CkA+oIJry6i3x7Wr+V6A7UZbsDUSwnNkx04H/lE3MoW+WXtkSmDU2b5BJ97odDYC9W4N01ZJm
	TWRmmDnO2IsFg6kI7ylpQtcF4no+mrwqCUsYJmiCdfL8d5kuMs1XB7DHklnFNaKHjfXzcI7agLKId
	p7X3GL0Ax2C/3zWlnWpr9K7RryDGoixDMJ+MVbd9I30AZqTQVmVnrjvQnkI18TYZUJpE/29PdKDky
	jRX/bgrrV0r5QMMRdZhylMUMGKX5oNLdF082I2AdtVBY1g9PHHPD21mo5M0XX7tMof64sRvjHvOOf
	KEtwrYOgoNSG+yVKU6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQE91-0000000H2hk-1Jzg;
	Mon, 09 Nov 2026 01:25:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQE8y-0000000H2hN-1rId
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 01:25:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90H4d03503203
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 01:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=; b=eTh0kznI3YTFuB/b
	TYV5wdAwaJpoMl8Qq2lpa7xXNb8fpqcKp2040mEU20Bs4/aJTz4BBYPanA/l/nht
	cwrODVPUjqyIGPO3NblEUM91LaObZraue3uZdjOUHoEIkQ3DpUD87VTIeIMR26kG
	00/SwtyMl+/q56NHDAJDHQwwWadn7/NaNX/+k2DTw4BmsZV5tM2bLRWGPNMSKdhr
	owJgenAn54eOm5PeYsM1ltvAjWB61hAz2n10H5sRIbDNazw/Rwh6etm9wahLi0T8
	Nw9QQxTIuJzLmfABEAxSJXTCvnuqsG4AvLsF0RW9v607SB5KNJvC53kb6UpLXy6y
	KefqLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm10rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 01:25:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed00709df0so3580375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 17:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187554; x=1794792354; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=;
        b=F8xqm18uCSmNgVu5XPGvE0XzdWy2nPpjzC3fr2Yif59mF28w7nDmyug8RtebiTw6Va
         8q+T4T+eX+tqmlJXeqLQc0D/6uTD+/gKIMJKcy6HS+TlANeBOx7lkIYSh3dbCqdEEDyL
         fqKXGtZ0uTengDg+0ZzRHYv5tXA6i6pfIfLbthD+ieSJc7YCCou3qAXyYn8P3Z0P6fx/
         WKiidcVm7AWr83Z0rKb9G1PPkL0UMmYxtMkc4zld5//1m4+4Ta2bDvHz5tPrQr++0W/e
         D55v13J/t3Bm5de4Lxbw9H0joRzpUpuusQ1b3IeLoK/IyAlz3AHQ2j/S4dGrznj1L40P
         CdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187554; x=1794792354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ggae2YD9A2NkAaxa6z72rRnbc57aSpVe8w6dQxbQmQ=;
        b=Xodd1tRlh6O+PtIi2mfsnJD27f7z9egBsCJajL8aZ2PXaonTToKwgefRwfUFTVZ7Sz
         2uSA0GRgv2UZcPsjr1yGFYE+JANDbNaX7cVe45Hvjmp9mbSvFekr0LsRUdm16h2OoEt4
         pzPyMoLWn3wPT8Tr+7wHam3s/TzZ8Kh70p5pvnD6b7BReuys2gINlIt93VfmhAA9W3JL
         BjSJ6CktZe5Glar5QvBBzEoRmo+zEhqi1u8mE4kEIvZ9Ga+9HFJIHb6dFM4heNjLLCcB
         Ac3SIP3Tg8MQy7lBqZwonCCv44TFkD4bVpk491YgcbJGFeNv8yO44jKAJ6ODSCKK3W0y
         JjRA==
X-Forwarded-Encrypted: i=1; AL+hErFZHs+tWIqCKgMcny5yfax2pNd/rTWLsraaGmqqfi/znsCBB7rHyGTNo3zHTJ4dpbjbzj17WpqaXreqmRUk8VH2@lists.infradead.org
X-Gm-Message-State: APuU4Z/BI+w6MlhEarduUVou8UwTqpbkfatN2HfvxI4DMHQzirrpNnsv
	/JdjhsSvbfENAnLLNz+SRgcdtKFAFcjN6JYfwsW1Bqw+a81yOgCpCHo1OJz3ra/JrJZD/gYN3/w
	k6PL0oiDzkDDYAc9wwy5pLOyOsvR/sxF9jWTpHj7g67A/h4KFZA03r6eSVVsAL61s8I3eE1booc
	P6Tw==
X-Gm-Gg: AYBFou22jwm75CZkehr3mZjtkA28PfybmMUslxai+XU0Xd0MO+PHhathzxVD/5Wv1RM
	JSB5fNQ0y6QxHHw4hdMI0lAxQwL3TnaPLJTD6nyLXyX1+f1KYxaR23IXadhqMXJQbh/HxEHK5q0
	7/hBWd5KhxMhtTwY3JbjVj9+sK691QoYIqr+mFCPtVIr2lNWEfIqe6hUznzLO3a9B6DNZQqB4Ve
	zGkGtqa61eCi+l+PPIJOGMz3PByWtPZ/kzVezyEOytEVOn/sms6L3FI1wgy1u5Z/bmPa/DUvCYc
	QaEM81xB6EeGjxxyNbNwGrpdoxZCDob98bIFjcFrsgOvA1iMcYyw1omI79ckhUEt9wIlUBy9wkC
	/inANZHwOmhw5t0MYZxs+VeJWDsIMCgN6TkRK+COn1iuYBxr3vlLSM/d2vnDJcZRAqDQS
X-Received: by 2002:a17:903:2acb:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2ed83777151mr25657305ad.38.1794187554186;
        Sun, 08 Nov 2026 17:25:54 -0800 (PST)
X-Received: by 2002:a17:903:2acb:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2ed83777151mr25657095ad.38.1794187553703;
        Sun, 08 Nov 2026 17:25:53 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed817156e2sm6149045ad.53.2026.11.08.17.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:25:53 -0800 (PST)
Message-ID: <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:25:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX5/vAi8qBmyd3
 UgFZA+3FF6yVwNBXjf5Ql//4jLsGkqfGsSMgPUnTI3gBReMufn2sVQwNL2SxecVYkc2elYbVTfj
 JemQa+4R31x7SXJHodmOp+/rns8Tyr0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX1T38NZDLvtUU
 +/HuTQSSJijkKQwOoRW7h17LUpdamoB+36Bfp5eL4w2IClJ4RbHDV5k0eecZwRzp32spBNb+FHi
 xhdJ5u5I3Wg1zmq57gDLzj9VELDB1yRFp8jBbbE1U5zwSGwMAgHdH911xqiwQB4F5D90rQ7AMXz
 X+06VogZtAxpoAodL9HCl20KJvqbvpbUAcgPC9FOFz8ngCmPxhv7Gl2fUaUMb4IFV0R3Ff68RKR
 mcnuBYLgj5Qh+HIuZb9znA5hcdPNidrvA4IG5Tcd1/TZOsNoGkxGDUWlsGZuUY4n2IxRDwcLMls
 VxvEIsJ38vYPdnjKLfSatCNPtI7Y9Qj1lfD6QeAOObp66KjSCtJ/OIKQSpB4NeTJT+zbxWMzkUv
 BFq3dyD2n0orQlROordn5FWwsyQb5WGsQ0QeKAHaXlpbtlscl/AE7ahEYSJn6eH3ozT+Fs1x7Cr
 6x6JiLmtdpN/H+uZ1nw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af12123 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gx6qCTCK5MvWq7IvBM0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: AZDm5eeXOe_yXGBFVMskr4Lerx3xGino
X-Proofpoint-ORIG-GUID: AZDm5eeXOe_yXGBFVMskr4Lerx3xGino
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172556_605475_48F54F52 
X-CRM114-Status: GOOD (  32.44  )
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



On 7/10/2026 10:38 AM, Jie Gan wrote:
> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> forces the device onto the AMBA bus, where the driver must read the
> peripheral ID from the device registers during probe. On several QCOM
> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> never probes and its trace path is unavailable.
> 
> This series drops the "arm,primecell" entry and turns "qcom,coresight-tnoc"
> into a standalone platform compatible. Without "arm,primecell" the device
> is created on the platform bus and probes through the platform driver by
> compatible string, bypassing the AMBA peripheral-ID read while remaining a
> fully functional Aggregator TNOC that allocates a system trace ID (ATID).
> 
> The series is organized as: binding first, then the driver support for the
> platform-bus compatible, followed by the per-platform DT fixes that switch
> the affected nodes over to it.
> 
> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
> "qcom,coresight-tnoc" a single standalone compatible, and updates the
> example node accordingly.
> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
> match table and renames the itnoc-specific names to generic tnoc names,
> since the platform driver now serves both the Interconnect and Aggregator
> TNOC. It also restricts the ATID-unsupported handling to
> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform bus is
> no longer wrongly covered and correctly allocates a trace ID.
> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
> fixing the probe failure on those platforms.
> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
> tn_ag_* endpoints show aggregation), so it should expose a system trace
> ID rather than being treated as an Interconnect TNOC.
> 

Gentle ping.


> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v6:
> - update commit message for all commits to focus on describe the
>    hardware itself and the hardware issue we are facing on.
> - Link to v5: https://lore.kernel.org/r/20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com
> 
> Changes in v5:
> - Drop the separate "qcom,coresight-agtnoc" compatible. Instead drop the
>    "arm,primecell" entry and reuse the existing "qcom,coresight-tnoc" as a
>    standalone platform compatible.
> - Update the binding, driver match table, and per-platform DT nodes to the
>    standalone "qcom,coresight-tnoc" compatible accordingly.
> - Rewrite the commit messages to describe dropping "arm,primecell" and
>    binding on the platform bus.
> - Link to v4: https://lore.kernel.org/r/20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com
> 
> Changes in v4:
> - rewrite the commit message for the patch 3 - patch 5.
> - free the allocated ATID in remove path.
> - Link to v3: https://lore.kernel.org/r/20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com
> 
> Changes in v3:
> - add standalone compatible for AG traceNoC device, allow it to be
>    probed with platform driver.
> - add fix patches for sm8750 and Glymur platforms
> - Link to v2: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com
> 
> Changes in v2:
> - address the ATID issue reported by Sashiko.
> - update binding to accept arm,primecell-periphid property.
> - Link to v1: https://lore.kernel.org/r/20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com
> 
> ---
> Jie Gan (5):
>        dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
>        coresight: tnoc: Bind Aggregator TNOC on the platform bus
>        arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
>        arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
>        arm64: dts: qcom: glymur: use Aggregator TNOC compatible
> 
>   .../bindings/arm/qcom,coresight-tnoc.yaml          | 16 ++--------
>   arch/arm64/boot/dts/qcom/glymur.dtsi               |  6 ++--
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  2 +-
>   arch/arm64/boot/dts/qcom/sm8750.dtsi               |  2 +-
>   drivers/hwtracing/coresight/coresight-tnoc.c       | 37 ++++++++++++----------
>   5 files changed, 27 insertions(+), 36 deletions(-)
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4
> 
> Best regards,


