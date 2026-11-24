Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B545606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bjzt2jZc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V/w7y3um;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEkl17pP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=; b=Bjzt2jZceNVowI
	zvScmtzKUO+DcBIvNeUoV5lda0RZgwKwHILt32hBmAmY+P9LQAKLQBoL8wOPnTdmnZYn6DXmt03S6
	DftXk5Ua2dY37vaosgF+kPOilvbn8oVlEeNK9vSZhVSI0kyBWXs+EKUuT6MktmFhuK9ToZjDnA+v+
	ogtSeGouq5YzCX+wftknsSgEdoNZo7nHofnFGkBXFRAfcctsa3qHCVwLkm30TquuSR96C3reAupJY
	FFAe73oyCJ1UzqEbcWC0JS3VOxEG9Lq63cfhSZ3BUPIebSqvCigRIPHMRtRh6Mva3fr0qCXIHS5GD
	ny8/iUZoF4bF1n7STOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzPW-000000082Yv-3ixc;
	Tue, 24 Nov 2026 22:54:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzPU-000000082YU-3W5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:54:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMatln640501
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=; b=V/w7y3umcyAD9MIl
	VnL1ez7G5fhzewN2uskuv0SPL+7FXEazH4JzJmpVog2kulJYMyAgFa1u4PSpwAqZ
	oSm4VFbgDw6HEaVCYuj1DCfsMAfS7/vVEpujX7FmskO6h3wndc/zLWmCKC2xl4G0
	WRwJFY7/UAOcxMedPFycyUpcPX8fCiTIR6zp1Tddc01VOInHgnV1crSNkNDaUUi5
	UFlOrKHu4002kc5CsA41Z/uS256uKowa8Byk7CyjX6jc03JgYrHj0Q1warQWIs3R
	LlmEUMerP84BYiKvXumNjvkGCgwGY7yq5Ifw9tudErkV5hlAmHonniuUO4yE539K
	tWoLGQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effsctr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:54:47 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b545eed566so1022502c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560887; x=1796165687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=UEkl17pPufLACv1U+gZUx68nUzP0n4+CW2QfPLv+yJ8AwegSRwJc0zXSlIO8fsop4Z
         R2p0Q+adPs64EopdmUtKauzs4XQRG4uLwKHXLj5TzHm6N4pndPCeMd7WaKjN4kNIAr5J
         JwV8YmDcPXW2nvS2kw01JfOWxU+Y1JbgQzGmmzmp0GJ9nO4UzdbA5uLXhisKFPmE7CHF
         P1R4UsIFEPkmk53k2dTzKZ8PlWdbbP0jyaNyUlW8TTfxSV2MevmvsYT9PzNW3fKDz7yL
         8IGUI2eX7I0GBtsdIUPBQh9R7dMzOPppujHeJUyN8EQIweOPWZfGYJCEOwO17pCS6Xpx
         UkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560887; x=1796165687;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4/M2/wWZQuAVqM9S5XjAM6gpmtHGY7fJh0chq5o+b4=;
        b=arU+4QXrR2F1mwtRjqRbWm1+AIb0HQH6nya9ixfoNpFvatyS8p3ERfutt5Y07Eu3Os
         o5lKojHENluTHqch4C0Ng9FZtEgnXxxPZZFtUVYhVOj/ThuPdgpfJltojHFk3dC07/ki
         TPRxixpFma6Upx4boqWqQj44WDuoyQqXbYEr9jPxS9eHuvYWLVFDvRTLg6gMKAqgQ9vU
         NPhMcoT+wGV5MPzgr0XeAIiu7HU4ZJpzYUdqVRnQcWL5kgdKixGZ7ZHfgTsfWUoFh3fP
         3u+EHqfTIcofdB7qj8N4X6t8NCxrbukB0tOJ91EmKLeud3cArzJz0kgMmo3AMbFxtAxs
         RPTw==
