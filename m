Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9AA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qdbOQgWj;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I9EMFaMW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZpb1Cez
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=; b=qdbOQgWjl2nh1c
	IfFyocXsPEY89FbkcF5DqLMwUY6cpvNqrEIrFyAHjN5CuMT7BrK6TJz5jYuqliEGCNzj2rJzhe6r2
	GcOhMc15qZg15ahXFyvXX1td9jj8X7itmSoQM/6kvayaCXk04nz6U9VlqlVyHP/tyRZjZqX9My4IR
	wZjMrW17TC/2Fj8c2pUEcjOoaHFZpbgUrPYSqO5aTHV6sm8qbHLDy7M5cSKM/Ir6YnW0o6WdfVyv/
	KXLjk4f8EqAbMkOsPbwTQPQcOCorfhjFiMsK85yavulbKRv0IK2MHzv7Zg8vtBg80yeILavCdFg47
	mZs3VfF8cCaabMjc5noQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbZf-000000029Ky-0GDR;
	Tue, 10 Nov 2026 02:27:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbZc-000000029Ka-2uAz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:27:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j5Xi1323195
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=; b=I9EMFaMWNtXPYRVj
	L2ts+ZenQ+6nxmUJleNtxEjnkHz3rezskY13a1f6Ez+LRG/wi4LpA+bZj24W8Fwo
	1ijJPzgdw38fMJ1QWN3QIxzttF7uPkpeSW+/SRSD6ncdocrklwIhvPQX7FWz7kyC
	w4Jky8HN+OLUKq4ylqg8FrN0MEGZI6u9FuTXt5Cz4tTulb3IFLKZnZeIxNdQrpJU
	RnhfKxU5N/Bk+uZl8OxuB0dOc2cceLkzXktKRvwKv/iylCDprODwPPWP5QsOtfEM
	/kNYe8W57yTImchU58JQdpk3MHzm5zvkgrDHSQr7IuebKMbqfFU/SeRnfi92IlBl
	GW/ksQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58br26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 02:27:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1959884eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 18:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794277619; x=1794882419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=gZpb1Cez+TjE5F5WdHyEINPiKeGB5cYlUIXsn4CJNM/laproIJbralP+7xMVk9RWkn
         gCYY1YrnZbmK2lJMrcKiwwmNWKwgbloUfNK3rNp50HIHfdgBj72ba2cxjqbQutFkzt9L
         KWmOs5W40ikmzh0zDPc1nBd5tNJe+PmdnXgwiUWg7z42PqMdK/tqaVzzhsXtucwFNeFs
         pOZmPyPZDglP14QVJhvVCqSbd1hmXwUTABWS7Mg0H2yWP0a4ouEPpE0eSmijSbV/NYDa
         ta2FWUrXY9XFCMJ+P2JRrKIi+wTsyroRACCQ7+c53RIC5Bgg1zlYWa9lmZNrpZziCImT
         ypwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277619; x=1794882419;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FbT91i0c5l/KVk+5M9vrjlRuG1+3lI13/QVZcwyokHQ=;
        b=S1EpsY38OnjZs4eTR1nHxCX/mmshaO9B9hE6PbhkudEAx1rdtGgEWTMqmH7oS0kYQj
         jPefX1X2vAMylr1aguSeFK+PtsIG/slmDoeCweELeuV/zKoAEy5eVCtK/r0VeehAAxlZ
         BQi92Fg7KHTfvLZC3CxSW+iF5sHdAjWGIPdeDUf0LEVxk6XgrjUblBld0lUbhuFPvJQY
         wgw+WIIhflYyT0VfpdOBmL2o3UXliVIKDDYQjvmy6G7lcOLjGaFhO7AgvOnc+vyLSxCh
         cJXCUmED06A9I9V6VskPQEQ7jAeGoE0MpRtWZn4zWW1p5lcQ30gN+FvX0A1chzkJAqh6
         Pozg==
