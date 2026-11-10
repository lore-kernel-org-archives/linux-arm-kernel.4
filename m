Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B573606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRgXLjj9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G2l9bb0x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=; b=LRgXLjj9esI6bL
	Rp5091WF/XnZ1RGmtFy0Wx+fgi3BmQApQhjjFtRUYXxyxgf9y+771tFHwZxQJEgFpr8p7Dk+g1MHT
	htwBafPLkCc+G4uSpoptAugoDl1OEEZSenyYb3RYja+MDWKgQRoi4+siDueZ3+yTzTkSrXooQclXG
	2e7mHQeQvMNdLniizl3AId7YkSLn+VtBgzKblAy4QER1neWTXjmKy3VdCxnzh0Cyr67k6E+zcBZHg
	b5/KZfneQQ3G24ryKQAGowQroea3FFe45iqV8PzECS8I4ZRaW8Da54Zpj9to77MJjf47Rto5zuEeK
	OrviWTLAF0xn/8s8eneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQucX-00000005BeX-0zzS;
	Tue, 10 Nov 2026 22:47:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQucU-00000005Bdy-1SKl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:47:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKMbe3714766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=; b=G312ZYHhWJ4RA8TO
	ubEW2+HPOqqU/suRUSiYvGRhEfntYedSdH5+UJsj8eLDQE6J05QChMWhdxfOFUdx
	t+DBWN2mcezGVO9FPgjtPClqb3K5tDg8yQGdbbIT1c/qX6jfVMbtV/JFJJzbbJhm
	5GYQ7pMJJXXJf4uEFkfeVFHvsawvDkuLAQp3h/52waU09fb6+8qSB16W+oLk5j3g
	m5TJ9Pd3przbuBfHtdmIU9bLqB+Wt4wWOEDNch6vxRzFEbwmTaoaBBi25HQ2OmGo
	54Vd955tycZQfSgarFEjIV72YP/cwlczbFZjRApG/qFJUbyjUK8g7Wgcok7c5yl9
	bTkPnw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4b84p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:47:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3420556eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350833; x=1794955633; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=G2l9bb0xLV9x/GN4nOaEFYUAFiTal8zBX1fYPF/X2BmVINlQqakSsp+RC7YnzEMGGd
         EL/3PKsVaajOo2jeQRUKMm5OVFNXDrlW9aJZSR60UcBJAm0cAt8j6PcNIjRolLlcdClI
         sgk6PYwK5vYzgp2OlsRnwlLKTNcj6+gEX9pa99Gbxzw6U0M70bqyoSaYgZFPEhHNfD6Y
         lwQiNJHwZtZaTPirFkiXOpMyPGcbZCmszHTuACbU2tbsCsyUMngjKZKzv7magHmovzUV
         svI6c63mFsNUtNpyS/d4pezbeLjxJN99O1Q4B/F4AfNs8CLTpckqf11LLmb2JsU77dW2
         AZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350833; x=1794955633;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=SfLsH8eqNzgoBhrX1P3zZTzqS1840KRYeQheVHsl/zW9faGRBVhs4TLnsJz+rSrZZ7
         LXnN0JQgwZthPbRx8c4EoCLaTJpAbRCU+/iBnRtyG7umVO5pjuyKMQgkNH4SroRJXLLI
         Nh8Aye37/eLEgzXzMCYK95WalyTKD8/bG3cpa9OgNlHrdtrnNBwSpy57oGMB3WjbrPNc
         Hrwazx5tTTbU7v/40eSYVduEYHtyJIKdgCchkisHDzYREiuimS/K0SW4Ys3cIfMikqaf
         cwSee1hF8YYVIjvf7eYzEJLHdv1wIvMJOAltDunORDt0yrD3N5f+WfzaC1qS/AyrLQxL
         GPDw==
X-Forwarded-Encrypted: i=1; AL+hErF2agm46LP7IaAhKqRlU9MVYb1/m7l+7yJ3fI8YtMmKhItofDKdPVg/kH6WbwzLiYnq4bziYYe8GzPaTv62YgEP@lists.infradead.org
X-Gm-Message-State: APuU4Z/cu/YRcn33vxJ5LZKAJJCc6fVXbcRXwNTxVjOCuRRpH+pMBmFW
	XF+eYdslrO2yxbJWorddxsizVVD7iIf2GzkYEHOIXXfM1WgutwAVKYTpvduyf9nopdjgrcQqQEx
	bmlefYFkFrp8hUMElDSSVpMd7wv1rDlUhHLPEJW7Xex+PsYmjxkSD9/nH4yQ5+fMpNmISx8R9Kt
	qgmcfUBWwejg==
