Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE583606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z8H6IzHk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h7oZLOCc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyPpog4j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=; b=Z8H6IzHkUVrH/A
	eeI/lwL4dcQpBYIGBUlar6O7x8hP4/iwphlYbwRqXL2yXNecq88SemPLx1f0GkH1Gp3sElNChOqRA
	vK4RrU1KREIygR3MjKu5k0DF8vpjJqx7SzbtWiCqlog2+kXlPJLYzfZPxz4A9nSgotiuLju1GiQXH
	5EtYfw9mJCw9R3TFm8dJzexUmFp1lz0LEDqKzntufl0mKm/hHtL2hz+P/prQ9xYagLhKp3F1fAvgD
	nRiv0vYjYEemjxFmwOlH+9MAhqenjpO52MqUna1ERk/V9l+coBuIWJLDWnAGbWM0eWv3SOLxmTNMU
	dUUipY68lMX312cr/1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW02x-000000085FQ-3MHv;
	Tue, 24 Nov 2026 23:35:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW02v-000000085Es-0ePV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:35:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaicR2558059
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=; b=h7oZLOCcrIy30Hao
	FK38iZQoYlkyepzI1JsVsRVxonG3GDqwrJX4tKCSIwWOTk3CMlfggGOezcsmYSNB
	DEGVFdJYPHawCDK3yfvF8sBseXvM7o5SOpDT+oBPhUVX60pQ23zUYPoe+xg7U1um
	PnwJzgUyaoI7Ca7AUBeVme8MJbxteoLp6/U9yFNSCYwlMMUOeUXwH9ehwTF3dcFI
	Sql0M6UmxnVC3bbEYdqcbqnhcA7tpUOyTTqx5iEBJd0MlbTjFE0o1mdOT4TttNSZ
	XaLNeYGsFTpXOAIuwKWORHgkG9oYFRoUN0P+2vX066bRjUg2rYVDxV6Y/klkUJPj
	tYI+0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnghrmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:35:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so4825519eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563332; x=1796168132; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=;
        b=UyPpog4jAFWdY3k4rGCM0wAQxKxPLR4vh+RLqEmji5b1o7OxbuSj1ENN42OeeIG/Yw
         fKwfL21mztWLyYjbmdFJz8Ubdl0NTNPJl4sqvCfVv1XPzlk5XXhyS27Ky6q4Aq1P1mom
         fhtL27j02YDja1220PKhaoLQ08D0UkKky+VroIVJLZpBU4vZa1rpJAGLsT3M0MJo09VU
         jxMedZjNWWlAqjGvECBHU3UUhkZlgshVCJSlEnZEkC7T80TTnct6LgupVxepCh0r+BFP
         jU7j3nzzxZR7kUvsedzzryrkLF8K5smZaD+rfbQzKX+eivru5yDlxLQfwayygT94NR9q
         DUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563332; x=1796168132;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QGUTIOxWinsKzT6Xe2dXkpvFQ+Rymkt3HBKSwo7edj4=;
        b=Yt6X3yDtyNcAgtRjRtAGcOE7KPjDAq1JJXH0FtQfdL5/UANk3LfD+5tdqTsqZixZc8
         pWIZBiDBQ7dCFAEgu+1ipo6mpMioRjnWm3/6A5VCgGCqsfGIwYu+SlJDMYXOIPi004Nm
         nXeSvIMs9DUVMWS//H6Ao3snuIAKaRcOw6DcLq79hxj4yPPt+7kKF8pkSflz6Zljszhg
         tQLWfaaUiSPYB6kykmDzxfRQKVwCdyDeiLQFl5i4pzKZf/FOToY6jZD3fRbCjuDcdBsT
         AnbIPOngNFnvqhvB5aDheGqM/yTy46nNngjCB0g7N2F4/8NNwBEFqycFa3TqiOx4a6gc
         7UPQ==
X-Forwarded-Encrypted: i=1; AL+hErGZmLGnHiSc3UNGDQ0qM4ODPyMeCG0RLq2cQn5TLUeS9PyYMM8XTpiE9Kaj1znUNnU6qF2GcXYWigjEvsO8L0yJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9AMNoqzSGpHqtGBIWlhNPLd/fbccvZf1xwFkWkOXEpN0uhA9+N
	77hEtS37m8ENUVUsTqzDb3PK3RQzgc5AIjJPqrUtPSV9K2Cgq/pjWHJT8HAPIqoIAPo7MiH1QzB
	IN/1GKLHeh+18z0CzeAzjNpczyiYxVJYDjOBb8LfCSAEcH6JCkSPvZIQxjve+4EUAjbq0Z/bDO+
	1QgQ==
