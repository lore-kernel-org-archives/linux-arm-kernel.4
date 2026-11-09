Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C7460A2612
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OfutszNX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P7df/oHK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SItbAMsw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=; b=OfutszNXQ3CK8y
	3TLJT40H+bcaGeynVLWhgkqxmmb8Dp7d24O3iGLNjE7i9atGYfC4AYIsfDdg/absOoQQrFuoqaB5z
	G9Il993c1/ewxBhz6iv65yzWpc47rQ1lviQgCgiK8TQp7F+nKAisrKunLoYktTsdJFQhRbH+rPb9C
	VVJELK9FEn1pPkZWPsAGZ0WK1+uSUMZqJVMDShVHht22GAzKAM/jcxPnpZl68+r4X6Qv7HqFqIYd6
	tD//GChKH3KOyFmpWzjqWoSYHmP232tEC3dGpe/7gY+7CfiW14ElGjLqwVt/n6sVqLEpIgl8vc5yY
	dsPRuoO1QLvsbJVup0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZEs-00000001yLJ-1a87;
	Mon, 09 Nov 2026 23:57:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZEq-00000001yKm-0qDN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 23:57:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9vdm2018040
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 23:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=; b=P7df/oHKtu/L6AL9
	oqYI7wHDYo8ud+Jllx28MBig/s6ZgrSXgSZD/FmgLmOSw5KhdD0OIUqoIHDM3uhE
	GX4utPRN8O+heRLZjQvIie38noeZiaKYJM2rNyww0+N7G9FxR2/0uxvIbYHjSTP6
	lkHtRnEJdrfspa4LbZoWMf2Y5rIOSc2paYFC4vVRQGNJn0cxWNfvI9SmfEixSX0c
	HH7pwFMAze9twemWpnh7rHEe5nxk/O8tSMu9L8qDMpYnXTsET+ldsCQ1d0mknyMH
	kKoK3cS+h8m8jc8CGvh2/lh9LO2Yfq/NQ5ukTOXIXU9HrKzcNagmnCTiUd8YxLZa
	/MbDwQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg0rvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 23:57:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37549877380so259469eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794268642; x=1794873442; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=SItbAMswqH8tIq0eiiD8RDU5/b9DkjGbC6s19hku1n88NQEteHr7YIFesQFf4NoNIF
         8wvBD532UQjwD0gbsPLe1vCapf+vHAF58bZW0BvlLq5VwAkv1fGl2lVie2e8MprsRjTi
         hW7oqx+doXTP2o09bTggCWTz4o4OfNGB3/YEsOgSTnFaMJwDngRphSHgwjUBqUorilwU
         H0ELLXXKqJpLWuB7UriPvHaeqCfEPR80HZgjB82+JC4OiALyvRZhJf6xxF+x7ZdjlAuY
         d67Xjkf9J5In2Tp2/2j7mlJZnNF/BmVVWH+qZXw1C5SlmNXb+eYOJT7QvO2SbuHg2XYN
         MClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268642; x=1794873442;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCyUzlqAB6XNK1tam0Dwe7EWgFWawysxa8qRUG9TL1Y=;
        b=N8H5cO7ykGJQftLNaEu06NvdDQmyMQVcOVWfV582IcC83Y63BRod7p86Vs91k4MK7w
         DeNGz1BZH2uqoqmi6lq61BJIpvL/38dqaynZFl3BNGkKSEo9jXhYRctLN2aX3Pu96968
         VY8gFOl2DoGcql7oBK6s9gDMGHq2ehdiM4xrEnpmkGI/NRLecaHpIiNg4KAyc6wLKAkw
         rnpHzy3r7EG8FrulXw3SiEzfbyeAfuFbrFpzcB1tWreGk340JlOWFEXSh9w4Dn3gPvxM
         c9CnQN2HcKHxWBAs0OzvPPiqthhqM+l+2iJQ2F/BO0qQyBYcmm1Pzwhsc2SrTBD7NJTm
         j8Mg==
