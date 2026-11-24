Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5070606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZjpryDpr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TzX/Y9Tk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B7G1sAjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=; b=ZjpryDprSDHzdO
	Bkjae8Vz8IV+Tc+lmc1aGUWR0uGLELwZY6D88XppS1tawS5tMluMypFv0h093L3QUnMgkNd7bwwcE
	Gn3a+pXtiWBYJOfimLBTIM3tEf40ujcAjNZBZYoXeyZlNFbWASSSQ6rgAGsoU9otwQOrMkRsjC/vk
	FLInHR4DtGEjp4qR2faqIHv0v6bX1OMuCVyQNuDnj1/fmg7s2FxdvnCxTpvRXJoqYHogLZhh1C8ek
	KgYKtY5xjQ3w0qYipVr9yrBEtW2bBRrQShT7vPM8evrklkrRPP9mVrm2uFOuxrIvkiEowO30R78PJ
	50c2i0vHbf0Jwkq+vPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzLH-0000000825H-0z2f;
	Tue, 24 Nov 2026 22:50:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzLD-0000000823u-1AuY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:50:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaYMX2830178
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=; b=TzX/Y9TkWw/uOJkZ
	b1ybUzAde1TA/HmSrnOU6olDuykfTgNFMJiO7/qL4o016GK1BGTw/IU0ltsNc65R
	DgTHZyAlgwgi3MtQJWTNwP4KpoNDnM453LIEqGEhBPRJHz3LPqAm8kqinHd8zoF5
	v/TSAMmlGr/KeJ1RkfFKiVp/UCNGR6z1xmNZ9EPEdhjmuXFy5y7Sg/28Zssldfse
	t13corOqh/ulmWOjQw74JeCk54fByFIpIksno+MoppOs3FORAm7jMFy5TT5W15FO
	LKj/4wvo6kgSPTem/8JUElunF26eVv60y4WGdW2lE5HZhxfLc3eYdkyf/jaXKpS3
	PqW6VA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9vrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:50:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5575031eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560622; x=1796165422; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
        b=B7G1sAjJX2B5frzF6q3M6UXbnKURsSzx8Bd9ZwuYiVyOiNleH2Kr2NhThjuUCvGnEB
         SW88SI5bJMdWhAiYtMY5wHH94pTQKUYiL9wMKtiu19t4zo2uetEMx35HZLr3tueFVEUr
         1bI7//gQM2gYbs2wJ3LJmGcy0VTfiR0T65otWqEdfgdB2IbocmC3LhrRImb4oB+hI+Vc
         dsOVRwBLjIItBlFpl7cW50xwE6B0YR4krb2VsH4wGWvP8JDEAVNdomT/ffQNKFdOf9zO
         48puzKvA7QRwfjvlLP26bnylif6MtBLqhhUAeCuKLkdjFLvJtGdO2rd7WYj1LSr/9TKr
         if9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560622; x=1796165422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e93XYvnnmR69yyrZgHmrvJK6riMd1HvvXUQLB/b+Wmo=;
        b=t2I617+1p1fhqRIDyKycrPRxMrwfYOew9/m5WxYcYc3WGJaIJocDxxdP2xesVfLT8R
         NmeMAN9Jl7zjizEO9dkbumJhKgCwY9STxJyayuvLDXCvNY+U4+4sfTx9QVHjDFdOgGvF
         56UW4y5Tx/U8No9H0WMhbxWVfyoh4dlw/DQcN3QDpJotYhvaUzPH0in4Me2d3bghQtAk
         FeAaRfNyP6Aza+IL1MaULLy3mY5FsCftfEE8VtA1VF4W1SQnTSj5UHMsuD9acrJ2Lkh2
         Nna6K4LuBC50Jop8YPxI6b6JlGbQ7f14GXUGfcGlX9knDam18xj7CPe+0rFrlOGSWMDI
         0ECw==
X-Forwarded-Encrypted: i=1; AL+hErEZ4kmYgXX1hb55wpFZFjKONVqUCNCV8eDvdlpTQJdW6psmprRYTfeuhAAeuej5UR0o1YbBw0NzX2NNFHbSEa+5@lists.infradead.org
X-Gm-Message-State: APuU4Z9XPenSUoQlQLewGVG8PFb3niX8YCZsA1owbK3MOHJWHyEsf5/R
	EglFD5y+gquUyZNkt/8ToXLAbE1E02UukLhyhpIVch/1/43gw7knoId9sMGOHylAVFUuxfoQqsr
	q/EhyKsv+FwdvonWwLjirf2jhohnIiSKQhLF9CXFBbjUc5X55eH/yVkPqIhcGIxGfo/+hUZRYLY
	oynQ==
X-Gm-Gg: AZFdTZc7ewZf96Yn6NvxJuqkHOGWmmNGw0AwR15nUVNR2gUK54PX2fIcdRJx2WdPP7J
	u6kQhBhcA2XKCOYjjB7l+FSEFo/1zkh7Dk5QiQi8H5+ie5jMBKgtVLvU4UaY8zOzXL2fw2+VjVK
	Pm//UAGc46CUiMEvHF6IMiPFst6m8KCANLeoJGusluknjUq1O8BunV3TnxVQ6Pn1XQdMIYjeLuw
	gXjCVvrfgL71Xf+nYcn1dJfHKwdrlTyVD3cXutDClEXLuJ+wiTQeSYLTnzOFbGzMBCjs31vL8Iu
	8xVTDfIyUVbUuCUrnYISu2MNLsNyoyXRE/n3blRdy+/AnEJ7Bocr1RSq4mZNGHmL4NoIWzIxdK3
	9pEMmCIdd54erB2zLZJrn9mIKG9wgUqTuf0GvBygJSjo4cb9OISnPFmWTGYU0CzKjN0ntIn+RQB
	cZO3YZKCkw4MZ+F+cb5iitSec2rpY=
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr11462728eec.0.1795560621940;
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr11462702eec.0.1795560621322;
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57035445eec.10.2026.11.24.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:50:21 -0800 (PST)
Date: Tue, 24 Nov 2026 14:50:15 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
        philip.radford@arm.com
