Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCBD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Fv5ZBG4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F03OaTtb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SK1Y+4pk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=; b=0Fv5ZBG4tGYI0C
	r/DrNHJYvyeguNt2uAEZo5BJQr07xB4jFqbaWvJvs8v59w8LvKLKPCfSEO4H3V6ahGfdbLyr9v6FU
	rxRY8DHFyWJiKHHniyjpqegNYK5tztoDzv3hy3XH+U2O8g2+w4XcNuvQGKN+9JDhnNaEFCqzUiq/K
	TavYdmWd2aRxwCt3xo37P2djLHqJMUp+jFZQQ6OEyTLyKMzkWnf1wpU8V074xrfSuBZie2tGvrqdy
	s1B3rE/01m1h6rmqEfAc6W1O8sFkn4TOrg3BMjMpEnzudXoGNi8znPQbqH2kaMtrZ+5StvPFgYDcI
	SYco33YgJpX7gFbjmbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuft-00000005C0S-3MhU;
	Tue, 10 Nov 2026 22:50:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQufr-00000005BzI-31rn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:50:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKiJ33592231
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=; b=F03OaTtb6bYFL8gL
	Ve7hnhc8Sw7J0rgs/T0of/qgvB9zty7yK88MG/KqmyKo0fjNPIy36RKq7bY/h0rG
	MII55Veey/4m0wpHYvZf0j5eeLFJCNOWB1o3CPl1bb34Fnemsi4Z6WD0rQMrEwvw
	9gIwmD/8TzFtFpGBdTZ7Y96/syKYW/wlm6UxZrj4MOSAxu/4TQrpvd/cGMEPAh0K
	21fLl/KpycU200fyM9amctc50JpVd6OQqWDTvmqrGWpt9CIgk1FLTZtKWimUyhfo
	RIwN1s4FdtEL4yX9mUPXOzSt/p93knQ36CorLFfZScmNxTuMk7pkHzOX5z54iQNa
	HEmvkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5hcqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:50:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4462257eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351042; x=1794955842; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=;
        b=SK1Y+4pkJ8sBadFoVJr2k0aW3PumW8JmGm72vLqE5Wbf14blpp+jy135I+NyJg/+7w
         TbPfcywq+jtOaeE84H7DMgzY82Dl890lV32h96XZv/c2Foth6LJIEz9tCfr6locNcLXh
         EBu+5QS+y0UmGP0C6z1G9zJ2SjsGdSfrTMiycfq2wTYf94UHCR5ZzIbSQZPQt1kzS8Eg
         KUb6aEdy/zYtk4YFp+j4Hu8lTW+7em5xVQSdyjzyVXwFn/UuR+Gv4ae0ncwpFzZk5pEq
         3hj9sv6AFWW5O+iJBVBd+DrI5dofPJzvl9AUcI9ClzntE18zswS/KMUXRjRRBxn1+wh3
         Hagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351042; x=1794955842;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVC61jJFB75Gmb5fdaFJWW1deGVGa7rOIiH4PEtL2io=;
        b=LCVrw94L+LlmDGgX9rfcxxAC6hD5KRw0oI8nbJKjDdREKR+Uq0o0BDvZfSWSeLBIWk
         BT3CmaBKAwXyPCR2sGa1neqwpS5re6CoiZU3eHaAnGeBqg8bLoA800uuLkGtP6CfJrQI
         H1mKyf3P9jXjrQfXjLFMRge8TMp4O3E4e/T1tu/atevdnbF99sRAHvWhI9niOD8NkAiY
         G3nlHHBAcxayT39VEl1nKYRoxeBbQU1An3JCM7i5j6YwiqtDDuAdfUEw8jg6SggDB8YN
         4l+4c0G8Owkp5IFua+qM9xkrsSmZbcoDKQ134nMiRu5j2tjX4AU+NSbsCrPGFVq0K4f3
         tTew==
X-Forwarded-Encrypted: i=1; AL+hErGJ6fd2XNe2T/ITdS3moEUd/XrJKgRd7/42qwCCVHcIpwz1FqyXV6rrg8oadUKpJ7jFBZI/hu9+TcWqMnRw+m9J@lists.infradead.org
X-Gm-Message-State: APuU4Z+ejAu2LtSS8duyCuGWOrDt1wnaMnBsa9ubbMZRF652odNmQmZf
	QU6lqSD8u6/W6dCBIp5RVOTcxLkLw4nHrnH0kCVJG4i5wuv1s+27wVacsVJLd3YoXIfsSY06UA8
	Z6eCDJLq/9kQsSIxC1grGLyPjJKQeA9sut0l6kS/5o0Zma8ZcVyVAabD9hNVpkj5bh3LAjOBTPm
	OiKw==
X-Gm-Gg: AYBFou2OrxWAwxzyCyMKSMnVMa10qILkGUql9RdmKtk6nZkfQhDEvIsgjktyFjXIH/b
	OJ9cfg0bHRm8N1tv3MmTpdA6R/C8EQjvoIB4vehpBirKC0TpKjC+QVqa6r+V5bRGEcWlEBvdh6D
	ayZyZED29Let+7jltz0Myl8BF5s45D5BlCvp/YSI0fSocjoLEBNwXZH3o9cExWqMKcD72ySP/lo
	B4FBHEmqCb9CTtlBcmfH7jaWqphSZ96ZGfjZxPP8Ux4Cx8ROmrIiRv2gBjrt7o8051Hf8hK/UyW
	LS+WKZOsGZbR5ya3mfPZPg9AnId/C7YJ5WwSpTcIVoT0B3KCe6Xn8D5sUM3FKLWk/SBzHxgKxg7
	QycnmaFJsABJmwH3gtEvPTXMw2pXfSmnPzqWCbIRkDSHnsDV+lFf1ODuOKfA5TL2SRB5brTM+XP
	keECWlN12Oh/umJcCq1eIZB/qFJtc=
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr424901c88.36.1794351041460;
        Tue, 10 Nov 2026 14:50:41 -0800 (PST)