X-Gm-Gg: AZFdTZf614rPdxmMDF/srEpI2k4pD1QXuzuZdMVXIrQxbt2J8wp4rKCVNvJuaOmsM+K
	0lbaxqztbpf76DGpsQI3b+N7Ulp0wb+euVFpmRDPA5OpdOIP753u1nbDUn+5Kzy/ova1Y6Dzq0b
	0enrrNe8Y1aFnkJ9FX5GNDOqFv/xmqwCWEJaN0gydF920LVghNUmoFVxGyM/ASMSyQS/3PWgMNt
	p8+pGKZS26qdD7qMPanHUeruO28d7iyy5l6z3dEiDyoQHJW6/s9OagsSJji09/Sq1DELnXOdF04
	QTTTi5NM25Y9ODfvs9Dxm52jfJL4QbdFmaFC5gLUyURsUFtlHE2ThK0l14Tz9AD66FkiiXQudlt
	hIkXFhdVoQE/hthLCQNkVyvfeVCaw9qAvRQ9Ba5fykSfuoj50t1kz4S9HVZbAg28eIeNR7mIxDo
	rv2FuECBqIWEgZG/wK5FEDraLQSTt3
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr17189728eec.2.1795563331633;
        Tue, 24 Nov 2026 15:35:31 -0800 (PST)
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr17189686eec.2.1795563331043;
        Tue, 24 Nov 2026 15:35:31 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm50037336eec.28.2026.11.24.15.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:35:30 -0800 (PST)
Date: Tue, 24 Nov 2026 15:35:24 -0800
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
Subject: Re: [PATCH v17 04/34] firmware: arm_scmi: Add centralized detection
 of truncated replies
Message-ID: <20261124153524.000049d3@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-5-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-5-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX9TlkUMINlNuq
 z9NGxRnavhnxrRO2rP2ywC2v99LG81W1pcbrVbmKRogp7aUgA9W1FVnnhxk0oL6vkWKLwrtIaff
 NnRce2H8Dp6KVVCqpaQwHFEGGti17GA=
X-Proofpoint-ORIG-GUID: 1dJl2D7CeMa0y_GFsobAOQy2EIesLGI_
X-Proofpoint-GUID: 1dJl2D7CeMa0y_GFsobAOQy2EIesLGI_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX1xKbQVd67qHJ
 uwXHJvIoxaujJ9GOEjqnqPNOWml8DO8HK3ja5CPBP1elEWiUQtFb327ZYdvU7sy2OL4vpBFbtjJ
 WujsG5eOxH8O0NgjiF1ii7cqzISMpbAIQaHxdlYALixExZRvaSgeMV/DF2F/W/PRLrlEWIgXv09
 GMuO3kucllgcttwRMBr3mZpjQgAJMpls0Ap31YRToQqDRd+B0stC71zvphdliXqBe2MKzln6y1T
 fZrwxChp29lVsXK6QfCb1soj4Aj04p33HkZFY3MvljioLsvYkZvgewoei+MhIRpJB62jSawo1PS
 lywmA/ST3r4FMpbWxe+5ati2fbBu0M9MuJr6eDCgIOT8WRw+Sg9RaNPp7Nl1Jdxrvj9y/2BGOKb
 C8TemsfJp3K1iEFd1Zz0eUtLlWl9FvsP7ONIXs8jba1boWaF6LJcmLf8Gegb4ndog1xawF2sKcQ
 z80A+4pbwl1i1ACnNhQ==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b061f44 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=jPhv6GyDbwQFenseDfIA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_153533_210150_A13EE741 
X-CRM114-Status: GOOD (  37.52  )
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

On Tue, 24 Nov 2026 19:48:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> When an xfer is allocated with a very well known fixed reply size by
> providing a non-zero rx_size parameter to xfer_get_init(), it becomes
> possible to verify if the effectively received reply was truncated.
> 
> Add the logic to detect and report truncated replies.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
A suggestion to perhaps move this to a different layer.

