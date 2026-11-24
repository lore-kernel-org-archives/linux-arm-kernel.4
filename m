Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bMQF6YNg;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fvTDaTI0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4HrxEON
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=; b=bMQF6YNgeHB/mM
	HfPIGqIC/yzWLMM0qfemUFKkmW3E1mT9me3NaCeo4k5UE2qgMDuQOhJIBO3lfqwv8hGNPmKmxttsW
	skEuHDFCsFun8v0IZuGIhHjX9CO1MTcKHlF69QCwYe8g8mzQUIEEmrAwS4trtq/eJopH+gcV8CMxI
	VVHmNqev1uUPTVNr6V9zrsuCfKedO5nqltNcwPo9Edd2w7smTLcRt1Nwm2JUApT7I35WcL6kpc5kN
	kzDul1ynorGWi03+uqjKVZPvCgAVX4LCUwsdlZgx1jELDdY2s2l9T+T29PAze8k39Zyp6X7N2ZPI3
	0kuLHinQACjGHOzVHLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0QV-000000086V1-0eob;
	Tue, 24 Nov 2026 23:59:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0QR-000000086Ud-3cxq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:59:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMajBA640302
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=; b=fvTDaTI04iPBE2tG
	fT2dwxkTu1GMDapg5uyWy8BRGAZHsY0cNlcPM44To5jMPkYrRdBpEUqcu8bSIsEf
	9rLlSv3gScNWirlesMvhM9T4LRVJWij4ad5BTLcH0NO6WLRtHiL+uANnJV+dan3n
	5KjKUEEJZ+C3Im2ixhvi4jaRaZ0HJhtFTkESP1MM0erMHPhycuqBKlutRxM+xr1n
	AJ4Lj/ZbsFygB5XZ05EXlGtJhWQLZgBSKa8qrDtDYLwk1HeJfY1pWHa71i0j9XOU
	DEm8/9PzJBLysnAyalWivhojUx54wvDnIJ1yF7OrctOXRkA6geGXAPpufSFWBeFk
	bbh7qA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effsj6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:59:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so7310470eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795564790; x=1796169590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
        b=A4HrxEONqSFdaSEVGL1qYkMYtI0QQlGADRxflCxb7ah5Kw85Hmkln62v7ZS+br+DnC
         c/hanWgNN35S/LtlVRF0ar0CwSSOi0IadW74TkYwqIXmaa69MAdm8V4nWcm4NYyDCASf
         RQBzhOICVlY6OMa7KfjjqvPGRuqUwiLyL530mSKVnadFp+VO4ofCvMJOVNm+DdEa02Uh
         Hmg18q22MKH5MC6jtkKWrwZGYMHa96cOiq4TpllzgPbkX9NJfgFwKEN2feyyMB7pAkER
         cH/XZ9rgSriyJnuWTEZTWqhql0JvBfsn9hqqGeCW0jr+2XdCazOsLuImkev9TfZLyyt/
         N0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564790; x=1796169590;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbGMGU3Ni5klOILvUXiLZ0e6e10FjAtQOC+P8hG45Jo=;
        b=HL0MnBKdaqqhcjWWZqu/ZAqU0UmvdEKu9IqwHWR0AIsHy98jkvwjv/mhx2Kk8Jp5wO
         QKBSMkrhMZu6Jvtz7Nfrf+V1hvUcw2pWOIZLhZrrqWtylD2qwale7aGjaVYvOqYV7yWt
         RVSedmrGP8phN51AXvvWdAa6jZdZeH7SimVfAzy1bjjSwLI+nDZXPwSxF0lFTYKmgr5q
         oU1jD19R4FUQAHMOhs1aaQhhoC6jhlNL9eYubTq7VpHi4FMe5g5UXjjedmX7ITQBwmC1
         LL9KBRIQWU6ixScdmfXJCapyk0DQguXNSGZtbkTfmGMhv6dYi6CYGzC0ibDySRjeiRMT
         qJDQ==
X-Forwarded-Encrypted: i=1; AL+hErGY0utcB5GHyDzWwGrCZiUEQ+lt4nKl9ySrSO5Yxp/4uYeN/6p5jlpubq440zfE89Oh8oPcb2Qu3crPjiqf3Usx@lists.infradead.org
X-Gm-Message-State: APuU4Z+691XQVtK5k+wauVD1doqFJtJNYcceZ9V9KZyYCM964EL/k36x
	LFXgn2TdIjWR2nXAEeEuqJFssR2sLqjXPYIeN9nSOI4HrInTdTPOrIhT7ADqnuWxM/bV0WZTKGs
	xk6injGV7iEDWRkzbN9AVzp+visAqCRfit6lHCSlSzF6uSGcHvmBiRYYJdxoFUEwzipDYjYpMGa
	D97DaNuC69tg==
