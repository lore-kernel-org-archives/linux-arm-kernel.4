Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=stm9tRAZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cp+tOSd2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ehr9wJNS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=; b=stm9tRAZVMP213
	RVe9ppngch8L6m4YAuMFsF5pV1ULqQhrCrAz839PrRu0g1NF3zAiuK/CNMuXbUQdfGfdE7t2pTrON
	pqA9/0tVEtFpSa4TxC+MtVchawL/mtSVV9uGBR0i/A0jASUrXcmYltmBTjQ2kZWjJPaZcYS5xPTt4
	mo1D4MY15D8bmfim8uFs3sszw3OUU1Q0CkIGiFzKP4WYs99gvn31qnkoJ5hBpCz+8mzEyUx6UVdlL
	CDCVL7jV+k7RTnJeEJ8DF5fnzXAia5ED+seteqttcnzm0RMiKDAGor17Wcsl907/0uy6YCT3Ps9Mt
	Ea9G7mO+5ZLG/kBA6QWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuI2-000000059jt-1u82;
	Tue, 10 Nov 2026 22:26:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuHx-000000059jJ-3FFw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:26:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMLCJh1117233
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=; b=Cp+tOSd2a9k0ul7T
	vbbqZ/ZYAIXNkqtpV7NyDiLxrJZo5UvfJis9hgKgbbEkHjXnMVFbJBt6kTdQT35q
	qHSE8LuDyqRdV9S12bpuGe9NhSNZmJxVLnN1rFRYlcEn4NsmnzF3USEEL8SVRg1w
	3YAWqL2CmzcNRkH21bzGbGRaTDDsv9JFq1MXeadHg0fo/hKUW9g3ngngLp0hgZ6X
	HPfY8zl8YEkdgaJUsDnz/1gyCbiAuEA0ha4x8ghZi6TA88EUigyOLcP8ffglbS+C
	1y8amHKRD/WvcGcY+2DZ0RD/7/RYeglLY4gpoEggIy5UOHDApuAgX3S8qjWXb8ho
	D0npxQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva1ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:26:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4103036eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794349560; x=1794954360; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=;
        b=Ehr9wJNSoveF0HQwP2HBznIkwJoFPfnadQQz2SJRuBGcwF/WFXbKqLbHQusElI//5P
         fSQYIkKJ2SV2XO97BlLQU0xiDOE2tJey4F4r6fNJPtDqnoO7m7e7/EqFLy7zAryktwLp
         hl3HzNbaBG4Vh6c/HNcQ7qIqVuxHBW9Nk9I04a1xEAlEdEKisuJUEw/9Mo1vCjjp5UiT
         mDFjm71LhylcUhBUOD7jSf9vZNZ+54g2Vy/YgiL+G59lrjCRcVzSogjxn6cPetShwmfq
         ytuxRpjHMLDTAC1QLEEN+MDwpl5m0yUL3j8XfnvYEu6+cY3sJkMV1DrqQLVr0RkTtiNC
         3FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349560; x=1794954360;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTCujI8/h5TPqkOtaoAlRquKFa3ouHL2s5oDMvSTaAw=;
        b=V5CiBcOoRldMKdLbTkzkTXs71xi35h+0NGvL7vSChkAiD8BRbn8bToOKbxwVyn67/b
         4Tt1EHyb7013cApKpyNekF/ud+tzc8mRLYcUO68m7Y3NKHTheH8I/xLgPK+s+Xi1ln3p
         pRt/HcI7oUEM/Y933ano+zpMTbP/EPAPBADoptr249LxyRDuwGF3Qc/So5aEcag+Yl2o
         OwhOrXWZWeQS2Yc1BnJf8lbNTlTP7gFKqAal05TqzAal93kd4wW69UE1jgpIXzNxlDWj
         MDkUTDqMqf5b6Z2uLvhXMwixfzGFnTsuGyH3xPuPhHsu2FHpoftTUVEpzHpLuW32EH1Y
         TyOA==
