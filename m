Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68965606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wmFwZvAh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+XOPo5s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XLGg26Zx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=; b=wmFwZvAhMa80cd
	3O3g/8pPjs6odrhsyPgzQT/5NmUtjb/cdSHjaQsv8rhVB9+jQwWFQh0fkVVSiCygEWy50wqY6mqa4
	7H7sQRzKdxWtI3xem/MGO80uIRDuU6qY4zD+7C0EE9obbsxnBahSJchvCf62eTJZrBC4MsqbUhFYQ
	qPYDidBqO6Jzx3MYXtJ+Nscdb52oyeV2BuO8WcX+YQ+ilxjgRQfj7MPpi4y/clhhqa90xTtj3j3Ki
	cqfKZn1vAWPucwi4o59L9EJ8GmDlGjIGQ7HYfbSA+r/pK+INPNg57pK34ia4RZ3RzjB38locbZcxI
	MXxHcxIOuf5S8ozXpScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqun-00000004q6X-345w;
	Tue, 10 Nov 2026 18:49:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqui-00000004q42-1ttn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 18:49:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIbwDn970715
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=; b=Y+XOPo5sh17BDAvJ
	nfpDK75yQgj6nL0Xk2giaKLnNdnKo6OTUstdAfHMLjPDtuJegrWc6VzQTOJOlwTk
	jediEOjLx4GjeE1F+UrlB22Pyiya0u7op6Lk/2pdCXc37PWVgZ2djhrh/MrNBRc5
	FdrYSIG5IT7CIGgfE/UYVq4vqBHyfdZDFVPaK01QQ5Gx3I6JtYVQbbGVGrMAzPJD
	dWX0szOzxXQlmEFe15FE7ZhP54hqQ2Vinzw87Py9rbC6yateKJ5BFOSGQXr/JqLS
	1SfyfyNFilw+dcdvmkvu4T9AjU45omESi53oMEeWOUCv9CmTlW0DCMuhdpTmXLqz
	z8EFzQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwjb1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:49:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso3079523eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 10:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794336587; x=1794941387; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=;
        b=XLGg26Zx8kdL6LM5TjLVKhjvMMzxMMECVeyGKTUudRiumbm5VEzehDARnT2K4C0pzV
         HdVK6xSipsGBnLsxcBEKMM8swsGHS7D9RoZ62MXRnywHC/A1l8C3Rt0acOtKdoDBpnlh
         J5uvjT5GIcvSWZ6MxeqXt1yC40RBoCvp1RZ/QDAFsPM48yCmokUQ850F8BnnxkjhJBWG
         DQJJnRBSHtBFSXPbd99dPLsYl6YrjeD9+3quXEekixKhZbQO/ibU7q6hpJkKFKzXY/mC
         vTByANYK0CJM7zXYm9PNyqKTViWPpI+co2jEsxVSmOpdmqld2nJwVUQ9EXSYh+84UKZK
         8N4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336587; x=1794941387;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlOMOYWweaD3rhIBYK0FxaPkexbukY9Q5FW/PQSKho0=;
        b=f84DLhxQezvHIu9eGIED5ZrsDjLB21w5U2FQmQbG+L7H//Mnip+TM/zjdO/RNT4W+p
         gOpAEWdpJ7KEY2KJIcIiAiZT5fwhZlJY5QS0Z4c1sVJivJ0qOy6UiqyNEcoMbTfdVFjv
         ef8qIMcti6QDv8Y8PbT0GuMM28bSbE/AzWKEYTpN/BAT+ccrLDM6xzX/JNRus+aAaG/D
         teaIs8AGZVDs/uk/Oy+nbd5w+uNGyygURfl2QjOoaZVjUdzVnr9htoWyyGAiPc6GMNgD
         ViERWUSTylPj3kZTF+wuRZuX9kzjgl6sBGp5BAtYyhqxQiRMWx30LnDd6/3Ietoi0tbT
         vTOw==
