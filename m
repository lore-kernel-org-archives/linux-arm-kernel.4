Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C72606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zRz4e2ml;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx/d+cZC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TeMpHNIs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=; b=zRz4e2mlTRuD0A
	O1fDOMiXrcwk/eeicPF4S4QsoTb2uUSo4+oYvDgqff/eCaaksqiQ8GudNhSpo+vH3rZYCYBdt6Zx2
	KcLjHEKo1EIsxEwS5bxRZkL/PToDKboC4Tc+o6Rjgd1zLbkA6fstz1RNk3Zk+oj7cIQgxpw6c8LEy
	uut7RrZGTbQmk7Sgn4qS6ehzm5rwjaG8PdN/ZmiP1zsGFREktTat63aB8WYiUAVwE+zFgRZa8PItP
	SQsVbUycgcTNvMU69iea3aGXOwNHPTWWYDkCSVGnPRGVLGcc01f2jxojQbKKbBj8HdXpmTtTT6kbP
	E3JzSCaJrxnwGfy8nnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQu9E-000000058i7-49fm;
	Tue, 10 Nov 2026 22:17:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQu9C-000000058hm-3BAm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:17:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAJBoBR708657
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=; b=nx/d+cZCnnl/B+9q
	V54paZksVqJtSnFLKo4838giNrvuCpWcwAmzEZ80aIGmS8kg3Dai9eZK2iG9Pbp1
	QNG7JAmSsLF3RDVrBWG5Ua+9VdeZNrF5Wce5zBre7pT9pkzkNuDau2lC23hvQQVh
	1kXPtf6xc9MIMXBYZsE3e8dIfg2/R7mSa2WNeWnns7cgBEc8aZaAubuhoaAR7ACJ
	ytlxPs2EpzTu6oOr4PL5YGcJxIeFlXSxKVPVQO16zM3vfG1ykCQx8N5J7BVCZB0t
	b47mNg2GpgIimO/GwcMiL4pOuN2VKLeq/P6Dx+N6j9ZmrLLf/EJ9zXLPGauTVs3O
	3MgAsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c8pvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:16:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso25289685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794349016; x=1794953816; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
        b=TeMpHNIs1SrXwXIkC+zXATWtywFubLqCbpvx18G7UMLffcHSkb5Rrb7+8gUvfx5kZq
         RMsPNO7D90+fgV1XSq1ybpw/VCT0mWOsXmlWz8Rpagjt3khjbNBMfW4/VCjmP9mzdl/3
         5RHPbwj97ZilMEqnxZkDo/yB9CyP05o2dLiDhjuFOzGUeyyH/qAUKBdidR+UC13rrhZo
         Zlq0C33FRHn9cIK1Vnp4j2cEP/xP3maJivaV1DbU4rtPbId2xAPGM1HaJxbb2Y1AxTX+
         Fb3kK3hSAlcSjey1/IcWag0YUN82T79mX6YyHuiLCN6Pwo2IYRb9gaRGcU1B8fg1JSAC
         +rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349016; x=1794953816;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUZnEGtOvAy/yLf/+pZo/7+n9ai2uJCe5ZMlXQokoWQ=;
        b=M0O5jWR7/u5CTYTaUmNPWyDJfuln5RkWNAUWP1bewPQM3ivL2gXqSwCH8wIMRyTvSd
         WB2BD/kU6rO0fTgJAH6ETOzTJrzk3Y/iwK/BRa8+aynrzLQHbtKqudjTVkisLPW6Zow3
         Uree8/SY9ZvrgTAAEndeYMk6/Aqu3+zmmu6UPTkEhm5frkKxDSe51H61o1cKAACfeIgR
         FdwlSaqJDsSLGEL9m03bkIwSeL49SSAHLg9Xa4BJTm68wGSLnLy0nEMksJT/XJUvrins
         Mru7TX+iFeVU5YPxJSMlYPbc9qiB6Jngob8QPL5YdLNgm/e7sGlRi8+8uLuH8s+Jw/sV
         f2NA==
