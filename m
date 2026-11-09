Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zbMT7mvt;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1VcI6mF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bQyR+Aq5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=; b=zbMT7mvt6bLAEj
	If1uTRDxTG4OHm5aXMzvwJj+57bdBwVBKIu64kvmVwtfd25qTiYRSZ9i/XW8VwrYuMRc7gR9t2mFJ
	C5X91k3JPx6u7RPk3DDOQcRD6XD+M03+9VF5yiDpge4f8zcB1QHBbjC5BzwkiPoXUDR3mRXXQS7kC
	h91yxBnvxwl8xMIABJ5GSNfn7T/bIQ7iu+p0L3XF6WY5YMPE4t6LQuW5P8mKzbSOvP/tBL2qIKlMh
	j6L9OkNlWwlcBrLe8i3eici5y3sdkde65sT2jw8Bj28NgdmcNzZXV/IDqEjao2/ehMr6ZXMED00NY
	W/9a/xhKnSCotS7RpMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXMj-00000001pDt-43sz;
	Mon, 09 Nov 2026 21:57:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXMh-00000001pDR-4AqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:57:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAINT2376842
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 21:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=; b=e1VcI6mF4e8vaywo
	BP2JNRCIqHssN0C8xO6Zctry3jEKmvteqTjRhEneMmvzz90PUDh0+aSacce9EAYb
	SBGo+9EwmJ8YIEDQGxJ3CE1I4ob3yG3mlEbFtk0ViV7XnQF4VHVoHxbK5t902JfG
	CZLg6z3J9gD3zgrCNMw5RQCM3rrHuyONQDtVSbxmfsSjBvoJZu3wi7H23A/8iiTr
	36EiWJ7SEqEcIJ3zXD2H/J2HIj84nVWDfhJoe/+7KxczykChI0kU176cMMYJMdNj
	kXFBVWZj4l0DCSZ7sxIthy9ceHbhEETDizISpnPuCTfZ6I3AHjKOcpQ9QwDIEtd1
	dV5NaA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qt2h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:57:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so2153819eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 13:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261443; x=1794866243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=bQyR+Aq5duDsq0Nc55Z19T87/3n3WVtYgoE5raQn5N6YxJ389wbPazlA7jermMMbcI
         b/umVTJhEhnRxyQcP2omasqundnoihtzPnbokfJjJziEoRvc6vrl+p7QGBS0z1Zz9oG6
         +GwxIBx8aJ++JWeD3QYQgtePyDIxRoY5eWkAAIcYGgIvN886LF7K4VKwCSRJaviokJod
         VENUyMksRZi1+78nSQnf2k81rMIAPgV0RrxjDVMqdAIbWkSZhzLHwoshkkZiN5CLsn/C
         TYn3Z98sX7t0dreoJkEIHQPvkUpia6SVKkhMavhZ3UCLGArFwf+eUUTsxRGrEROWKnvj
         OB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261443; x=1794866243;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7DxPMnLAGx59NG4Xr4LnCuXJDUvyj4OcVD3Rep5gdc=;
        b=Yf8TiYFoL39txncqM69r8GngPOuzFBfbIWB4NVxyd6SgDs3kPVjLumTNqOwJNnOAZs
         p+yCfY8p8CcCdk4n6SQXYgggaQ4BBOwvE5pnX8mr1zfSmAH5KZV/p5RXIAzaos1PhK23
         Clkqk4TmgqgWNvoMdg+BbNUmgOKLOo740tuMSmU9chuDdyEd+D+NoW2jxtLZ0kyodVgV
         bQFlmxmqmZRgT/GmxQu/BWqUP1EjFOBVmU2lfCIeELYnfuP3i+KR4dWKj1J5e66z/aRs
         TWjmbIXkvNEusHivnlmZEHKrt+Z78vY0Xs3VVTlhWfTVBqsC7MFOox9wosdOnWb1WkeX
         BOow==
X-Forwarded-Encrypted: i=1; AL+hErGGu0k0YkLo2jfq27yt9VArrFUoyR+geISwjSK26emOdBT218+n3T9ntxMF2FqNnoSxR5hpWK/tN0VgHA9jboL+@lists.infradead.org
X-Gm-Message-State: APuU4Z8WhzjsykZL7Az5CEwCpB/lfa1rpS0Io/ypOSQQntQOBbPQ5OPB
	rvERgJa1wfrX3N3uU32TzgAQAQ+pXE3GXvBse2oZRx/1hoLE+7lC29uy/GP+3NjHhUisOivhftr
	FCEtnLvGvDfB7gGs3fuZzEPcXjjwHlHh8uvUb3HU0gd24HvG596M7Zu1frXGKSXJZoMqyJr5T30
	ae4Q==
