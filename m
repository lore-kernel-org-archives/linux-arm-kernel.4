Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E317dwrQ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7pGQ2/J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fVPOpKiM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=; b=E317dwrQGAL15gbrcVQwk0q0KV
	RSsJLLnchRSORQBJ1EaPeTHwb+9YHffzgCp3uogXiwP9cfPmQAIijafV9q804b5hjkFs4QKTsl40U
	lMLmVkqY95Ym3N+Bnh/leB8SIKwM+3F26zMsAuMYV6DB2xTDn7JSxhZPNei91U+3htUyqCrj+3qHU
	CMLQcd3X1H4vvlcO/8Aq90y433ADMO4XVigvEwqIpIBlr7qV0uZq3hI/T49qtu44p/iZECyqGauXo
	FraN8/Sy+7hLDYgxQO7M8ark5DmNw4AfoJ+1kWBuB7Qoh46NLbpIEKXh7WkUO73ayKiVjgsTcFtbx
	ZOv+y52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUK9L-0000000ELyw-02ie;
	Fri, 20 Nov 2026 08:39:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUK9C-0000000ELxt-25NX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:39:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fBvF1049291
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxL85Sxg8r+S5/kdCqyPgvf0
	BRmAuv9WK9TtBPMBZAg=; b=V7pGQ2/JE6UEEFVms/VQyMr1yIr4KBvqGydNk7Lo
	osuwTK2rJfPMGognUWHWpsW51HucPpOZqgSw7Jry4gJ88uEPfwuocpeKuXcO2u6q
	kQfm9Iu6Z8lqKdaMENXN4Iv3qlbDRjsEPMouIXMs0qfaW97BgBBeOmpo7vfhspaj
	pT+0rWiCg2KWkQPFchTX5uqz4L/QRQO5Tt1CRgXEdE0xwl7/v+uEAib6+kyQ4DmZ
	PDCASnJjtHbKC+7M57rg44StUzwgNzdcazpaSjKmKwR8+Fy3xkzT1/OAOhRYe21e
	25r9GrwGbDjMM1+N3WsKI0eHnkckQyR4IhoaRj1J4MzHFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagjc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:39:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so121464085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163944; x=1795768744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
        b=fVPOpKiME6AaEMjfvjEdyk4yxew0B0WQy8Hw2ifkMWS2ovoAyMuhUqnPsio0yDbmz2
         /5CRBu/4+gkO/uBM+YjXC7M/WdVOYkutH5p0xuNzgEMie1TIHQFTmJkr4aFnTyZMZ1ZN
         FpB+DlOP8FVoTb8N/czVk2lHt1nJfIZY0mBjvaoxsFuKkdLfPiRPD4u3mGCt17A9C6iu
         zMHObtbhh7nxuuAtFIjvjdw9hXKo4FYjyYptk9LRmbdXBNZr/EoV9KBTzbFXWICQtYc6
         ow5rnrWVd6ZvhNLVdCMGgCCQDpkynOxpTl2BxnZzvkN6BA+LUQovITpp4ApUvTvt4f2B
         YK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163944; x=1795768744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
        b=YbsHVU+gZGxRmax/e7JI1LBe5jNG5m7eYO7aC3eGiZ4Lwjo0uOmi5vHhiv3kgjzd/G
         YuShBklgq1sxMzE1No8C9Ggpf8n/MXWEhpurb1kdBzmhL0VE6PIyE7fx8d9VLPPsBeeo
         Iy0fbe6Y/0qtX2oYZQ9BuxkafaCwZ9ZfaSTxxhc3qHVY0iRP055wlJJXvoYLQZOJrtS6
         LM9ObP6weq3Qmykq1GEFpp2eXm+G5+zZIlCP70Xlj5L02rMNuDpnpUJ8z79oYCZM4ZuQ
         ck4DVHXnFoMtjBRf6gzu6Ryrly2r7xe61z1pijyE+SvLXWmM2g01Ycx025B7Vr7nBvhw
         R+pQ==