X-Forwarded-Encrypted: i=1; AL+hErFlWD2pDCsqH2kSGneVvp9Gtc5AwU8PvcF2F6x/HPq+YPWHLXn7dDIS5hTgmGK/QO/mag8q0RsBQL7RAm8qKKj3@lists.infradead.org
X-Gm-Message-State: APuU4Z8aiaZhqYpDvO6OxXt8+UBBhq34zxqj9f/1xDLYH3gw6fT61LWo
	lMknl9NWjgHJhPM2pcw2hDCkaBRju9HKzSLUx0FqHeP+sglKX6Bhj/HqSlg/avYy134Pc8+fyh/
	x5+bt7SXp+Tj/6XkQ3cTnZ06IXCmb/7gyhqmTZbwGZ57yOxPTSTxaBdGkxhJUEb5W75wbiUE7UO
	8y1Q==
X-Gm-Gg: AYBFou0QCdx3wT0h2pia6abhwXcUbUOT2DdN4WsLuJGr6q835qrje7gbn2wvl4j3tQr
	zv8m7BO2flrzVoKnvG0a/um2lTsM3/khT2suyWUhuZCQZ1AFmKfC6JqXY1LRIbc7XI/KpwN16cW
	KMKgtjeqTrRAhPMflj9iJLd80IuMllYmiJ8idr7n9UYCprLkSuq2LHXweY/ZQmmpRVVeB6Vz88U
	BfSOAe/xTqHGPjo5xYbkiVDUh300SHXzbZttEAhnRu3rI4f+/onPRBr8jeGKBAXrpWMf3xijH/j
	9bW7Vv2Qpps1A/AxitEAsHMumhYvg4uN1OH1ZwKfZehgsa1fcliI0VZwY6YIPb1PPkrIvzIWx9L
	DGQG44cBbque9wA3ejYmMinlfjyxU38f5sqHS5xiUTqUcQZuAyR0mhQwmhwIeH4OHnCfcSZg3Pf
	/4NJ0iYtS1fmDsmdb4EHoOJzj/nmc=
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr317134a91.40.1794349016229;
        Tue, 10 Nov 2026 14:16:56 -0800 (PST)
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr317114a91.40.1794349015717;
        Tue, 10 Nov 2026 14:16:55 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm18363973eec.18.2026.11.10.14.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:16:55 -0800 (PST)
Date: Tue, 10 Nov 2026 14:16:35 -0800
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
Subject: Re: [PATCH v15 20/35] firmware: arm_scmi: Add Telemetry
 notification support
Message-ID: <20261110141635.00005ca9@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-21-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-21-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX/yQRShmUsZBD
 o5CWs9BAfULFV4d187MvoQlDypDoe7nKBMJv+1i/slZYuodwmN2WbWzqqD3fFHVJOPEstyqu+lr
 FJoekxwvChpDwhm2CGL4ZiaCFAOEP/8Ucdm1tR8Z33JQEtqN+6zr81nK5sXPqJuCKQvnB7p8PIE
 yztfEuz8gwuJnh1BU1rQKuAMrksS0F2crIO7o7YXuDj8lF4Ys6yDr+KNJ8hFsXs4NkCaMzo9O4A
 wQW9dN62lsiXHLk/ubewp7nbXEqgFb+047lNec7R6TcRVRt0XpTL5SfAfxd3N9q6N1eimwADIsz
 vDnAD2DKBmZRbx/oNbTD70+9ubNSrHyPNfF0kiXjbd76D1FikpwRBXGqlZDDUBrVpmStA8lI/T6
 CpGs/COCSJZiWbI0z97Pt9oSnwAKn0kbS2DWEi18KyO75Jlvs2yqMKL4G76KFzE2VifZsV41g8q
 JnHPh24DVXtNxsiiXEg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af397d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=iaZMxDlvdvNhGf_iel8A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: FsgpQxZcF71Z5vR91w4lHVx80aRKVyuM
X-Proofpoint-ORIG-GUID: FsgpQxZcF71Z5vR91w4lHVx80aRKVyuM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX+7Lcayr0atpP
 X9TSxsb7nfvSe17t+j27sgkLgy/Vzki+FK/VluwuVIu9rU8NnkGDnuxNOjLkQU+xCTv0oAPtXs5
 Ea3cztQAJA1xr9uAeciWWBlvig8F6t0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_141658_943458_E5E29EB0 
X-CRM114-Status: GOOD (  30.66  )
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

On Mon,  9 Nov 2026 09:12:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for notifications to Telemetry protocol and register an
> internal notifier during protocol initialization: any DE value received
> inside a notification payload will be cached for future user consumption.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Trivial things inline.

>  drivers/firmware/arm_scmi/telemetry.c | 184 +++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |   9 ++
>  2 files changed, 190 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ebad4ec2afda..918067e225d5 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

