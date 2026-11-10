Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97E606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VHzx6Mjk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMjT0Un2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jXEqyrjx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rEYk2hz3ZT8gh5jgp2cuyRyD8kcB8tgP4Wu1VC22UmM=; b=VHzx6MjkcJN1Uw
	9MBBQQN8Rl0KOreQ9uVeMhV+X2degkNC5l5AtJEO4KE9mgTGtRLo5GtACqVkVpAdmo983c+dQfrPb
	3PbsUZBnGjdmmuJQdeQxw4bNhVRqc6Zerd8VFpmxwBp6l7dY98rKhMig+eDEFFwfd/ZQ6xrqboLXc
	B7CIW0OpoGS6/Esknx3HctXJlnf4DAxBxBcYWANMBp+W8gkpR6DiSPI+Ni1w/l75OSXZZyd2gitvZ
	ASEf1yGrjKSZ10JphuohhuzaCtdCnx30ZIpaKy95z2OQbSGW6hDEUOi0I2H2oDU9JKgVP4wpTH8XN
	baR411UrvkldPtqr+zkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtsH-000000056xt-0gsl;
	Tue, 10 Nov 2026 21:59:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtsE-000000056xC-2uc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:59:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAJKlMp733951
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 21:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEYk2hz3ZT8gh5jgp2cuyRyD8kcB8tgP4Wu1VC22UmM=; b=eMjT0Un2/C3ifcyq
	6yWnfWfH6I4DHiYNovnQJoEexXRLhME6cyXbjFnAVLiO4x6z15WCYQmzdWojWeFH
	LWvyXVeMmKoi8hKUbFIlUYOXzqJ64Nw4ladn7TbI6gIU/3haTCUbOoe//MmLOrbE
	2J84OeZrVww9WVxDc39Jmiyhrhm5FTOMvk5POeuoz2XLHdR1q/yIRtpDOCC7g9mG
	lYM3cYfpkSZHY+xzppJ41+9Dfn7AM+c0/YwLUJjx2JPJykxVaiAf0rteQkVGFPHu
	P9f92xIcdHTW5DTAjT0mpeLieeR01JWhmuL5uoJp18KjNl6Mrp5tqI8zBUox2uHo
	xpX2Fw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv9xch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 21:59:25 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so265804c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794347964; x=1794952764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rEYk2hz3ZT8gh5jgp2cuyRyD8kcB8tgP4Wu1VC22UmM=;
        b=jXEqyrjxyV90KXK6fna1D/JhmJF8uxzOB+3FkzB0xCkXO0MjbltbNfs8UjlYWPsLqp
         KBg3Wp52cme87W6qXtVAmJzYEjQbrHJKjNjIwNSDy3se2gaGmAw0BpYDGo1vf45eSXF+
         9TyT6/ksUpgpny8TUSw2SopAU9fwWzoRNMFpDPnM65FyXFjhvkT2yQyActOkzPo3TxUs
         dHVClZSivE17ljzbYG+vPy67aQFlCM2rH2a1egmiAcRcn3pnpKtCr8rhDhfc9cwFJDEM
         reHEFvTrNoetFKE12rr2FQv8McZSuRQ612lX5y9325OLwMPOdBvvSv9W/snjxlavanUK
         yjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347964; x=1794952764;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEYk2hz3ZT8gh5jgp2cuyRyD8kcB8tgP4Wu1VC22UmM=;
        b=SL/ba6vePkgT+f2mJtiiJk0Aa+2nBIKO+N9w3/M3sepJEJK23I+WMmT93RUJUXkdhC
         16um/9XSin4wIyznB+Rk7jaGvUXnfI3YqVuLyuO51sDatkb0QXgSUAtgIY3UGmdvhVm3
         ChFCMnOlBRYtaOqGS00eigX59QlD6gBPhBxsZ7/IGge+52eamsJNdI7LaxXDagPn3iLg
         Uo+7TridYEH+Cy0YAYYempQ8yn03JTFCIq2UO8+prvr19HCeVe77MDfsSDN0DP26dqxm
         BL050ENE1CcIedl/FuDCRSrer24ESLkqum6IiezCdJLCoiojaEOeuTjEysYra5HXjTv5
         poOw==