X-Forwarded-Encrypted: i=1; AL+hErGnnPKBzbkXFAXReyAv36XN1orDVRSSrvV1pSAkqt/rFyaKaAhGVk6ngmrWfcu2aIVqOzRPU6MeYllbeVW52xnM@lists.infradead.org
X-Gm-Message-State: APuU4Z9U2Q2WWceVg6qk46yLGuVWNePCXXio2ngSfWoY3I7swZZ28mV+
	HlRX2Zv6e2r1HZcIVZug1tWbUeCQuMeiP7MfTmx/jp2GA48uoW6l9EWJtmk5z0ojwVaJiLCFzKq
	Aw+si0kkaQmL87vWuoJkl9PmrMigZ32Bp5V3+05C20peE6WifrzA5cdgEczR49Fi7NzKzWMyISL
	SVWw==
X-Gm-Gg: AYBFou3FucsZaPA6AFmu8UWusyJbo+mGrNL5zl6FK4S4PVcnPHVeJfooFHJ4aTe0W7w
	T+bz2feeen0Fqs0Ug5OJiLGVn03hrcpnpVsx0YtlGsXU68FMj899YzGYnPyXfLnS6un73SXqZ2N
	uRTna/MRfbRgG4O0SILqslGIX6YlghX1xd/Pl7Iq0SC20wg5DtPzxhxKH5WCpf4c40LuufP00yb
	7hTR49aI6IceHzbflq0yI3zRFA7N1NqEzz9xE8IRRWQNnS2fg1zkw0Ysip6aRttzuvr9FpFQNGZ
	VXS5ydC/ssPDvplWdxcCgx7BKV8p3y1Cygy951VkG7mTHLxX/Zyl7ZHFAmMzinF4xQ2W1ZebErd
	6oF0jHYCaehv25BuOtRwnwHmCxU5KBnsOW+BjF8Ww64v8P55lbdSQDfuSM2+w4qMQyrKwRnocHO
	eAsFcPCWIrcerTxiiWg4taUZXIPqYE
X-Received: by 2002:a05:693c:66d2:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-3768636e4b1mr198799eec.27.1794336585361;
        Tue, 10 Nov 2026 10:49:45 -0800 (PST)
X-Received: by 2002:a05:693c:66d2:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-3768636e4b1mr198736eec.27.1794336584648;
        Tue, 10 Nov 2026 10:49:44 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm7990922eec.12.2026.11.10.10.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:49:44 -0800 (PST)
Date: Tue, 10 Nov 2026 10:49:25 -0800
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
Subject: Re: [PATCH v15 16/35] firmware: arm_scmi: Add Telemetry TDCF
 parsing for UUID lines
Message-ID: <20261110104925.00001db6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-17-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-17-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JwVhNPXXjYXWbQTfJoNORpY2fswr9KzG
X-Proofpoint-ORIG-GUID: JwVhNPXXjYXWbQTfJoNORpY2fswr9KzG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX1V9mvQoMEbrh
 V7VXoqqQ8DpL5XjDqazOq0IBj26fV1eM9CSJkdH8rnFEMlm5s/LEJ8Re0dB7ee+GZV5MdHZP1iP
 Lvu0WdpB0bJC4QYV6phN3zuKt2NQwQM=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af3674b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=gDUTI9D6LIilfzPf5l8A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3NCBTYWx0ZWRfX5V4GNKypU/I8
 ulb0jx9IYqJALPL0B+oCGsVpoiE9F/sdBFhmHdGwe8mTEH+QTqh169+nOAu+3eJ0g/qNYBKAk/1
 xewt4yN2hgJdxWmb9e6S6+02v04eBEoOKmGr1tr4sxxLrRPa6Tj8WP0h58pGuIuwSdeLY+AzKpy
 OChzRdWQY9ns/XLvWXstK6LUBRxO3hOs0aGww8V6kyd3kq7vzJfo1EvbL4ge+SK3iin4TWlBmgn
 e9bcnktpU6zIU/rMUlDRBdl1dwhv8eXUpdbjfRen7UPTxevsSUR1hoExnr4mtX4Zbarvp1ELxEJ
 M76MCA1Ol9piey97QNQwA2XwIgD3eKHZWbw5xtsftDOErV/Vmnsk1GIZ28SfoxRIXrQAYzW61Cn
 6t9QCcr66W2oLDHdVVOeN7IzfTPMOUTRPmP41jpWcyfC5cPDYd9sDtA5PTOQKiVOj6IKEWlywVR
 GnOmN55cKOrvzCfpcdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_104948_509319_8E48988F 