X-Gm-Gg: AZFdTZcTjVXJgD8gHWcfG58XyR5ZVXmy3Wnbjus0ne8+ZaiosKpJKntjOfxwBo8rbk+
	W5zHRlboLgCGtOCtyCg0frvT9svVaZjWCPAoOYUuVLN7TKxDppMLbQO8Bqep8bcBExvibwlxVD4
	uNbby6WsRcERNnRaQjhwbbwtjSxikiyjKVJvdAaRBzhq+at0ftmPMYJ5SartPFzfQvRNSiWGVFB
	VR4BU+m/P16hTlZ4wLTa8rGLzVzVz3d+Y+fpEETRRLfY1PFajdHE+Jsb8yzW3G59JogDTj8EvHx
	K+M0LcvD4kLaPt6nNshKnoUfE3UYYP8awjkv/Bm//fPw71nfvw08yr9ezL9Rvz7Prbf1pyj+c7D
	qlp0UPcDLKzY4LTVm4Ucab/zVtQhv3KG+x1JcnzRQ6agR3of+Dv9gweauMXcRpTalwX3FTFunkv
	77a3W6WMYZYpySKRlicBE2rBC7Vo4=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr14495397eec.40.1795564789574;
        Tue, 24 Nov 2026 15:59:49 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr14495349eec.40.1795564788926;
        Tue, 24 Nov 2026 15:59:48 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm15214484eec.9.2026.11.24.15.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:59:48 -0800 (PST)
Date: Tue, 24 Nov 2026 15:59:40 -0800
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
Subject: Re: [PATCH v17 11/34] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261124155940.0000336d@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-12-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-12-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b0624f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=AXIch-7a5tO8ZeyO9HQA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5NCBTYWx0ZWRfX55/LHd4ddrmX
 kjMc+Ty/dHcC9TUTOQdGFnDcBMab3PuKJCJm+n+Ore9zhHoJHAyRZOF+Bv23D35HZ32nKRcRTaW
 t75z5Uzf2KLIF+ARVx/E4MLy1plkR8hSdP2AcnkywTjgfkf0x75jCvfITGkkhFSPlPpJJxbAAqs
 o9dcPiRLX2yNQ4jvLpoMVIHWfids+JyMEmAdZ5Izr61oBBBRQOsli9nnCzOzDOPoiUsjT5QgUsA
 APkOLOObQireRrCQn3eSL8RrhUFO9/4P/f7d73RZyGDdQoUK1E2eHgqbikxrrzj7AsaVgxPi0DU
 uFl1lCNy8ZPDdL4YgsMQG4RXdqWdlX9BNk0mpQ0z/1uqb+OajIHI+S46+sDZVcaT9JB4BOjxFNr
 FK/JWG14w1389SBURTY5VNzS0CbtFjVjyff0pxgXSJLh+gecp0HbbD6rRcWUfJM3z+ZtwL5bdA/
 v7R6h3NCnFQqylCClzg==
X-Proofpoint-GUID: CRbhVstoIiqwjaVoNQ_0CEpa4MG8jt89
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5NCBTYWx0ZWRfX6l40jy1IMeuV
 5ZF5bnRSyVSH4ralUP7A3R84RIFQ0Mih5D1bqg7jWVR14qcJ/KKA8JTXH6T3KtFNwmudyWjUIvg
 fdA4p01PTVWrVUHcNUwtXzFNssv0CSw=
X-Proofpoint-ORIG-GUID: CRbhVstoIiqwjaVoNQ_0CEpa4MG8jt89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_155952_051853_63811101 
X-CRM114-Status: GOOD (  21.82  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 19:48:17 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v15 --> v16
>  - ignore groups

Partly... Need to do a lot more ignoring to make this true and consistent.
There are a few things in here, but key is we need the whole framework
to be as unaware of groups as possible. At least up to the userspace interface
layer where we may need to ensure extensibility.

Jonathan



> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 3f7cc35eb861..f076ce5601cf 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -2,17 +2,19 @@
>  /*
>   * SCMI Message Protocol driver header
>   *
> - * Copyright (C) 2018-2021 ARM Ltd.
> + * Copyright (C) 2018-2026 ARM Ltd.
>   */
>  
>  #ifndef _LINUX_SCMI_PROTOCOL_H
>  #define _LINUX_SCMI_PROTOCOL_H
>  
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  #include <linux/device-id/scmi.h>
>  #include <linux/device.h>
>  #include <linux/notifier.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
>  
>  #define SCMI_MAX_STR_SIZE		64
>  #define SCMI_SHORT_NAME_MAX_SIZE	16
> @@ -828,6 +830,35 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_base_info {
> +	unsigned int version;
> +	uuid_t primary_revision;
> +	unsigned int num_des;
> +	unsigned int num_groups;

My gut instinct would be to introduce this only in set 2 that adds
groups controls.  The best form of no groups is no reference to them at all
except in userspace ABI where you stub them out for now.

> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
Ideally grow this as you add support for things. num_intervals and num_shmtis aren't used yet.

> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;

Logically without group support we don't care.  I'm less bothered though
on whether you rip out a simple support bit but if we are going for clean
separation this would go as well.

> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};
> +
> +/**
> + * struct scmi_telemetry_proto_ops - represents the various operations provided
> + *	by SCMI Telemetry Protocol
> + *
> + * @info_get: get the general Telemetry information.
> + */
> +struct scmi_telemetry_proto_ops {
> +	const struct scmi_telemetry_info *(*info_get)
> +		(const struct scmi_protocol_handle *ph);
> +};
> +
>  /**
>   * struct scmi_notify_ops  - represents notifications' operations provided by
>   * SCMI core