X-Gm-Gg: AYBFou1LYwarILZHuk9TzDld/Rj9bi120YL7uKV/fY/wB+qUOHWDChceevqucLwACVD
	vtfUA3hgxYfYnKsGPnR/PaRAYhX0HIc1vmsrYuw/FXwWXDWG8ZW1XX/jQgDKS2dEYPn1GJFkU6j
	L/mtNNdDiP717SnJQIi4hS/F/85MmFq4/yK3R1n1KqjdEN2hkCzTLILnN7iCh8FgdRUG0EqpHy5
	YCiXoVxY3XzX42bBYmMjEGvmaRBlBgPwIbHN1ydOYv9NP4YlOUWFnBjF3fLakTvzFEMzVF9y/9J
	HK1Ii2lxPwFk0Pm5cL9KU8ZUT2T6A5dzvJiOmnopM7l3ezRJSxEPQDsunB05C9hNAzF+b9xzYeD
	FlNoKG830tZflUNI18qe54ukb8adrKf+VTxXWlGa49iIk4+0Mi4jaEE+QfxSJS9ovDWfKaCID8V
	82qu8YkObBkK7zIlBnYnU02mGknUg=
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817957c88.14.1794261442588;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b3b6037813mr817919c88.14.1794261442019;
        Mon, 09 Nov 2026 13:57:22 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm2048895eec.23.2026.11.09.13.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:57:21 -0800 (PST)
Date: Mon, 9 Nov 2026 13:57:13 -0800
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
Subject: Re: [PATCH v15 01/35] firmware: arm_scmi: Harden iterators state
 parsing
Message-ID: <20261109135713.000049d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-2-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-2-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX6yC2KBaoKCtN
 ZEffO245YXxBuvHSL5QITsHPZS8mRfvLYaFJuZd2ePql8bmx45F5YoE47e+AmKaI9o4tQ8meVai
 +kcJA8EihICvfGJuJUZGAdSurilRA4qjoDTAjgZbg16FOMP7SPSAzQfIqKCHGwqifRwYKZpb5pv
 CbctDivlZiql69mh3crc724iM0r1KG4xbJy67aySp1GC8JsG5F3ElL2sgOI92xEeEGkv1dedSUg
 n0ELdNNRcWP5DRHLIuRg+f1lBobOS1/lkDPm7oXcjhrwVtJ9BIo8liLtvZeQ9aVcBHcbrClP2Gn
 0Q9IeCoDQFAUmpah/IVe6KfEprb3VS61ZgAukwyjVVkvCu44/TMSct9+SkDx5kb9OlmLoeh8oAH
 uzZ3FQlkdWwKJzw8xtaLxxiYsSc5inhTt000XqMXv6pCaNGW8xdlu3QA1lDEnVzXV/DIZwudxCJ
 H7oYsEHZqx82B5tUI3A==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af241c3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=TxbN916H7FYpum8SNwIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: CBh3wRTh4WLaGOS33JS_nuUgq32tzPGs
X-Proofpoint-ORIG-GUID: CBh3wRTh4WLaGOS33JS_nuUgq32tzPGs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfXxzht0PfJsmzh
 R5jMaGZwmIiRxF7k3FHi93tzM4tMa8M9H/xPqZTGowonqAWLeu88YLOYuz0MlKdkm6xm/hCSeos
 JiHok+hZ/RFFyvBZxnaHW7Qm8JjlZYY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_135724_042077_57218350 
X-CRM114-Status: GOOD (  21.08  )
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

On Mon,  9 Nov 2026 09:11:47 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add checks in the core multi-part iterators support to detect generally
> malformed and incosistent multi-part replies.

Spell check patch descriptions.  inconsistent.

Otherwise seems fine but I'm too lazy to check all existing protocols for
that minimum size!

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  drivers/firmware/arm_scmi/driver.c    | 10 ++++++++++
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 05092301db29..55d9cc487916 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -1873,11 +1873,21 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
>  		if (ret)
>  			return ret;
>  
> +		if (i->t->rx.len < SCMI_MULTIPART_REPLY_MIN_SZ) {
> +			dev_err(ph->dev, "Invalid multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		st->rx_len = i->t->rx.len;
>  		ret = iops->update_state(st, i->resp, i->priv);
>  		if (ret)
>  			return ret;
>  
> +		if (!st->num_returned && st->num_remaining) {
> +			dev_err(ph->dev, "Inconsistent multi-part reply.\n");
> +			return -EINVAL;
> +		}
> +
>  		if (st->num_returned > st->max_resources - st->desc_index) {
>  			dev_err(ph->dev,
>  				"No. of resources can't exceed %d\n",
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index 8583159059e6..b295006ef1fd 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -33,6 +33,12 @@
>  
>  #define MSG_SUPPORTS_FASTCHANNEL(x)	((x) & BIT(0))
>  
> +/*
> + * Common minimum size currently required by all the existing standard and
> + * vendor protocols.
> + */
> +#define SCMI_MULTIPART_REPLY_MIN_SZ	(sizeof(u32))
> +
>  enum scmi_common_cmd {
>  	PROTOCOL_VERSION = 0x0,
>  	PROTOCOL_ATTRIBUTES = 0x1,


