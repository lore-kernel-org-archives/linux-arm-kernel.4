Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n9snndyL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SaJ7MQkV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HzaHg41Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=; b=n9snndyL8DYrFs
	LbahQm+MOJvHZIZx5NDkmQeQsCPk5Wd3PtzO1JrEi9RekweJK7quOvFYzFcOg1uA+kzVN4rx1Gd/c
	isIClynRU1jtexycPzPRTyECMXw/zD8YJwnyQ+FODUpx0Yi1ggm7TZoDsrlBbxcN/uzbPoIV7UbAm
	xt2xIJidLE+p+LHNy/o39PcmyE417Kr3JmXhXVX2s6BJTz+5Mb0Ex5sKjYr9ixclM9Fjo5GWLiLDu
	f2Wg8J4Fa3s+nN33/i5mLBvhPc0bXpHc1PLYprcdsw0dfVqzN/S+ORIPUjH7Olzj+4dfdpleTu8M+
	kgHO6+QUhQ0C2+3FsadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqfq-00000004o5b-2q4L;
	Tue, 10 Nov 2026 18:34:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqfl-00000004o4E-2f8u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:34:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF0C0i3713592
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=; b=SaJ7MQkVqcEov/Zp
	G6DNO3M5WaRiQEC2W9C8uSRw8U7nBHky9LwKAIU+gO97H5lyVLGNYcciTkXSPaJl
	bw+jay9tS9q3KPO0pMduEhONBECQDouysnAtsX47aDH1aqTkMMpRe7GDzzqTcfBk
	K2JRFIbkGZk1LTqFyGiedJOKy5CedEtaHKH/CvhUbomoePhT26Za/Oy6S5Pv2A/7
	gsm157jneUh2GCVmKUfk1bvMRBbBOpt+Fk+wMTtZ/chSQbNhYmDxSdIhXsVcLtfp
	oeF1h9KrcqRZ+Ie4BJL1a3P1vdci9K6N9LVFk6ZNWAS7Rrn/JwsNrbeosStDljke
	4kRmkw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdb5gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:34:20 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so315153c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794335659; x=1794940459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=HzaHg41ZnbUc4Ci4W12MlTZohi7mER1HNNiUxN3rAUfttu17Irjs90flia9vXLI7YV
         /lAqCoc779nWlWCHQn0yTmUnHiUaC60pHaRi2AuhtxX3Hu1piOphn9aNsDxC6vSezswY
         5VfAmgmfQEypcW34qVNkpbpDsnBIFl1kHOPBMgtJHp7VNZ2RlpOZBnrV6W6IneD4jpvv
         +WGsYbk7V+wH+7ViqH4PgWeJ/gbBXfk6BWkbFJoGrnNF7exwgwhxpCoIWSeAp1V57k1W
         WM9TVtZk9ryabZXQMHGMA+ldu49NDBRARFoKz887ae7EFIKzK7peh4nOmdQG9JVpbe4f
         yNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335659; x=1794940459;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xyV7qBNwckqTtIsssEL9NaExu/jjkMlfPFwS4GdvAeo=;
        b=cH/suiY2KFmlaeqw0cn5dJstUsF813VTDyeFIiuG3aqUci/XqvXAuRE7xiM+yiiUrs
         oi1lGyNRjuhS1U+JM+fhrambmwnKzd+x7r1EE6EWUe332R8mV2LO9vUdBpbqp92U5AUf
         dy7bRYk3+/Axy99R/JcWkZ3Dke5ZiN2oXPkJDhzzf2xMHlayQ29zQ17wHGk6AlM2XupX
         Qzt711+djme1LWao/5cAUb42chnorRiWwXo1cVvOVGQkCTzKfMfHIXmsPMCfLfIdlTW2
         3CDJWrjYCSdi58vTfX6+37VSKi5XkGn5bmYfg5HuTfrsF7Alj30PsMBTk9ESEWqm40L6
         PhRQ==
X-Forwarded-Encrypted: i=1; AL+hErFcsQkbqb/KLxKshJ4RxER4Bv+UwUV5ptqhSgldUANvTicBZEIynlHNlskVyH37uwmxaKaI86ZwR4+lw9MyifQc@lists.infradead.org
X-Gm-Message-State: APuU4Z+Q7st7sPDxqbmNAibQgTTkwIjYq0FAxdg3aJwIW5HXAGNq5oUI
	E3Mv/vcjLqsluyGqW78PCaKW7qz5Ied4F+EJf4HWr8b29OnMaFtYpw/7jAZfDn2xuAu+/V39McQ
	BpS9j10nMcgB/yjUkblxKsGMhPuH3XzMY/aOFZcQOMi7Bj9MLr8TEFrGbUUNs5D30LsMr8CLQ/J
	woyQ==