X-Forwarded-Encrypted: i=1; AL+hErEBGD5SsxdLWnvFnMqSFo8KOkIeHl3We5J0c+hQeZKxZzYnBhyX3QI6a8TVA+NOr1KZ+AIRzruQcXnOw/mXq4bf@lists.infradead.org
X-Gm-Message-State: APuU4Z8addvjtwDSBiuj1gQXc5FVNLygBU3UcbXas1NGv32PcDfIiwM6
	Lvn8fy0b24qhisK0bWQXnZ7PKy1nKkUzdO1v1RrAJ9qoLkhxfC0CovA7gPNWPNDHw8dQesoEF5f
	AaTVp5ic/0qB1TXFfNp/nMcQIwHVqeO8PFVdPAVZ8pXlJ9QQo97faPUPv0SxgVbDzxgzqWEYigW
	Xlog==
X-Gm-Gg: AYBFou3npkPZT4ugy5jduGeet5eCunk1Owqj45IvYy63gOv2R2+XDWMROHNpX0Irk9D
	irEG6lHyFFqHvcHYiOHKB+3tUHSQ95yczYpSBh2Xe5busUtBWWp9Epmo+3Bo/f66FSgQBRPFjxp
	wNIFkGfZbjIrjHDLpvrDb/A+vhC6FarR1Sb4mrX86W3xexm3PUFCUnGb9TGqqYGP6vV9YGbwtrM
	TBJ6kwUvzcHR4LtJWUnfc835f1nImV/xPWggGkukP0MlYZZno6nKgOWsvt1L5du2LwcLbwrpW6B
	aThQ01IYsWCWtQEDwJLW1gWx2YcUTLbFHgMX5sVJW3J/qRi6ipa99rFEEsggAhVfridZUDQaKSF
	RcNXrMaKOi+K/6orQzvF+YTIioZpeKnhcb89+csZSw/ce7VX7LBBCA4z13ELXlwfLoO01y6epet
	ugKIZVOf00Nv6kYtAF6Q7JsZG5xA==
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574063eec.6.1794277619059;
        Mon, 09 Nov 2026 18:26:59 -0800 (PST)
X-Received: by 2002:a05:693c:41cc:10b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3751ee7c792mr1574034eec.6.1794277618398;
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm2466798eec.8.2026.11.09.18.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:26:58 -0800 (PST)
Date: Mon, 9 Nov 2026 18:26:54 -0800
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
Subject: Re: [PATCH v15 13/35] firmware: arm_scmi: Add Telemetry SHMTI areas
 enumeration
Message-ID: <20261109182654.00003f6d@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-14-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-14-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX4Ho5AVk87Kgz
 +3S30tsBnEY+vh2lBDkLOOK8QYXeBCPXIevmQ3uZh3ecTeCw6kabW6HnSDdvVtsH3knNx2ZKkpL
 z4WdWlRCJ5zwTW2KZgC117p7Iz98RB18S6ahrzoIz6exD2+MJAmetZrtyMDRWorJxc5sGc08NAS
 +xa8vr1Do1HXSXm2xdOOViWxP9bq+BW//58XuKyy7X0fYKIXrYQWEsjvLOJLvgRzLI9L5Vq+19r
 LnTE+Um2Deqhab/m3FRpy77G6ALp6eXOJbcurOxFPdNnkIwwmZc3qE8qsGDi8bkpvOH430iDYpa
 BMnh+EzZtJQCzjinW4FLqNtSRBFoPKs/y5NDYHsZBKeyeJJ+uQehDSutbkfHDyIOQ9yHZWqEQMY
 joqH+q7yTlXSESoHTlfhZHzxUHNJNjqmEfPld9o3JNtRb0noNsGoYbe4ETFSi6yCsH4QpQiqqDn
 9ZVr+CZ0qALInDkwmIA==
X-Proofpoint-ORIG-GUID: 76LceEUVuP3V273GoPkHmRx8DH4FurEF
X-Proofpoint-GUID: 76LceEUVuP3V273GoPkHmRx8DH4FurEF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwOSBTYWx0ZWRfX7FqcEnEgMC24
 FyihkdcBvtLNqSTBUsvM0ovGZ3ejx94ZFyKdhHaoycJdfqOX+wPkMLNEYOdVThx0yQ/tgE7mZpV
 8KDzulr2TpbfiTs+foIwJbuxTA0c4Fw=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af280f4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=UCLCd_48klQTlnfJctoA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_182700_777882_E076E7A2 
X-CRM114-Status: GOOD (  34.14  )
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