X-Forwarded-Encrypted: i=1; AL+hErF59RofgUHLUsiadQfgIbiyl8Cj5vX1mpoZs8uPtIsXYtTtkSXyezXhUxsf1oETBrYNaf+AlYBlR8Th0ai8+wAN@lists.infradead.org
X-Gm-Message-State: APuU4Z9tm/Pj+dcbv65hlTgpy7Uz5moKCDb6m8E/y7zlpXGy3LWtOQCK
	MqTsbLAMpIn6Y6Ky2S/QPfVBo1kB1R6f5gS5BQIdT4auGzPu/4Fexpx/GdlcSANhLavFGD/5f2L
	bWHttX0K1aOYKzHcvCtE75Xx1cz2ULi+NqSTRtzo8sbCBkbouhwR7vCxeyqIGlvuBfY0ZdtdLZL
	l41A==
X-Gm-Gg: AYBFou1LWBDfwkD7S10QYlSBOpqKi5du0GiLJPXqSeM8qyhoZlDC+tWx3KshW5nlb2P
	p+00L+c4Jzz0Pkpj78hDv5fPHxjkZCPeiFKUWxlHtw2RFq54Vf7SnTuTSsWxAzLXXFZAo54QNWF
	V7yg6W67G/ZuXenpSyRJukNi/PvzQ24ftUKH8YZKNx2eldKytctc4QLX5oEE1uuXa2cETkf0ErF
	dEatZ2tTQgpWEAx4dHJYlkCB0k2sYlEwKrHoCDI8ppGQrKx1g2YFtCOmOtEwv76L0Zy+mkmPGz4
	Ws/PFxAac2T0QZRoO/W7BOnj2D5l+7KwBzZ1l+L7qEboP+fIs12C6s5xMI7KtVnLd4kXbf5WZfI
	b/ZKyX+fSvZnBQhUGJYNBA4+2/UDSbxSL1YbJlAI67cq4Swx7Mu/lVuYW++HyXaWOSlYFYOjdX2
	/BIX5ij2cODzCU53W+3rbxDKzYkIc=
X-Received: by 2002:a05:7300:6a8f:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-376861732afmr893498eec.28.1794349559641;
        Tue, 10 Nov 2026 14:25:59 -0800 (PST)
X-Received: by 2002:a05:7300:6a8f:b0:360:e2e6:f849 with SMTP id 5a478bee46e88-376861732afmr893440eec.28.1794349558946;
        Tue, 10 Nov 2026 14:25:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm9981992eec.20.2026.11.10.14.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:25:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:25:35 -0800
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
Subject: Re: [PATCH v15 21/35] firmware: arm_scmi: Add Telemetry boot-on
 support
Message-ID: <20261110142535.000034c8@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-22-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-22-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af399f8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=vwVg_fRgSUVs-176lKkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-ORIG-GUID: xU_JTRIni3Nfk5eiaai9bRY3OBrKR21q
X-Proofpoint-GUID: xU_JTRIni3Nfk5eiaai9bRY3OBrKR21q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX0izbCXXr/F3V
 lwHq4XytY8hV4jyrq6Q5Z6zjfjMSJ1GYHe4i2tK2yQKP6GYJiJqt7sE0irwRA11q7qxmZhodm7T
 Ef5O1lxLFdV26i/K2qh9yDrgMf/5eNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OSBTYWx0ZWRfX/Q+LjWonpJ4E
 NLqnZv9L+OJBw0ClSz9UwKkT9NxYlOoeGtfn3IE7Hnk2er/hnJhRI/v1ukak1EswVE4GDf/3T2r
 eEcT58DcQ5eRYyn/qnZoRfK6ZzqJ3N9WPM6g8ypz6uCXgUttrLqRXWo9taOS/5St7iECk3YZ7px
 wkGR71nD3MjX3kyx08AsoDeIuYK5EifM32zsCLA+oFENZjxYvUUGe9vvGFszr5PPPv0xBuBJ+7y
 bXLBM/j2NQ7pvKhV4CrSqjwup97bSCkjUvPtcT2UDsib95H4CnOggPJJ0bBvD4GnFbXxg2tWiAM
 6nB3sgZV+a9UjEQBj1p7WMRJIxbBISyUo/ywkXBIbS2yswpfQaS13QZNT99UgZxDi5KlutEGQ4J
 9FRHlSc/kvW3Hwcr2LFKquYWWEd8v4SBxC5W8Vqf3CbzqLsIqJMLJJrlkGStc3mZrZlhZZ+CxIl
 IgOp1qJCN80HRSqTxzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_142604_225339_C07534B4 