X-Gm-Gg: AYBFou2dyWmRhPRGWxYEQavVa/Fybi8vJbFdXAdPec7RmaXc4BmEXARgcCIv7SQBojy
	7ntX7vO8uT+LVrwnJy4y9h2xywcd2n7aRg4FeiTvfAzM9qdgrEiGMVJ/LYhaJwULEVcvi9wo4G/
	/O2ZSQYkzRIc+FJpGS9EiWkP1gPhAlTwyFfSKOUqM34GSfnu5PpZXxwo7ygF5D/mJN6qyQU0Yv7
	6vZIU9WRTkLP2TLBJ8+MMsFzhfPq0wTLmdaKIujFZ1HyFUWouu3A6xD8Cja8OAm9Vm6oRvt+rUw
	1S1IgqRIutwqlqm/PgpifZoIEWONesfzLYPGg8+tTi1lePbeVQVbWqSSHNt7EGxpbvBLqS/7xfc
	LSaec+6QPG73a49YCcvKa/SfNwgipbVvrS45yB2YqoLnofJYTQQFI0TQvNmkJCsgqpO9k2LDUTM
	t2ybiFnouoB2acLCt1l8z4XBwnjr0=
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484112c88.8.1794335659320;
        Tue, 10 Nov 2026 10:34:19 -0800 (PST)
X-Received: by 2002:a05:7022:1109:b0:1ac:f84d:403b with SMTP id a92af1059eb24-1b3b6054c1fmr4484060c88.8.1794335658518;
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm17591012c88.10.2026.11.10.10.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:34:18 -0800 (PST)
Date: Tue, 10 Nov 2026 10:33:56 -0800
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
Subject: Re: [PATCH v15 15/35] firmware: arm_scmi: Add Telemetry TDCF
 parsing for BLK_TS lines
Message-ID: <20261110103356.00003a29@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-16-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-16-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7nVFGVkEA2zoLrUwi52cZROAOLliMAt_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX8/BSi+1X4LVz
 LhRe2ObsX2OHo/cQwURecxBj43d8PNpPqgBftPjBA7+zYpVcEwn6OEoIm298kjk60ubgT2++LOA
 p0ivLT++stOOG/tI0RFES8au+ETRj1A=
X-Proofpoint-ORIG-GUID: 7nVFGVkEA2zoLrUwi52cZROAOLliMAt_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3MyBTYWx0ZWRfX6avDsC6w8XnN
 Gy6y19fWhBrZ2rbF/aJyq3sNHVd/uESm9dsz5wSU5pufCUz4/T28auLsZiYM/NGA9INNbhI1zG1
 Ofvhva8lx608IOXSmDJkrgsn0sM6nXsXOuO1S6C25SkpicF6fnyqnGuKKRotMaAcwOJygNGKTha
 0ZhMIpgs9PpB3ezTcR6Q71P5BKJJZsQrVcZlXBkuNR8z2kQkT5zsWQES5slQm+Q40NOns/Fo6Es
 uSe0RaMqlwmlx5qdXSrIjO6DInPkqKW8y7p+B3L4jhGlh+9A2tcEWXaD3WFMc1noAGrcqJJ/exS
 1AgX2Z19mrHiLJkty8lNRjZ8AhqQSuc0ppwN+McMnYOpbw96fctID2BZskIHIqM7eCcr1nPYBgw
 YRzQjvsuPes6zL2QzRA+VL52qzvyTqo68lob4AgKfkFlx8bI4qKJYyeyhk9jJcR1VeJg9Q1S0AL
 7szfs1zzqtbWOyXx5uw==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af363ac cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=JRCmi-Q6nD18N7oa2wEA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_103421_801205_08E81ABA 
X-CRM114-Status: GOOD (  37.98  )
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

On Mon,  9 Nov 2026 09:12:01 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to parse, track and link TDCF BLK_TS lines to the related
> discovered DataEvents.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor things inline.  + I think some of previous patch belongs
in here. Getting patch break up perfect is sometimes a pain, but it
really helps keep things logically together for reviewers and on
a massive set like this, anything that keeps the reviewers happy
is the way to go!

Jonathan

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 317 +++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 810195889484..e3fbcb1e6ea7 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c


> +
> +static inline void scmi_telemetry_line_free(struct telemetry_line *line)
> +{
> +	void *blob;
> +
> +	switch (line->type) {
> +	case TDCF_BLK_TS_LINE:
> +		blob = to_blkts(line);
> +		kfree(blob);
The local variable isn't adding much over

		kfree(to_blkts(line));

> +		break;
> +	default:
> +		WARN_ON(1);
> +		break;
> +	}
> +}


> +
> +static struct telemetry_block_ts *
> +scmi_telemetry_blkts_create(struct telemetry_shmti *shmti, unsigned long offset)
> +{
> +	struct telemetry_block_ts *bts;
> +	int ret;
> +
> +	bts = kzalloc_obj(*bts);

Use a __free() here and then no_free_ptr() on the return.

> +	if (!bts)
> +		return NULL;
> +
> +	ret = scmi_telemetry_line_init(shmti, &bts->line, offset, TDCF_BLK_TS_LINE);
> +	if (ret) {
> +		kfree(bts);
> +		return NULL;
> +	}
> +
> +	trace_scmi_tlm_collect(0, shmti->info.sid, offset, "SHMTI_NEW_BLKTS");
> +
> +	return bts;
> +}

