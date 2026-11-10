Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D560A260F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWUeRGXH;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RieQAkdK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHve33cw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WRXokBdO+oIs4atEvH5/Tv8lqdAUyBY3KDx/dJ0vXYY=; b=OWUeRGXHFbM75v
	k2Ge1Jbo6J168oH02Iob8Rw42VgiPbz8tkxVY6zEJezlRhZ+yvPSG8dRj+Ts9ihCcpPP/roqfrTVb
	e610pOEBoQfSaUFVkxWsZ83N7KWy6fgtprVvUg2aEcHIsyIDxOMbGaQvC7AzN6mkCY0PHLdR0MDUq
	J83eKU/Xq3w+VOpw468R9S/CEFX3N9Di4tvR8wRDQYssd5EjoI0nMPXtjIygV+nTfNGpT+Xf6o3wI
	KJ2WIkyDcr0vzt/izzXFJKC+6cENbfSitBm8R9VFBoruUw2QrbggdyWGqnuEKRMpXqVr+VOk0y5cA
	AiP1As+NjHCgfmhhabIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQan5-0000000264n-2Zea;
	Tue, 10 Nov 2026 01:36:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQan2-0000000264H-3HbM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 01:36:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jHVD237171
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRXokBdO+oIs4atEvH5/Tv8lqdAUyBY3KDx/dJ0vXYY=; b=RieQAkdKTiDYe9GY
	Z09+SAp3vodCat0dYK2hMUhxpeWVhanaZpXCLhEIB5m25/YD1EK3hesCHLuE5uu6
	MIqQ8Yy54GKwF7d9/OYp+xESZr4gwEuivFJK/5SAIzZPeUKsyC2M8g5Z8CL6cVDe
	gqEQKQORZnYuO07ykVBAiLOsa8vjO94C/QKdSv0zZV0ZD3kOV4FJv1+5B5xx5kaB
	1DWYD4N31XrL98HutkLHf8UND1M5qrI8QJLc6uGSXHznMxdB1atq3aHyXwimsFUE
	CRCEQiFpSyThaNGuvZAqGQBK4GeNaHnqRLRY0ZgBmNVRGNNGELwKtaNhCv5JmsJW
	DcaG9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hubt8u64x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 01:36:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so3858712eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 17:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794274607; x=1794879407; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WRXokBdO+oIs4atEvH5/Tv8lqdAUyBY3KDx/dJ0vXYY=;
        b=UHve33cwMAR5CeTOfAprTNX/8g83FkYEwtQbFzIZ8nWUj4ekBHUjrGAxANnwIIR1A1
         PmpevCm/dzGKLseOmHt2w6O71PJkGUDaEExtgEHYBypYzj/mChx2zgOvwpDeelDbs84c
         XlR8Ea7g7rd4aZFtki5cTMwWgkjZQtnmNCPRyL+GehgTZeJSGMBjfMT+jwhCWNfeduGV
         SrBZ5Cy0pBsMjy9tIrLkjJgOK+UZvvONS8sLRv3hXG7diq5hgKms0frvZ/Yn9qOy9tqq
         PyM67Z17DB7bKsE4FNp7anAGEI1f+MtoLenZBBp45v0soZc6pUXSpMHb3EmzO1g0EBdP
         gAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274607; x=1794879407;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRXokBdO+oIs4atEvH5/Tv8lqdAUyBY3KDx/dJ0vXYY=;
        b=lRL8S2TdnwqSbCqFzSYH3v+V6Y578/YImT1uS9zF4pK13plfVqGIuEjknK8NkOuSoU
         ahgw0PhuLyYJBNvzTMwt+RAZMwEv5MfcPHocwtkXlEXoOenu/A7pjvWFwfjXTIIkKrPV
         v4b6adMEZZmCgx0szG8EoNmf7Z77AxmLeTO1IR/0GBs9U4QhXY0HhbWIECh8GWeD7Bqt
         qmMz44HQzyIvfSnUp91Ou/TiCyYjXenr7ZjkkemhAyaryfQQK7zDqvoOqrdI6vvC5tEg
         bpfsGOhuMNBTot73lQ9CawHFJT2CkOxijVKm3EPbKySXFYn0lMsFmv3CmDBdU9yRH4Zu
         wxmQ==
