Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jdzXh/Oy;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNbkNY9Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqwiaIY+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=; b=jdzXh/Oyv1Er3S
	Wb24vWM4QE+0ptgfF/q4UkgsgR0YJfSTpDYgUaPrUGEy9tXyxhn9earpFZ10qXFbQtlFkuJZR09PZ
	NdqVASSya/TYLoJ3Rl4vwk57EuxN7MK8qRkX6g1CmmUzsrC7a0PvCRIq1k+1f+ps37ymyc4eZlR9Z
	gOyYyDtp7uMnH3hc0d9WeZ0y8L7T12ZaqPu1K+9SAsdaymrquUR1Qjk5BHhGf/CIUBMB619Tb1Cso
	TlhUhAOPGvvovENPiqJKoI1JooeuYZNf5SgM3wpFwt83mnckWTFhd5QPgUMBxgbg02gpk9O4ogL2b
	smYFWVFN65A0tGDZlsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzoW-0000000847u-3dbT;
	Tue, 24 Nov 2026 23:20:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzoU-0000000847K-1l7n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:20:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMatcE2558266
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=; b=iNbkNY9Q/L04JZ4G
	qETJC5rbd2pOWstVW0EwhXf5Ov0ejz4I4599gNgWU6w8oujtEEyhnQNYGp9qg95L
	dKgb2950z6WGts8R20qztvZ2B8Yvh9stSS2vuMx8mFmxCJwAOdVmrVz/WA+I7PgS
	fFhuyV54KA86XN+tSTVqexwp39o9V4FXtg3G8gNbZso1sepp7RCHPiDg7Z166KMQ
	OvbgNXxE6b6/5RAcz1eOeOKunNoexRixz5JXnStp1rYjcvclYN47h3pficNheSo0
	cCmQLYB/wrq0lvxhi+ctEUt6fN46bQ2oVrZFa386e0YZiIf4L7Fu1d1pn0+XE2NL
	a4S5qg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnghqfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:20:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b511ad8a2eso1330858c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795562437; x=1796167237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
        b=iqwiaIY+FVa+SteJrihwJ+2Kufe5nJDsfF0f0kxyTg7W6zOYbQYYZQ+RZZZnWoXlx0
         c+qUB1E/j3vzodB/ikaRcJEmKRFCJs514INbrDMzNcMmhDEn8XMQ+b+eW1Oo4OZ60Ywp
         9n9Ky1KK7BwQUHkcYCo9Gu5aZ3kNVxcT+7ioGLgX1pxlQ1C/VmZDdfF/KL9nNFu0fll7
         NNbubSindYgfeVK/8z1mec63WyY7OWk0MFCgRm7cFE/Gx7rEhsWn/i5QBp2ggn/gfYtx
         j74u9+CxNxUHKdYnywS6SckgUNnTfYW4OBb/IBFMLQhZ+rJIFJHfJGq7qaKJxSC3l6H4
         2xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562437; x=1796167237;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KO/odQMQ92hZWqJbAKzDNnQu530XOIkKjxzw7TZv+w=;
        b=jTdwroMg7axNjmtjgpfdSCKr2HQMY678OpUUYAauMrNBdmIFF+OkW3hxHYckagAbnF
         ljH/Hh3d397ZPZWH3kFJPiCbdJKpEnJVM0r7ELnyIw0PRQjF0sjbMcqWriNFtI2EwJvf
         vNzvIEdRV/nt1/sJkaSpAJvFQVFOnfy7KIDF3IMZmLPVte4C5UBZQ5Jk90LgQSZe1Mui
         3HNI5DIlZg+ScCrLsGt3G3ytFeQIHs9JNfAfEL5+/i6uWGvM+zh1EO9A3vxZCQzdp5Eg
         ko0tLrOigHZCuPRkX96+fd33NNsk2FteAFyFYlc3GerWWemgOhz/HypEPOvKP1n/qgcY
         lYRg==
X-Forwarded-Encrypted: i=1; AL+hErFH8MJ8vumOGNoIAc5vDvisBwUSvINgVrkrj9B5Wonus0U8UxKuqeYDORv+ZuTrX1UTsUf1qVEpGw9/jkTOT4oi@lists.infradead.org
X-Gm-Message-State: APuU4Z/YZGyjmLGFxMzcESDdvoTL+XzKef9dMfqAFYYSXgI+gKO9PDZp
	8i8R/tpaSEuKbT07FixELszuid5UXeAEkd3+sHiMZA+cc+uqqROUvnJvEj9RtjnD16qN6yPF3zr
	hPJiLl0zQPsKp819y2Ok0T4f/48tNv4jhUFo1v+EQJpVcdtMeGXl3G6qmPaJQzoI5MFb1ow7Nmi
	8xDg==
X-Gm-Gg: AZFdTZdZhIK3CvmZQz2jQ+oPhbTMhg8hyCh+X6KxcP2wp+C8nG5mzgEa1iKyIC+n0Xu
	vmoGZrbUKuqB+7ItGPjPYNPrexb+QYB0U+ewsysam2yUD8eXh0InDDKkq/x9I4c0g3VYPSy3aJm
	pgMjjh6bco/G/03AHXONdTrishdQ2mOWN87Hx7T/NoisbwR89C6QbLSznMSN4HPNTsBAMSz0B0u
	m9h37I34tpRWDCnJNQ+g7TF+n7h3wQZeY77LvuJtkEAzg/Pln7Lp9O1Hw6eqSSApr2F2d5pQOCd
	ZOpD8Z07rxr1D3Y8IIXLPqbUJLIxL0DYLljXqkq0aW8Ts6TUDTRA+sNbse63xhKZMoubkerD/yX
	oq5f0+BkwGK+AAP5nER7MSwwOX1Y+UwXXC3LSh78/5vGNlXBeyTuOYmvkgoarGXGnRA00QRSvfl
	0MwUkBQ9/9pMTpKLuEwZkrpel5l7j7