X-Received: by 2002:a05:7022:1184:b0:1b2:6b1f:1d89 with SMTP id a92af1059eb24-1b3c0360627mr424866c88.36.1794351040724;
        Tue, 10 Nov 2026 14:50:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm10023483c88.9.2026.11.10.14.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:50:40 -0800 (PST)
Date: Tue, 10 Nov 2026 14:50:15 -0800
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
Subject: Re: [PATCH v15 24/35] firmware: arm_scmi: Add common per-protocol
 debugfs support
Message-ID: <20261110145015.0000712c@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-25-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-25-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX55nkglYYblLB
 boFsTL0FhJZAf8iwXhsHa4RbIx2NmtopejbacpuHj2nz18EFYBOE8x4SovAYCfOAadfv1cfx9Pe
 /91KrRnDRixjNQS2lgjEkSGmgzQqKStRU2kvIzpecQ5DCcEjptSomzsWtdZbrsPNMXD/TMVlg1r
 XTPBkKmA0PlPVC0rcJWfrLmpXwVNGEahyRbLQfsZVZ8ieV9DUZw4pekQDoJtvD3N5aLKPdFvSGA
 JwXFTeO5LwrqprToULsgiQNClyTHm8giN/AuAD9krFyR34sW2tRGC+R7F6EEsMTVJ0k1ktZSDTJ
 7oIAyD20fdVqkAnpNRN50p3W5/Dhe+nPf8gut47bk1sJ9Ke1h7WSZary8c7jjsh9d1A2edLPBH3
 P4zGA5uGod9ipK1gj7jLoG3W8uD+KOdbVxfmxgMDHyMF03cFbzXeLve5yykyQYp4iTJOFd+pN4G
 iu6QeOnys6CA4p93GFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX28/K47j+EWQ9
 GWioEoLDyLbPt5MazeqxfvdxhyjscvFgKXnuAsmVIlXGeHzyfj2sN5f0FhfOXQ2IcPM7RKHnHGW
 qEquZHM3Ne5FfHmBWh2V+k+Ng/p8Bus=
X-Proofpoint-ORIG-GUID: gJfQkSx4Hn9LlAD6WDs2MfZc9s2_60Kc
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af39fc2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=43dFeItomYT0VcnkQewA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: gJfQkSx4Hn9LlAD6WDs2MfZc9s2_60Kc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145043_882518_157F2AB1 
X-CRM114-Status: GOOD (  26.63  )
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

On Mon,  9 Nov 2026 09:12:10 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow interested SCMI protocols to register their own specific debugfs
> entries under a common per-instance and per-protocol subtree rooted
> at /sys/kernel/debug/scmi/<N>/protocols/<PROTO_ID>/
> 
> Expose a helper to enable protocol initialization code to get access to
> such per-protocol/per-instance dentries in order to be able to install
> their own dedicated debugfs entries.
> 
> Per-protocol debugfs support is configurable and default off.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - fix debugfs_remove_recursive call-site...was too early
> v8 --> v9
>  - avoid NULL deref on DBG cleanup path
> v5 --> v6
>  - bail out of dentry_get helper when SCMI debug susbsytem failed to init
>  - remove stale SCMI protocol operations
>  - add a preoper clean up of debugfs when protocol init fails
> ---
>  drivers/firmware/arm_scmi/Kconfig     | 14 +++++++++
>  drivers/firmware/arm_scmi/common.h    |  2 ++
>  drivers/firmware/arm_scmi/driver.c    | 42 +++++++++++++++++++++++++--
>  drivers/firmware/arm_scmi/protocols.h |  6 ++++
>  include/linux/scmi_protocol.h         |  1 -
>  5 files changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index 783c24a20e29..f506c4d1d96a 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -69,6 +69,20 @@ config ARM_SCMI_DEBUG_COUNTERS
>  	  such useful debug counters. This can be helpful for debugging and
>  	  SCMI monitoring.
>  
> +config ARM_SCMI_DEBUG_PROTOCOLS
> +	bool "Enable SCMI protocols debug"
> +	select ARM_SCMI_NEED_DEBUGFS
> +	depends on DEBUG_FS
> +	default n

default of default is n, so no need.  By all means add some text
to discourage distros from enabling it.

> +	help
> +	  Enables per-protocol specific debug features, where available.
> +	  When provided, such per-protocol debugfs entries are grouped
> +	  inside a common a subtree named by the protocol number and rooted
> +	  under a per-instance 'protocols' directory.
> +
> +	  Such per-protocol entries subtree structure is freely defined
> +	  within the related protocol code.
> +

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index c1f503c6e72c..8a4664165a64 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c


> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 585eb3a4684e..ed3eaa1482a3 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -1164,7 +1164,6 @@ struct scmi_handle {
>  	void (*devm_protocol_put)(struct scmi_device *sdev, u8 proto);
>  	bool (*is_transport_atomic)(const struct scmi_handle *handle,
>  				    unsigned int *atomic_threshold);
> -
Unrelated.  Scrub for this stuff before sending new versions. Saves time
all round for a minute or two sanity checking.

>  	const struct scmi_notify_ops *notify_ops;
>  };
>  


