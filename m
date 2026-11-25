Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jD1wRylp;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fS3u3tCB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUSyvDQs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=; b=jD1wRylpInR5nE
	wJjIK9Ys0DPPlZ7UKtyJIUqSV9kMaTyRxlwZbPsaMNJVTpNfT+WrQOoDTQ4Ggx2d6Su+gWw07QS6o
	3u099wJGj12nPIWngl0XkAgt7/GLfVLrQDEwZKNNaNeTZuUE1mgMKUJoDAcqzQE8dk7bguwXxGzdL
	7cPHCnliD4oa0CV7xePX4aEjP/SIJGDQ7I9Lh52RNa0RtUF88X7hXyUsEJiShc1ubC3KxLMyyfl5N
	PgUmaufUep83+tDkH8ffuHJOxYFOlneexFjY5VMydNEF1d3x6GifWuD9owfFhAdiaB1nZ9020A9gw
	TrTAbJZLFwKZEgyufadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9xD-00000009Q2P-3Bdh;
	Wed, 25 Nov 2026 10:10:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9x0-00000009Px7-0kei
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 10:10:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mAFu115101
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=; b=fS3u3tCBem8GE1mO
	zsb3vErqGs0SV7AlWHyuOCHCcD//RX8nP58id7K2s+ehYJex/U31fFH7d0kHa62U
	KkLVxXfyvK0nhEDJbZuJfrbHb+iGfODDtRlj6/CqMCs+WpUxYGSnonHaxU9pSK9i
	BJFtS3uBtSiVZqvQhWtfQe8Cbe29XpIvISv7l5qzJBX8Ld1CCEhckqSJ01Qy76hB
	10OTWRG8ALtwpT9tR4f1mqyfU+bbtQAOlPtJJawtlp/4HFGtXq+ti+pQz2UhhNQk
	A/JDmRhSvSDqdOjO5VV3QWlEQJAf6MVnnWLoU+I6tKWOnk9RUq7b4LsVMXEoHaBt
	Xi3gsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkc9jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:10:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94993a54a73so50176485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601404; x=1796206204; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
        b=YUSyvDQsMqHeve9azVU0finUorqkqhdKrviXUdzrT/TkS9ZRd+lQOBeWgcjY0COWTf
         tQ5X6sGDjl5QcWeXrtwMWOjondsEWdcfJ850UKxd/E02Ux1AF+qKO3Qlb08aSTbgNmoL
         AohC1RZ6y48twsNHsBm/YclNACuSN8Ps0Uf6XgiH7mpCFj+/RMstlcoWDaPfvgVSRiu6
         gTyhng0893c4tJndsQqvRNrAtVJElvV5XEBCNEdX8Z3yJSo99IHPlWW4r62zeVkIB0OH
         F8Sj/77YqnKi7DARn+HzzTmF+mYG6EFjD1XSCF/qYxFsRy5m/qtscMj9InWlk31Anjs1
         GFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601404; x=1796206204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OU5JFLWRxxBLW3Js1yGWACITsN/nVqJUpunNXdZEfU8=;
        b=pkN50uj7Pqb8Qk463/ReFnfyeKTbagO7mHy9ScmYyxQPXotjamrs8dOvgFfY1LlP/v
         4k4qiA0cOHsZc3Yjpw2yieAMJkobehuE9cQMoMBG/SvziE4ywrDTXuxZpBEcV4UEVcA6
         bBi4udFoN/EHP0QjsEIGVgxg52ExBGZiHxm45e+D9CdhMBdN20paLU/+xc6igXoTrbrW
         WCh4epGK8MapI+0+ozQq88KKLP5hPaAiqp03zVvt83KUrT6/DCxKLVWPpxpDizj6xQa0
         Fgs1Hhiwb5hJNlQVgzzpLKCiKLkWo2B6fJCmH7QlpPHRDE6PmIkJCUmh9HWPlvP0H3fJ
         lDcg==
X-Forwarded-Encrypted: i=1; AL+hErGns8xtQ5zm22fn4J2Z7bYeL9oaDQ/xCmjjbjLldcILX83mYHT/lFwsEbJMOk6nJdV33DJBNniFI7DQKN3lsSKp@lists.infradead.org
X-Gm-Message-State: APuU4Z+xGG9QUQYysqJbBAjqPinHSw90SGBTa1YacytKKtk+FqSkLoF7
	8+7TtBJHKlnf3MPaTT8oR3kaJNuUaPyMB+7mqKtpaNLXqL7k/NHdgdp9UEKBrUgNzjlNobep+dy
	feUwjtY41famOA68fizBvge2z2HF7u5WcwrShs6gb83tgT3W9IH893js1BjUfBOhMMFoJ/KQr+n
	6bLg==
