Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D1B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IaXJRTjQ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1jWdHr6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKX64Q9Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=; b=IaXJRTjQ8nFUud
	ODQT5wvbfW3gt8JjMuvgosKnDToZVxWBjV6hTSnvZsNg+PjKlSSmBRBsHxeO+MO8i2LIk7LGNz1od
	zYAtmDXdQdo2+53ZDAAQt6aCLsXoLX/+Iv7cvA7q29FlRHU3n6JoFVwdVF1TOYqq3XIewWJOxZS8I
	ZyMdaDc2XPLx3/Hh/+sFtQv45l+hzVecXt/ZvbwI6yURowkENQnGv44ehXX0T9QqioWCD49PO3meS
	nxY3Ado73EB4Je0ccPb1v9AuNEpTZhdjSAQ2rezyOfx1c5RHLdBcwqWUgtbnCI1PVM/4mj/cZN5rx
	KDwfbpQBvg5RX8MOCc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQw1q-00000005I7W-06Qi;
	Wed, 11 Nov 2026 00:17:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQw1j-00000005I74-3bra
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 00:17:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB0FGv3725904
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=; b=P1jWdHr6o70PdxdE
	ca3zbWHpNS/Q01CDJVg19jkHrl++unZ1XbyzY7IsBwRaRE98NN5l57+rfglCjeUs
	EUzFmvU2dHipnb51F/07MnWsrAT3JLLqaS70e8R8bqSzycczc6dy6CqnrEuVAqKu
	nq1TCW6iE1eq39FbMLvDxji8cx0sV2H9n5TQFTz3+z3CtTKIidu2Xia/1LsqCJM7
	bugsPotgrISQsh1mLnoqZhzMQfmCRbwrprnHgHYj1gFH5lV4pvfT9BHZ1yvwCE4a
	r2Ya+sB5losn1NopcXYulLCciEAn065bS/RRGx7WTUiJF4I/T8Cz69InGfJ4ZM+8
	6daWUw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm806e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:17:21 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so3983038eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356240; x=1794961040; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=bKX64Q9Z2fLBA5EMZk1IpkF5UqG9xpteL+2YPMLnCiQ2wDobd+YaFtKmukVl3n+Xhd
         x3c4LN7FrG3A22bRAr2pX236MIkyVvC8uSNGDlZOF7W5vSFi8XOESgul3/Yewbmaxlyv
         8DjpVRpdvClkCCjnMLUKfeYA4uivyiBWfevqJYaTi66t8uiVB2/fMFisXJPbxOv9omU3
         rdAl43Upu/cy/NvvYGeULbJz3OzqIcZi3RB8qJdkMrLEuj9kswO5gqwRKM4UCFHIj/s2
         uzfLPk/2zVEQnmMd+Fy/3K3tKmxmYzITvNYRkJxF2ebkmo4Tysk0G9vzy6U+Jmc9yC9m
         kn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356240; x=1794961040;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbWhx2amPnBedKqcixZZvPPSyHTBlFBe/3TWhbUU5Nk=;
        b=VAedCGgfroqPcH+/7G2KMr36eR8GFxoM4loYxQJpOV/VuZ6v2KTea4PHIvhsdhZiel
         VAmuwdTjqereGRPn7VNx14SdSwVEhOH9vjnmuTxLPB8nF+qR6wyWI7mEjxKGygC9A9l/
         kcoTue/WtBgEC5wrzGWrX/3duqi/nzRGOfQRx6EfeD9SwjP8r3EWKq1dQS6WJMPPRaMs
         /Xlu+15RUgW68p65vUv5Jvm+ahbixJJheJKYHCJQa2EX41NfzKaCS4aoaDrQb2o8d4BW
         DkRAVmppujqoao3NMT8nnX66gBdQS3EInN1LVMtj2uy0Aepar2WflOvb27Kru4Bdoo6J
         5UgQ==
X-Forwarded-Encrypted: i=1; AL+hErEHTvFVbwvoGfhlzC0tRwX8AoTefAJ3CvvJX7PhDcpdF1e+bKzVmBqLR8fqetwsGCLNkIZWHemGpv8nT0Uod4Gi@lists.infradead.org
X-Gm-Message-State: APuU4Z/OUiNCA/s9DYLT3uhG6sbn8QNnj9bOaSNvUoLLJNZYvx3fTuV7
	w7EcReKg0fl0sOMM7kn6vshB2RCIWoH3ceM2XVj1qz6UNb3UmT894fLIg3et4mHUjkEF6ehUXm8
	XDQ69le6Te6Mb5fAgcX5VgvrDjZ8ftlSeY2MkJMMbXah1Ines0Qrv3qCo8v1tVQ47cMaJT6NjFL
	PLfg==