Subject: Re: [PATCH 2/2] firmware: arm_scmi: Refactor protocol allocation
Message-ID: <20261124145015.0000358e@oss.qualcomm.com>
In-Reply-To: <20261124185111.1022322-3-cristian.marussi@arm.com>
References: <20261124185111.1022322-1-cristian.marussi@arm.com>
	<20261124185111.1022322-3-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfX1zzOi/aNkFEb
 Leu0WR0/KkqDuGeZ9D0keJ6fD9qglHEL0xvj+yH/AxeFnP7VcsJ5hWVXP8GD6V1S1iUewo8FUF7
 f1TiSKr19ymZH65KkNth+0qX/CdweEBg0+Ppr+aQcGv5SqFfhocAf7pPENwO0v5S6/+SVXzfXr4
 PuHI5WT1h7K5CjOOCYYFo9X0PmbSu9wGfhP8Eq60mDIHNfTcgELe6U8/ZINIp1eXqvd9E5xrOZN
 1K5T9iJ0xYgi5EBdAXxlONqp1kd4DDfbMEJHALjWTZy40SpYdhaK9QhMqT5zUxFIRIDogWnc1lE
 tsy9xs87QSW2/qppeM3h4rIlF3NnOhXT6TVrpe8znmt4B4bsMgmrBlhW/QATCHQVVKejs8riG3d
 eRHBkAdaNX/tHVVhzsVzS1WTIjlFRNgI7LBlg2cXez7s9dkrXr6TI1p6v3oxFoHZAWPyyr+rhPl
 wR3zz+013EVdqiVxdgQ==
X-Proofpoint-GUID: uDQXBjlpUpexmN5r27wVvS3eugn6WQ_g
X-Proofpoint-ORIG-GUID: uDQXBjlpUpexmN5r27wVvS3eugn6WQ_g
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b0614ae cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=dr6W7SPZJ_YoKJA_jgUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4OSBTYWx0ZWRfXxg9h/kCIv1Q+
 qwwXFX2f0WKceLtUcctlyErNGRfaRk5F/6gJx0rDOG5jl+R+Ji8u9+1p3+3tCsTT3j68NKCCSJu
 GMrzkS7aKRPFGTB81EXQe4q3445cLJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_145023_334043_3DBE8181 
X-CRM114-Status: GOOD (  27.19  )
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

On Tue, 24 Nov 2026 18:51:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Simplify protocol initialization and finalization using cleanup handlers.
> Relocate the protocol put operations out of the setup and cleanup code so
> as to be executed strictly after the protocol devres groups have been
> fully released.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Lol. I should have read on! Nice that you have found the time to look at this.

> ---
>  drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++-----------------
>  1 file changed, 22 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 2c4424aa0d37..199f0a189432 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2256,24 +2256,21 @@ static void scmi_protocol_version_initialize(struct device *dev,
>   *
>   * Context: Assumes to be called with @protocols_mtx already acquired.
>   * Return: A reference to a freshly allocated and initialized protocol instance
> - *	   or ERR_PTR on failure. On failure the @proto reference is at first
> - *	   put using @scmi_protocol_put() before releasing all the devres group.
> + *	   or ERR_PTR on failure.
>   */
>  static struct scmi_protocol_instance *
>  scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  				  const struct scmi_protocol *proto)
>  {
> +	const struct scmi_handle *handle = &info->handle;
> +	struct scmi_protocol_instance *pi;
>  	int ret = -ENOMEM;
>  	void *gid;
> -	struct scmi_protocol_instance *pi;
> -	const struct scmi_handle *handle = &info->handle;
>  
>  	/* Protocol specific devres group */
>  	gid = devres_open_group(handle->dev, NULL, GFP_KERNEL);
> -	if (!gid) {
> -		scmi_protocol_put(proto);
> -		goto out;
> -	}
> +	if (!gid)
> +		return ERR_PTR(ret);
>  
>  	pi = devm_kzalloc_obj(handle->dev, *pi);
>  	if (!pi)
> @@ -2328,10 +2325,7 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
>  	if (pi->proto->instance_deinit)
>  		pi->proto->instance_deinit(&pi->ph);
>  clean:
> -	/* Take care to put the protocol module's owner before releasing all */
> -	scmi_protocol_put(proto);
>  	devres_release_group(handle->dev, gid);
> -out:
>  	return ERR_PTR(ret);
>  }
Better though the devres group approach works best in my view when it's a wrapper
around a helper.

	gid = dev_res_open_group(handle->dev, NULL, GFP_KERNEL);
	pi = __scmi_alloc_init_protocol_instance();
	if (IS_ERR(pi)) {
		devres_release_group(handle->dev, gid);	
		return pi;
	}

	devres_close_group(handlde->dev, gid);
	return pi;

Though here you'd have more or less a wrapper surrounding a wrapper, so fine to
just push this up into scmi_alloc_init_protocol_instance()

Anyhow even if you leave like you have it this is a great improvement.
Lifetimes in these calls are now a little less complex to reason about.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

