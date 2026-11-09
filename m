Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4037606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GgZLCPXK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e7I9DGRY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S392Jr4R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=; b=GgZLCPXKSF2uLA
	RaZFQVMck1voio4z41zXaJVR6MGEfPrXwoMzAJTLA6lov5nQsdFUFLp03K/QdLcbjUOf6i+vCLKiN
	CiTy1661xELNkUDjT2qzlN6t/cfW/ghVFrYgLfgpoAsLvYp2PvIZUfC0goAYvkG2LFb2sY1rWo6KI
	/uYgmUnKuzRuSSfbXfnZSG+DlMC0pzKu/KMlkcdHrMwEtzykO7vbUB7mW04USIkx8FC+CC/UxCDVi
	56v05nFurDKY04t5P6cSvmu4XowrcC8AuqND1tLlcoPY0cBVZoVWGEd41YywGzP/ioqlHltXlvyUG
	jhJnaJ8+Lqoyc9JrGtnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXQv-00000001px6-315P;
	Mon, 09 Nov 2026 22:01:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXQt-00000001pwb-1MRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 22:01:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAfPH3975902
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 22:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=; b=e7I9DGRYOGMiGoH/
	9ZoE29LUbkorsFvZdOvL+TFcpTgfHORVobuEWk8PJboxsm+F8FvRZETRWPJ4cbVK
	GUVRv75INA5Iaq/X7r1Xzf6dJRWOo9+iBHur3dSZZas9h9UER+SReUXSWZ8Hr78q
	KtOSrqyXX4pK8SeVyCc81nDoW1zf29dGDIVRLQuGotPphEf3EEPxLOyA5S+3HUyn
	M12UZx7KDkpAErIIRLsrsH2ntnuxiEAE9bKaiy0HqEeM+ncFOy7/UQhSmviQJCeO
	PysqGDgM7FymmEUVNObbm2pGUmVg5WrmxiYG/aMpAQGJec6AE8vg+3c+e0Gwq3P8
	ZjaCig==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8tjp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 22:01:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3227821eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 14:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261702; x=1794866502; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
        b=S392Jr4RV1jJyJEMCPzPkMqqF0qIjj7S14Ee9d4FtrgkGD/ZjNnGtfTGO7y9QqqXij
         yl6dxBNFej9v+kDn71XrCmRaEeTd4+aQ0r7hpTLAApj6f4fKonOfihfy6hFXMgnVI/np
         qZ9jiackFJcxPK3/23EwFuAzX4JlHQPg2RuesszzcIswFqzBwnLkT9I57/95MhRNpbUp
         ppd4gcMcl7zfREVyx2wq8eB047GJA5qdOO6g3jpwLPMFCvCArwmO5AVYcSZL2yg1LcPE
         J2RyGgaNN+aeUo7G7KUydHM8cEo28VE36sGsehs91n4CdlBOKzHOpcPWDt/bbOBAVJL8
         UiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261702; x=1794866502;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/U5uro6b/Mumfr/eDH65lCVfbkZfC9WhsiSfQqom5U=;
        b=Eqw7bVv846N/q65DGLOeKJ4UOX3JkcC++r0pJ0evNAVsi1/RylhGR1gFVTuNgIGqMl
         eqLYk47H2hnl4hfEtHBJc8E4A7tmwJDDAmLrlHHzu4h4bxJ45pxq2Q9zO10LkMC/E8P2
         x9DGJCZdnaQlaIJvLU4MAjPAT67KRZMrd382ltyOAclJJEYSebSkXRY2/HhYl6pt2Dl9
         2ZDFpB4M6caKjL0Wp5s1sGAwmTwqlx8T2OW9inktAyQ/PFxukhQEScHLtiVdxT9IYGEq
         1DTrOvtW05T2Udb6n6vQxrr7vvIIcFJPvPQB4VE1pkIV7KxOVYuEMnqx54ACjoqcTXBJ
         W63A==
X-Forwarded-Encrypted: i=1; AL+hErH5Usple20ojS/NPdwNemk/j597uI9hzoAHOvmf4bIpWdsYDag9MTNmPbFzMIBF0TXdwpOfoebqZ6w8Q+SX/Bfb@lists.infradead.org
X-Gm-Message-State: APuU4Z+zvetAExtBv/D2AKKr2D/qX7v+y9Hs8LvVqvtPxrrZyrryC8Yw
	UdQjKShYBvEYTLu5fciVtP8twcBAHZA1ORTW/0z2qdTMjmQssmgQ9X9E2gXAe5x3SmT69ff2OCP
	BMF5Ywf5qoyGe/4SeLYdWJj7gUOxSU7pbUk+ihFGxEp6aaGXK1cVgwegwClOzgHSAIgsupqLzUU
	o39w==