X-Forwarded-Encrypted: i=1; AL+hErEZz6A+w3JBRhRAleIH/ljzOnr+5woOWsHMXJHwZaRDu2bnIEAbzNP12tVUIfe6Y+u6jTgoYQCWIaVnOtWc3tao@lists.infradead.org
X-Gm-Message-State: APuU4Z/ayDZc0MRA1wS/BSvq4pvzhatuY1+G3BIptN8YZui7MRxvZIP6
	inGFC4X2f0EYutQ7z4yM/ijQvQ0CO1pn0t5kQdxPRCom0SS4xjIjnLnDIkC7nCfgmf11DUdtfQx
	ZRX9z+SIpKk6nxHkruoL1HIO2LJ6f9RwIXnpo4IMKUYshjTci3KSaYi1sAUlCu8mbEmxhQKedYj
	0Ztw==
X-Gm-Gg: AYBFou2IO9vOzPDWJp6VJLaPl3/DQVMg8jhKhHDWfSIHnosQRqeBKlJPljkpomjWtSB
	ZTOx+UlOUy/Q91CwMiqosj5fIdJSr2D9gUoMMLllDBBLsIPQMTYrO8dpszZnppovitb76mZF4/W
	wua20RpgUtfyh+1z0DOtk8nmumFc3+T8o+54Gt1xImyPoU+jdBwP6nvoMbzxaqkhFp0wNSTvCZv
	G9I4w3BZgAmybXQkbPnDvySechxgPd4kTSWh9aeiwdpZI+gwQlkykNF9+b3+clVGybW4D9xvxwj
	Feq83ArO6GvlyThwm7z34JoiVbnSRnsmqdl25TBZjf0SU9h42/kjLJRMtHfSXPxU9bkd51qLsb2
	ck6rXKAjkr0WN2buS8vjUFCRFGT//ko9EMrgfdwGMl0Frnaw4XwdmcvkH2g00AlKboFqh73XDAz
	3bzQcU3Q4tGzKOCZcK8MH3lpOO3A==
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153093eec.21.1794268641554;
        Mon, 09 Nov 2026 15:57:21 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-3751fa3d519mr1153056eec.21.1794268640929;
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm1608728eec.13.2026.11.09.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:20 -0800 (PST)
Date: Mon, 9 Nov 2026 15:57:09 -0800
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
Subject: Re: [PATCH v15 09/35] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261109155709.000059cb@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-10-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-10-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfXx9OUi0Y/uH/R
 jLRrjoogWr2beRl+Q1OBkOKL1zug1BlmtCmdxwixrwGgs/Srs5eujx43EhAfC/a6kzZ4KS+ZGjg
 wTPMMUhOtVXC9EOl+d0Ay5Qh6CODA5x7wBd3Yqnj318tFsSbYmSVHX+hGbbGL7AKDSVLpV5ReVS
 cMjZSlyHh7JtZxRqiicUrFsTSx92Jkche9nwo/TK9idG0RSigdbAEe31quMCCQqShnS04fVRw3O
 8fGE+KQvL/EKgNFXCHAAtPbSboKT/VNa1uf3B8ghMhk3JPhCKkiR5M7e26IpW/nGHoTNJAa+GEW
 OP06gRjtZiVxXVSvTOk959tN6CH8vBlx7BwRodfHWj0uWH7CiRBPBPIVVKrhTMYBKfGZSDYQXHd
 /1SIWFwS5n3r+ImboNWhgnVIP0O5w5HvpGjBBQ+ba5WZMC7HWC0UACfAgY2RjdO5/+HZBTnz9me
 yqzywHHslbSqols1ZlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA5NSBTYWx0ZWRfX2KrkR1vpYwpu
 iT6PrzVfMFsOtjx7/hfiiWsbF5/CDUnj3MncryQDx4CaXsBJUGx03n1qzfgMsqxvrYOxw9pGYIL
 Am6QBvqI80ikq9SgxpLqE6m7VUmL59A=
X-Proofpoint-GUID: KZmuv38HfHHzN4Hg6s39JVTxd88xeky3
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af25de2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=FN7pwp8LrHzWrJGgN4QA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: KZmuv38HfHHzN4Hg6s39JVTxd88xeky3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_155724_409156_AD862DF5 
X-CRM114-Status: GOOD (  32.03  )
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

On Mon,  9 Nov 2026 09:11:55 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.

Thanks,

Jonathan

> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index d1f1bde8a7cc..77daedddaab7 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -410,5 +410,6 @@ DECLARE_SCMI_REGISTER_UNREGISTER(sensors);
>  DECLARE_SCMI_REGISTER_UNREGISTER(voltage);
>  DECLARE_SCMI_REGISTER_UNREGISTER(system);
>  DECLARE_SCMI_REGISTER_UNREGISTER(powercap);
> +DECLARE_SCMI_REGISTER_UNREGISTER(telemetry);
>  
>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..23eaac485691
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Management Interface (SCMI) Telemetry Protocol
> + *
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#include <linux/atomic.h>

I'm not immediately spotting this being used.  Perhaps take another
look at whether some of these should wait for later patches
where their usecases come in.

> +#include <linux/bitfield.h>
> +#include <linux/compiler_types.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/sprintf.h>
> +#include <linux/string.h>
> +#include <linux/uuid.h>
> +
> +#include "protocols.h"
> +#include "notify.h"
> +
> +/* Updated only after ALL the mandatory features for that version are merged */
> +#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
> +
> +#define SCMI_TLM_DE_IMPL_NUM_DWORDS	4
> +
> +/* An enum listing the protocol specific commands definitions */
> +enum scmi_telemetry_protocol_cmd {
> +	TELEMETRY_LIST_SHMTI = 0x3,
> +	TELEMETRY_DE_DESCRIPTION = 0x4,
> +	TELEMETRY_LIST_UPDATE_INTERVALS = 0x5,
> +	TELEMETRY_DE_CONFIGURE = 0x6,
> +	TELEMETRY_DE_ENABLED_LIST = 0x7,
> +	TELEMETRY_CONFIG_SET = 0x8,
> +	TELEMETRY_READING_COMPLETE = TELEMETRY_CONFIG_SET,
> +	TELEMETRY_CONFIG_GET = 0x9,
> +	TELEMETRY_RESET = 0xA,
> +};
> +
> +struct scmi_msg_resp_telemetry_protocol_attributes {

I like clear names as much as anyone, but probably wouldn't lose much by
abbreviating a little?

struct scmi_msg_rsp_telemetry_prot_attr
perhaps?

> +	__le32 de_num;
> +	__le32 groups_num;
> +	__le32 de_implem_rev_dword[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +	__le32 attributes_1;
> +#define SUPPORTS_SINGLE_READ(x)		(le32_get_bits((x), BIT(31)))
> +#define SUPPORTS_CONTINUOS_UPDATE(x)	(le32_get_bits((x), BIT(30)))
> +#define SUPPORTS_PER_GROUP_CONFIG(x)	(le32_get_bits((x), BIT(18)))
> +#define SUPPORTS_RESET(x)		(le32_get_bits((x), BIT(17)))
> +#define SUPPORTS_FC(x)			(le32_get_bits((x), BIT(16)))

I guess a local style thing but my normal inclination would be not hide
what is going on here and instead define
	ATTRS1_SUPPORTS_FC BIT(16)
and use the le32_get_bits() inline.  These helpers have lost the connection
with attributes_1.  

> +	__le32 default_blk_ts_rate;
> +};
> +
> +struct telemetry_info {
> +	bool streaming_mode;
> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;

It feels like this is in the function scope rather than the if (!ret)
mostly because it has a really long type name. See above.

> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;

I think this would ideally be in the if (!ret) as well which makes
more sense if the declaration is in there.

> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {

Maybe given long lines and indent, this is worth a helper function.

> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +
> +		ti->info.base.num_des = le32_to_cpu(resp->de_num);
> +		ti->info.base.num_groups = le32_to_cpu(resp->groups_num);
> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));
> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));

I think that mask belongs up with the structure definition as people will want
to check the whole thing in one place.


> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

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

Not seeing use of that in this patch within the header.
Perhaps it should be included in a later patch or in the c file?

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
> +	unsigned int num_intervals;
> +	unsigned int num_shmtis;
> +};
> +
> +struct scmi_telemetry_info {
> +	bool single_read_support;
> +	bool continuous_update_support;
> +	bool per_group_config_support;
> +	bool reset_support;
> +	bool fc_support;
> +	struct scmi_telemetry_base_info base;
> +};