X-CRM114-Status: GOOD (  35.76  )
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

On Mon,  9 Nov 2026 09:12:02 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to parse, track and link TDCF UUID lines to the related
> discovered DataEvents.
> 
> Maintain also a central list of discovered UUID lines.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Trivial stuff + a follow on about how you are handling the
devm_ cleanup for the de and it making your code more complex
than it needs to be.  I think a simple helper will get
you to a better state (and my preferred approach of fine grained
management is probably overkill!)

Jonathan

> ---
> v14 --> v15
>  - use proper casting in tlm_collect
>  - use snapshots to collect UUIDs during full scans
>  - stop tracking UUIDs lines singularly..it's useless
>  - use UUIDs line hashing for lookup
>  - clarified UUID/DE binding are permanent
>  - fixed WARN_ON invocation on missing active_uuid
> v13 --> v14
>  - split out of previous single patch implementing parse SHMTI routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 277 +++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |   2 +
>  2 files changed, 277 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index e3fbcb1e6ea7..38a94d66116f 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

>  
> +static int scmi_telemetry_uuids_update(struct telemetry_info *ti,
> +				       struct telemetry_uuid *uuid)
> +{
> +	uuid_t **cur_uuids;
> +
> +	/* Resize array if needed ... */
> +	if (ti->info.num_uuids + SCMI_UUID_DB_THRESH >= ti->uuids_len) {
> +		uuid_t **new_uuids, **old_uuids;
> +		unsigned int new_len = ti->uuids_len * 2;
> +
> +		new_uuids = kzalloc_objs(*new_uuids, new_len);
> +		if (!new_uuids)
> +			return -ENOMEM;
> +
> +		old_uuids = rcu_dereference_protected(ti->info.uuids,
> +						      lockdep_is_held(&ti->uuids_mtx));
> +		/* Copy/move old allocated UUIDs */
> +		for (int i = 0; i < ti->info.num_uuids; i++)
> +			new_uuids[i] = old_uuids[i];

memcpy?

> +
> +		/* Expose new UUID pointer */
> +		rcu_assign_pointer(ti->info.uuids, new_uuids);
> +		ti->uuids_len = new_len;
> +
> +		kfree_rcu_mightsleep(old_uuids);
> +	}
> +
> +	/* Store new UUID reference into the globally accessible UUIDS */
> +	cur_uuids = rcu_dereference_protected(ti->info.uuids,
> +					      lockdep_is_held(&ti->uuids_mtx));
> +	cur_uuids[ti->info.num_uuids] = &uuid->uuid;
> +	rcu_assign_pointer(ti->info.uuids, cur_uuids);
> +	/* Update UUIDs count */
> +	smp_store_release(&ti->info.num_uuids, ti->info.num_uuids + 1);
> +
> +	return 0;
> +}



> @@ -2362,6 +2554,7 @@ static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
>  	}
>  
>  	INIT_LIST_HEAD(&ti->fcs_des);
> +	hash_init(ti->uuids_ht);

Why init the hash here but the mutex at the caller? I guess
maybe you wanted it to be obvious the mutex was valid, but to me
just doing mutex_init up here is easier.