X-CRM114-Status: GOOD (  31.54  )
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

On Mon,  9 Nov 2026 09:12:07 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add the initialization and discovery logic needed to detect when the
> platform SCMI server is configured with telemetry enabled at boot and
> perform all the needed resource enumerations to keep the kernel telemetry
> subsystem state aligned with the platform boot-on configurations.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Minor things inline.

Whilst reading this I'm kind of on the lookout for things that maybe
could be pushed out to a future patch set just to cut down on the
rather large reviews needed on current set.

I'll address that separately when I get to end of the series, but
maybe this is one such thing that could wait.

Jonathan

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 287 +++++++++++++++++++++++++-
>  1 file changed, 280 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 918067e225d5..2322348f98c9 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> +
> +static int
> +iter_enabled_list_process_response(const struct scmi_protocol_handle *ph,
> +				   const void *response,
> +				   struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_de_enabled_list *r = response;
> +	const struct scmi_enabled_de_desc *desc;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_de *tde;
> +	u32 de_id;
> +	int ret;
> +
> +	desc = &r->array[st->loop_idx];
> +	de_id = le32_to_cpu(desc->id);
> +	if (scmi_telemetry_tde_lookup(ti, de_id)) {
> +		dev_err(ph->dev,
> +			"Found INVALID DE with DUPLICATED ID:0x%08X\n", de_id);
> +		return -EINVAL;
> +	}
> +
> +	tde = scmi_telemetry_tde_get(ti, de_id);
> +	if (IS_ERR(tde))
> +		return PTR_ERR(tde);
> +
> +	guard(mutex)(&tde->mtx);
> +	tde->de.info->id = de_id;
> +	tde->de.enabled = true;
> +	tde->de.tstamp_enabled = le32_to_cpu(desc->mode) == DE_ENABLED_WITH_TSTAMP;
> +	/*
> +	 * Guessing that, if a DE is reported as enabled with timestamp, it has
> +	 * to support timestamp: NOTE THAT the timestamp type (tde->ts_type) can
> +	 * ONLY be discovered later by  DE_DESCRIPTION.

Extra pace before DE_DESCRIPTION that probably wants to go.

> +	 */
> +	tde->de.tstamp_support = tde->de.tstamp_enabled;
> +
> +	ret = scmi_telemetry_tde_register(ti, tde);
> +	if (ret) {
> +		scmi_telemetry_free_tde_put(ti, tde);
> +		return ret;
> +	}
> +
> +	scmi_telemetry_de_state_update(ti, ENA_STATE, NULL, true);
> +	if (tde->de.tstamp_enabled)
> +		scmi_telemetry_de_state_update(ti, ENA_TSTAMP, NULL, true);
> +
> +	dev_dbg(ph->dev, "Registered new ENABLED DE with ID:0x%08X\n",
> +		tde->de.info->id);
> +
> +	return 0;
> +}


>  static int
>  scmi_telemetry_de_groups_init(struct telemetry_info *ti)
>  {
> @@ -1163,8 +1417,13 @@ scmi_telemetry_de_groups_init(struct telemetry_info *ti)
>  		}
>  	}
>  
> -	/* Expose all groups once all fully initialized */
> -	rinfo->num_groups = num_groups;

This reflects on patch 11, but using num_groups here was rather inconsistent
with all the use of ti->info.base.num_groups.

They are equal as it was a santity check earlier but I'd make a change
back then to use the ti->info.base.num_groups to assign this.
Then more obvious here that you have the write change to this loop.

> +	for (int i = 0; i < ti->info.base.num_groups; i++) {
> +		/* Expose groups once successfully initialized */
> +		if (!scmi_telemetry_group_config_lookup(ti, &rinfo->grps[i]))
> +			rinfo->num_groups++;
> +		else
> +			trace_scmi_tlm_access(0, "GROUP_LOOKUP_FAILED", 0, 0);
> +	}
>  
>  	return 0;
>  }


