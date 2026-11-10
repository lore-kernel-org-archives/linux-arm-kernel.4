Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WaFuot7g;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mm9NkHN6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeQibEII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=; b=WaFuot7gfuKFI2
	ertiHi/mzGYZwhlMsN5Ifz3KVCcgiqZbVghgQgKegycFCPRCJHbO4nv3F05M3zgd9jMEgU2QHCLzp
	vJ8kzgK4Iso+8XbucTrxkzHTGxBe48J8QdwjZ1JjBLT/ZjB2Q3XrTqCnMiqS+FOFKlUy/6yt6OdJc
	Ur8biFVFnvWJisymWqB67y9zszCR+K2XRUmsmpPvAuqxdhZMqZzG9jh+P5anXF6cBFtle6FteVWTA
	dlt+acmX9cmY8z7uYo0bumxtpQQd3P2ahYba4xxQOr0smWGpe+UgmAE55FqSpR+CSgFr1AZWS2ySn
	VrWQmyPWyvYjHyRYm6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbHG-0000000285u-2Nv2;
	Tue, 10 Nov 2026 02:08:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbHD-0000000285Z-2zf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:08:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jErO2474670
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=; b=Mm9NkHN6Zj756Mhy
	mSX1hHZcKC+vcG5YLjqGOa5t+mJxEXGCK2zfLfPBDmsxiQ/MehoccxiCria080oN
	bkYpObyiygb/TnV68u+OOYaB7iUT8Pw4YhuRBzmKlsr/f77wsfV1xLGoyuofOE1Q
	cvPjEyxsUZIk0sN75d/r/oeeFh6MjrQjf9VXbTId3lTOa7lnOdjJW1X4Szua5bfI
	fmI6n6BYE4hnUWF4ev35kGreXzpT0OOnI8Q7ei5nAdXJmd+h9Bzdl8Mq2QCnilyS
	zIOJL297SWPq0u7MMzRQCwqfnj+AmPyWPLa/f+nlKeJv1mGyhDIejbJtB2R/ahBZ
	NpRV3w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg15kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:07:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso813609eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 18:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794276477; x=1794881277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
        b=QeQibEII6VxdsKWUKm1y62XY2v3OaC4dd2gjHcb4AZ7jl7LcSJ/GOHRIaJHNM3xGUV
         EKieccbLows+yNDdSUshIGWYei29hctGxhbtTJxCRaTZB9fo6m6yzdwXcyxP7nksYoeO
         MeVOkNgTUnwDsMW2tkb0hRGWXei0D7Ot6tZZmv6NuTZ/L3YAIOBAPo/VTP6UpenvOMS/
         vOQqqsdfgUJgvw0/9JgOt9rSMdU5e7+h8MmL/MfsMnuDTo8S3aY3QNueliSSy07cd8fv
         qsL+otEgSKAyORne7+Wo91Z5fHvXgj0n63VZDh1UxbHhBCUIjg+l6jhkdBAiDr8z7X/P
         kW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276477; x=1794881277;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzh0jbXLioqQjgqKAH32s/RDc3mnON1vZDCgrDAnmOU=;
        b=wwAg6vQO1roK4Ca49i1jywfQMjDqnh2P/romw2WDxvtNp2sszI45RFs9liJdRgWlrU
         HanxTgI4wgDKLev0+cpFoa8MkNwwpt3tRy1/sQLzVFXqbCm8wrC92PCxGF7CwxGL5wMW
         81rtm7GG3sS6ZELisThribTk9CLFZQfywnNnrtXjuBqv/ftOGiGN/7pKhaH19GkcNEsj
         8cgWS2OuvmYXnVTqrng+fiZZUkAQKHwg7v7WzxIat1ejXGwwTkUvvjkckn0WsdGdOALI
         w1WKMOA1vBaxoMw59dNkVccagDt7WnUpjZSukh9PUNnTuQCXVBjv9aH5mGxYoBJ+sazO
         NT2Q==
X-Forwarded-Encrypted: i=1; AL+hErH3o5EC+wgb5AjaMsj082BDUSOHx2XMuzKyqg93ahPTwCHOjZcsCZBMLc7m/XJkX66wUn95oJxSaDe9oSbsg1kh@lists.infradead.org
X-Gm-Message-State: APuU4Z9DnIVcLVqw3MPvWSQksDfaeG/43XT0a6DBYeIRwFltP8KBFGWm
	Z8i4CYZWHTTFEqb0ct1el2xnDpbh+RxiXY5jbIkAxL7a0uTIvJBqrdPOmxNK8s0w8PDbbFW16gQ
	dZtbhr59WyC82dcTvkQJxbel+m83cscAlLgrqrDRRJUKr7YKk5z6M0ndVM1a3r5tARpbLuPLMR3
	JJRw==