I don't feel that strongly about it though, so whilst that is my preference
this is fine if not.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
> v16 --> v17
>  - use %zu
>  - consider expected_size when reset_rx_to_max
> ---
>  drivers/firmware/arm_scmi/driver.c    | 14 +++++++++++++-
>  drivers/firmware/arm_scmi/protocols.h |  8 ++++++++
>  drivers/firmware/arm_scmi/raw_mode.c  |  1 +
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 6dd249c08f5f..35adee6a7a15 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1356,6 +1356,16 @@ static int scmi_wait_for_reply(struct device *dev, const struct scmi_desc *desc,
>  		}
>  	}
>  
> +	/* Check for truncated messages..it will be logged by the caller */
> +	if (!ret && !xfer->hdr.status && xfer->expected_rx_len &&
> +	    xfer->expected_rx_len != xfer->rx.len) {
> +		dev_dbg(dev,
> +			"Truncated reply - HDR:%08X  expected:%zu  received:%zu\n",
> +			pack_scmi_header(&xfer->hdr), xfer->expected_rx_len,
> +			xfer->rx.len);
> +		xfer->hdr.status = SCMI_ERR_COMMS;
> +	}

The check is good but it's the only validation done in this function and
the naming doesn't suggest any validation would be done in here.

There are only two call chains to this, so maybe it makes more sense
to move it up to do_xfer() / scmi_xfer_raw_worker()?
Small amount of duplication but in a place I think feels a little more natural.


> +
>  	return ret;
>  }
>  
> @@ -1508,7 +1518,7 @@ static void reset_rx_to_maxsz(const struct scmi_protocol_handle *ph,
>  	const struct scmi_protocol_instance *pi = ph_to_pi(ph);
>  	struct scmi_info *info = handle_to_scmi_info(pi->handle);
>  
> -	xfer->rx.len = info->desc->max_msg_size;
> +	xfer->rx.len = xfer->expected_rx_len ?: info->desc->max_msg_size;
>  }
>  
>  /**
> @@ -1616,6 +1626,8 @@ static int xfer_get_init(const struct scmi_protocol_handle *ph,
>  
>  	xfer->tx.len = tx_size;
>  	xfer->rx.len = rx_size ? : info->desc->max_msg_size;
> +	/* When a specific rx_size was specified, check for truncation */
> +	xfer->expected_rx_len = rx_size ? : 0;
>  	xfer->hdr.type = MSG_TYPE_COMMAND;
>  	xfer->hdr.id = msg_id;
>  	xfer->hdr.poll_completion = false;
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index c15ec188291a..50b89c56e309 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -106,6 +106,13 @@ struct scmi_msg_hdr {
>   * @rx: Receive message, the buffer should be pre-allocated to store
>   *	message. If request-ACK protocol is used, we can reuse the same
>   *	buffer for the rx path as we use for the tx path.
> + * @expected_rx_len: The expected length of the payload in the reply, excluding
> + *		     the status field. When set to a non-zero value this is used
> + *		     to evaluate if a reply had been possibly truncated due to a
> + *		     misconfigured transport: it is only set to some meaningful
> + *		     non-zero value for replies having a very well known fixed
> + *		     size, definitely not for variable-sized xfers with an RX
> + *		     len initialized to max_msg_size.
>   * @done: command message transmit completion event
>   * @async_done: pointer to delayed response message received event completion,
>   *		or NULL when no delayed response is expected. Protected by
> @@ -139,6 +146,7 @@ struct scmi_xfer {
>  	struct scmi_msg_hdr hdr;
>  	struct scmi_msg tx;
>  	struct scmi_msg rx;
> +	size_t expected_rx_len;
>  	struct completion done;
>  	struct completion *async_done;
>  	bool pending;
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
> index 7e42dd6cc2af..45206edff446 100644
> --- a/drivers/firmware/arm_scmi/raw_mode.c
> +++ b/drivers/firmware/arm_scmi/raw_mode.c
> @@ -574,6 +574,7 @@ static int scmi_xfer_raw_get_init(struct scmi_raw_mode_info *raw, void *buf,
>  	xfer->hdr.status = SCMI_SUCCESS;
>  	xfer->tx.len = tx_size;
>  	xfer->rx.len = raw->desc->max_msg_size;
> +	xfer->expected_rx_len = 0;
>  	/* Clear the whole TX buffer */
>  	memset(xfer->tx.buf, 0x00, raw->desc->max_msg_size);
>  	if (xfer->tx.len)