X-Gm-Gg: AYBFou1R8E2wm7oGc+ZC+IsjyVj3xULX0D5RtTFPKCqHuD2LwrOnoga2v8MS7jP5V/v
	2A/DehP/FUfvsnL2KoUxAP/hFVUsO5/+3edA4zNycN1+2m2zvNbcAJCv5iPM0sZiZPW+lfy8l6S
	c0xB1j+TM726rYUMxm1s2w4XXjMYQWsryisfHwhLpgiBE+6x72WWwjPmxzJfREtEym0lmYytUxQ
	jv5qkgXxJ/mI3iz/KXDkMD1SaJPeTge0HnFqIUx9Vyuhzb8EL+CJlqsXmYKBoShqK2StWrFtstt
	ZEndModFRdjqka6sWpg1cEZYdjNmky/3scFY2jXetXO3VwNnbSkHpJt838CBZQYRVQzPKBMNrXj
	+SlHTQyvG/s3XzCDimmsOcSgVQ2jZAUjFwvn9oMzB8BdezXE3z+aRdrd/LakGOuh0SJ3yO6S+Kw
	OFb4XpevM4RL0bcbWg4+AhpJnDTw==
X-Received: by 2002:a05:693c:6007:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3751c82f248mr762501eec.5.1794261701738;
        Mon, 09 Nov 2026 14:01:41 -0800 (PST)
X-Received: by 2002:a05:693c:6007:b0:36a:1008:5815 with SMTP id 5a478bee46e88-3751c82f248mr762424eec.5.1794261700734;
        Mon, 09 Nov 2026 14:01:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm1118577eec.3.2026.11.09.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:01:40 -0800 (PST)
Date: Mon, 9 Nov 2026 14:01:29 -0800
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
Subject: Re: [PATCH v15 03/35] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261109140129.00004b4f@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-4-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX5UMxZfQ8vee4
 DNTxBV+nHZF0RSKdP9wpTNA+VRZYwfXbwlQmV8eYcVAMWbI8wuaNSSwki/Ys3KJz1vtbwzojzqI
 aBNmnp6bjq+5wO1uvOF7assV3DpOMh9PxJETP+xeQZVS8ZJTzH30xBGzZFOp9PJdVyvUlki/3Oo
 GzH3FiVViq12PoxGMQvgFMsIYD+M9ReXdr77VK47Op+0M7G1eCk6HdS+6ucIfc5P00F76r32sgR
 T1S7ofolZtr9APXQ3z3puNrFTgO5rTDMQe1wCgjVLWOYoobu9SNC5rpc+mLi9LKF+YY7LxnHehe
 z5Qz437YBwvefmkVJ1pYkhq8iCcJV0jJm4HjVFqype9uYhj5CE+NzigjRBIf6bAm2s74s9V92Ml
 vQmb0GPd48DweUwBn8AABWhXRHT7bqHMmNoQZSn+xS8Nr5ULJLRNF7usvQ9YV+7D8BFQABRhR22
 xOXyIm8NVxI1N2nBkZg==
X-Proofpoint-GUID: QJM-ozdagom3ZOTbzwCS5U7P-CTKpqfN
X-Proofpoint-ORIG-GUID: QJM-ozdagom3ZOTbzwCS5U7P-CTKpqfN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX7S8inNcWiBBy
 vQqtk/DeVE2leOpn1LfIXzqN5hBtBWDzYj4OVKIRYFX+EKKqYBYSxC19maQdxTn9t5cUbnNTJFM
 d5Vjd2uKHr/NFscLLa2v8iaCAux2Pr4=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af242c6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1uBkIsMKrF2EJPe0UmoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_140143_375709_871517B8 
X-CRM114-Status: GOOD (  27.00  )
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

On Mon,  9 Nov 2026 09:11:49 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h

In ideal world I'd move first and add the new codes later.
(so swap this and previous patch).

Trivial thing but reduce the patch size a tiny bit!