X-Forwarded-Encrypted: i=1; AL+hErF3bD5mckJmUQ4FjL47eHRSfnvuLqcA9kXPaSSYlDMVtslK42oy9mOgkWwpn3xgNfJ1jL5D/81JcJsbEvbVRU6H@lists.infradead.org
X-Gm-Message-State: APuU4Z9F9mjKAy+ef4eoqdiRKL3/ZIa2a1XVyl13xJi7vfb4VKSuo9/+
	aAO/4/Y4VRh/wCpNjSKzjbzxAcTRo+MR+qLCGEjs1N/n9ELB+SOLv660OiNEZ+JcL1GWyNi0L3D
	73nOVrtrslpjfFc5VieTpmBCwlA7WLo9JQFpf/aYvM2y+oCnbaG9z7mUucDajB0PB+ykx7qEndu
	dU8w==
X-Gm-Gg: AYBFou2kH0hrRbMRwJKowA8h1eIhZLFC0X+ZEFbvYWFmWfD2TBsJheupK5JpqyxMgwT
	jEXGWE363a/Ss39ZM8kIso7veA6PaXBzi4FTey9YtvBA043+kSmaRLwjZGQ5mJ5WwgrgzzcARFf
	IibUGFom9e6pwnILtMcm9iPHtBuTEf8+oRzxpGxzXy4VeMSgc1Qtw6bTexqyl3eeM7SDsqCEeKT
	LzRHBjf2E7ZPWQNN7GO7rXpHiIHpdlrUXZKDZ2SKZsjdP1PPTk/eXK1pDn71BfqRzGC0bJ5INnE
	KEA4rPwR72gQwQby8WpGmNc2QmpLDG4qJSF7nCZst7dUkKIMLE+iJi74phv/sTEy6Qus2D8ENPB
	BmCBbKg9kZvsH0ah9WUwHz0/H4HaxMU6hHVQ2dOGWLU2egmBxIllPOsZVOWr3sgaBdZxRMgeEVj
	fMUJ4lRCbaPsVs3+6LdWiX2cvs6g==
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr1712707c88.41.1794274607038;
        Mon, 09 Nov 2026 17:36:47 -0800 (PST)
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr1712673c88.41.1794274606039;
        Mon, 09 Nov 2026 17:36:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5ba8426sm2374684c88.23.2026.11.09.17.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:45 -0800 (PST)
Date: Mon, 9 Nov 2026 17:36:41 -0800
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
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <20261109173641.00005289@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-11-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-11-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNiBTYWx0ZWRfXxI2J9Y5wtMTD
 pzcxwjfFfMjW9tuhd5gnXAakfLJZPWERByZbdwk/W8VUeHsYsQWNKSK3a895IAyL2uDgTfBiFyj
 OQCI0IWIfanoXPGBASfSuGigW61UXUOmwXTGtHDoqLlF0/VNn9kFEwS0Lmq2MAV7skz+DckI7iv
 j+As0+mJrt9gkxTm38qCKwy9XBcIcTKG7PmtnWl12cuPn/fPsgkkFNQa6+ZN+0yBRdpaATWtrM/
 8Md93u+0JUlckhPQ9vSjWyx3TUYC5G96zOz8VnOStAcLzLNbDi6Dz6BV7FSL2OB55XFYFJJfR2S
 oAJmzC92xRMszQacXVRUPnd83dGp0E1kcoUk+t9IEs0pFmn5nX/2vw4W6qv7TD/0OTqKkT9wKRg
 RjR42rbcwTcufC4KG2zq3G8/f20OXOIOrJOCCdhHnQcQYJ80QJrF2wwXAazYaFFg3JuQDLbq8XO
 GSMIGo6syfQO3HbAEqw==