>  static struct scmi_telemetry_res_info *
>  __scmi_telemetry_resources_get(struct telemetry_info *ti);
>  
> @@ -3831,9 +3843,9 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  	while (next < num_dwords) {
>  		struct payload *payld = (struct payload *)&dwords[next];
>  		struct scmi_telemetry_de_sample sample = {};
> +		u32 de_id, meta = le32_to_cpu(payld->meta);
>  		struct scmi_telemetry_de *de;
>  		struct telemetry_de *tde;
> -		u32 de_id, meta = le32_to_cpu(payld->meta);
>  		unsigned int wlen;
>  
>  		wlen = LINE_LENGTH_WORDS_RAW(meta);
> @@ -3874,7 +3886,6 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  		}
>  
>  		tde->cached_msg = cacheable;
> -

If you want this, figure out which patch to push it back to.

>  		sample.val = LINE_DATA_GET_RAW(&payld->tsl);
>  		sample.tstamp = HAS_LINE_EXT_RAW(meta) &&
>  			LINE_TS_VALID_RAW(meta) ? LINE_TSTAMP_GET_RAW(&payld->tsl) : 0;
> @@ -3882,6 +3893,10 @@ scmi_telemetry_msg_payld_process(struct telemetry_info *ti,
>  		/* Update the cache holding the TDE mutex */
>  		scmi_telemetry_tde_cache_update(tde, &sample, NULL);
>  
> +		/* Link notifications to Primary UUID */
> +		if (cacheable)
> +			scmi_telemetry_uuid_link(tde, ti->primary_uuid);
> +
>  		trace_scmi_tlm_collect(sample.tstamp, de->info->id, sample.val,
>  				       "MESSAGE");
>  	}
> @@ -4062,6 +4077,148 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.reset = scmi_telemetry_reset,
>  };


> +
> +static int scmi_telemetry_notifier(struct notifier_block *nb,
> +				   unsigned long event, void *data)
> +{
> +	struct scmi_telemetry_update_report *er = data;
> +	struct telemetry_info *ti = telemetry_nb_to_info(nb);
> +
> +	/*
> +	 * PARTIAL_ERRORs are reported as -EBADMSG and related lines,
> +	 * marked as DATA_INVALID, will be properly skipped by
> +	 * scmi_telemetry_msg_payld_process.

Doesn't matter much given it will still be 3 lines, but inconsistent short wrap.

> +	 */
> +	if (er->status && er->status != -EBADMSG) {
> +		trace_scmi_tlm_access(0, "BAD_NOTIF_MSG", 0, 0);
> +		return NOTIFY_DONE;

>  /**
>   * scmi_telemetry_resources_alloc  - Resources allocation
>   * @ti: A reference to the telemetry info descriptor for this instance
> @@ -4488,7 +4645,27 @@ static int scmi_telemetry_protocol_init(const struct scmi_protocol_handle *ph)
>  
>  	ti->info.base.version = ph->version;
>  
> -	return ph->set_priv(ph, ti);
> +	ret = ph->set_priv(ph, ti);
> +	if (ret)
> +		return ret;

Can drive this change back to original introduction to avoid a bit of churn.

> +
> +	/*
> +	 * Register a notifier anyway straight upon protocol initialization
> +	 * since there could be some DEs that are ONLY reported by notifications
> +	 * even though the chosen collection method was SHMTI/FCs.
> +	 */
> +	if (ti->info.continuous_update_support) {
> +		ti->telemetry_nb.notifier_call = &scmi_telemetry_notifier;
> +		ret = ph->instance_notifier_register(ph, SCMI_EVENT_TELEMETRY_UPDATE,
> +						     NULL, &ti->telemetry_nb);
> +		if (ret) {
> +			dev_err(ph->dev,
> +				"Could NOT register Telemetry notifier\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
>  }

>  struct scmi_power_state_changed_report {
> @@ -1342,4 +1343,12 @@ struct scmi_powercap_meas_changed_report {
>  	unsigned int	domain_id;
>  	unsigned int	power;
>  };
> +
> +struct scmi_telemetry_update_report {
> +	ktime_t		timestamp;
> +	unsigned int	agent_id;
> +	int		status;
> +	unsigned int	num_dwords;
> +	unsigned int	dwords[];

__counted_by?

> +};
>  #endif /* _LINUX_SCMI_PROTOCOL_H */