X-Forwarded-Encrypted: i=1; AL+hErHiIL8cGvM4Qzhxamu+K/UzGTOghDQrNZgV3FXZhrX8sVUvlcPhUsQ5jkpLbgifZ13esfqQKmLE5B+N+KaQhkub@lists.infradead.org
X-Gm-Message-State: APuU4Z9EgJbrOcESMhFRlhqWKXjVQfMdgEkmoZEDY9OyNZIrI1+/nKwk
	kTdAVm5wBR+cmS+76iH6Q54bqK4r4n8ktWcWrX5zR+cZq+9xSTFMrypc0mQaR29UsK1YQWNlALB
	6q8EU5cOAvbz4bzNB6686TSmlCVSlq3yNnqTL0XZf73IOuxJdZg1rBjpiWrpCnX6GUv6lbXLAvf
	sUdA==
X-Gm-Gg: AZFdTZfkSngH9CzvRE8kiWWF6ZuXT3XNhyhgATcPLMDJTiL51VVSUKXaSQitn1btM5N
	ub0n1RhvdQ9Pz1PFYfcb7Ss4lKjyU++mHfpzrC3VpdpnCYWkxkrX8Yg/S9/ff+68a9ga8Iqbcai
	hHU9MMsrgGclA8xe8AqhTn0mpTVGBs7/HYTwWUEMHdFvp0HLBFU4cqsATEE4ajqIq6EzhurRX0Y
	ao+WLwAoX+vbySllYJft+RkWX6gf7dslQIGbwhs31mXPGjiqgyFo12m35yqd104QQSFWSnE2367
	4XgxUmTnBpGUfNdHCRxhIr71WXaLvjj/UBDhxBGuZA7YEXYZ7HsrITs6A0GOcbtdaH2KkZ1am67
	JVEEujQbZoHPsI0ssEHhNhpVA3c2rX7XDZLe6FfobLnjy1zTTMG33MU50mukphQY/TcCPF5Qnua
	h1xXJmvAwqtL2I9CnLW9xcJ5+HG9mi
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710295c88.5.1795560886648;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
X-Received: by 2002:a05:701b:4550:10b0:1b5:337a:6456 with SMTP id a92af1059eb24-1b55247eff6mr15710269c88.5.1795560886049;
        Tue, 24 Nov 2026 14:54:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm38075587c88.12.2026.11.24.14.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:45 -0800 (PST)
Date: Tue, 24 Nov 2026 14:54:40 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 01/34] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261124145440.000017c5@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-2-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-2-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b0615b7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=But-FDUsNSCRHIe_eGIA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX1B6yc0SZ9QBh
 8J7Wc++0PovZI4Qj4uLzM+fIqGMF6MQFWORIaljMfVSsj3b+S9pEeB6W1UnsHhZ+I5Kuf4X1Mvf
 kM/KQrLEARoYyRRI/UcS38EeC+WTYims0FgMiSu9A+TI+mJSdpni1iyzQkC7FIfR0k0vtG2zqg4
 XkJR1MwbKl+UgGPCHE+6hmE/dwIIG0WeZp4EEGrFeIrWsbubVugennPA8YqcCupXk6bTYWyGjAG
 y30w96QTFgxNJEQQFgSsJ7sTaEx3iN5iHxRy6LFg4vRArtCoIsGu1xW26ReNan5fOqPdTIoA40m
 RcdndQ1oLPRKGakRfccE1QzBR3xnwSeNJSDPeIQGqaOk86ew0gapU25qYMNYflzYcVAcdKI2ZhX
 eMMiEIJUZQsoh48ky4JkFXibdEdXZN/0qKHgHsZ3lBqWsk8O7YBBr9SObBcnYXlkphGvEbia7rj
 fICu3r07Gu/8YQ13L7g==
X-Proofpoint-GUID: Efl_zRqTxNWfN5XoTKY6rcaJAWhPHn6Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX/KTXxKYoGXZ4
 KFGeE01UntmKZWRq7Sb48VVwgORPnCh8bay/Xx64wj4w1sh7kFiYBN0zkaL1OhtuiRnU4sHiC1s
 B2uZqAfhhF2rgz6nR2Pq2u6k9fZWWeI=
X-Proofpoint-ORIG-GUID: Efl_zRqTxNWfN5XoTKY6rcaJAWhPHn6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_145448_994971_2A7AE2C2 
X-CRM114-Status: GOOD (  11.95  )
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 19:48:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and inconsistent multi-part replies.
> 
> Fixes: 36b6ea0fc6bc ("firmware: arm_scmi: Add iterators for multi-part commands")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
You answered my question on this some versions back (wrt to where the magic
size came from).

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

