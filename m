Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NVo3WHRU;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Qn7Uey;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPjW8+HQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=; b=NVo3WHRUUsR03W
	v7RklGRaXf7fbW1mHBL0I5feL6FASeZ8r+WUBtVgRo8p8J02yoiY8X/C96qvaXhxLX+iPtbe4fYD4
	POAFepUHVWu/v1PqV4VQ2+7CzFkhOgl/yKjrhYLfG5ASMUi/1aml3lxPesfP9ZRFBGkcqRDSausbO
	pOfhTVMrHDs+Wve9DEyJaY3tf87XJgTh4OEahIiobfQFsKiXVjeAo4Q4vAogfH/pf6QpBMDXQ1gmD
	4Dtd8oK1dxKaNJT8kaEQmiUPwnLBhurIEHVlZoyYUP5ulx6grXt+lmFPG7/JZPMuRtUZHmhiAEERr
	/xoJ2bqOgHuGTEMqer3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQujp-00000005CWG-0NaL;
	Tue, 10 Nov 2026 22:54:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQujm-00000005CVu-0Kog
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:54:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKPAY443545
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=; b=E+Qn7UeymNps67d5
	wrvFa7hBA91ezSgAP2Nj1NnYtcT0IIJBDCANmprLkW0s+C9UUyAivV/UM5EHTJKx
	raR4xn46utCvdckjtofqC/oGelTlmcFImAnqpr1Jbop3njDt/xgeGVTamzdN2TPG
	3FhHoZPSrRELKajEZ2IWF0X9N3DI4P8k+i7WHCuLatQgVv3jJtAEKcAXe3xwrCFl
	DZHcz+CUF8A/ddXTDcul0jZcdmk/mkOSVwWfJt9R5U1SBBF49J/RqfnYHRsmF93l
	e4TZ0MeWzzEE/SlQ6qf40ZQRru3/kL9KCBjMIim/Ib0eT1MXOIm+HFjqkMtFEIoA
	rN8qRg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufu8dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:54:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so3537984eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351285; x=1794956085; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
        b=FPjW8+HQ7c3V/ER4adT1Dgb3y7glfgZhpCDVr49409ziaJXag1Vx0e7ZWvc6FqRpIV
         ITiKc6CabbNnhQlu0XAkPXaPJw0JiU64fGzcNNfQjt6M6Ll3Y2N29KyC++fdkQzbuQcy
         2qrUcW0aKhk/fQR2p6G1RYdf7DEe2r5JwN+xBNCgJ2BtUKzzeKJg6hx/kTLhz1eOU3Ur
         yS1vc/AEAx8e135Mm5MF9HLpU2jbd6uBPs4KzpBr/n/REBTuYiC6nql7gZ1hM/bEmdwf
         AuxKPBicty6WHBr9UpKhmkxJO/9WdWa/4Ppj6xxrPd31GT1tsqkyqK5br+JHGG3qy1Y/
         XsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351285; x=1794956085;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXuGtK5krbBCur3qg+VgvLf8G+IVJJVcv2zNy5XnaUs=;
        b=CwIznTiFCigLklsObe9hYEIwQim+tQL2721lEDefp6BtZApZ/JmpwV0iGyCm8zGv1K
         FX9ox9NoWLuA0rf6SPpVrEKzKX3kH+aaSdwf8CrUaLCp9uVL47yKfPM2L0l1UsdGGckm
         xu97qDruGqRa7YgK2mHX8vEBSkgKALSr+YjjeQqzJpwoZxc+PzMuVh59HxmDtKaevLlu
         tAiXJI9BghB0P3fzoFLuQbM/Yk6s0HeQfVUgqsbxfAPpntvP7Cftq7q/On3XPr0sYlIh
         s6pDyUjPYgZ4a8eBXBrWQWrY6G+JeFcXUkroAYXNkhzI5BZOCRO2M9xtt68QwTQQ7Ydf
         HXSg==
X-Forwarded-Encrypted: i=1; AL+hErENRPjge8tcFOn6+H+L8aVEOPbFKoBwOvgF3xqNnAxwz3pcdekcekeiBQjQdx1y/+VPDLxPoSiU3e5Jtb8O0em7@lists.infradead.org
X-Gm-Message-State: APuU4Z8QvY9exsn6X50mDjdOSGW/jFJCJSX3p9xvJmpkNLx+C0tR/YJA
	oAe5MgkLA4hc2tUZt/VZoaf54MIHDMk+s+vyFjENsMG4+diARP/xGGUcih/jjBWeZ7LLOMElL7S
	vGSYxFfuW9g9ls+50xQfY+kgr50GTYcotE+EuDsrx3C5r4lB+0IuG45GCGYBJBH2CBy42rzT41d
	3nLA==