X-Gm-Gg: AYBFou1wB+IlstLwPGTLlQEpv0RhMx98SfuatZqnfCcTvmXPKLn7eP2QlWk+uQ5Rn68
	1vi4oKyQuYt6+rit8H07JddQvNZejXa7R86IRS/CzIn0hjvIl17ycXfG95Puxanxz1jvCtS+aYg
	juA/0lJb+yj86zhIeLpAlOptP+mqHDXsxs1iZ3N4xmwwsfhDlDcWVkOrrvS23f+GkICwQZHFbfV
	LtHrRd6YlmqExemBY8lDBiwnWdCnFnoBfiBIfdBHINq7742C5vN9llWwN0R+Vzut+UuCEGZ2b6m
	0UmGnihyBHpdfzNnXjo8LNSSWDGVOiympN1JYlJrE1SfVmzI8pj+Iz0VEvmA0+Y5OxWkvp5s4/z
	3lh1Zub/bU9Xi39GyCBVIKOhizD+kov6wQxx5cUcpg9wviwLAyOYZhMCYFBhfPYl7+VDPuhRbJ8
	l+Zi83one6GyMAnGqe9UVSSGzCrw==
X-Received: by 2002:a05:701a:844d:20b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3b5fa29b1mr1724900c88.1.1794276477154;
        Mon, 09 Nov 2026 18:07:57 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3b5fa29b1mr1724846c88.1.1794276476426;
        Mon, 09 Nov 2026 18:07:56 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm3158465c88.4.2026.11.09.18.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:07:56 -0800 (PST)
Date: Mon, 9 Nov 2026 18:07:50 -0800
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
Subject: Re: [PATCH v15 12/35] firmware: arm_scmi: Add Telemetry update
 intervals enumeration
Message-ID: <20261109180750.0000150a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-13-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-13-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOCBTYWx0ZWRfX/oHNZ0stMhlB
 bglzuq4lZXHAGzCHvhPEDVMmOYsy2K3WDIoR5SRbU38/pw8+2llh39RGaLAwjbv7uMsMIaIa48p
 pgzuAxoxb4bdMVIa80T+avKp/mM9oXjwyLdotDsF8AoNCjvIgUfojZuwoFYEKRYP/oFdDJq/cfz
 ePql2BD3GsX5hp8t60rBDwgZ44dtPKGWSGvxishXZePdJHq1TEgrUF921rsQaqFoBerwDtdIpAD
 E5g/PplI6sUAC7Y0Pre8G69Y/R5k2gqpbsxabU0xvGCi0JN2xddwwISLiONP08b8mdY9Ty3103A
 8Op/mKrgDDxuprAh0Ej6ssEBARhV+YeBJ9InS+VeACnntEABpxcGNhutlSFuuJo4MQYRD4KBQ0G
 JsNHR/2utgb5hXGsyQ9U/+/dIvfOlyTKgUy4W80mzIuASYEEXsH9ma4rhVKTVKYaP8WoJ6wn3BO
 hg3PF+Z7H9IB79Fy0Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOCBTYWx0ZWRfXz+RUds5Rzz7v
 hoQ/SaySJnYfS/XByWkAz1TWPwhuztvaout80sDZ7ROY7Du9ZPGxME1+RmNHLr0oOALrrCJjMSR
 18uEJwaz912i99bk0rgk+mU40L8qvMs=
X-Proofpoint-GUID: sFDahx6Bt8DZO_XKIcjvUeZj69hFNDEE
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af27c7e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=M8WuIlgHp6E56V_sPrAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: sFDahx6Bt8DZO_XKIcjvUeZj69hFNDEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_180759_901564_A1C46D7E 
X-CRM114-Status: GOOD (  31.85  )
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