X-Proofpoint-GUID: bjD3NkNJZE2GKthp0zWNCKO9xvBH1oSJ
X-Proofpoint-ORIG-GUID: bjD3NkNJZE2GKthp0zWNCKO9xvBH1oSJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNiBTYWx0ZWRfXzqXqHB8doUj/
 TsZf1yxXm1iYZ38txyp34ZWnd6+lACLt8qL2k8OdUksju9cNVxNkPky24ZB58nazOXocsV5sQGE
 Ji/THjk/mf73x+yb7o4i3OgWCYEliC8=
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6af27530 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=xkoatq2HAAAA:8 a=_IL6JYvmeqXbNhZtubEA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=CuNAHyPTimGbZf_9KV2F:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173648_864254_24923D35 
X-CRM114-Status: GOOD (  39.93  )
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

On Mon,  9 Nov 2026 09:11:56 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add basic Telemetry allocation and initialization routines, introducing and
> wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> optionally using a lazy on-demand scheme: this approach factors in the
> flexibility needed to minimize the amount of initialization work based on
> the effective access pattern used by the upper layer ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Just some minor stuff inline.

> ---
> v14 --> v15
>  - drop usage of devres for FC iomapping
>  - trigger full enumeration of DE lookups
>  - new IS_TDE_TS_ macro helpers
>  - add a dedicated scmi_telemetry_free_tdes_add helper
>  - better commenting
>  - dropping needless __must_check
>  - flag as fully enumerated only when ALL declared des were found
>  - drop redundant iounmap
>  - check FC size on enumeration
> v13 --> v14
>  - splitted out of the old Basic Telemetry patch, contains the basic
>    instance allocations and the DEs enumeration process
>  - renamed some fields to more strictly adhere to spec nomenclature
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 724 ++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  37 ++
>  2 files changed, 761 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index 23eaac485691..db4108ef0232 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> +
> +#define TDE_FC_SIZE(_t)							\
> +({									\
> +	struct telemetry_de *__t = (_t);				\
> +	size_t fc_size;							\
> +									\
> +	fc_size = __t->de.info->data_sz;				\
> +	fc_size += __t->de.tstamp_support ? sizeof(u32) * 2 : 0;	\

Maybe add a comment on why two u32.  I had to dig around for that.

> +	(fc_size);							\
> +})
> +
> +enum timestamps {
> +	TSTAMP_NONE = 0,
> +	TSTAMP_LINE = 1,
> +	TSTAMP_BLK = 2,
> +};
> +
> +#define SHMTI_ID_INVALID	GENMASK(31, 0)
> +
> +struct telemetry_de {
> +	enum timestamps ts_type;
> +	u32 ts_rate;
> +	bool enumerated;
> +	void __iomem *base;
> +	u32 sid;
> +	u32 offset;
> +	/* NOTE THAT DE data_sz is registered in scmi_telemetry_de */

Why this comment? Seems a bit random.

> +	u32 fc_size;
> +	struct list_head item;
> +	struct scmi_telemetry_de de;
> +	/* Protect last_val/ts/magic accesses - MUST BE KEPT LAST */

Why?  Would be useful to have that as well as what must be the case.

> +	struct mutex mtx;
> +};


> +
> +static int scmi_telemetry_tde_register(struct telemetry_info *ti,
> +				       struct telemetry_de *tde)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	int ret;
> +
> +	lockdep_assert_held(&tde->mtx);
> +
> +	/* Get rinfo without triggering a recursive enumeration */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +
> +	if (rinfo->num_des >= ti->info.base.num_des) {
> +		ret = -ENOSPC;
> +		goto err;
> +	}
> +
> +	/* Store DE pointer by de_id ... */
> +	ret = xa_insert(&ti->xa_des, tde->de.info->id, &tde->de, GFP_KERNEL);
> +	if (ret)
> +		goto err;
> +
> +	/* ... and in the general array */
> +	rinfo->des[rinfo->num_des] = &tde->de;
> +	/* Make sure the freshly registered DE is visible before the index update */
> +	smp_store_release(&rinfo->num_des, rinfo->num_des + 1);
> +
> +	return 0;
> +
> +err:
> +	dev_err(ti->ph->dev, "Cannot register TDE for ID:0x%08X - ret:%d\n",
> +		tde->de.info->id, ret);

I'd push that into the error paths above where you can give a more
specific message + avoid the goto complexity by returning directly.

> +
> +	return ret;
> +}

> +
> +static int iter_de_descr_update_state(struct scmi_iterator_state *st,
> +				      const void *response, void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_de_description *r = response;
> +	struct scmi_tlm_de_priv *p = priv;
> +
> +	st->num_returned = le32_get_bits(r->num_desc, GENMASK(15, 0));
> +	st->num_remaining = le32_get_bits(r->num_desc, GENMASK(31, 16));
> +
> +	if (st->rx_len < (sizeof(*r) + sizeof(r->desc[0]) * st->num_returned))
> +		return -EINVAL;
> +
> +	/* Initialized to first descriptor and initial payload size */
> +	p->next = (void *)r->desc;

Any need for the cast?  Looks to be a non const pointer being stored to a void *
so implicit cast should be fine.


> +	p->rx_len = st->rx_len - sizeof(*r);
> +
> +	return 0;
> +}

> +
> +static int scmi_telemetry_de_descriptor_parse(struct telemetry_info *ti,
> +					      struct telemetry_de *tde,
> +					      void **next, size_t *rx_len)
> +{
> +	const struct scmi_de_desc *desc = *next;
> +	size_t payld_sz = sizeof(*desc);
> +
> +	lockdep_assert_held(&tde->mtx);
> +
> +	if (*rx_len < payld_sz)
> +		return -ENOSPC;
> +
> +	tde->de.info->id = le32_to_cpu(desc->de_id);
> +	tde->de.info->grp_id = le32_to_cpu(desc->group_id);
> +	tde->de.info->data_sz = le32_to_cpu(desc->de_data_sz);
> +	tde->de.info->type = GET_DE_TYPE(desc);

I much prefer this approach of passing in the whole desc to the one in the 
previous patch where the __le32 attributes_1 was passed in.
It keeps all the 'which field' associations in one place in the code.
So if you want to do these GET / SUPPORTS macros then on the whole
resp structure is the better option (as done here!)

> +	tde->de.info->unit = GET_DE_UNIT(desc);
> +	tde->de.info->unit_exp = GET_DE_UNIT_EXP(desc);
> +	tde->de.info->instance_id = GET_DE_INSTA_ID(desc);
> +	tde->de.info->compo_instance_id = GET_COMPO_INSTA_ID(desc);
> +	tde->de.info->compo_type = GET_COMPO_TYPE(desc);
> +	tde->de.info->persistent = IS_PERSISTENT(desc);
> +	tde->ts_type = TSTAMP_SUPPORT(desc);
> +	tde->de.tstamp_support = !!tde->ts_type;
> +	tde->de.fc_support = IS_FC_SUPPORTED(desc);
> +	tde->de.name_support = IS_NAME_SUPPORTED(desc);
> +	/* Update DE_DESCRIPTOR size for the next iteration */
> +	*next += sizeof(*desc);
> +
> +	payld_sz += scmi_telemetry_tde_var_size_calc(tde);

Might be easier to just check on element in the variable sized
region?  Keeps the size together with what we are looking for
it in.  Or is aim of doing this here to make sure there are no
possible failure paths after the fast channel stuff so we
don't have to unwind that?  If so maybe a comment here would
help reviewers understand that.

> +	if (*rx_len < payld_sz)
> +		return -ENOSPC;
> +
> +	if (IS_TDE_TS_LINE(tde)) {
> +		__le32 *line_ts_rate = *next;
> +
> +		tde->de.info->ts_rate = le32_to_cpu((*line_ts_rate));
> +
> +		/* Variably sized depending on TS support */

As below. I'd say 'what' is variably sized, or drop the comment.

> +		*next += sizeof(*line_ts_rate);
> +	} else if (tde->ts_type == TSTAMP_BLK) {
> +		/* Setup default BLK TS value at first */
> +		tde->de.info->ts_rate = ti->default_blk_ts_rate;
> +	}
> +
> +	if (tde->de.fc_support) {
> +		struct de_desc_fastchannel *dfc;
> +		phys_addr_t phys_addr;
> +		void __iomem *addr;
> +		size_t size;
> +		int ret;
> +
> +		dfc = *next;

Similar to the setting of desc at top of file, I'd do this
at declaration
		struct de_desc_fastchannel *dfc = *next;

Mainly for consistency rather that it really mattering either way!

> +
> +		ret = scmi_telemetry_area_check(ti->ph->dev, "FC",
> +						le32_to_cpu(dfc->addr_low),
> +						le32_to_cpu(dfc->addr_high),
> +						le32_to_cpu(dfc->size),
> +						&phys_addr, &size);

Building phys_addr inside a function called check is a bit unintuitive.
I'd do it out here and pass it in as a parameter.
Similar with size (though that's just copied).

> +		if (ret)
> +			return ret;
> +
> +		/* Does it fit ? */
> +		if (size < TDE_FC_SIZE(tde)) {
> +			dev_err(ti->ph->dev,
> +				FW_BUG "TDE FC size too small (%zu)\n", size);
> +			return -EPROTO;
> +		}
> +
> +		addr = ioremap(phys_addr, size);
> +		if (!addr)
> +			return -EADDRNOTAVAIL;
> +
> +		tde->base = addr;
> +		tde->offset = 0;
> +		tde->fc_size = size;
> +
> +		/* Variably sized depending on FC support */

Not sure that comment adds much seeing as we are in the fc support if statement.

> +		*next += sizeof(*dfc);
> +	}
> +
> +	if (tde->de.name_support) {
> +		const char *de_name = *next;
> +
> +		strscpy(tde->de.info->name, de_name, SCMI_SHORT_NAME_MAX_SIZE);
> +		/* Variably sized depending on name support */

Similarly. This seems pretty obvious given where we are.
Also not clear 'what' is variably sized from the comment.

> +		*next += SCMI_SHORT_NAME_MAX_SIZE;
> +	}
> +
> +	*rx_len -= payld_sz;
> +
> +	return 0;
> +}
> +
> +static int iter_de_descr_process_response(const struct scmi_protocol_handle *ph,
> +					  const void *response,
> +					  struct scmi_iterator_state *st,
> +					  void *priv)
> +{
> +	struct scmi_tlm_de_priv *p = priv;
> +	struct telemetry_info *ti = p->ti;
> +	const struct scmi_de_desc *desc = p->next;
> +	struct telemetry_de *tde;
> +	bool discovered = false;
> +	unsigned int de_id;
> +	int ret;
> +
> +	/* Is at least reading de_id safe */
> +	if (p->rx_len < sizeof(desc->de_id))
> +		return -ENOSPC;
> +
> +	de_id = le32_to_cpu(desc->de_id);
> +	/*
> +	 * Check if this DE was already been discovered by other means,
> +	 * such as during boot if Telemetry was detected as already enabled
> +	 * and the list of enabled DEs was enumerated separately.
> +	 */

Is this something added in a later patch?  So far I'm not seeing any means for
this to happen and hence for the tde->enumerated check below to ever not
trigger (unless we get a failure in the descriptor parsing).

> +	tde = scmi_telemetry_tde_lookup(ti, de_id);
> +	if (!tde) {
> +		/* Create a new one */
> +		tde = scmi_telemetry_tde_get(ti, de_id);

The naming here with _get made me think this would retrieve the instance
if it was already registered. Instead it is getting a free on from
the pool.. Maybe better called alloc?  This naming is the reason
the Create comment is currently necessary. Seems easy to resolve!

> +		if (IS_ERR(tde))
> +			return PTR_ERR(tde);
> +
> +		discovered = true;
> +	}
> +
> +	guard(mutex)(&tde->mtx);
> +	if (tde->enumerated) {
> +		/* Cannot be a duplicate of a DE already created by enumeration */
> +		dev_err(ph->dev,
> +			"Discovered INVALID DE with DUPLICATED ID:0x%08X\n",
> +			de_id);
> +		return -EINVAL;
> +	}
> +
> +	ret = scmi_telemetry_de_descriptor_parse(ti, tde, &p->next, &p->rx_len);
> +	if (ret) {
> +		dev_err(ph->dev, "Malformed DE Descriptor - ret:%d\n", ret);
> +		/* DE not enumerated at this point were created in this call */


If they were created in this call, why do we need to check 'discovered'?
Comment seems a bit confusing.

> +		if (discovered)
> +			scmi_telemetry_free_tde_put(ti, tde);
> +		return ret;
> +	}
> +
> +	/* Now fully enumerated */
> +	tde->enumerated = true;
> +
> +	/* Register if it was not already ... */
> +	if (discovered) {
> +		ret = scmi_telemetry_tde_register(ti, tde);
> +		if (ret) {
> +			/* DE not enumerated at this point were created in this call */
> +			scmi_telemetry_free_tde_put(ti, tde);
> +			return ret;
> +		}
> +	}
> +
> +	/* Count timestamped DEs */
> +	ti->num_des_tstamp += !!tde->de.tstamp_support;
> +
> +	/* Add to FastChannels list */
> +	if (tde->de.fc_support)
> +		list_add(&tde->item, &ti->fcs_des);
> +
> +	return 0;
> +}
> +
> +static int scmi_telemetry_de_descriptors_get(struct telemetry_info *ti)
> +{
> +	const struct scmi_protocol_handle *ph = ti->ph;
> +
> +	struct scmi_iterator_ops ops = {
> +		.prepare_message = iter_tlm_prepare_message,
> +		.update_state = iter_de_descr_update_state,
> +		.process_response = iter_de_descr_process_response,
> +	};
> +	struct scmi_tlm_de_priv tpriv = {
> +		.ti = ti,
> +		.next = NULL,

It will be NULL whether or not you set it.  Is there significant
documentation value in doing so explicitly?

> +	};
> +	void *iter;
> +	int ret;
> +
> +	if (!ti->info.base.num_des)
> +		return 0;
> +
> +	iter = ph->hops->iter_response_init(ph, &ops, ti->info.base.num_des,
> +					    TELEMETRY_DE_DESCRIPTION,
> +					    sizeof(u32), &tpriv);
> +	if (IS_ERR(iter))
> +		return PTR_ERR(iter);
> +
> +	ret = ph->hops->iter_response_run(iter);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static const struct scmi_telemetry_info *
>  scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
>  {
> @@ -108,10 +589,247 @@ scmi_telemetry_info_get(const struct scmi_protocol_handle *ph)
>  	return &ti->info;
>  }
>  
> +static const struct scmi_telemetry_res_info *
> +scmi_telemetry_resources_get(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_telemetry_res_info *(*res_get)(struct telemetry_info *ti);
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +
> +	/* Ensure the latest installed res_get helper is visible */
> +	res_get = smp_load_acquire(&ti->res_get);
> +
> +	return res_get(ti);
> +}
> +
> +static const struct scmi_telemetry_de *
> +scmi_telemetry_de_lookup(const struct scmi_protocol_handle *ph, u32 id)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +
> +	/* Trigger a full proper enumeration */

I'm a bit confused, doesn't this only trigger full enumeration on first
access?  That comment seems to imply every time.  Or is there something
about this function that ensures it is always the first access and is
only used that one time?

> +	scmi_telemetry_resources_get(ph);
> +
> +	return xa_load(&ti->xa_des, id);
> +}
> +
>  static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.info_get = scmi_telemetry_info_get,
> +	.de_lookup = scmi_telemetry_de_lookup,
> +	.res_get = scmi_telemetry_resources_get,
>  };
>  
> +/**
> + * scmi_telemetry_resources_alloc  - Resources allocation
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This allocates and initializes dedicated resources for the maximum possible
> + * number of needed telemetry resources, based on information gathered from
> + * the initial enumeration: these allocations represent an upper bound on
> + * the number of discoverable telemetry resources and they will be later
> + * populated during late deferred further discovery phases.
> + *
> + * Note that some of the allocations down below are designed to keep some
> + * class of data packed together since it eases retrieval from the ABI layer.
> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
> +{
> +	/* Array to hold pointers to discovered DEs */
> +	struct scmi_telemetry_de **des __free(kfree) =
> +		kzalloc_objs(*des, ti->info.base.num_des);
> +	if (!des)
> +		return -ENOMEM;
> +
> +	/* The allocated DE descriptors */
> +	struct telemetry_de *tdes __free(kfree) =
> +		kzalloc_objs(*tdes, ti->info.base.num_des);
> +	if (!tdes)
> +		return -ENOMEM;
> +
> +	/* Allocate a set of contiguous DE info descriptors. */
> +	struct scmi_telemetry_de_info *dei_store __free(kfree) =
> +		kzalloc_objs(*dei_store, ti->info.base.num_des);
> +	if (!dei_store)
> +		return -ENOMEM;
> +
> +	struct scmi_telemetry_res_info *rinfo __free(kfree) =
> +		kzalloc_obj(*rinfo);
> +	if (!rinfo)
> +		return -ENOMEM;

It's a minor thing, but I'd allocate these in the order
that is the reverse of that used for tear down. Right now they
are not quite in the same order so it's not that you are
following another consistent scheme.

> +
> +	mutex_init(&ti->free_mtx);
> +	INIT_LIST_HEAD(&ti->free_des);
> +	for (int i = 0; i < ti->info.base.num_des; i++) {
> +		mutex_init(&tdes[i].mtx);
> +		/* Bind contiguous DE info structures */
> +		tdes[i].de.info = &dei_store[i];
> +		scmi_telemetry_free_tdes_add(ti, &tdes[i]);
> +	}
> +
> +	INIT_LIST_HEAD(&ti->fcs_des);
> +
> +	ti->tdes = no_free_ptr(tdes);
> +
> +	rinfo->des = no_free_ptr(des);
> +	rinfo->dei_store = no_free_ptr(dei_store);
> +
> +	/* Ensure all of the above assignments are visible */
> +	smp_store_release(&ti->rinfo, no_free_ptr(rinfo));
> +
> +	return 0;
> +}
> +
> +static struct scmi_telemetry_res_info *
> +__scmi_telemetry_resources_get(struct telemetry_info *ti)
> +{
> +	/* Ensure rinfo descriptor is visible */
> +	return smp_load_acquire(&ti->rinfo);
> +}
> +
> +static void scmi_telemetry_resources_free(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +
> +	/* Get rinfo without triggering a recursive enumeration, cannot be NULL */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +	/* Ensure rinfo is no more accessible upfront */
> +	smp_store_release(&ti->rinfo, NULL);
> +
> +	kfree(ti->tdes);
> +
> +	kfree(rinfo->des);
> +	kfree(rinfo->dei_store);
> +
> +	kfree(rinfo);
> +
> +	dev_dbg(ti->ph->dev, "SCMI Telemetry resources freed for instance\n");
> +}