X-Forwarded-Encrypted: i=1; AL+hErH72OnwAfYgiKXlWdoEw8nGulNaJGAIPvFnQFKCvE6lX3TvxIclCgKlbrqY2oT0Zu38wRZS3ibTDzfpkquQQaMh@lists.infradead.org
X-Gm-Message-State: APuU4Z/nQemRLcpw168csKKDYxnty4kCbw36I05IcKbY7U8PDLsKe8TI
	sY2U5pfsVRbqzfYVGXbuv37rZk2wl+PzSgtRtLRxT7LQVEoOQldJcnnICxQXA4e6e33r69LU+RN
	32UclIqslyfq/YLVeTJ3UV4tiTpQeS2FSrRRadQW5RNhWrKGaCEaXJ/8KIcmRFQTBoU7HA8yR06
	GXyQ==
X-Gm-Gg: AYBFou1OZPSWOfCnrUgcd8i2VhMpBcCgEtEvqwsbb+7nEM+f6T7OnEjLj7Twl4NQiOs
	5uaZ6bx5EYMYg9VagTdGlU71ZZFeeKMHPHnJX+ixdkAJEJa12rBv5xjgXoJ8NBzpeqtdtyuerye
	1Mzv5sCetCyIDkvghvfEury4YKfEJ+lnU86WL/914m2jmh0pGi66R4njKiIykChM++TwinUnz7l
	gMhyYhAL8eZrsV2RdqCkH1UwtNaoDs71kqE8J7TPF9kxmElbKmNzrt8310UY5yorYXHs1FaU5G9
	iTuqEiz8ATsPP2EX4jZfmecNh/hd+dpJ068nloL7DHnOdaEyKNTHVGqCzddY8YbLIXum5unqEcp
	qYjiB4YRBZsgCfiKkvCI8ix/KzkniK1DY885gg+jUBXXk1CNT+pEY3YwtkPlvLK9H
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr379042885a.7.1795163944119;
        Fri, 20 Nov 2026 00:39:04 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr379038385a.7.1795163943488;
        Fri, 20 Nov 2026 00:39:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm4317185f8f.6.2026.11.20.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:02 -0800 (PST)
Date: Fri, 20 Nov 2026 10:39:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for
 traceNoC
Message-ID: <pwsze5zu4j6qplgtncsgohy6x77tomyl3zavjn43jmpkszrunq@p7et6xg6zqhf>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXxEBK20UDCWMP
 jIG0t36ArkT6BmpGFUJHV3coViN5yzoTO5yyKbIdinrMM35lxnj/27U2fEGHpxWSFeVpSLZDUMj
 7wYwkMyrhKnL35d543yJdmxCMVNAEEB/BQ0DVyzzyfdrxpr63TokAhuoTJqk9eDsMVZev54920j
 csp93fLE/niIsYpqyEQZ679M4jDWLLw+zbGYNFSBMd6B1P5Oi110IAarURcEdZuilYna811CQQe
 Sly/LvZmZqSgrr3kk1KnTwngRBbIIYUM71nccUKSgoziE48jfy0U/sDL86/+XZrnY+0SlCJS16m
 dYDpJE6ce5yd7tjKtPaeD82NG5I5BU2yQSr01EouIWSMtuuF6bM2rGKcHj+PmkCBrhD7nb2GhLX
 E/aq0wnKK27okQS7cXi1dsIamSQ8aYFfr9ZdAbQTmEkax6dMGwGgh0JaUj0ZwaLtgIN/7NhVjz9
 LuMx344ShaXNNrZF55Q==
X-Proofpoint-ORIG-GUID: FgYSR-JoUu-s2ExIdeOGGz0C0LEWvDkJ
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b000729 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WMmcwxbHwbnGiJZfeH4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FgYSR-JoUu-s2ExIdeOGGz0C0LEWvDkJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX2h9b9S17AMRN
 x0jcrOvKC3LmQh171mHQTPut+fOTrddpspZaVEIkyt4PsH0Tyq0z98VSnHeP4HJAT95RM0uVTyc
 qagbTNh0o2gIw3oW+RBb97BLYkfFLtc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_003906_547124_F852C1BD 
X-CRM114-Status: GOOD (  16.54  )
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

On 26-11-18 15:01:44, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

