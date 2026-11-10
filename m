Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AE1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k8rshTpi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg+rAz5n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G7YIPZzP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=; b=k8rshTpibc9BEa
	FYDaf0aBmCsNnSY7vL09E9MQF62Xi9nim23IiIqX6OA001jPHeBBC2OiWaUgaOI2ZIr1DsMdER7g4
	NqHcbD6tdTwhXcBUVwllOxjgluYnoLdIvW5SJcJXFKw9m8ECcOcwVKD0M214P5bfRyE1Aq08MCIup
	O475LXaaqRkXx1xYfXr5jm3YHvY0mfbi0Lk4V4GBs9YJyuPPfoQw+TIz0Ya0QNR+clkMmxY1ZLaLv
	92TzDUOLnWKNInXXb6lhOOpOEZiHFTTWLbyDB72t26WITxYBmcwmHCZhIPe1tj2H3TbzfgVMqfX+/
	D00DNDxOUT+qYDNqdWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv2h-00000005Dfj-1p6W;
	Tue, 10 Nov 2026 23:14:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQv2d-00000005DfM-1tFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:14:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML8nN1117167
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=; b=pg+rAz5niP/2exc5
	mmAqnWelZCxUE3DBGcXTX6EVbGMLGuESy8uaJgx+lHzThpBSRau6OQyon1EMXycD
	udel624sixOUdWNg0uBOyMtSEx2Nv+HNd72dxKdA4/wCgjGuD07G+WR3JT4Hxr53
	kKokAUEB84+QcitMbyGAs63fxc/tji9cxc5xDzjTJ5mOA4qMniP89Aauj2DIhFG0
	ePoh6eBPxMXL4SjNjSvk4tMuyPrUD1gk03Ov3MsZANm4LMO3nOeaazXB9tackSm7
	V656QbeY22V1reYdpD11W5klNuwk66jlKkOYfnL3u0p7QWIs0SZDrKQCr4uELWio
	HH4mlg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:14:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so3829327eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352453; x=1794957253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
        b=G7YIPZzP728iKsn80dd793GPvO439wDdXFou0JWjTZvcfoTCmQJmuEex+2AaSJPgDY
         IBjZHOH2/DSB9ZFH6rPko3d4G8upBqyNM8cz9Yu8PFghDBFGIw/EIyGr4MC3kCAvJLLE
         uC/pr+nPksJ9NcE2j6XZ3OAXEE2OFEEgBFQ1guLsUObBQ+BV+vtGZtDFEjenJ1P9jcsa
         BHP3T+sZioE9xVoZWCizxeg6HVxUpKqE8LdpB/U7NViA/bJvkH/vTRPVZque3XJBoK9q
         XGOuMmnpVtwe5rzBLfJAz7/YwBLtYVdFnWTvW41EW84mXfszigYP1kAg/mi9FD6yP+si
         JFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352453; x=1794957253;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Xpscwyy3jFhQfYrCqIDewqcILIH2yywXOfnayr7y/Q=;
        b=jUA0rlBuAECMxQu+z14IYBNHPVd/mQ2u4jv5sCLpgdjsSF4xPKqvoICu+npDvtsG8i
         dhZ4+xiWo2e5uLyOvtcuHXZZtLr0dtuHjQVWrA1+oiMdaNxMJq+a8PlXRnV7beP6lPCg
         g2IFOKl55vOIPo2FlCefpDmAdgZ1Zo3JR86GJy2ocVKcQU1qpcltBVxDP+ZKpbQJ/2s/
         aB+zTCgPu/nBunHRIAMREo9knkQIbu1/de597x4twr3vDNenO1B0Se/rteyYdvvuK1Iw
         jWxoQNpgEegOLbtreAaSmPRzcH0LoScZ1PxXffPee/7Xzmk89faD6S10j3Ls4QTDd/Ky
         yW6g==
X-Forwarded-Encrypted: i=1; AL+hErE2CXRd5qBQEXDXlaUmlOqbSlHrL97Idh5ybD12JQgP04Ir7CoxtT5BmsGeuDy0i4G7vqQ+AnaLrRurzs66T0C2@lists.infradead.org
X-Gm-Message-State: APuU4Z/dGkrTY5Lnz0MH79rhpwMboCtXNN/WdwGMyijhBhP0D+4/cfHw
	LXvZ9zHYaJkIx6xF1y9u3g1lNRjayESqlVONkN21C152hj8caEEbB82hxTuGi1cKnnP++XLkcie
	OrpCyQ1dxETMR55IX+CQOUsij3dna9AWa3ar5TnZjjFx1OQBZBFt3ZXnno5FQ/xQ2QfyTy92M5z
	oDzA==