X-Forwarded-Encrypted: i=1; AL+hErFRj24bw9+YJgWLHEtW1HM8df5eNRrvLXANSB87dtJoIiW/zbUi009PZPs/ag4QDwZaFVQtjtlgVY4+DCpTYUZH@lists.infradead.org
X-Gm-Message-State: APuU4Z8KygdCRsih8fhnJy+0YJIp0hqAYUlbIi+ItVzgF2BrKQF9SpD7
	1bXWVL1tLTUGylpy23b6SZDehlrp3q+2LvVC6MGgUHK8ujFRtkq0SH/Vt9CKaqWJPv3QhORG/9g
	lfwMVZO1m6NGNd6lp5RkcOpYF6dH535eTVjyk6fJwV08Ut2NMDWm5X7DT+WjDKqNQI3wjwFPwRM
	WE2w==
X-Gm-Gg: AYBFou1uMIHPmOlL//RuGomyQv5dD4qaIkWJJIEHQlNu/JbcwwKgD3YFb4GlW2o5J3w
	mKtahhOVbi5X69k/DR/FJTc+V81jROc8CB8hHmlqKp1wXwZLenDGb5JRvS1Iol/TYd5gh47fYfp
	JzBIONRA2oGZLXy+DJG9Lg/5jlHJwzhq9tynWzFdaOQkfOot5l1RDLgicambxYBSW/lvF+QT+iE
	vmdD6mr/e6xZIoI5MCSLDhzNNBJLQCX3n7DUyvyd1PTR4ASZKARsfMpb4SBD0VzWGpbZRXquKZA
	+Xgy3jTd6Pvys3cf0KghRuAoHmKuBQ+AVt+l7n0JhKKJs0QllCsBqt5FsrhCb36y8EioDZAX7ao
	ItoUaAihO3rp7/yPqEg92gPsnt7zNo5f29eiNwkRHPbJo625r8rIPTcFqehyG1PUFc483zN6EI/
	RiKG3lpU2Qgx+FmUrwVb2+WxS/Gnc=
X-Received: by 2002:a05:7022:ec16:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b3c0238623mr289965c88.2.1794347963898;
        Tue, 10 Nov 2026 13:59:23 -0800 (PST)
X-Received: by 2002:a05:7022:ec16:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b3c0238623mr289916c88.2.1794347963155;
        Tue, 10 Nov 2026 13:59:23 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm9133285c88.6.2026.11.10.13.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:59:22 -0800 (PST)
Date: Tue, 10 Nov 2026 13:59:01 -0800
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
Subject: Re: [PATCH v15 18/35] firmware: arm_scmi: Add Telemetry DataEvent
 read capabilities
Message-ID: <20261110135901.00002e53@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-19-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-19-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af393bd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=E7ZmVm72AAAA:8 a=DDYDo27XsBoOhGDe9_AA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=CuNAHyPTimGbZf_9KV2F:22 a=99DZ-gr6pvD72HNFZKZ2:22
X-Proofpoint-ORIG-GUID: c8F0RhVtQIkR7U8Qnral1zL7kkCzaq2w
X-Proofpoint-GUID: c8F0RhVtQIkR7U8Qnral1zL7kkCzaq2w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4NyBTYWx0ZWRfX4UmgBs0YLlRZ
 MKzE6qBSazjoT/8iIx2lLAIZY0OpHjiOG780uGozz+OCRMn7QRtrZPb/6a+PoT+6EOQOvHrD655
 eW21YDFIubFXt+XgeFm1AbXdmCRGjVI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4NyBTYWx0ZWRfX7vKjCsfcj8nE
 SuLUY1rmH0EUku5nswXg5RWEph53mpsI/Dm3UwhZjKvnoB69qmwpOJQiReeBR8dKcQs0YIQJnmh
 4aRArHF91msbWhCI6/23qG4rMuTGJjR3/pJkbYDyJJQe6D4uqR1jP8urhophCs80JvEiUZc1UYI
 dsA0pAFJsiYb8QrnZBd7MnLTrwHdoW5phrcM9pIUqN6iVeu4Eux6dQ1nP7Vcdw0TSYS+ui99huv
 Johu+RKQDWe4hgQT7df10L38sXpJ8nW0QKDPi4MraAEoPNuWDCU7O7LsQLlnBdi++ZrI8+xZvz6
 mbzFi8TxN3MVKIPqt7Pgy6b9ED6Gu1xyywOZqWq1vP3YUuwahErvT/k4y6OycO5F8XrkQ6Dp1Bx
 U34bW6NWZ1TDjRWB6NZoBPGQuEWPbB9Y8NuNwQAParFLXX42x7EuxXjQdTdA7IZBxTUxOVDvThL
 7CKJextVrFkosVMqczg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135926_864239_DE192E43 