X-Received: by 2002:a05:7022:5f19:b0:1b5:51b4:85aa with SMTP id a92af1059eb24-1b5524b5a93mr14548249c88.12.1795562436808;
        Tue, 24 Nov 2026 15:20:36 -0800 (PST)
X-Received: by 2002:a05:7022:5f19:b0:1b5:51b4:85aa with SMTP id a92af1059eb24-1b5524b5a93mr14548210c88.12.1795562436093;
        Tue, 24 Nov 2026 15:20:36 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm55096295c88.14.2026.11.24.15.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:20:35 -0800 (PST)
Date: Tue, 24 Nov 2026 15:20:30 -0800
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
Subject: Re: [PATCH v17 03/34] firmware: arm_scmi: Make Clock attributes
 size deterministic
Message-ID: <20261124152030.0000438d@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-4-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX13v5Ozduehs5
 giqNDasWZAzbRglCiWFY+oLbUtVf+AVw0S+8ch2nh+5pcR2EHzrfK4NbeTheoKJr9Ybgb9V0G4t
 Cbajb8zHCdUM4SQQOJ6BIOI2poc2q6E=
X-Proofpoint-ORIG-GUID: ZsaYAF5a_0UFfS6U_YPB8dGA2ezjXG1O
X-Proofpoint-GUID: ZsaYAF5a_0UFfS6U_YPB8dGA2ezjXG1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MiBTYWx0ZWRfX9obgmgFQ2J0Q
 LPdc4IrHO/+XI6sNT1cxY7HTbv1OLFGvBnIB6AV+Osw6dzFA0KaeCacOUlIlyuYWFm8ipggY1GQ
 OYoVMcG8kBc64OVpvGS2j4GmGgSDtwjt5AOmKyU+m4B4nzzD7aA9H4JH9B61CqxjeJjnnNSQYGL
 Z2h9geWaosP+WSDJCAZ7kE5b1f79N22BIJnZXOssmB7zOqf6yLuIPNatn0ywMsqd3uzm7pZp5vf
 u657N3qGY+IUk3GwUKUBJZj0XoXZSAEAteXD4S4Ud4OW89jNBOyoiRSPJ1grNAUBmKRDyLVzFib
 UL6Oq751uiYa7MJT6OY63hUgCorQ/WqsVY8whCFF2gqiscdwCD1kVCaux02rnxidCUd1L5p6Peb
 pNzVRkTvAFkwVJyYuKpSYtZp95v/cvj3ZmnYifdciml4n/KaLF8PU5QoZyYsI+ZJWXdUoyOznt0
 FJu3kCKPuHko0gabWdA==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b061bc5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=jNwuLTo9DzxMKENvP54A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_152038_493836_0AD4F1B4 
X-CRM114-Status: GOOD (  22.61  )
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

On Tue, 24 Nov 2026 19:48:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Clock protocol CLOCK_ATTRIBUTES command varied in its reply payload
> size together with the specification evolution.
> 
> Between Clock version 0x10000 and 0x20000 one trailing field was added.
> The current implementation used the maximum possible payload size across
> any protocol version as the rx_size paramenter passed to xfer_get_init:
> such solution works fine but inhibits any possible centralized check on
> the size of the received reply.
> 
> Size the requested reply strictly according to the expected protocol
> version.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

You could use offsetof() so it doesn't matter if yet more fields
turn up later. In practice though you'll then have 3 options so this
code will change anyway, so meh. This is fine.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Being lazy I didn't check old specs :)



> ---
>  drivers/firmware/arm_scmi/clock.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
> index 6b5d50b35a48..ed93970c3b87 100644
> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c
> @@ -362,10 +362,14 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
>  	u32 attributes;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_clock_attributes *attr;
> +	size_t rx_size = sizeof(*attr);
>  	struct scmi_clock_info *clk = CLOCK_INFO(cinfo, clk_id);
>  
> +	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
> +		rx_size -= sizeof(attr->clock_enable_latency);
> +
>  	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> -				      sizeof(clk_id), sizeof(*attr), &t);
> +				      sizeof(clk_id), rx_size, &t);
>  	if (ret)
>  		return ret;
>  
> @@ -1002,12 +1006,16 @@ scmi_clock_config_get(const struct scmi_protocol_handle *ph, u32 clk_id,
>  	int ret;
>  	struct scmi_xfer *t;
>  	struct scmi_msg_resp_clock_attributes *resp;
> +	size_t rx_size = sizeof(*resp);
>  
>  	if (!enabled)
>  		return -EINVAL;
>  
> +	if (PROTOCOL_REV_MAJOR(ph->version) < 0x2)
> +		rx_size -= sizeof(resp->clock_enable_latency);
> +
>  	ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
> -				      sizeof(clk_id), sizeof(*resp), &t);
> +				      sizeof(clk_id), rx_size, &t);
>  	if (ret)
>  		return ret;
>  