X-Gm-Gg: AYBFou1y+SGaJ2nxocsVdaVGYup4lO8yggmSAEWvVDb1OupiXQDJ6cCY8zofufpXjC5
	aoNJGAPA1FGOX6h2mFlyppx3ofw6NZI+6pUT6OoHLAKlIZV3y6yXAK4uUS7SD2EXNcSyPVNAYYc
	G6LbjOQvJoJsBYhRGZBTIIJOIQ/vnQAfteMjaGDz9vAw1n0UOgogYWI8Dfr4KDuPbSDjl+CnRj+
	xvZ/7q6g/wUzx1ZjETpYQ9iCnUCO7uivSiYA09/yR6M+JKJLFuVJPRukHQkudhGx7LNUq0OLO2d
	wqtUoqU7BGZ2iw1kidGIOdXIg8+h4WPoMcT3up07Ep+uaaMpJe8URfLdfH/3tzHQ3yvtOw5zYFs
	cdM9uVKP+g9yO+VUENY6gMrVM69fVviidp7AoVKPIFuvyoDVvMS8y1cjgqu/zQ5RANNxt+X/OXb
	QB7YnQiL4TUWGz8HZZ+F2u9+yqa6E=
X-Received: by 2002:a05:7300:f78e:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-37685d7279dmr1026960eec.13.1794352452866;
        Tue, 10 Nov 2026 15:14:12 -0800 (PST)
X-Received: by 2002:a05:7300:f78e:b0:36a:12bb:7f8e with SMTP id 5a478bee46e88-37685d7279dmr1026919eec.13.1794352452279;
        Tue, 10 Nov 2026 15:14:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm10490952eec.7.2026.11.10.15.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:14:11 -0800 (PST)
Date: Tue, 10 Nov 2026 15:13:49 -0800
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
Subject: Re: [PATCH v15 29/35] uapi: Add ARM SCMI Telemetry definitions
Message-ID: <20261110151349.00005df7@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-30-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-30-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3a546 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=XiCDCQztHa5vJwnvm_YA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: vCYa19Yvzna-P1_leFnnKr7y1nscBofP
X-Proofpoint-GUID: vCYa19Yvzna-P1_leFnnKr7y1nscBofP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX8rBAWfWCX6N/
 hL6esORGTFdmCI2a87gePSmw1cvnvRtcknGljzO5cTgmWcJTmPBaEoppCAQxoNCCSRJEcQyltWP
 X78PdqjzqgbvrDgUNxp2aWVdb6PL9Qk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX8Pp02QUBQAXV
 TfFxf5cKVAOPpGon0+Lr/2z6IoVIoP2eIVewHL8gBHwZPFg4a3zckPtach9NHlkthXHJGIYjLBw
 N5+ob878nqpp4NmPVgP59sfqVERa2Lz0rxJa8bcvIyCzA3fUqptDiq4SASCd/kbicZElILo5RV1
 PSs6O3h4DaikiHaRHxX4muMwhT9SzW83KC072996+t88mayRPaIRF+CGSKMJnrPQ2OuG6Be72z+
 7HLBoxklvjCq1IzriVcv+J3ueNnU2EhrBGg66avzKcufBHqPn2eh5ChErJBFZPxvFLKZz1rHWo9
 7JB+KrVh7CWbkAiRgR8A5XAVggx9TdfxQ5UyPJOHttm6GEiPIicbrWTuVetxQ5V93OwnjXKDuIt
 OdbptsSMuGPTUzkz2qjf0SZQGYeSmr2AHTIibCF60mYOTdeYY4wnDkkEuzOG4lFAha/j14u356x
 drK1S5+e6oeq32N6ZQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_151415_610891_B934749D 
X-CRM114-Status: GOOD (  30.77  )
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

On Mon,  9 Nov 2026 09:12:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a number of structures and ioctls definitions used by the ARM
> SCMI Telemetry protocol.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

> ---