> +
> +/**
> + * scmi_telemetry_tdcf_blkts_parse  - A BLK_TS line parser
> + *
> + * @ti: A reference to the telemetry_info descriptor
> + * @bts_payld: TDCF payld line to process
> + * @snap: A reference to the working SHMTI snapshot that will be processed
> + * @active_bts: Input/output reference to keep track of the last blk_ts found
> + *
> + * Process a valid TDCF BLK_TS line and, after having looked up or created a
> + * blk_ts descriptor, update the related data and return it as the currently
> + * active blk_ts, given that it is effectively the last found during this
> + * scan.
> + */
> +static void scmi_telemetry_tdcf_blkts_parse(struct telemetry_info *ti,
> +					    struct payload *bts_payld,
> +					    struct shmti_snap *snap,
> +					    struct telemetry_block_ts **active_bts)
> +{
> +	struct telemetry_block_ts *bts, *previous = *active_bts;
> +	struct telemetry_shmti *shmti = snap->shmti;
> +	u32 meta = PAYLD_META_RAW(bts_payld);
> +	unsigned long offset;
> +
> +	/* Check for spec compliance */
> +	if (BLK_TS_INVALID_RAW(meta)) {
> +		trace_scmi_tlm_access(0, "BLK_TS_INVALID", 0, meta);
> +		return;
> +	}
> +
> +	offset = TDCF_OFFS(snap->base, bts_payld);
> +	/* A BLK_TS descriptor MUST be returned: it is found or it is created */
> +	bts = scmi_telemetry_blkts_get_or_create(shmti, offset);
> +	/*
> +	 * On error processing the new BLK_TS bailout taking care to clear
> +	 * the previous last active BLK_TS to avoid mistakenly binding to the
> +	 * next data lines.
> +	 */
> +	if (WARN_ON(!bts))
> +		goto out;
> +
> +	/* Update the descriptor with the lastest TS */
> +	scmi_telemetry_blkts_update_snap(ti, bts, bts_payld, snap->magic);
> +
> +out:
> +	/* Drop one refcount on the previous active since we found a new one */

I'd have this mention where the reference was taken as then it's clear why
it makes sense to drop one here. Something like
	/*
	 * Drop one refcount on previous active to match with the one take
	 * in creation as no longer need to keep it around for potential new
	 * users.
	 */

> +	if (previous)
> +		scmi_telemetry_line_put(&previous->line);
> +
> +	*active_bts = bts;
>  }
>  
>  static inline struct telemetry_de *
> @@ -1561,7 +1801,8 @@ scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap
>  		*tstamp = 0;
>  		if (USE_BLK_TS_RAW(meta)) {
>  			/* Read out the actual BLK_TS */
> -			*tstamp = scmi_telemetry_blkts_read(magic, tde);
> +			*tstamp = scmi_telemetry_blkts_read(magic, tde,
> +							    bts_payld, snap);

Noted in review of previous patch that I'd just have all the parameters
back there rather than adding these two here.  It isn't consistent in that
some parameters were used and others not, as in that patch magic wasn't used
either!

>  		} else if (LINE_TS_VALID_RAW(meta)) {
>  			/*
>  			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that

> @@ -1906,6 +2187,15 @@ scmi_telemetry_shmti_refresh(struct telemetry_shmti *shmti, int *idx)
>  	return work;
>  }
>  
> +static inline void
> +scmi_telemetry_reset_active_lines(struct telemetry_block_ts **active_bts)
> +{
> +	if (*active_bts) {
> +		scmi_telemetry_line_put(&(*active_bts)->line);
> +		*active_bts = NULL;
> +	}
> +}
> +
>  /**
>   * scmi_telemetry_shmti_scan  - Full SHMTI scan
>   * @ti: A reference to the telemetry info descriptor
> @@ -1976,6 +2266,7 @@ static int scmi_telemetry_shmti_scan(struct telemetry_info *ti,
>  		qwords -= used_qwords;
>  	}
>  
> +	scmi_telemetry_reset_active_lines(&active_bts);

It's only resetting one.  Maybe reset_active_line?

>  	srcu_read_unlock(&shmti->srcu, idx);
>  
>  	if (ret)
> @@ -2120,6 +2411,22 @@ static void scmi_telemetry_resources_free(struct telemetry_info *ti)
>  	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
>  }
>  
> +static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
> +{
> +	for (int id = 0; id < ti->num_shmti; id++) {
> +		struct telemetry_shmti *shmti = &ti->shmti[id];
> +		struct telemetry_line *line;
> +		unsigned long idx;
> +
> +		guard(mutex)(&shmti->lines_mtx);
> +		/* Drop all remaining currently unbound lines and their containers */

I'd avoid the comment.  It's a _put so should be clear there may be references
held that keep it alive for now. The comment kind of invites questions about what
it means to drop unbound ones here, and what the lifetimes of others look like.

> +		xa_for_each(&shmti->xa_lines, idx, line)
> +			__scmi_telemetry_line_put(line);
> +
> +		xa_destroy(&shmti->xa_lines);
> +	}
> +}