X-Gm-Gg: AYBFou3wNb0mQVb3DbiZv+t5ly3jhjCxIVRiA0vqW0RCEF9FGf2rzd6qCPUdpTTGl+9
	/5UMEj2MTETZdv3IKrYMmZEKHYhXgvRGk064ukw4UzwacgtdkxLBjcwjjHoXDDJiM0Iypvq8AFq
	URt5dWcnSghGBas9ZTbLvwQ20v9Ze/g2WpjTluYcFnxnGm3LWcjMFjsCcQ4rUQhPryp0SvUMDya
	d1FOnUp2GA4r5iXCmHScW7VXG2PcA75twfyQ3wFrULXmMHE9IC9ZrcJ/7W61UFtqs1/UyAPhpVS
	jkUu8b4dFMYhNaGCB8QJ0cdla8ERgdEB5QKBy2f4SKQPm+JNhgY8GiwndzU/M9sTsriZzOqHFpi
	OBd71lweG5LEVY5m7svBzWrDmkMy08whv3BUFPLeH6MP7NwySCsGPQaItwN26E3kskCMcmVRWTr
	O+eG5RklcU/t+nigtA/sGKkGieyAg=
X-Received: by 2002:a05:7300:51c3:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37683b487admr1199212eec.4.1794351284572;
        Tue, 10 Nov 2026 14:54:44 -0800 (PST)
X-Received: by 2002:a05:7300:51c3:b0:351:207d:bff4 with SMTP id 5a478bee46e88-37683b487admr1199160eec.4.1794351283882;
        Tue, 10 Nov 2026 14:54:43 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe07dsm10131788eec.20.2026.11.10.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:54:43 -0800 (PST)
Date: Tue, 10 Nov 2026 14:54:21 -0800
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
Subject: Re: [PATCH v15 25/35] firmware: arm_scmi: Add Telemetry debugfs
 SHMTI dump support
Message-ID: <20261110145421.00002a62@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-26-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-26-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6P9HLtLRQJ3eM6dgFjmHv0VBK3J4AZD-
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af3a0b5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=CKzkSn0JwAB8-U6WE24A:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 6P9HLtLRQJ3eM6dgFjmHv0VBK3J4AZD-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX14nVHba+nYww
 9RJ8uZjfV4NQOODjZbBOBNHqBojBr8IFsuuXhs+0GPko9aIf+hpgDlDKW43gbIlcV4uAKnfoGJU
 s2zh/9GYoVPlnaRYvLYF0K4u6qr7dCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX4k0y6Z6tUUwH
 Q66xJUjrMyaJTXp54rYC7rkGIVNr1T/qeHSZBe9eWmJ8szKnbzJUYrb+PyzpZDwJVyYPHVZvPyz
 GzIpHzkcagkJDQerfnqnbM6bjDHjHcRZbQet030Yr3wFAbt0x0+WAxjceUD3HGhKMJUXi+yqZCh
 wQTScKsQghBTW50HusQTecf7SLxQpH+daK1SGOfgPUDBO/0JgHIIuT9DYO9NC4tyhKiIIUrvWhF
 IsB6x/gBkZfAlHbX4NYlniTBuytPyCbcu6GafzwRzEp/wNNquc4wxXFV8LWpJXVCWMpEfdIle7s
 KaypwmkK77ICIJhAnarl/tmS0waU3fauAT2U+GowZ4/Qqw4+Iw2LuHKxY0mzjMcXUEv2jnzJ8Tm
 wFHEDjsEqD5qesxEzf9SDhFwXf9aTKfgMsHsKVH6p9kPw1qR490seC5GwgmMUZqvaQv+A6vWV1E
 61Ya6DGFic5BNZobbpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145446_149978_FC922608 
X-CRM114-Status: GOOD (  22.23  )
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

On Mon,  9 Nov 2026 09:12:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Expose one debugfs entry for each discovered SHMTI that can be used to
> dump the related SHMTI in binary form from TBGN up to TEND markers.
> 
> No processing is done kernel side, beside using proper accessors for
> device memory.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Seems fine, one trivial inline. I find it hard to care about this
particular option though.

> ---
>  drivers/firmware/arm_scmi/telemetry.c | 103 ++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index c21700bd1b43..7582fe295a23 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> @@ -1683,6 +1694,91 @@ scmi_telemetry_enumerate_common_intervals(struct telemetry_info *ti)
>  					ti->info.intervals);
>  }
>  
> +static int scmi_telemetry_dbg_shmti_open(struct inode *inode, struct file *filp)
> +{
> +	struct scmi_telemetry_dbg_shmti *sblob;
> +	struct telemetry_shmti *shmti;
> +
> +	if (!inode->i_private)
> +		return -ENODEV;
> +
> +	shmti = inode->i_private;
> +	sblob = kzalloc_obj(*sblob);

Use some __free magic then appropriate no_free_ptr() after
it can't fail any more.

Trivial but might as well.

> +	if (!sblob)
> +		return -ENOMEM;
> +
> +	sblob->shmti = shmti;
> +	sblob->buf = kvzalloc(shmti->info.len, GFP_KERNEL);
> +	if (!sblob->buf) {
> +		kfree(sblob);
> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&sblob->mtx);
> +
> +	filp->private_data = sblob;
> +
> +	return 0;
> +}
> 