> diff --git a/include/uapi/linux/scmi.h b/include/uapi/linux/scmi.h
> new file mode 100644
> index 000000000000..dd78220554a2
> --- /dev/null
> +++ b/include/uapi/linux/scmi.h
> @@ -0,0 +1,531 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +#ifndef _UAPI_LINUX_SCMI_H
> +#define _UAPI_LINUX_SCMI_H
> +
> +/*
> + * Userspace interface SCMI Telemetry
> + */
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define SCMI_TLM_ABI_VERSION_V1			1
> +#define SCMI_TLM_CURRENT_ABI_VERSION		SCMI_TLM_ABI_VERSION_V1
> +#define SCMI_TLM_DE_IMPL_UUID_SZ		16
> +
> +#define SCMI_TLM_SHMTI_ID_INVALID		0xFFFFFFFF
> +
> +/**
> + * struct scmi_tlm_abi_info - Basic information on the ABI/instance
> + *
> + * SCMI Telemetry characteristics like number of DEs, Groups, Intervals and
> + * SHMTIs are statically determined by the platform and do not change within
> + * one boot/session; they are reported here so that they can be used to properly
> + * size the requests on other IOCTLs, without having to discover dynamically
> + * those sizes by issuing a zero-sized IOCTL request at first.
> + *
> + * @size: sizeof this structure - IN
> + * @abi_version: ABI Version - OUT

I'm curious what the plan is for ABI versioning.  Normally to have
any hope of backwards compatibility it needs to be a negotiation between
userspace and kernel (and then hardware if appropriate). Is there any route
to do that?

> + * @abi_features: ABI capabilities bitmap - OUT
> + * @primary_de_impl_version: SCMI Telemetry DE implementation revision - OUT
> + * @num_des: Number of defined DEs - OUT
> + * @num_groups: Number of defined DEs groups - OUT
> + * @num_intervals: Number of available update intervals (instance-level) - OUT
> + * @num_shmtis: Number of discovered SHMTI areas - OUT
> + * @features: Instance specific SCMI feature-support bitmap - OUT
> + * @reserved: Some room for future expansion without the need to resize.
> + *	      Must be zero.

Why?  I'd expect the input size to indicate what userspace supports.
As such what use is this reserved padding?

> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_ABI_INFO
> + */
> +struct scmi_tlm_abi_info {
> +	__u32 size;
> +	__u32 abi_version;
> +	__u32 abi_features;
> +#define SCMI_TLM_ABI_FEAT_RESET				(1 << 0)
> +#define SCMI_TLM_ABI_FEAT_EVENT				(1 << 1)
> +#define SCMI_TLM_ABI_FEAT_UUID_LIST			(1 << 2)
> +#define SCMI_TLM_ABI_FEAT_BATCH_STATE			(1 << 3)
> +#define SCMI_TLM_ABI_FEAT_BATCHED_CFG			(1 << 4)
> +#define SCMI_TLM_ABI_FEAT_DE_TRACKING			(1 << 5)
> +	__u8 primary_de_impl_version[SCMI_TLM_DE_IMPL_UUID_SZ];
> +	__u32 num_des;
> +	__u32 num_groups;
> +	__u32 num_intervals;
> +	__u32 num_shmtis;
> +	__u32 features;
> +#define SCMI_TLM_SCMI_SUPPORT_RESET			(1 << 0)
> +#define SCMI_TLM_SCMI_SUPPORT_SINGLE_SAMPLE		(1 << 1)
> +#define SCMI_TLM_SCMI_SUPPORT_GROUP_CONFIG		(1 << 2)
> +#define SCMI_TLM_SCMI_SUPPORT_UPDATE_NOTIFICATION	(1 << 3)
> +	__u64 reserved;
> +};
> +


> +/**
> + * struct scmi_tlm_config  - Whole instance or group configuration
> + *
> + * @enable: Get/Set Telemetry enabled state for the whole instance or the
> + *	    group specified in @grp_id - IN/OUT
> + * @t_enable: Get/Set timestamp state for the group specified in @grp_id - IN/OUT
> + * @flags: Bitmask to represent special characteristics - IN
> + * @pad: Padding fields to enforce alignment
> + * @grp_id: Identifier of the target group upon which this configuration will
> + *	    be applied: ignored if not marked as a group in @flags - IN/OUT
> + * @active: Get/Set currently active update interval for the whole instance
> + *	    or the group specified in @grp_id - IN/OUT
> + * @reserved: Some room for future expansion. Must be zero.

I'd add a size field for this one too to make it easier to expand.
Probably the same applies to all others.


> + *
> + * Used by:
> + *	RW - SCMI_TLM_GET_CFG
> + *	WO - SCMI_TLM_SET_CFG
> + */
> +struct scmi_tlm_config {
> +	__u8 enable;
> +	__u8 t_enable;
> +	__u8 flags;
> +#define SCMI_TLM_CONFIG_GROUP		(1 << 0)
> +#define SCMI_TLM_CONFIG_FLAGS		(SCMI_TLM_CONFIG_GROUP)
> +#define SCMI_TLM_CONFIG_IS_GROUP(f)	((f) & SCMI_TLM_CONFIG_GROUP)
> +	__u8 pad;
> +	__u32 grp_id;
> +	struct scmi_tlm_update_interval active;
> +	__u64 reserved;
> +};
> +
> +/**
> + * struct scmi_tlm_intervals  - Update intervals descriptor
> + *
> + * @grp_id: Identifier of the target group upon which this configuration
> + *	    will be applied: ignored if not marked as a group in @flags - IN
> + * @flags: Bitmask to represent special characteristics. When the interval
> + *	   is NOT marked as SCMI_TLM_INTERV_DISCRETE, @intervals will
> + *	   contain a triplet: min/max/step - OUT

I'd have a reference to this in the num_intervals text. What happens if the input
only allows for two intervals?

> + * @pad: Padding fields to enforce alignment
> + * @num_intervals: Number of entries of @intervals. On input this represents the
> + *		   size of @intervals, while on output carries the effective
> + *		   number of entries filled-in.
> + *		   On input this has an upper-bound determined as:

