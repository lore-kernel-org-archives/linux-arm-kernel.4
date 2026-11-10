Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B487606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TtVwtLUh;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c86qyAqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U+KXZGiL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=; b=TtVwtLUh5yR8Yj
	j0OEVPaESvTnLodGQaccxqgrKBM0MWS89dylSpQkex8uHBTA0Qa6wseE3GNdHdlnI5BTQMub2PHIq
	5DrZdifLDLBkAvVsTQKMek0MhzJICwaD2QvwEeZIuST3OkZC/xx0W5RXVsOj6zdVRvEIzN2R+azXH
	FrQ3MCDmooaJHeboc+uohAzP5hPGMMPaf+w7Mw4Kfwck/JwXOU+OqWY2pC8htPRAWTZaAFCZEmv98
	+9p9i+xYOAO6wyYgwcZYH0/Whi7HHORS77i7Eq7JhTgKddCRa5m+x/Dj4h5v5W7S9O8Gk/C59ysaU
	qGgYo6QC8bLClxSRZ7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQu0Z-000000058Es-3asR;
	Tue, 10 Nov 2026 22:08:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQu0X-000000058EW-3AY0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:08:03 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIoq9M015182
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=; b=c86qyAqVEQjKRFe5
	Er8KYOzZEgLoic6DIf0SBwpxaNoz94s9EcCc1yjf4dBrtW8TSccPKpcC1gPh4D9j
	k4Su05jYX00KVsMK0jN5Ls0pJvk76SDxOQsx2Ifnqi72HfXTJj4z0L2UM8r7buUa
	34Zsg7bZOzgePJMUK2BEtXIL6mxVahb0YbU3huvR4L8iWrbjZZ4ysH8VR4oKkYLf
	GAQn7SdP5iL+PwtMZR8KhY07k6yTjF3I80Y5w7qPLbjGxgOgSe13wC43l3zvT7ye
	6dly1MOnE9JFQhlpHOruTcaixz6BzWAc2LLekoZW+Z7VOACVqEoYVCFlmVTEd4hR
	gCBYnA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03cu3hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:08:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3367358eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794348480; x=1794953280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
        b=U+KXZGiLE6HNGzwxqbKlmPq9pccvY7H9xmvT3mrgVqXbuHspv0SwA+dQgUYdMLP0Bd
         qLeUNOzpqJP7mTuFgvDuzrDrXnZSCfduOUMZjH5kuZqk0ZCxqGEK25JQHh0GFoDR5MWa
         huoL7EiVZF0m0Jp0DJDU1WPd4vtjjEaorsg2DH3WoA+V9acPkp0R/5hB0yG+T4DwruAs
         FjcewULqKPMHM6ag9zWduhnY3Ixb1fzLStXCbuIOrwPXaS0yGNuW4y6l6n4SdJaflLwF
         i1l4abRw35TF2qb4VYXz2vZxQaTaAAhIxFkNS7j9BG92n8stmnkCx+mgOr1ZhQ3LTvXy
         MSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348480; x=1794953280;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
        b=NZfM/PO+b0VlqySIg30ILOlTXdvZhlhCDV22WIdCFI7jUvDIXdxw5Ha7Xq+R8mTbZ3
         gsuYoZjnP5zoQU6ea9eWyFpz0D0u3yU+3icFF0ZN0RC95ri+7x8aGLLm04RmOs/8Kjh/
         h8PGKfYa5D4XdSz6r2R3c0Ou0C19yNjEIqVu8pSB+plhG2SNlniYSQlcoJVC9PW4EVkt
         PB+nyC+JIOy5jmV95gzPqbmChN+TzobaRV4JbXjIO7gjWmHJVFMBpyA28ivn8ZDdAGZq
         +TYE+vRK3emzeCl1Cy7d0L34QLsKhlBD0iuGHV16jZwmjgc4cwbEM04DnwxrAQU4FMrF
         +ZjA==
X-Forwarded-Encrypted: i=1; AL+hErEEc0lDwEOo1m6M5GeY0T10kTCugVVAEvvkTvzdVMuVqk8iAWAKu0thISbFyEZHY9yfAh4+aCvxg0BTWAeF0E7e@lists.infradead.org
X-Gm-Message-State: APuU4Z8sI8ikO2IlsXlUVA8DAgDfrkmTqLOB/t8bW3L3jN2TcwlK08RU
	c4750m3EwE0Ef9tFCTgrlTf3q+3vo2tQlxp9K60VSf13Jgg7dKRtfMDUH5ZYBUEL23FxkGhB/um
	3YVGshs6xKgpupi8J9pJRShyaxMHxJf9gwMpzKE5p/wrqAyREIzGgwaFeA+yeW47euoh8TSLNSC
	3ikw==
X-Gm-Gg: AYBFou21urTUldNUxzuY3ketOjYVW4Lu4mdQ9c0M8050wFDxQyIWhuKu5qvkEm4aQ0N
	SAY7fkx233P2ZApUTlAFOMhRL7Sd/t2D6fIUE8C/jbEoxZSKhVNK5fENcv9ktkTZ0KlbmOUeRw+
	BTzFD4o7DJfKBsZMJbbWFMWO0fkwBEdqrOrpzgkRAvN8VQ5y/P3Lttaz3EcyYa+xurCSEXvpgAW
	05N/2TevbP0I6DD0WorcvhwBMJFvpU3YcXjlXH3iUE9t5w2z+jnm6+KtELKLRF4ZOqUKe5H0/9S
	n+D6t8hJMXUYiwjv6ZtIiGd6KKzj0PtElH6V5Cy9rMHcAwlxlwck0QB7bgmttesM6pIkeOmRRjB
	+3dnvY+5Opc+yDSYhOZh5vjun6o6on+HPanTTvVadE5fEe9bZikG2SPAshRHcrLYi3+532WgzQ3
	DOMxFsnunJ0Mrp45GLxoIOhRzCVDEp
X-Received: by 2002:a05:7300:ea0d:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37686174a2bmr904343eec.17.1794348479585;
        Tue, 10 Nov 2026 14:07:59 -0800 (PST)
X-Received: by 2002:a05:7300:ea0d:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37686174a2bmr904303eec.17.1794348478722;
        Tue, 10 Nov 2026 14:07:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10250365eec.27.2026.11.10.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:07:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:39 -0800
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
Subject: Re: [PATCH v15 19/35] firmware: arm_scmi: Add Telemetry reset logic
Message-ID: <20261110140739.000026c1@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-20-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-20-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SxyuclTWT0jpZTBA8PwSBDZ9cb_1LMnK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX9rY+if7qnpJb
 gSNrvHlg6aOC56rXYmSno04vVbC7VQNVvmJdJcFwiPSYYagN8uklavbfChw+mWXSaKrFKtlUTDC
 OB/615IBiGw4KDtcHMMCYdbKf74hZdU=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af395c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=ejotlmTCnjgNnXibSUUA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: SxyuclTWT0jpZTBA8PwSBDZ9cb_1LMnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfXwydfsbFjc5Oi
 Y7PKKWo8M7piYAyFDwupbtT0jWo1arqP3YBRd7E1A/B5o9bGYmyhDF3OUa/AEBGr636N74f4q2a
 nV2bwBU+w23N/CKJnqOUS2J1tkWowbs/U5iGn2P682xu8oOvtORGf6F8IanMpE9OVuSd/ypiSoY
 fw/Qw5WSz5dPSXI6jSW58GST8kmlqIodngCv/xvZiHV6wYmfU6ArZzkUQCBA6I4n81trz0wBkVs
 n1UE+EnKJoRmBFO9SC9k2VBITZgqmfceqV9TFqEdmzFrvg4xHijei/UTc5mmppG5NB44OxcyNRw
 0b5Jc61fwMm5U8pkHTCxO5VtdeaJPv0Ojt/TgmbCzkpEMKap4X3pjuKhJgLsSl8z0OA08aPKRu7
 Wz50hpKh0jVpWJG5Lwpyb5axBGmXuJqqpbDfx1qfUYIcQxWUqAT46bjgh/EUNG9s6ZK2u+4pzTP
 jCxyWvvA+aRhfdcBc3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_140801_956152_B9DF6C73 
X-CRM114-Status: GOOD (  31.03  )
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

On Mon,  9 Nov 2026 09:12:05 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to request platform to
> reset telemetry current configuration and data events values.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Just one trivial thing that might be wrong anyway.
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 81 +++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  2 +
>  2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index bf37faf99865..ebad4ec2afda 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -3969,6 +3969,86 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	unsigned int num_des;
> +
> +	ti->info.enabled = false;
> +	ti->info.current_mode = SCMI_TLM_ONDEMAND;
> +	ti->streaming_mode = false;
> +	ti->info.active_update_interval = 0;
> +
> +	/* Get rinfo without triggering an enumeration, cannot be NULL anyway */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +	/* Make sure to see the latest num_des */
> +	num_des = smp_load_acquire(&rinfo->num_des);
> +	/* Clear all local state...*/
> +	for (int i = 0; i < num_des; i++) {
> +		struct telemetry_de *tde = to_tde(rinfo->des[i]);
> +
> +		scoped_guard(mutex, &tde->mtx) {

Unless this gets more complex later,
		guard(mutex)(&tde->mtx);
and resulting drop in indent.

If it does get more complex ignore this.

> +			tde->last_ts = 0;
> +			tde->last_val = 0;
> +			tde->last_magic = 0;
> +			tde->cached_msg = false;
> +			if (!tde->de.fc_support) {
> +				tde->sid = SHMTI_ID_INVALID;
> +				tde->base = NULL;
> +				tde->offset = 0;
> +				tde->eplg = NULL;
> +			}
> +
> +			scmi_telemetry_de_state_update(ti, ENA_STATE,
> +						       &tde->de.enabled, false);
> +
> +			if (tde->de.tstamp_support)
> +				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
> +							       &tde->de.tstamp_enabled,
> +							       false);
> +
> +			/*
> +			 * Unlinking ONLY BLK_TS lines since, per the SCMI spec,
> +			 * the UUID/DE associations are permanent within the same
> +			 * session boot: after a reset has cleared the server-side
> +			 * configuration the next time SHMTIs will be re-populated,
> +			 * these same UUID/DE associations will be re-instated.
> +			 */
> +			scmi_telemetry_blkts_unlink(tde);
> +		}
> +	}
> +
> +	for (int i = 0; i < rinfo->num_groups; i++) {
> +		rinfo->grps[i].enabled = false;
> +		rinfo->grps[i].tstamp_enabled = false;
> +		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
> +		rinfo->grps[i].active_update_interval = 0;
> +	}
> +}
> +
> +static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(0, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret)
> +		scmi_telemetry_local_resources_reset(ti);
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.info_get = scmi_telemetry_info_get,
>  	.de_lookup = scmi_telemetry_de_lookup,
> @@ -3979,6 +4059,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.de_data_read = scmi_telemetry_de_data_read,
>  	.des_bulk_read = scmi_telemetry_des_bulk_read,
>  	.des_sample_get = scmi_telemetry_des_sample_get,
> +	.reset = scmi_telemetry_reset,
>  };
>  
>  /**
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 7177f739f062..012894e1d9be 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -1024,6 +1024,7 @@ struct scmi_telemetry_de_sample {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> + * @reset: reset configuration and telemetry data.
>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)
> @@ -1051,6 +1052,7 @@ struct scmi_telemetry_proto_ops {
>  	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
>  					   int grp_id, unsigned int *num_samples,
>  					   struct scmi_telemetry_de_sample *samples);
> +	int (*reset)(const struct scmi_protocol_handle *ph);
>  };
>  
>  /**