X-CRM114-Status: GOOD (  39.96  )
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

On Mon,  9 Nov 2026 09:12:04 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to read DataEvent values and
> timestamps as single entities or all together in a single bulk buffer.
> The returned values are effectiely retrieved from the platform only
> when strictly needed, i.e. when no fresh recent cached value was already
> available.
> The DataEvent values are fetched transparently from the platform origins
> using the proper synchronization and consistency primitives, directly from
> the SHMTIs areas or the FastChannels memory depending on the configuration.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

As far as I can spot there is nothing stopping you introducing the
struct scmi_telemetry_de_sample much earlier in the set and reducing
the churn here.   Does looks like it would be too bad to do so
I'd suggest you do so.

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 678 ++++++++++++++++++++++++--
>  include/linux/scmi_protocol.h         |  24 +
>  2 files changed, 666 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 1f6505fff199..bf37faf99865 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c


> @@ -695,8 +707,9 @@ scmi_telemetry_tde_cache_stale(struct telemetry_de *tde, u32 magic)
>  }
>  
>  static void
> -scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
> -				u64 *tstamp, u32 *magic)
> +scmi_telemetry_tde_cache_update(struct telemetry_de *tde,
> +				struct scmi_telemetry_de_sample *sample,

Better to push this back to the patch that introduced this function.  I don't
think it does any harm to always use the structure for passing in the
val and tstamp.  Do this earlier will reduce churn here and doesn't
look that painful to do.

> +				u32 *magic)
>  {
>  	lockdep_assert_held(&tde->mtx);
>  
> @@ -708,10 +721,37 @@ scmi_telemetry_tde_cache_update(struct telemetry_de *tde, u64 val,
>  		return;
>  
>  	tde->last_magic = magic ? *magic : TDCF_BAD_END_SEQ;
> -	tde->last_val = val;
> -	tde->last_ts = tstamp && scmi_tde_has_tstamp(tde) ? *tstamp : 0;
> -	if (tstamp)
> -		*tstamp = tde->last_ts;
> +	tde->last_val = sample->val;
> +	tde->last_ts = scmi_tde_has_tstamp(tde) ? sample->tstamp : 0;
> +	/* Update returned value too */
> +	sample->tstamp = tde->last_ts;

This is currently rather circular.  I guess the aim is to squash
any stale timestamps.  Probably want a comment about that.

> +
> +	trace_scmi_tlm_collect(tde->last_ts, tde->de.info->id,
> +			       tde->last_val, "CACHED_DE_UPDATED");
> +}
> +
> +static int
> +scmi_telemetry_tde_cache_lookup(struct telemetry_de *tde,
> +				struct scmi_telemetry_de_sample *sample,
> +				u32 *magic)
> +{
> +	lockdep_assert_held(&tde->mtx);
> +
> +	/*
> +	 * Bailout without providing any sample when the cache is
> +	 * stale, i.e. last_magic < *magic

Short line wrap.

> +	 */
> +	if (magic && scmi_telemetry_tde_cache_stale(tde, *magic))
> +		return -EAGAIN;
> +
> +	sample->id = tde->de.info->id;
> +	sample->val = tde->last_val;
> +	sample->tstamp = tde->last_ts;
	sample = (struct scmi_telemetry_de_sample) {
		.id = tde.info->id,
		.val = tde->last_val,
		.tstamp = tde->last_ts,
	};

perhaps so it is clear we are setting it all (clearing the padding
seems fine anyway...

> +
> +	trace_scmi_tlm_collect(sample->tstamp, sample->id,
> +			       sample->val, "CACHED_DE_READ");
> +
> +	return 0;
>  }
>  
>  struct scmi_tlm_de_priv {
> @@ -2068,45 +2108,45 @@ scmi_telemetry_tde_allocate(struct telemetry_info *ti, u32 de_id,
>  
>  static inline int
>  scmi_telemetry_line_data_parse(struct telemetry_de *tde, struct shmti_snap *snap,
> -			       u64 *val, u64 *tstamp, struct payload *payld,
> -			       struct payload *bts_payld, u32 magic)
> +			       struct scmi_telemetry_de_sample *sample,

Similar to above. Maybe makes sense to push the existence of the structure earlier
in the patch set to avoid churn at this point.

> +			       struct payload *payld, struct payload *bts_payld,
> +			       u32 magic)
>  {
>  	u32 meta = PAYLD_META_RAW(payld);
>  
>  	lockdep_assert_held(&tde->mtx);
>  
>  	/* Clear returned values in case of errors */
> -	*val = 0;
> -
> -	if (tstamp) {
> -		*tstamp = 0;
> -		if (USE_BLK_TS_RAW(meta)) {
> -			/* Read out the actual BLK_TS */
> -			*tstamp = scmi_telemetry_blkts_read(magic, tde,
> -							    bts_payld, snap);
> -		} else if (LINE_TS_VALID_RAW(meta)) {
> -			/*
> -			 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
> -			 * the per DE line_ts_rate is advertised in the DE
> -			 * descriptor, BUT we check anyway against buggy FW.
> -			 */
> -			if (!HAS_LINE_EXT_RAW(meta)) {
> -				trace_scmi_tlm_access(tde->de.info->id,
> -						      "SHMTI_BAD_TS_LINE", 0, 0);
> -				return -EPROTO;
> -			}
> -
> -			*tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
> +	sample->tstamp = 0;
> +	sample->val = 0;

If we are clearing for errors, then maybe do the whole thing?
Generally I'd hope we never use values in error paths and the
clearing is unnecessary but if doing it seems like doing it general
makes most sense.

> +
> +	if (USE_BLK_TS_RAW(meta)) {
> +		/* Read out the actual BLK_TS */
> +		sample->tstamp = scmi_telemetry_blkts_read(magic, tde,
> +							   bts_payld, snap);
> +	} else if (LINE_TS_VALID_RAW(meta)) {
> +		/*
> +		 * Note that LINE_TS_VALID implies HAS_LINE_EXT and that
> +		 * the per DE line_ts_rate is advertised in the DE
> +		 * descriptor, BUT we check anyway against buggy FW.
> +		 */
> +		if (!HAS_LINE_EXT_RAW(meta)) {
> +			trace_scmi_tlm_access(tde->de.info->id,
> +					      "SHMTI_BAD_TS_LINE", 0, 0);
> +			return -EPROTO;
>  		}
> +
> +		sample->tstamp = LINE_TSTAMP_GET_RAW(&payld->tsl);
>  	}
>  
>  	/* Data is always valid since we are NOT handling BLK TS lines here */
> -	*val = LINE_DATA_GET_RAW(&payld->l);
> +	sample->val = LINE_DATA_GET_RAW(&payld->l);
>  
> -	trace_scmi_tlm_collect(tstamp ? *tstamp : 0, tde->de.info->id,
> -			       *val, "SHMTI_DE_READ");
> +	/* Trace originally read tstamp */
> +	trace_scmi_tlm_collect(sample->tstamp, tde->de.info->id,
> +			       sample->val, "SHMTI_DE_READ");
>  
> -	scmi_telemetry_tde_cache_update(tde, *val, tstamp, &magic);
> +	scmi_telemetry_tde_cache_update(tde, sample, &magic);
>  
>  	return 0;
>  }

  
>

> +
> +static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
> +					 int grp_id, unsigned int *num_samples,
> +					 struct scmi_telemetry_de_sample *samples)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	struct scmi_xfer *t;
> +	bool is_group;
> +	u32 control;
> +	int ret;

I guess it is prevented at a higher level, but perhaps some indication
of this one not needing to take the config_mtx and why would be helpful.
It's not locally obvious why other config messages can race with each
other to need the defense on those config_set calls but not this one.

> +
> +	if (!ti->info.enabled || !num_samples || !samples ||
> +	    !ti->info.single_read_support)
> +		return -EINVAL;
> +
> +	is_group = grp_id != SCMI_TLM_GRP_INVALID;
> +	if (is_group && grp_id >= ti->info.base.num_groups)
> +		return -EINVAL;
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_CONFIG_SET,
> +				      sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->group_identifier = cpu_to_le32(grp_id);
> +	control = TELEMETRY_ENABLE;
> +	control |= !is_group ? TELEMETRY_SET_SELECTOR_ALL :
> +		TELEMETRY_SET_SELECTOR_GROUP;
> +	control |= TELEMETRY_MODE_SINGLE;

Similar to earlier. I think this would be a lot more readable as appropriate
FIELD_PREP()

> +	msg->control = cpu_to_le32(control);
> +	msg->sampling_rate = 0;
> +
> +	ret = ph->xops->do_xfer_with_response(ph, t);
> +	/*
> +	 * PARTIAL_ERRORs are reported as -EBADMSG and related lines,
> +	 * marked as DATA_INVALID, will be properly skipped by
> +	 * scmi_telemetry_msg_payld_process.
> +	 */
> +	if (!ret || ret == -EBADMSG) {
> +		struct scmi_msg_resp_telemetry_reading_complete *r = t->rx.buf;
> +		u32 num_dwords;
> +
> +		if (ret == -EBADMSG)
> +			trace_scmi_tlm_access(0, "BAD_SAMPLE_PARTIAL_ERROR", 0, 0);
> +
> +		if (t->rx.len < sizeof(*r))
> +			return -EPROTO;
> +
> +		num_dwords = le32_to_cpu(r->num_dwords);
> +		/* Update cached DEs values from payload */
> +		if (num_dwords) {
> +			size_t payld_sz = 0, dwords_sz;
> +
> +			if (check_mul_overflow(num_dwords, sizeof(r->array[0]), &dwords_sz) ||
> +			    check_add_overflow(sizeof(*r), dwords_sz, &payld_sz) ||
> +			    payld_sz > t->rx.len) {
> +				dev_err(ph->dev,
> +					"Malformed Telemetry delayed response - num_dwords:%u  payld_sz:%zd  rx_len:%zd\n",
> +					num_dwords, payld_sz, t->rx.len);
> +				ret = -EPROTO;
> +				goto out;
> +			}
> +
> +			scmi_telemetry_msg_payld_process(ti, num_dwords, r->array,
> +							 payld_sz - sizeof(*r), false);
> +		}
> +
> +		/* Scan and update SMHTIs and FCs */
> +		scmi_telemetry_scan_update(ti);
> +
> +		/* Collect all last cached values, override any PARTIAL_ERROR */
> +		ret = scmi_telemetry_samples_collect(ti, grp_id, num_samples,
> +						     samples);
> +	}
> +
> +out:
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
;
>  
>  /**
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index ce35734d2249..7177f739f062 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -994,6 +994,13 @@ struct scmi_telemetry_info {
>  	enum scmi_telemetry_collection current_mode;
>  };
>  
> +struct scmi_telemetry_de_sample {
> +	unsigned int id;
> +	unsigned int pad;
> +	unsigned long long tstamp;
> +	unsigned long long val;

Why not the fixed size kernel types?

> +};