> +
> +/**
> + * scmi_telemetry_resources_enumerate  - Enumeration helper
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * This helper is configured to be called once on the first enumeration
> + * attempt, when triggered by invoking ti->res_get() from somewhere else.
> + *
> + * Once run it substitues itself in ti->res_get() with the simple accessor
> + * __scmi_telemetry_resources_get, which returns a descriptor to the resources
> + * that were possibly discovered.
> + *
> + * Note that, while it attempts to fully enumerate Data Events and Groups, it
> + * does NOT fail when such enumerations fail, instead it simply gives up with
> + * the end result that only a partially populated, but consistent, resources
> + * descriptor will be returned; in such a case the incomplete descriptor will
> + * be marked as NOT fully_enumerated: this design enables the kernel to deal
> + * with badly implemented out-of-spec firmware support while keep on providing
> + * a minimal sane, albeit possibly incomplete, set of telemetry respources.

I'm curious about this. What's the motivation for being nice to people who
write buggy firmware?  I'd kind of prefer an opt in quirk for any that show
up where a fix is impractical rather than a paper over the bad from the start.

> + *
> + * Return: A reference to a fully or partially populated resources descriptor
> + */
> +static struct scmi_telemetry_res_info *
> +scmi_telemetry_resources_enumerate(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	struct device *dev = ti->ph->dev;
> +	int ret;
> +
> +	/*
> +	 * Ensure the following initialization can be called only once
> +	 * from one thread of execution.
> +	 */
> +	if (atomic_cmpxchg(&ti->rinfo_initializing, 0, 1)) {
> +		/*
> +		 * When initialization is already ongoing in another thread,
> +		 * just wait for its completion and return the fully or partially
> +		 * populated rinfo.
> +		 */
> +		if (!completion_done(&ti->rinfo_initdone))
> +			wait_for_completion(&ti->rinfo_initdone);

Given this is a not particularly hot initialization path, do we care about
the small saving the completion_done precheck is giving here?  I'd just
do the wait unconditionally.  If you do need the completion_done check then
add a comment for why or someone is likely to tidy it away in future!

> +
> +		/* Ensure rinfo descriptor is visible */
> +		return smp_load_acquire(&ti->rinfo);
> +	}
> +
> +	/* Note that this code below can be run only once by one thread */
> +	ret = scmi_telemetry_de_descriptors_get(ti);
> +	if (ret) {
> +		dev_err(dev, FW_BUG "Cannot fully enumerate DEs resources. Degraded system.\n");
> +		goto done;
> +	}
> +
> +	/* Get rinfo without triggering a recursive enumeration */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +	rinfo->fully_enumerated = rinfo->num_des == ti->info.base.num_des;
> +done:
> +	/* Disable initialization permanently */
> +	smp_store_release(&ti->res_get, __scmi_telemetry_resources_get);
> +
> +	/* Unblock concurrent threads that have been stalled */
> +	complete_all(&ti->rinfo_initdone);
> +
> +	/* Ensure local rinfo is visible before returning it */
> +	smp_mb();
> +	return ti->rinfo;
> +}
> +
> +/**
> + * scmi_telemetry_instance_init  - Instance initializer
> + * @ti: A reference to the telemetry info descriptor for this instance
> + *
> + * Note that this allocates and initialize all the resources possibly needed
> + * and then setups the @scmi_telemetry_resources_enumerate helper as the
then sets up

(setup only exists as a noun).

> + * default method for the first call to ti->res_get(): this mechanism enables
> + * the possibility of optionally implementing deferred enumeration policies
> + * which optionally delay the discovery phase and related SCMI message exchanges
> + * to a later point in time.
> + *
> + * Return: 0 on Success, errno otherwise
> + */
> +static int scmi_telemetry_instance_init(struct telemetry_info *ti)
> +{
> +	int ret;
> +
> +	ret = scmi_telemetry_resources_alloc(ti);
> +	if (ret)
> +		return ret;
> +
> +	xa_init(&ti->xa_des);
> +
> +	/* Setup resources lazy initialization */
> +	atomic_set(&ti->rinfo_initializing, 0);
> +	init_completion(&ti->rinfo_initdone);
> +	/* Ensure the new res_get() operation is visible after this point */
> +	smp_store_mb(ti->res_get, scmi_telemetry_resources_enumerate);
> +
> +	return devm_add_action_or_reset(ti->ph->dev,
> +					scmi_telemetry_instance_cleanup, ti);
I'd have preferred clear association of each step this unwinds with where
the thing was set up, but I suppose this isn't too bad as is.

> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index f076ce5601cf..cc5bd87705ed 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -830,6 +830,37 @@ struct scmi_pinctrl_proto_ops {
>  	int (*pin_free)(const struct scmi_protocol_handle *ph, u32 pin);
>  };
>  
> +struct scmi_telemetry_de_info {
> +	unsigned int id;
> +	unsigned int grp_id;
> +	unsigned int data_sz;
> +	unsigned int type;
> +	unsigned int unit;
> +	int unit_exp;
> +	unsigned int ts_rate;
> +	unsigned int instance_id;
> +	unsigned int compo_instance_id;
> +	unsigned int compo_type;
> +	bool persistent;
> +	char name[16];
> +};
> +
> +struct scmi_telemetry_de {
> +	bool tstamp_support;
> +	bool fc_support;
> +	bool name_support;
> +	bool enabled;
> +	bool tstamp_enabled;
> +	struct scmi_telemetry_de_info *info;
> +};
> +
> +struct scmi_telemetry_res_info {
> +	bool fully_enumerated;
> +	unsigned int num_des;
> +	struct scmi_telemetry_de **des;
> +	struct scmi_telemetry_de_info *dei_store;
> +};