X-Gm-Gg: AZFdTZev0ZJtCUpBXp7NFPc88I8n5HrI4ldWMuiauIv30Q+mwA3rZ/KSSjDuraLJQVJ
	WYtkbmsgWscQI/nGDZpeXADohe8UoRfmvIeaTh6YXfJ5wkdelp7lAe0KkschuGuS601EksxK4o6
	6IL0e+hus8uRHbtnGh1SJ9dwBh4q+WxagP/i2Eei4yHEyw8kZQHEsLDkv/tTj1FvtE7xlfTiDm4
	zACr4L8OF8TgCSJZNHSYeXHXEAcZ4VjLp8mVqwCx9o3QDVscZyvwJt5kGfv/EDkx7NJs1q1EBDS
	XJzF+ure3T7xCp3kdF04WT8snCnU+T6PD4zkIgaeRMHsmXKAF3FpGDUJUP2SN58HK8UMqxBTlio
	ZRGPLjPaZmkHyL5vm+mEJ+AB6pWFZ8G+BezOpJGp9aC4VjqUTmVUbTsxnDiyJ8TdBMhoJ/cI=
X-Received: by 2002:a05:620a:8b8b:b0:949:5a32:af48 with SMTP id af79cd13be357-949ba96eaf6mr2467778285a.3.1795601403653;
        Wed, 25 Nov 2026 02:10:03 -0800 (PST)
X-Received: by 2002:a05:620a:8b8b:b0:949:5a32:af48 with SMTP id af79cd13be357-949ba96eaf6mr2467773485a.3.1795601403027;
        Wed, 25 Nov 2026 02:10:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb34386705sm167817a12.35.2026.11.25.02.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:10:02 -0800 (PST)
Message-ID: <3051b140-e9e6-4513-a400-d4d58be8be34@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:09:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-fix-tracenoc-probe-v1-4-0298dc5f05ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXwtfT9IwJovdO
 iAst8iRUu/+EbDxYKeuuOk/LCgoh0yqpRKOrxg8ihwR3uiIZArhbI6CdaM5ycW1HhGaHRCeSBja
 +mfGaEMm1j5pZdsc5vupD7SqClt59nf9NqzOPiSPen9ql4WiRo+xo8Tkm9k5IgidKvyRCSfsP4C
 dOMJ095YYm9kYDkev6x7gYSxcZvCMeBCqWtiMsWkzwxdlEsXQroJhnugkddEC7lRGC+uKwzX+Ch
 /NVmtDCkAT/tSY8HSvpI83jOU1KnNi+spCPTPSBrKSzJJDxe3FFT2gYyqlO2FMJNSgZcyuXSOEE
 mVwZpzHaacqZUSVjwN2vjSm6ucD9Vt1HqEwVRYNX7b5Zwkrj8qUzIHkBO5eOw8Ej22XVdyhxlcG
 BhfgoCjbdOE/acP2JBebWkbxhWDJF2J9twpbyaV/3fHLKdekx1sOvhchveJe5BCIQUmzQYCHFx7
 Cbv7onocrju/tkOvYuw==
X-Proofpoint-GUID: LVGWtMe96PzMWDZLom3HPm4Os36a2_6g
X-Proofpoint-ORIG-GUID: LVGWtMe96PzMWDZLom3HPm4Os36a2_6g
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06b3fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rNxy-IUp7fSqA_O6V1UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX+VUKAXhFoLgS
 1TrJplJoVMduTC3YpT8bZYsZ3c42hvsNXxADBLG+DgB5fVkvG2MQzD30K9tZHNxuZabGYp52J2+
 YHl+QdokgXt/xAe47so3dxQkpN4wvhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_021006_239386_7948E637 
X-CRM114-Status: GOOD (  15.20  )
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

On 11/18/26 8:01 AM, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> Switch the node to "qcom,coresight-tnoc", "arm,primecell" so it is
> described as the Aggregator TNOC it is and is assigned a system trace ID.
> Rename the node to "tn" and use the "apb_pclk" clock name as required by
> the Aggregator TNOC binding.
> 
> The Component ID returned by the hardware is 0x00000000 instead of a
> valid AMBA Component ID, which would make the AMBA probe fail, so also add
> the "arm,primecell-periphid" property to have the AMBA bus use the
> specified peripheral ID instead of reading it from the device.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