On Mon,  9 Nov 2026 09:11:59 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add Telemetry support to enumerate SHMTI areas.

I'd be tempted to leave the local data structures like snaps to
be introduced only when code actually uses them.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - fix prologue/epilogue endianity fields
>  - rework SHMTI initialization and allocation
>  - add snapshot suppport data structures
>  - added alignment checks on SHMTII length size
>  - fixed error string formatting
>  - warn if less than expected SHMTIs are enumerated
>  - improve memory area sanity checks
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the
>    SHMTI areas enumeration routines
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 312 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  59 +++++
>  2 files changed, 371 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index e57534c93b26..d9f1a3e3468e 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -16,6 +16,7 @@
>  #include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/sprintf.h>
>  #include <linux/string.h>

> +struct scmi_msg_resp_telemetry_shmti_list {
> +	__le32 num_shmti;

Add a comment that this is not actually the number of shmti. 
Not confusing spec name at all.   Maybe just put a pair of
extraction macros right after it like you've had for
some of the other similar cases and that will act as documentation
that not all is what it seems.

> +	struct scmi_shmti_desc desc[];
> +};
> +
>  struct de_desc_fastchannel {
>  	__le32 addr_low;
>  	__le32 addr_high;
> @@ -107,6 +121,72 @@ struct scmi_msg_resp_telemetry_update_intervals {
>  	__le32 intervals[];
>  };
>  
> +/* TDCF */
> +
> +#define _I(__a)		(ioread32((void __iomem *)(__a)))

Is that really worth doing?  I think I'd rather see some long lines
with that expanded out.

> +
> +struct prlg {
> +	__le32 sign_start;
> +#define SIGNATURE_START	0x5442474E	/* TBGN */
> +	__le32 match_start;
> +	__le32 num_qwords;
> +	__le32 hdr_meta_1;
> +#define TDCF_REVISION_GET(x)	(le32_get_bits((x)->hdr_meta_1, GENMASK(7, 0)))

Outer brackets needed?

> +};
> +
> +struct eplg {
> +	__le32 match_end;
> +	__le32 sign_end;
> +#define SIGNATURE_END	0x54454E44	/* TEND */
> +};
> +
> +#define TDCF_EPLG_SZ	(sizeof(struct eplg))
> +
> +struct tdcf {
> +	struct prlg prlg;
> +	unsigned char payld[];
> +};
> +
> +#define SHMTI_MIN_SIZE	(sizeof(struct tdcf) + TDCF_EPLG_SZ)
> +/* An arbitrary upper bound to avoid crazy allocations driven by buggy FW */
> +#define SHMTI_MAX_SIZE	SZ_64K
> +
> +#define TDCF_START_SIGNATURE(x)	(_I(&((x)->prlg.sign_start)))
> +#define TDCF_END_SIGNATURE(e)	(_I(&((e)->sign_end)))


>  	/* Mutex to protect access to @free_des */
> @@ -878,6 +960,211 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int iter_shmti_update_state(struct scmi_iterator_state *st,
> +				   const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +
> +	st->num_returned = le32_get_bits(r->num_shmti, GENMASK(15, 0));
> +	st->num_remaining = le32_get_bits(r->num_shmti, GENMASK(31, 16));
I'd move those two into defines above, just to document that num_shmti is more
complex than it seems at first glance. Also for general consistency.
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	return 0;
> +}

> +
> +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> +				       const void *response,
> +				       struct scmi_iterator_state *st,
> +				       void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_shmti *shmti;
> +	const struct scmi_shmti_desc *desc;
> +	void __iomem *addr;
> +	phys_addr_t phys_addr;
> +	size_t len;
> +	int ret;
> +
> +	desc = &r->desc[st->loop_idx];
> +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> +
> +	shmti->info.sid = le32_to_cpu(desc->id);
> +	shmti->flags = le32_to_cpu(desc->flags);
> +
> +	ret = scmi_telemetry_area_check(ph->dev, "SHMTI",
> +					le32_to_cpu(desc->addr_low),
> +					le32_to_cpu(desc->addr_high),

Same as before. I'd do the build of phys_addr and len outside the
call. Keep it to checking validity as it's name suggests.

> +					le32_to_cpu(desc->length),
> +					&phys_addr, &len);
> +	if (ret) {
> +		dev_err(ph->dev, "Malformed SHMTI ID:%u. Abort.\n",
> +			shmti->info.sid);
> +		return ret;
> +	}
> +
> +	if (len < SHMTI_MIN_SIZE || len > SHMTI_MAX_SIZE) {
> +		dev_err(ph->dev,
> +			FW_BUG "Invalid length for SHMTI ID:%u len:%zu. Abort.\n",
> +			shmti->info.sid, len);
> +		return -EINVAL;
> +	}
> +
> +	/* SHMTI base phys_addr SHOULD be 64bit aligned by the SCMI spec */
> +	if (!IS_ALIGNED(phys_addr, 8))
> +		dev_warn(ph->dev,
> +			 "SHMTI ID:%u is NOT 64bit aligned (paddr:0x%llX)\n",
> +			 shmti->info.sid, phys_addr);
> +
> +	addr = devm_ioremap(ph->dev, phys_addr, len);
> +	if (!addr)
> +		return -EADDRNOTAVAIL;
> +
> +	shmti->base = addr;
> +	shmti->info.len = len;
> +	shmti->info.phys = phys_addr;
> +	shmti->info.offset = shmti->info.phys & ~PAGE_MASK;
> +
> +	ret = scmi_telemetry_shmti_validate(ph->dev, shmti);
> +	if (ret)
> +		return ret;
> +
> +	ti->num_shmti++;
> +
> +	return 0;
> +}


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index f38ca2f8099b..b7b8bd77b37d 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -830,6 +830,57 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  