X-Gm-Gg: AYBFou1y+fbj4vbJ0btcD54yGMZbYVBswhsPk982/u+DjB2D57RKb3ju+4dZd0cZ3HB
	x6Rp6zuI+A6dpeECZDuHCKkqakvcC7HIvmy4WTBUUWukRZEd+yh8JyIl38eWQLUmD8IwoA6rmMp
	suXYBk5ZkcaCH5vdKUudX67kHt/dmlo2rw3pegeWbf8nlDorqEx8TldCrMsP3D8+CQbrAlRnkh1
	O9sZMWqQz8u+i5vPoxpIT0Ikz63855+MlRH51qsmQwOEz87K7XPMZg9+NWepWK8f/2vIdHSeSTh
	5+l4jEh8H/V8XLwzCkDnrzQsTZUU2f9YIXPbUxMFsG3/0Nd2yrB6G7GObvqiD/Xq6TvmZ6COh7I
	NKkyhA7xcePFrWuFLUpRM3V5XXkgKC1Y6wJTDVR12JAoGGmIXGHJNSKFNQJwhUq/bgfk/UWptLl
	6jI/mDlWGt4sK8edCobDjwA1oSTXqj
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339955eec.20.1794356240111;
        Tue, 10 Nov 2026 16:17:20 -0800 (PST)
X-Received: by 2002:a05:7301:904:b0:375:c862:34e with SMTP id 5a478bee46e88-3768636dc95mr1339925eec.20.1794356239547;
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19260603eec.29.2026.11.10.16.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:17:19 -0800 (PST)
Date: Tue, 10 Nov 2026 16:16:56 -0800
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
Subject: Re: [PATCH v15 35/35] [RFC] tools/testing/scmi: Add SCMI Telemetry
 testing tool
Message-ID: <20261110161656.00002a1c@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-36-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-36-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HCN-WKScSVsTDqC9CKCRCQmTYue0KPfH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX5KTIz0RADL6V
 YtKbUAxwK63Tf6ag2+YwF6zKbCfWRqIz+i5kc3XTK3E+6CuyHF2f/RwJ9zJJfVhWE0F38yIAe5+
 rQY/WYw0hTiZY+vaLpFHkf0IazveuVo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX/NsZEhaI53Mj
 Hl0riK5JTdqfpxU+cUZIClmjMrdasbju16uOzMFwzI4NXLdwfpWUwtA7P6vdQ8SOHKHNcg8U7gW
 VpL8/KI/2gpaTBuuAk8OhuZLlNv25prq7FXzIT3QNjHilCWpsUiyKUPZdKBP5M2F6UtJfvkkH7k
 zReTGgizntNU2vfmQevTEFt/kGsvGRGFxWnZFM958PB+xHdj88DyEY8ZQ72DUTwXH2xa//2LSH8
 Z5GpG9LNCcgFMBnVU3yXDrY+CNUOgiwc9lBFrxvlrpB/xnctlQZpwbr2RUz2fOBNCmPTDfoYd7e
 YRcTKGnoiLRsUzAFbFwkw5mAGEntwJMK/iKnoyKltJuVp8JFWdQKOJ+my+5glCqmvLsG4mwqi+q
 B1L3yF5I/7TFvi6XDgZ1BgSrxjNfP4Z2zuBx3nWQOhpfdvI87MnOyqVq2LEj50En8XGelbazCdj
 jJ9tfio0CkS6xxix3ug==
X-Proofpoint-GUID: HCN-WKScSVsTDqC9CKCRCQmTYue0KPfH
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3b411 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=Rq-k35hIRNRoFwHvQQQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_161724_385778_C5F88DCC 
X-CRM114-Status: GOOD (  16.28  )
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

On Mon,  9 Nov 2026 09:12:21 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a testing tool that exercises the SCMI ioctls UAPI interface: as of
> now the tool simply queries the initial state of the SCMI Telemetry
> subsystem, tries to enable all the existent Data Events and dumps all
> the Telemetry data.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Test tools need breaking up into bite sized patches too!
Perhaps a little easier to read than kernel code, but you aren't
generally going to get great review on a 2000 line ish single
patch.  I'd be tempted to do this a bit like we do PMUs vs perf.
Separate series, often posted before the driver merges but not
really considered for merge until afterwards.

Anyhow, enough telemetry for me for now so not going to review
this yet.

Jonathan