On Mon,  9 Nov 2026 09:11:58 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to enumerate available Telemetry update intervals.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - removed unused dev reference in interval parsing
>  - added missing initialization of intrvs->grp_id
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    update_intervals enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 198 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  21 +++
>  2 files changed, 219 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 9944506652f5..e57534c93b26 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -92,6 +92,21 @@ struct scmi_msg_resp_telemetry_de_description {
>  	struct scmi_de_desc desc[];
>  };
>  
> +struct scmi_msg_telemetry_update_intervals {
> +	__le32 index;
> +	__le32 group_identifier;
> +#define	ALL_DES_NO_GROUP	0x0
> +#define SPECIFIC_GROUP_DES	0x1
> +#define ALL_DES_ANY_GROUP	0x2

For previous defines like this they have followed the value they are in.
So I think these belong after flags.  (That fits with common practice for
this sort of thing which is why I looked).

> +	__le32 flags;
> +};
> +
> +struct scmi_msg_resp_telemetry_update_intervals {
> +	__le32 flags;
> +#define INTERVALS_DISCRETE(x)	(le32_get_bits((x), BIT(12)) == 0)
> +	__le32 intervals[];
> +};
> +
>  #define IS_TDE_TSTAMP_TYPE(__t, __ttype)	((__t)->ts_type == (__ttype))
>  #define IS_TDE_TS_NONE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_NONE))
>  #define IS_TDE_TS_LINE(_t)	(IS_TDE_TSTAMP_TYPE((_t), TSTAMP_LINE))
> @@ -693,6 +708,176 @@ static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
>  	return scmi_telemetry_de_groups_init(ti);
>  }
>  
> +struct scmi_tlm_ivl_priv {
> +	struct scmi_telemetry_intervals **intrvs;
> +	unsigned int grp_id;
> +	unsigned int flags;

Given these are fixed size, maybe u32 for each of them just to
make sure that matches up.

> +};
> +
> +static void iter_intervals_prepare_message(void *message,
> +					   unsigned int desc_index,
> +					   const void *priv)
> +{
> +	struct scmi_msg_telemetry_update_intervals *msg = message;
> +	const struct scmi_tlm_ivl_priv *p = priv;
> +
> +	msg->index = cpu_to_le32(desc_index);
> +	msg->group_identifier = cpu_to_le32(p->grp_id);
> +	msg->flags = cpu_to_le32(FIELD_PREP(GENMASK(3, 0), p->flags));

Need the mask?  It's valid but I'd expect the protection on sanity
to be at the point of p->flags being written rather than here.

> +}
> +
> +static int iter_intervals_update_state(struct scmi_iterator_state *st,
> +				       const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
> +
> +	st->num_returned = le32_get_bits(r->flags, GENMASK(11, 0));
> +	st->num_remaining = le32_get_bits(r->flags, GENMASK(31, 16));
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->intervals[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	/*
> +	 * total intervals is not declared previously anywhere so we
> +	 * assume it's returned+remaining on first call.
> +	 */
> +	if (!st->max_resources) {
> +		struct scmi_tlm_ivl_priv *p = priv;
> +		struct scmi_telemetry_intervals *intrvs;
> +		bool discrete;
> +		int inum;
> +
> +		discrete = INTERVALS_DISCRETE(r->flags);
> +		/* Check consistency on first call */
> +		if (!discrete && (st->num_returned != 3 || st->num_remaining != 0))
> +			return -EINVAL;
> +
> +		inum = st->num_returned + st->num_remaining;
> +		intrvs = kzalloc_flex(*intrvs, update_intervals, inum);
> +		if (!intrvs)
> +			return -ENOMEM;
> +
> +		intrvs->num_intervals = inum;
> +		intrvs->discrete = discrete;
> +		intrvs->grp_id = p->grp_id;
> +		st->max_resources = intrvs->num_intervals;
> +
> +		*p->intrvs = intrvs;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +iter_intervals_process_response(const struct scmi_protocol_handle *ph,
> +				const void *response,
> +				struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_update_intervals *r = response;
> +	struct scmi_tlm_ivl_priv *p = priv;
> +	struct scmi_telemetry_intervals *intrvs = *p->intrvs;
> +	unsigned int idx = st->loop_idx;
> +
> +	intrvs->update_intervals[st->desc_index + idx] =
> +		le32_to_cpu(r->intervals[idx]);

I'd go a bit long and put that on one line.

> +
> +	return 0;
> +}

> +static int
> +scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
> +{
> +	unsigned int flags;
> +	int ret;
> +
> +	flags = !ti->info.per_group_config_support ?
> +		ALL_DES_ANY_GROUP : ALL_DES_NO_GROUP;

Why not flip the condition and reverse the values?
This thing is weird enough I'd add a comment or rename them
to be more helpful. ALL_DES_THAT_HAVE_NO_GROUP for example.


> +
> +	ret = scmi_tlm_enumerate_update_intervals(ti, &ti->info.intervals,
> +						  SCMI_TLM_GRP_INVALID, flags);
> +	if (ret)
> +		return ret;
> +
> +	/* A copy for UAPI access... */
> +	ti->info.base.num_intervals = ti->info.intervals->num_intervals;
> +
> +	/* Delegate freeing of allocated intervals to unbind time */
> +	return devm_add_action_or_reset(ti->ph->dev,
> +					scmi_telemetry_intervals_free,
> +					ti->info.intervals);
> +}

>  /**