Other than that, seems like there are enough of these
for a separate header to perhaps make sense.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 43 +----------------------
>  drivers/firmware/arm_scmi/errors.h | 56 ++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/firmware/arm_scmi/errors.h
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index e3390686fc58..cdd6f887fae7 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -26,6 +26,7 @@
>  
>  #include <linux/unaligned.h>
>  
> +#include "errors.h"
>  #include "protocols.h"
>  #include "notify.h"
>  
> @@ -37,48 +38,6 @@
>  
>  #define SCMI_TRANSPORT_DEVNAME_PREFIX	"__scmi_transport_device"
>  
> -enum scmi_error_codes {
> -	SCMI_SUCCESS = 0,	/* Success */
> -	SCMI_ERR_SUPPORT = -1,	/* Not supported */
> -	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
> -	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
> -	SCMI_ERR_ENTRY = -4,	/* Not found */
> -	SCMI_ERR_RANGE = -5,	/* Value out of range */
> -	SCMI_ERR_BUSY = -6,	/* Device busy */
> -	SCMI_ERR_COMMS = -7,	/* Communication Error */
> -	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> -	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> -	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> -	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> -	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> -};
> -
> -static const int scmi_linux_errmap[] = {
> -	/* better than switch case as long as return value is continuous */
> -	0,			/* SCMI_SUCCESS */
> -	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
> -	-EINVAL,		/* SCMI_ERR_PARAM */
> -	-EACCES,		/* SCMI_ERR_ACCESS */
> -	-ENOENT,		/* SCMI_ERR_ENTRY */
> -	-ERANGE,		/* SCMI_ERR_RANGE */
> -	-EBUSY,			/* SCMI_ERR_BUSY */
> -	-ECOMM,			/* SCMI_ERR_COMMS */
> -	-EIO,			/* SCMI_ERR_GENERIC */
> -	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> -	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> -	-EBUSY,			/* SCMI_ERR_IN_USE */
> -	-EBADMSG,		/* SCMI_ERR_PARTIAL */
> -};
> -
> -static inline int scmi_to_linux_errno(int errno)
> -{
> -	int err_idx = -errno;
> -
> -	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
> -		return scmi_linux_errmap[err_idx];
> -	return -EIO;
> -}
> -
>  #define MSG_ID_MASK		GENMASK(7, 0)
>  #define MSG_XTRACT_ID(hdr)	FIELD_GET(MSG_ID_MASK, (hdr))
>  #define MSG_TYPE_MASK		GENMASK(9, 8)
> diff --git a/drivers/firmware/arm_scmi/errors.h b/drivers/firmware/arm_scmi/errors.h
> new file mode 100644
> index 000000000000..707761cd8d34
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/errors.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * System Control and Management Interface (SCMI) Message Protocol
> + * header containing SCMI errors definitions and Linux mapping.
> + *
> + * Copyright (C) 2018-2026 ARM Ltd.
> + */
> +#ifndef _SCMI_ERRORS_H
> +#define _SCMI_ERRORS_H
> +
> +#include <linux/errno.h>
> +#include <linux/array_size.h>
> +
> +enum scmi_error_codes {
> +	SCMI_SUCCESS = 0,	/* Success */
> +	SCMI_ERR_SUPPORT = -1,	/* Not supported */
> +	SCMI_ERR_PARAMS = -2,	/* Invalid Parameters */
> +	SCMI_ERR_ACCESS = -3,	/* Invalid access/permission denied */
> +	SCMI_ERR_ENTRY = -4,	/* Not found */
> +	SCMI_ERR_RANGE = -5,	/* Value out of range */
> +	SCMI_ERR_BUSY = -6,	/* Device busy */
> +	SCMI_ERR_COMMS = -7,	/* Communication Error */
> +	SCMI_ERR_GENERIC = -8,	/* Generic Error */
> +	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
> +	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
> +	SCMI_ERR_IN_USE = -11,  /* In Use Error */
> +	SCMI_ERR_PARTIAL = -12, /* Partial Error */
> +};
> +
> +static const int scmi_linux_errmap[] = {
> +	/* better than switch case as long as return value is continuous */
> +	0,			/* SCMI_SUCCESS */
> +	-EOPNOTSUPP,		/* SCMI_ERR_SUPPORT */
> +	-EINVAL,		/* SCMI_ERR_PARAM */
> +	-EACCES,		/* SCMI_ERR_ACCESS */
> +	-ENOENT,		/* SCMI_ERR_ENTRY */
> +	-ERANGE,		/* SCMI_ERR_RANGE */
> +	-EBUSY,			/* SCMI_ERR_BUSY */
> +	-ECOMM,			/* SCMI_ERR_COMMS */
> +	-EIO,			/* SCMI_ERR_GENERIC */
> +	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
> +	-EPROTO,		/* SCMI_ERR_PROTOCOL */
> +	-EBUSY,			/* SCMI_ERR_IN_USE */
> +	-EBADMSG,		/* SCMI_ERR_PARTIAL */
> +};
> +
> +static inline int scmi_to_linux_errno(int errno)
> +{
> +	int err_idx = -errno;
> +
> +	if (err_idx >= SCMI_SUCCESS && err_idx < ARRAY_SIZE(scmi_linux_errmap))
> +		return scmi_linux_errmap[err_idx];
> +	return -EIO;
> +}
> +
> +#endif /* _SCMI_ERRORS_H */


