Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rCPEwqoT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/iJIxEt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CENAszfo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=; b=rCPEwqoTvynK0V
	UbVhRAg7ZEtRHIhsTxi1h+YFaRsa2suGGmbZAEVM921iThY8baRQhu0uYHTAomM1lvBuDA44Bxwov
	jfNulUxy2f1vWsR42JwLNyhIiZl01M1O5GBoRTkrqmSfMLm0fTh+348GupdWAvML/uG3Gq0M3v6mQ
	cPJFVT9NkT8xCokfCat84l5YVFzAP9GQpqNUGY5KlZ1xVOg/ytBVEzX2icUtNiFrvBFOefnb7gUmT
	gJFv2Plhfz0LX3gfTZQrQHtXSIs17gliltf/W/V59kt9oTpdKqgRVqlSo7n1pVrZxlUgN+rCefDuc
	Kg23z9jzjHCh4KeoeBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzd0-000000083K0-2WGo;
	Tue, 24 Nov 2026 23:08:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzcy-000000083Jf-1R7W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:08:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb4A31655386
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=; b=l/iJIxEtbXhbrUuQ
	a5cKBnFyYsoSufAs/EVmTOrxwpo2KYsht9Y9BZN3+1deUoLwxzBSesaEjq05kxOx
	bT7LVGB8NMr1jjmR2+HcM4E8mLnKHerLEPJm5UJO09RHriIu8akQWBLHqIt2bH3h
	DIbL/4Sf+2cRmsieezdoVMijLVeduOGLA0hS+/5o0rVpXSF9Ggee02GKP4mL9YNX
	AfFyD8nKnOdSkpGaoZwKXp+eyeslAVKIoLpeLFjKpODXbpPM0weemVa+rJeGdnWk
	KVgjJGjg0Mi4NM1bjHvL8xZGzLgOIvwgYsgAyCxj3nzvQWsLmqSH0IKjlLdlPn25
	RZscBg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd98r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:08:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so7984159eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795561723; x=1796166523; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
        b=CENAszfo9XY5yoLFBkv6DaZnyEaMfl90EXZZkj7zpz2wWNmkKhV+3/Xd3MLbrRF+vP
         EOdrM0EfMp+4i9JPkkx3gW3gSI6fZV8jlhCwCIrHuia+h9LZJCD+YfpjXrcBi89LId1T
         4PLRxiwXOgw8gIWLzQ5etPnv3C+UfKaRJ8tC5RDAhlNzAvGU4fTM9MazV0M4yL9v611O
         8be0xd24qGaJ5YXEKErHJBT+lHoeG9ZpyKXjiRYk9FMAL1GL2rZABVgfawvQNstDnfk+
         VV7HBFafTQplRC9Rpn2ESIsu68HkGfhwsNCNU/4zqFL9sntUjxWKdM62h4v3oy/8QpDI
         fDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561723; x=1796166523;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWjbVz+E9OQxZmuF0usfHOwN4nVJ9HwNyrbdjrhAa4M=;
        b=LReUClIoHLTLY/sP0E6B9DkzGhN828IWJz2ZLmIbYZddTIgQPGW71L/BgEddUyIRpK
         +1niCsOGDQi9BLLxe8mGL52rrww2HEzKrMqwAHeirSvWwNsP2LAp/9drZNw0uYjFWg20
         1wT6Sc/5c3qA96q1F5+01vlc35bTFOBsj6TfQfXfG4MfRHINFB9y1ySUe7aNVWSb7MGY
         WVda30QmG3PWzU0QKjrIawigcZNCjhnGpOQMs8YrZs2TgRn+LixHcqTRbidxC649y0xi
         UON8QyVDJ86e65GmKrLfq9EpxKjeV/FhOFJPTtS3eUKur+a44Au5/Vlzi9ua+1klv0+O
         jKKQ==
X-Forwarded-Encrypted: i=1; AL+hErGj2FHGA1ZWd+5fg7qVuV/iUBJ4P0838bzOIid93AYbw6apn4CKhF/0eRTGGQOdu7NMrQR+vsUSe9JEiNQ4wlAl@lists.infradead.org
X-Gm-Message-State: APuU4Z8CaWYieXKodLDe+9nNHa247Wt0kjhthikaIxcMZbwUtfTDRIpf
	thzX/vh6C1LI/R4QpTPXJNlfl9gN+Q8eoPIVyT4e03UhjhpBEaKh6pwE++jMW+zyQ6JGk1G7DkG
	Cn0bP6GDuGlx2mxl7HSpU/ss+aF8Wc/Kzt/VfSSkqRqh8RztS+7ZyIipC/GCFY8brqaJUXDtFl3
	rO+g==
X-Gm-Gg: AZFdTZdqYgntCZcZwE3iT0PNuxZY8ho32u8zk5LNWdDneBI/YWFscylMXne7NJUUjLx
	Ss0cihj1EnnawgzMoU4lW1RQa/Kh80HqPotiOyqN23TyOze3aDxRZDl5n75otawBu0Dj/J6MBTi
	Ar5vEMqyxcqtStmrpX/OqckQAwLomxvFrmbfu8ex75NH3/lUGF+6VdQespy+8uYviGTV1fcwa6Q
	mD+A9u8kmEp+ovFjNou6NulQ3xx5SNbn20l6Bu8Za3IzuYL4wNeQdPyAI21Pgot4KKtkwa6Jo+P
	gxlUgbqhMXDkf90kZt/LkOorQFF/vu9vIAe4ntO+V9GH6LsUzMFEMg4+Qob2YmjxvxzOvbzMuH4
	5LcV+991WupxrkZDQsQ83YiCO/Gb/JHdWxMT3wO3tmmm2VDhRSqZO7qlquwbqrRiCBFCKx5xAmJ
	08Wt7ibyIU/hp61vaX+qFTC6ET1tck
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr15352942c88.12.1795561722508;
        Tue, 24 Nov 2026 15:08:42 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5568650aamr15352913c88.12.1795561721846;
        Tue, 24 Nov 2026 15:08:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm55030717c88.14.2026.11.24.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:08:41 -0800 (PST)
Date: Tue, 24 Nov 2026 15:08:35 -0800
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
Subject: Re: [PATCH v17 02/34] [RFC] firmware: arm_scmi: Additional
 iterators consistency checks
Message-ID: <20261124150835.000060be@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-3-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-3-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfX+qXOyvz4Ti0Z
 /2B0tJq91BefHv50Sr2SaVeAcOKRADcbLpSZqsWHYfJXuZNm1yNjONreRb+qnU2QfBsAmEiOACw
 mRui8hM5wB5lo0v1DmiensfO+mUpfWQ=
X-Proofpoint-ORIG-GUID: PD783QEbHxQ1oWS72grmDWU2G2c4I8o9
X-Proofpoint-GUID: PD783QEbHxQ1oWS72grmDWU2G2c4I8o9
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b0618fb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=8EtlKy0l8xtiV7R28LgA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MSBTYWx0ZWRfXwL26Gsa9o1fz
 xEB9tgjO5wCj+ScZRkKva/NItXoXAjHu4HQfRLmcSROFnYZBMFWx2qJf7/T1EM8UY9rfEZw/ULf
 INA7xWeLwATkaW8b7jZsI+Qh2zZ3C+pbSQPw1RtTv/UiSNxJ40h3FGBr9vD7KCu9BzA42VlrSmR
 5dwsqvxwRR10c/4A4jETBoT+kvfXfPbgy+rjXio6Y2zf75c834ttMWSi4Im7MBzY9qR99n2dTak
 xoyXpb2mJtf/RAHQBJmmMjVc3KDkCS5vZHDJ739wd15Cisqb6vLfPLSvkLO7lU0plYZjJm5ppT4
 tEebLoWLggnW6cuwDOHbomA+r0BaE2j/kI6lfh2PltWfZ35SUA+hhY58zs4rL33NQgHw0kGCLIq
 C6iF1ISTEdqYBoJqIIBV5w/wfb6qn4EmrTGkUGvuyFYyzG0Mqu4TIBGL3QLpmIuNg4S5e0SuInR
 FI7EbEgJOWnUFK0EjeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_150844_398573_3A9EE9AD 
X-CRM114-Status: GOOD (  29.06  )
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

On Tue, 24 Nov 2026 19:48:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a few more consistency checks around the number of returned and
> remaining items during the life of an iteration: this is useful to spot
> prematurely terminated iterations that would produce shorter than expected
> results.
> 
> Handling these anomalies in the platform multi-part replies within the
> core SCMI iterators machinery avoids the need to address such issues
> multiple times at the protocol layer.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> RFC because this is another fix that is potentially disrupting for any
> non compliant SCMI platform deployed in the wild.

Looks sensible to me and cutting out weirdness as early as possible should
make everything more resilient.  If there is a broken implementation out there
(and to hit these is not definitely not great) then quirk that when it surfaces.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  drivers/firmware/arm_scmi/driver.c | 36 ++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 55d9cc487916..6dd249c08f5f 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1852,7 +1852,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  	const struct scmi_protocol_handle *ph;
>  	struct scmi_iterator_state *st;
>  	struct scmi_iterator *i;
> -	unsigned int n;
> +	unsigned int n, i_start, i_max, i_returned;
>  
>  	if (!iter)
>  		return -EINVAL;
> @@ -1862,10 +1862,15 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  	ph = i->ph;
>  	st = &i->state;
>  
> +	/* Initialize iteration counters used to check consistency */
> +	i_max = 0;
> +	i_returned = 0;
> +	i_start = start ? *start : 0;
> +
>  	/* Reinitialize state for next run */
>  	st->num_returned = 0;
>  	st->num_remaining = 0;
> -	st->desc_index = start ? *start : 0;
> +	st->desc_index = i_start;
>  
>  	do {
>  		iops->prepare_message(i->msg, st->desc_index, i->priv);
> @@ -1883,11 +1888,34 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> -		if (!st->num_returned && st->num_remaining) {
> -			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +		/*
> +		 * Initialize max items expectation for this run based on
> +		 * values returned on first message exchange: during the
> +		 * following iterations consistency will be validated against
> +		 * these parameters, so as to spot FW anomalies like sudden
> +		 * termination or unplausible conditions.
> +		 */
> +		if (!i_max)
> +			i_max = i_start + st->num_returned + st->num_remaining;
> +
> +		if ((!st->num_returned && st->num_remaining) ||
> +		    (i_max != i_start + i_returned + st->num_returned + st->num_remaining)) {
> +			dev_err(ph->dev,
> +				"Inconsistent multi-part reply. max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
> +				st->max_resources, i_max, i_start, i_returned,
> +				st->num_returned, st->num_remaining,
> +				st->desc_index);
>  			return -EINVAL;
>  		}
>  
> +		dev_dbg(ph->dev,
> +			"Multi-part - max:%u  i_max:%u  i_start:%u  i_returned:%u  returned:%u  remaining:%u  desc_index:%u\n",
> +			st->max_resources, i_max, i_start, i_returned,
> +			st->num_returned, st->num_remaining, st->desc_index);
> +
> +		/* Account for last batch received */
> +		i_returned += st->num_returned;
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",