X-Gm-Gg: AYBFou1RNEaF1LPkRbfIcuRuc+gKrFmYYWY2dnSEzB/Il5oh6ulOT4tRZEjKvot7QwS
	PopzSywUB8NtZXo7lQjC6x27HtGItu6nBPUH4h9ArgVZA5qjQCh5/kDRZUaQvpFvtOiqk1efDxr
	Rm1DI3SqVU8TtWY+48exBrMq1eH5Dlm5jJKkzHp3CHP5aG4yQGrAe30/jcMYbDnFxw+p0bYhMi7
	jnTsw7JRLaAT/R70xkIQiWzK3yYJHmWRSujoPeZDqClSbQeRkWKkYJZjd8M/i2lAV6fYf4lC25s
	suhhKzVq7JWzUNdJZHStLDBnf3fhHrFmHKfXvxeOB9C8pvTyqMhwGkNPR+NqY7dymWmdfLW124M
	rOCU9JwLHGRL+AgFpK5RapEYew9AmrL2e3BevPALwQSmMsUHnaoCl5Vt98FWaahgbsQHNmFgun3
	a3K60QkCX/KI4wv8c76O2K8CI9fCg=
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356765eec.32.1794350832629;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356702eec.32.1794350832037;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm9820360eec.5.2026.11.10.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:47:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:46:35 -0800
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
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261110144635.00005964@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-24-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX6Euofov1jh8Z
 R3jPAcCz/EuaMQi2WMPyIwUKdsvfs76eyFZcPuKNb1dOpb0JmwP5YqWV/Dw3772VeC7HbPjNoac
 ycH4IJdyG7up9Y8qUjsuyGFnOyKq4bQdSgrZXMNj26OFvF+FzFHP8W9HfoFLyKgR7gHF6FDUZ2L
 kFeY/HLauZT30ZRA2URHchJdRrQMB/Bj5aw36djbezNacE9vAGjrdWetawXgFOfb5/Vxdr0qMI5
 JzoUqUhagoy+m+fIasLyvs6Htl2Clx8WkrKFXe8JJinTOexRVaeKreEOlSy3R8DN4dd4DbMukCs
 ZUBUyye2ZJbXFIScsD+ErS0lwCuowe9KSnOqi+Oey6b9Xebbeqs6X2lXShvmt06X2lIyjOr58+v
 yOYvss3zS93jSkiFZR+IFq70yjb8+Lg92aP8UMsPkU7NATmGuLwG1GS/Fg6vh/qPDaGIBSfwNUh
 sU+s5iS9DU6EqJLTPzg==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af39ef1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=C8gR6w-PNCreNn7I4OwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX++WeAfjoH+dt
 tt7+PJsHQPWf2s9LbFAPeZOuQ6YBoqi+ShjepYfrKQwcMUJ/mI2Sw6RGBDT1PfhZVr9YMds/eTw
 y7CL9th9Z9uJgJVQuwkCskDyfyrY+kc=
X-Proofpoint-GUID: 1l4SP1vJw3SXDJVeY7ObSHzsS-C_J6Gv
X-Proofpoint-ORIG-GUID: 1l4SP1vJw3SXDJVeY7ObSHzsS-C_J6Gv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_144714_397049_792F5D9D 
X-CRM114-Status: GOOD (  24.99  )
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

On Mon,  9 Nov 2026 09:12:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a per-instance generation counter to track configuration changes which
> uses the common telemetry events framework.
Why?  What's the usecase for this?
Needs some more information or I'd leave it for now.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - do NOT reset generation on RESET
> v12 --> v13
>  - update generation counter on do_xfer succcess even if failing to process
>    response since the change hass been applied: this avoids state misalignment
> v11 -->v12
>  - reviewed generation counter update logic
> v6 --> v7
>  - use new Generic event mechanism based on EventFD instead of WaitQ
> v5 --> v6
>  - add relese semantic to the atomic set of the generation counter
>  - use new eventfd_ctx common event logic
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 46 ++++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |  6 ++--
>  2 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ba17204bbfc4..c21700bd1b43 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index af882c1e4ea4..585eb3a4684e 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

>  struct scmi_telemetry_de_sample {
> @@ -1003,7 +1005,7 @@ struct scmi_telemetry_de_sample {
>  };
>  
>  enum scmi_telemetry_event {
> -	SCMI_TLM_EVT_DUMMY,
> +	SCMI_TLM_EVT_GENERATION,
>  	SCMI_TLM_EVT_MAX,
>  };
>  
> @@ -1030,11 +1032,11 @@ enum scmi_telemetry_event {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> - * @reset: reset configuration and telemetry data.
>   * @event_subscribe: subscribe to the specified event @type using the provided
>   *		     @eventfd_ctx.
>   * @event_unsubscribe: unsubscribe to the specified event @type the previously
>   *		       registered @eventfd_ctx.
> + * @reset: reset configuration and telemetry data.

Unrelated change.  Belongs in previous patch.

>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)