>  
>  	ti->shmti = no_free_ptr(shmtis);
>  	ti->info.shmtis = no_free_ptr(shmtis_info);
> @@ -2427,6 +2620,37 @@ static void scmi_telemetry_lines_cleanup(struct telemetry_info *ti)
>  	}
>  }

>  static void scmi_telemetry_tdes_cleanup(struct telemetry_info *ti)
>  {
>  	struct scmi_telemetry_de *de;
> @@ -2471,6 +2695,7 @@ static void scmi_telemetry_instance_cleanup(void *arg)
>  
>  	scmi_telemetry_groups_free(ti->rinfo);
>  	scmi_telemetry_tdes_cleanup(ti);
> +	scmi_telemetry_uuids_cleanup(ti);

See below.  The monolithic approach to devm cleanup is making
your setup code harder to read.  Suggestions down there on how
to avoid that.

>  	scmi_telemetry_lines_cleanup(ti);
>  	scmi_telemetry_resources_free(ti);
>  }

>  /**
>   * scmi_telemetry_instance_init  - Instance initializer
>   * @ti: A reference to the telemetry info descriptor for this instance
> @@ -2563,6 +2805,8 @@ scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
>   */
>  static int scmi_telemetry_instance_init(struct telemetry_info *ti)
>  {
> +	unsigned int uuids_len;
> +	uuid_t **cur_uuids;
>  	int ret;
>  
>  	ret = scmi_telemetry_resources_alloc(ti);
> @@ -2571,6 +2815,35 @@ static int scmi_telemetry_instance_init(struct telemetry_info *ti)
>  
>  	xa_init(&ti->xa_des);
>  
> +	/*
> +	 * Always allocate at least one slot for the primary and anyway at
> +	 * least enough to avoid immediate resizing, assuring uuids_len
> +	 * always greater or equal to one.
> +	 */
> +	uuids_len = max(ti->num_shmti * 2, SCMI_UUID_DB_THRESH + 1);
> +	cur_uuids = kzalloc_objs(*cur_uuids, uuids_len);
> +	if (!cur_uuids) {
> +		xa_destroy(&ti->xa_des);
> +		scmi_telemetry_resources_free(ti);
This sort of dance of not using a goto block because we
have unified cleanup at the end always suggests to me one of two things.
Finer grained devm_ callbacks, or a helper that can have a clean return
to this outer function with no side effects, those having all been
cleaned up via goto based unified error handling in the helper.

I personally prefer fine grained devm with each element clearly
being paired with the undo, but the helper is perhaps easier to
introduce here.

> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&ti->uuids_mtx);
> +	/* Expose new UUID pointer */
> +	scoped_guard(mutex, &ti->uuids_mtx) {
> +		rcu_assign_pointer(ti->info.uuids, cur_uuids);
> +		ti->uuids_len = uuids_len;
> +	}
> +
> +	/* Initialize the first UUIDs in the global list with the primary */
> +	ret = scmi_telemetry_primary_uuid_init(ti);
> +	if (ret) {
> +		scmi_telemetry_uuids_cleanup(ti);
> +		xa_destroy(&ti->xa_des);
> +		scmi_telemetry_resources_free(ti);
> +		return ret;
> +	}
> +
>  	atomic_set(&ti->des_enabled[ENA_STATE], 0);
>  	atomic_set(&ti->des_enabled[ENA_TSTAMP], 0);
>  	mutex_init(&ti->des_enabled_mtx);
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index b7b8bd77b37d..3973779c0aba 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -981,6 +981,8 @@ struct scmi_telemetry_info {
>  	unsigned int active_update_interval;
>  	struct scmi_telemetry_intervals *intervals;
>  	struct scmi_telemetry_shmti_info **shmtis;
> +	unsigned int num_uuids;
> +	uuid_t * __rcu *uuids __counted_by_ptr(num_uuids);
>  };
>  
>  /**