> +
> +enum scmi_telemetry_compo_type {
> +	SCMI_TLM_COMPO_TYPE_USPECIFIED,
> +	SCMI_TLM_COMPO_TYPE_CPU,
> +	SCMI_TLM_COMPO_TYPE_CLUSTER,
> +	SCMI_TLM_COMPO_TYPE_GPU,
> +	SCMI_TLM_COMPO_TYPE_NPU,
> +	SCMI_TLM_COMPO_TYPE_INTERCONNECT,
> +	SCMI_TLM_COMPO_TYPE_MEM_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_L1_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L2_CACHE,
> +	SCMI_TLM_COMPO_TYPE_L3_CACHE,
> +	SCMI_TLM_COMPO_TYPE_LL_CACHE,
> +	SCMI_TLM_COMPO_TYPE_SYS_CACHE,
> +	SCMI_TLM_COMPO_TYPE_DISP_CNTRL,
> +	SCMI_TLM_COMPO_TYPE_IPU,
> +	SCMI_TLM_COMPO_TYPE_CHIPLET,
> +	SCMI_TLM_COMPO_TYPE_PACKAGE,
> +	SCMI_TLM_COMPO_TYPE_SOC,
> +	SCMI_TLM_COMPO_TYPE_SYSTEM,
> +	SCMI_TLM_COMPO_TYPE_SMCU,
> +	SCMI_TLM_COMPO_TYPE_ACCEL,
> +	SCMI_TLM_COMPO_TYPE_BATTERY,
> +	SCMI_TLM_COMPO_TYPE_CHARGER,
> +	SCMI_TLM_COMPO_TYPE_PMIC,
> +	SCMI_TLM_COMPO_TYPE_BOARD,
> +	SCMI_TLM_COMPO_TYPE_MEMORY,
> +	SCMI_TLM_COMPO_TYPE_PERIPH,
> +	SCMI_TLM_COMPO_TYPE_PERIPH_SUBC,
> +	SCMI_TLM_COMPO_TYPE_LID,
> +	SCMI_TLM_COMPO_TYPE_DISPLAY,

Die 0x1d is in the version I'm looking at. Perhaps a comment
for specific version of spec used.  I'd also
be tempted to assign every one of these as it makes
it easy to eyeball an particular one vs the spec.

> +	SCMI_TLM_COMPO_TYPE_RESERVED_START = 0x1d,
> +	SCMI_TLM_COMPO_TYPE_RESERVED_END = 0xdf,
> +	SCMI_TLM_COMPO_TYPE_OEM_START = 0xe0,
> +	SCMI_TLM_COMPO_TYPE_OEM_END = 0xff,
> +};



