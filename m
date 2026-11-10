Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39BA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NfKhSOvI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ngr8t411;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHnveJ7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tuta7zXDJotP5Mc5TnvlvxObG+w4C4fXcl6owUGWTlA=; b=NfKhSOvImZ0qLx
	PwQ5wh6QoThI7CoiLkkt5gGpON9tQmnCCfcRpQf828EIFH1dFJf4+a2t+8E0xoSVkqm0FyTk++gXA
	3uhSaSEvnsZrBkbp44839fzCzgnwXnrt4xeM6hbjO+noEpGYvQYfwEAq4XVscz5ntdTapjdWBZrmp
	ZhKAas+v/jZiUhd45mt7bPO8s5XQylNP5pK7exniq8Mbn+DHQlIfQn9vN+7JtGjTaVC8LW8TysgiI
	QOPkzvXdzZk/CrBixDuUBuiBTlEPtaQvL0HpnCdP/NJ7tekgKAeils4F/cYDsaS4JakFh6Cw2uwVU
	gyDUzoMW3FZYHdhBrv/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvXz-00000005GMW-1VLY;
	Tue, 10 Nov 2026 23:46:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvXw-00000005GLi-2rvh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:46:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML9Rw1117179
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuta7zXDJotP5Mc5TnvlvxObG+w4C4fXcl6owUGWTlA=; b=ngr8t411Z5cGLy0a
	5WrovNSb74tn/rfs52dz3QnAapS4s9etd1QwgY/oURGmgj8zvH5uzECls4XtXEQq
	PWi9UwlB4R8VWz6nfaH8oJuN3dQaVCSM4X2YwFV2jk680LS4ngOJIF6IToIHXbpx
	Ji0jGaaecTa91CYpfwGd4iYGNsN/fmPPi3NgyGYMTWNMUtvqJYtrSHVf4EY0RFDF
	JMH1qMRizpb6WlBtthwBYBaIvfDXJVndI+i48sDyb8K1yibL5tQu8UhoqXawJlAe
	4ukMdtJ7a2pqbyO9VqV5354685o8P0Kpu6kbdtM1EjQNXfFt2w53rqeKHcWCf+x3
	HAY7Pg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pva97f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:46:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37628596fc9so12340eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794354394; x=1794959194; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tuta7zXDJotP5Mc5TnvlvxObG+w4C4fXcl6owUGWTlA=;
        b=JHnveJ7G72ENcyxflerf2GLIqk0zTBg7ww/i1O+2oKId2mjikr7+qLDPlq9nIIzZ8z
         fq6CCarSboBrloZnI28fjqwWVmK9vR7iBRJYXpDzkHtqb0NBkug80yZqz/f4s7OMCDjO
         vCNSYVqXMQ5EDGz1nKIfyn+YSrr6lG+RVS+HHO8kpqh2oj0xvx+PAydgnOXOAwepSDh3
         HMsGUtY/WXYr5Z0wCb7kzlwnJgvbOFzodTRdUYYX5adRmFvnnjNxgAfcHQXKvD/qo1hl
         SQjOu5ReRk9Fy8MTue2rQSLumWBSOUSGLTfad8Q78RQEX/LMbwy4RxNH3ia3UKGg9U8V
         VCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354394; x=1794959194;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuta7zXDJotP5Mc5TnvlvxObG+w4C4fXcl6owUGWTlA=;
        b=KxY+xyvF1jksz6XHDRx5OMQcrkkKukYM/+Rp96mkyKo49RJjaMpr6AAwHZuXnna7l8
         C7xF8NXerMNssM4+dce1QnYOfrI/AVkhVBBbmS9TETcaYT16dqQPNLqXSzj1ARcBoEcF
         BbvS4TUkT4ZmWvVpGLEk4aaAQMLHcZ3bvXrgY6tO03ZprT5Unst4fupU/R/DyZeAs2Kp
         wwfyYj7cC2Y763gioQPgGDU+inXUyPcYoGDx+ryN2inBBmW7JGeoX1KR7EuD7PDC/b5c
         bGaNPq+ZmZwYxGfMjS24dAdeKtCshNg4nkBF3/XB1lv4OCTXLS4xO/dsApDwbTOg18Vf
         rtTg==
X-Forwarded-Encrypted: i=1; AL+hErFQSu8ELOvHeSxX1CEHCMpnwkXiX5FZjNJAkzBSasgTrLWRdg7kNDoBDriAYChQtYz+Xot8+FhO2swtpdTpIHSk@lists.infradead.org
X-Gm-Message-State: APuU4Z+3TciF/aGoGBhGhibkT//r8I9OjWDVIbF2uFbACSEOak4OefxP
	KwgqfRXUeOl68sfMPhFD80sZzUofcdycz2Ym8N6VBSd2Wp4mULM5JMgIZu4NxgaKrFSOoajy+Mf
	zBHez8mACCVt463OrdVWRGe6Ow1abdHE1RoMoN1wH7jUaQz5NmJlVK6M4Ra46xpySBPvKLSSXZW
	znFA==
X-Gm-Gg: AYBFou2udjgLCuJuNR+IeTUj0NkVboI2ls/fsUfNg6eACmBj6P/YYQbSIYIWYvuGO6Y
	UQQI+jVKW/SHUkRWSrESFYMOzOKvG6EidHu+8yRvtqllj2IAj89ix4ckKVH3AVdYZYs7NONtZ13
	pXP8wuOH2H/+9ocIfJZJf+0fthkWDq/hU5TmG8v7vM0CYXdloDeiu+XzUtks1Gc5KKCanhjNpiV
	Qxvmq6ToAje1IgP6a7fMF1NTWBwW3sc/Jz2v5TCDLqNDTlJ1g5+jHEEFV94oYzj72CVSbkaxAfS
	8cS0mk5Gex4aHS7Ib3+ZqQy/1SFKCyGddwEfY6YO1/8Kx8ZouOD6Wzs8fXMyqjKfGAecy2CehHB
	vC7Bmd/uYJIsYfKBJkP3u5L9GGDuRoFDHIeSreFAJ0FI+/8/IJbaMAYUWS99WpbNk5tvQN1NSbF
	7aVQJRKxG0mxv2wgI71PBtNXq/hQg=
X-Received: by 2002:a05:693c:68da:b0:36c:a104:90db with SMTP id 5a478bee46e88-37687215dffmr1151703eec.41.1794354393785;
        Tue, 10 Nov 2026 15:46:33 -0800 (PST)
X-Received: by 2002:a05:693c:68da:b0:36c:a104:90db with SMTP id 5a478bee46e88-37687215dffmr1151665eec.41.1794354393092;
        Tue, 10 Nov 2026 15:46:33 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm10664890eec.7.2026.11.10.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:46:32 -0800 (PST)
Date: Tue, 10 Nov 2026 15:46:07 -0800
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
Subject: Re: [PATCH v15 30/35] firmware: arm_scmi: Add System Telemetry
 driver
Message-ID: <20261110154607.00002b64@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-31-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-31-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3acdb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=J8EkM7pjTVn-s5uLH5oA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: km60Q7HDtA7kTLn88OEhhtlMclr8XBnE
X-Proofpoint-GUID: km60Q7HDtA7kTLn88OEhhtlMclr8XBnE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5NCBTYWx0ZWRfXxr6LOVPqL5AK
 wmQKcWPGcE3doWkh1ZLGAV1qOenmwwYmkSTmX8s7TClhmfSFjsuG/WtWsHHpwtcJ2FJ/VTEtqzY
 L4x/bekc3lv0i0q4rR5u2UE8kkrWz7E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5NCBTYWx0ZWRfXz9vS2d/n9fQ+
 WpOggX724wrAwFNznRJTUDAMRWOg0nsz9CAHYwZFbRZch8O6Qq/bDrgpgi0ifgW9NjgbJ/sXzo5
 ZOM/ddDSXYqwz1DX+pFeDbAo9fw0hzJHNnqpVeydv/wrYENPaOQ5RvrLte6SNKAXb1KsFDOQMyj
 FfjHsR6gNNj3UG7Jag81JbEEOy9C8V0QLDS8A8a5a+AAkclbcLTYqzoqARh8dI+6dpx/S4jX1FS
 w+QFlLh1+m0EWkH4Xj2fRS/gpYIsEfZgXhZPMbZ3qnOAtNkfXOSKIY1oqLsk0ScQWJ/XReNGiA9
 e6h7EI8aVkVfaEC5iL4vkQ5vgqgqDs9AbUCyflaUMJhtDCflrmBLIj078sazd6JhzgpRcgVPPPn
 +g1UThS/Hz0dQ2jeJ00LGamYB/wo2ExNj5oL4SfwtQ2HrVLkasv+6wqNnPTDsyl70j8UkiR1KfN
 ahCOzi3ie6T0irFzIKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_154636_936865_F7125C90 
X-CRM114-Status: GOOD (  34.40  )
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

On Mon,  9 Nov 2026 09:12:16 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add an SCMI driver to allow enumeration, configuration and data collection
> of SCMI Telemetry data.
> 
> The driver exposes one character device for each found SCMI instance and a
> set of related IOCTLs can be used to enumerate, configure and collect
> Telemetry resources.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Some comments inline.  I'm not even going to pretend to be
alert enough to claim this is a thorough review though.

Jonathan

> diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> new file mode 100644
> index 000000000000..185c8e646628
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c

> +static long scmi_tlm_des_batch_read_ioctl(const struct scmi_tlm_instance *ti,
> +					  unsigned long arg)
> +{
> +	struct scmi_telemetry_de_sample *samples __free(kvfree) = NULL;

As near as possible to the constructor for an __free declarations.

> +	int ret, *states __free(kvfree) = NULL;

Definitely don't mix __free and non __free declarations.
Separate lines!

> +	const struct scmi_telemetry_res_info *rinfo;
> +	void __user *uptr = (void __user *)arg;
> +	struct scmi_tlm_batch batch = {};
> +	size_t batch_sz, states_sz;
> +
> +	rinfo = scmi_telemetry_res_info_get(ti->tsp);
> +	ret = scmi_tlm_batch_initialize(uptr, &batch, sizeof(*samples),
> +					rinfo->num_des, (void **)&samples,
> +					&batch_sz, &states, &states_sz);
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < batch.num_items; i++) {
> +		int ret;
> +
> +		ret = ti->tsp->ops->de_data_read(ti->tsp->ph, &samples[i]);
> +		if (ret) {
> +			if (!states)
> +				return ret;
> +
> +			states[i] = ret;
> +			continue;
> +		}
> +	}
> +
> +	/* Return max batch size on zero query */
> +	if (!batch.num_items)
> +		batch.num_items = rinfo->num_des;
> +
> +	return scmi_tlm_batch_finalize(uptr, &batch, samples, states, batch_sz,
> +				       states_sz);
> +}
> +
> +static struct scmi_tlm_shmti_ctx *
> +scmi_tlm_shmti_ctx_alloc(struct scmi_tlm_instance *ti,
> +			 struct scmi_telemetry_shmti_info *shmti)
> +{
> +	struct scmi_tlm_shmti_ctx *ctx;
> +
> +	ctx = kzalloc_obj(*ctx);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->shmti = shmti;
> +	kref_init(&ctx->ref);
> +
> +	/* Get hold of the Telemetry instance when returning anon_fds */

This bit of the code isn't returning anon_fds???

> +	get_device(&ti->dev);
> +	ctx->ti = ti;
> +
> +	return ctx;
> +}

> +
> +static int scmi_tlm_shmti_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	unsigned long npages, expect, needed, req;
> +	struct scmi_tlm_shmti_ctx *ctx;
> +	phys_addr_t base;
> +	size_t map_sz;
> +	int ret, idx;
> +
> +	if (vma->vm_pgoff)
> +		return -EINVAL;
> +
> +	if (vma->vm_flags & (VM_WRITE | VM_EXEC))
> +		return -EPERM;
> +
> +	vm_flags_clear(vma, VM_MAYWRITE | VM_MAYEXEC);
> +
> +	/* Grab a ctx reference early on */
> +	ctx = scmi_tlm_shmti_ctx_get(filp->private_data);
> +	/*
> +	 * Note that any ctx_put potentially release the device and
> +	 * cleans the SRCU structure...no guards.

No guards is fine but maybe goto and a common cleanup block?

> +	 */
> +	idx = srcu_read_lock(&ctx->ti->dead_srcu);
> +	if (READ_ONCE(ctx->ti->dead)) {
> +		srcu_read_unlock(&ctx->ti->dead_srcu, idx);
> +		scmi_tlm_shmti_ctx_put(ctx);
> +		return -ENODEV;
> +	}
> +
> +	needed = ctx->shmti->len + ctx->shmti->offset;
> +	req = vma->vm_end - vma->vm_start;
> +	if (req < needed) {
> +		srcu_read_unlock(&ctx->ti->dead_srcu, idx);
> +		scmi_tlm_shmti_ctx_put(ctx);
> +		return -EINVAL;
> +	}
> +
> +	/* Align & reject oversized requests */
> +	base = ctx->shmti->phys & PAGE_MASK;
> +	expect = DIV_ROUND_UP(needed, PAGE_SIZE);
> +	npages = req >> PAGE_SHIFT;
> +	if (npages > expect) {
> +		srcu_read_unlock(&ctx->ti->dead_srcu, idx);
> +		scmi_tlm_shmti_ctx_put(ctx);
> +		return -EINVAL;
> +	}
> +
> +	map_sz = PAGE_ALIGN(needed);
> +	vma->vm_private_data = ctx;
> +	vma->vm_ops = &scmi_tlm_shmti_vm_ops;
> +	/* Set appropriate caching attributes */
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +
> +	/* Map physical address range into user space */
> +	ret = vm_iomap_memory(vma, base, map_sz);
> +	if (ret) {
> +		srcu_read_unlock(&ctx->ti->dead_srcu, idx);
> +		scmi_tlm_shmti_ctx_put(ctx);
> +		return ret;
> +	}
> +
> +	srcu_read_unlock(&ctx->ti->dead_srcu, idx);
> +
> +	return 0;
> +}

> +static void
> +scmi_tlm_allocate_anon_fds(struct scmi_tlm_instance *ti, unsigned int *num_shmtis,
> +			   struct scmi_tlm_shmti_info *shinfo,
> +			   struct file **filps)
> +{
> +	const struct scmi_telemetry_info *info = ti->info;
> +	struct device *dev = &ti->tsp->sdev->dev;
> +	int idx = 0;
> +
> +	for (int i = 0; i < *num_shmtis; i++) {
> +		struct scmi_telemetry_shmti_info *shmti = info->shmtis[i];
> +		struct scmi_tlm_shmti_ctx *ctx;
> +		struct file *filp;
> +		int fd;
> +
> +		fd = get_unused_fd_flags(O_CLOEXEC);

Bit marginal, but perhaps some __free magic for this.

> +		if (fd < 0) {
> +			dev_err(dev, "Failed GET_UNUSED_FD for SID: %u\n",
> +				shmti->sid);
> +			continue;
> +		}
> +
> +		ctx = scmi_tlm_shmti_ctx_alloc(ti, shmti);
> +		if (IS_ERR(ctx)) {
> +			dev_err(dev, "Failed CTX_ALLOC for SID: %u\n", shmti->sid);
> +			put_unused_fd(fd);
> +			continue;
> +		}
> +
> +		filp = anon_inode_getfile(SCMI_TLM_DRIVER, &scmi_tlm_shmti_fops,
> +					  ctx, O_RDONLY | O_CLOEXEC);
> +		if (IS_ERR(filp)) {
> +			scmi_tlm_shmti_ctx_put(ctx);

Bit fiddlier but maybe some __free magic for ctx as well.

> +			put_unused_fd(fd);
> +			dev_err(dev, "Failed ANON GET_FILE for SID: %u\n",
> +				shmti->sid);
> +			continue;
> +		}
> +
> +		shinfo[idx].sid = shmti->sid;
> +		shinfo[idx].fd = fd;
> +		shinfo[idx].len = shmti->len;
> +		shinfo[idx].offset = shmti->offset;
> +
> +		filps[idx++] = filp;
> +	}
> +
> +	/* Return effective initialized items */
> +	*num_shmtis = idx;
> +}

> +
> +static long
> +scmi_tlm_shmtis_list_get_ioctl(struct scmi_tlm_instance *ti, unsigned long arg)
> +{
> +	struct scmi_tlm_shmti_info *shinfo __free(kvfree) = NULL;

Move down to where it's constructed.  cleanup.h talks about this.

> +	unsigned int max_shmtis = ti->info->base.num_shmtis;
> +	void __user *uptr = (void __user *)arg;
> +	struct scmi_tlm_batch batch = {};
> +	size_t batch_sz;
> +	int ret;
> +
> +	ret = scmi_tlm_batch_initialize(uptr, &batch, sizeof(*shinfo), max_shmtis,
> +					(void **)&shinfo, &batch_sz, NULL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (batch.num_items == 0) {
> +		batch.num_items = max_shmtis;
> +
> +		return scmi_tlm_batch_finalize(uptr, &batch, shinfo, NULL,
> +					       batch_sz, 0);
> +	}
> +
> +	struct file **filps __free(kfree) = kzalloc_objs(*filps, batch.num_items);
> +	if (!filps)
> +		return -ENOMEM;
> +
> +	/* Passing the array as a param avoids dancing with uptr->items */
> +	scmi_tlm_allocate_anon_fds(ti, &batch.num_items, shinfo, filps);
> +	ret = scmi_tlm_batch_finalize(uptr, &batch, shinfo, NULL, batch_sz, 0);
> +	if (ret) {
> +		scmi_tlm_anon_fds_free(batch.num_items, shinfo, filps);
> +		return ret;
> +	}
> +
> +	scmi_tlm_anon_fds_install(batch.num_items, shinfo, filps);
> +
> +	return 0;
> +}

> +
> +static long
> +scmi_tlm_uuid_list_get_ioctl(const struct scmi_tlm_instance *ti,
> +			     unsigned long arg)
> +{
> +	struct scmi_tlm_uuid *uuids __free(kvfree) = NULL;

Move this down next to where the constructor is.  See cleanup.h guidance
on why they should be together.

> +	void __user *uptr = (void __user *)arg;
> +	struct scmi_tlm_batch batch = {};
> +	unsigned int num_uuids;
> +	uuid_t **cur_uuids;
> +	size_t batch_sz;
> +	int ret;
> +
> +	/*
> +	 * Note that UUID array can ONLY grow and it has NOT a known upper
> +	 * bound, so it does not matter if by the time we grab the cur_uuids
> +	 * via rcu_dereference() the array has grown in size and we end up
> +	 * here reading a stale/incomplete set of UUIDs, we will simply
> +	 * read the new UUIDs next-time: this simplifies allocation.
> +	 */
> +	num_uuids = smp_load_acquire(&ti->info->num_uuids);
> +	ret = scmi_tlm_batch_initialize(uptr, &batch, sizeof(*uuids),
> +					num_uuids, (void **)&uuids, &batch_sz,
> +					NULL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	rcu_read_lock();
> +	cur_uuids = rcu_dereference(ti->info->uuids);
> +	for (int j = 0; j < batch.num_items; j++)
> +		export_uuid(uuids[j].bytes, cur_uuids[j]);
> +	rcu_read_unlock();
> +
> +	/* Return max batch size on zero query */
> +	if (!batch.num_items)
> +		batch.num_items = num_uuids;
> +
> +	return scmi_tlm_batch_finalize(uptr, &batch, uuids, NULL, batch_sz, 0);
> +}
> +
> +static int scmi_tlm_event_subscribe(struct scmi_tlm_instance *ti,
> +				    struct scmi_tlm_event *evt, void *key)
> +{
> +	struct scmi_tlm_events_session *session;
> +	struct scmi_tlm_registered_event *revt;
> +	struct eventfd_ctx *ctx;
> +	u32 cookie;
> +	int ret;
> +
> +	scoped_guard(mutex, &ti->sessions_mtx) {
> +		session = xa_load(&ti->sessions_xa, (unsigned long)key);
> +		if (!session) {
> +			/*
> +			 * Initialize a new session on first call.
> +			 * Once created successfully initialized sessions are
> +			 * freed only on final release.
> +			 */
> +			session = kzalloc_obj(*session);
> +			if (!session)
> +				return -ENOMEM;
> +
> +			/* Initialize inner with proper flags to support xa_alloc */
> +			xa_init_flags(&session->events_xa, XA_FLAGS_ALLOC);
> +			mutex_init(&session->events_mtx);
> +			ret = xa_insert(&ti->sessions_xa, (unsigned long)key,
> +					session, GFP_KERNEL);
> +			if (ret) {
> +				xa_destroy(&session->events_xa);
> +				kfree(session);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	ctx = eventfd_ctx_fdget(evt->efd);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	revt = kzalloc_obj(*revt);
> +	if (!revt) {
> +		eventfd_ctx_put(ctx);
> +		return -ENOMEM;
> +	}
> +
> +	guard(mutex)(&session->events_mtx);
> +	revt->ctx = ctx;
> +	revt->type = evt->type;
> +	ret = xa_alloc(&session->events_xa, &cookie, revt,
> +		       scmi_evt_xa_limit, GFP_KERNEL);
> +	if (ret) {
> +		eventfd_ctx_put(revt->ctx);
> +		kfree(revt);
> +		return ret;
> +	}
> +
> +	ret = ti->tsp->ops->event_subscribe(ti->tsp->ph, revt->type, revt->ctx);
> +	if (ret) {
> +		xa_erase(&session->events_xa, cookie);
> +		eventfd_ctx_put(revt->ctx);
> +		kfree(revt);
> +		return ret;
Quite a bit of repetition in the error paths. Use a common goto
block to clean up.  For the guard stuff above, a helper is probably
the easiest way to avoid mixing that with cleanup via gotos down here.

> +	}
> +
> +	/* Return the allocated cookie */
> +	evt->cookie = cookie;
> +
> +	/* Get hold of the instance */
> +	get_device(&ti->dev);
> +
> +	return 0;
> +}

> +
> +static long scmi_tlm_unlocked_ioctl(struct file *filp, unsigned int cmd,
> +				    unsigned long arg)
> +{
> +	struct scmi_tlm_instance *ti = filp->private_data;
> +	bool writable = filp->f_mode & FMODE_WRITE;
> +
> +	guard(srcu)(&ti->dead_srcu);
> +	if (READ_ONCE(ti->dead))
> +		return -ENODEV;
> +
> +	switch (cmd) {
> +	case SCMI_TLM_GET_ABI_INFO:
> +		return scmi_tlm_abi_info_get_ioctl(ti, arg);
> +	case SCMI_TLM_GET_CFG:
> +		return scmi_tlm_config_get_ioctl(ti, arg);
> +	case SCMI_TLM_SET_CFG:
> +		if (writable)
> +			return scmi_tlm_config_set_ioctl(ti, arg);
> +		break;
> +	case SCMI_TLM_GET_INTRVS:
> +		return scmi_tlm_intervals_get_ioctl(ti, arg);
> +	case SCMI_TLM_GET_DE_CFG:
> +		return scmi_tlm_de_config_get_ioctl(ti, arg);
> +	case SCMI_TLM_SET_DE_CFG:
> +		if (writable)
> +			return scmi_tlm_de_config_set_ioctl(ti, arg);
> +		break;
> +	case SCMI_TLM_GET_DE_INFO:
> +		return scmi_tlm_de_info_get_ioctl(ti, arg);
> +	case SCMI_TLM_GET_DE_LIST:
> +		return scmi_tlm_des_list_get_ioctl(ti, arg);
> +	case SCMI_TLM_DE_READ:
> +		return scmi_tlm_de_value_get_ioctl(ti, arg);
> +	case SCMI_TLM_GET_ALL_CFG:
> +		return scmi_tlm_all_de_config_get_ioctl(ti, arg);
> +	case SCMI_TLM_SET_ALL_CFG:
> +		if (writable)
> +			return scmi_tlm_all_de_config_set_ioctl(ti, arg);
> +		break;
> +	case SCMI_TLM_GET_GRP_LIST:
> +		return scmi_tlm_grps_list_get_ioctl(ti, arg);
> +	case SCMI_TLM_GET_GRP_INFO:
> +		return scmi_tlm_grp_info_get_ioctl(ti, arg);
> +	case SCMI_TLM_GET_GRP_DESC:
> +		return scmi_tlm_grp_desc_get_ioctl(ti, arg);
> +	case SCMI_TLM_SINGLE_READ:
> +		return scmi_tlm_des_read_ioctl(ti, arg, true);
> +	case SCMI_TLM_BULK_READ:
> +		return scmi_tlm_des_read_ioctl(ti, arg, false);
> +	case SCMI_TLM_BATCH_READ:
> +		return scmi_tlm_des_batch_read_ioctl(ti, arg);
> +	case SCMI_TLM_GET_SHMTI_LIST:
> +		return scmi_tlm_shmtis_list_get_ioctl(ti, arg);
> +	case SCMI_TLM_RESET:
> +		if (writable)
> +			return scmi_tlm_reset_ioctl(ti, arg);
> +		break;
> +	case SCMI_TLM_GET_UUID_LIST:
> +		return scmi_tlm_uuid_list_get_ioctl(ti, arg);
> +	case SCMI_TLM_EVENT_SUBSCRIBE:
> +		return scmi_tlm_event_subscribe_ioctl(ti, arg, filp);
> +	default:
> +		return -ENOTTY;
> +	}
> +
> +	return -EPERM;

I'd just return this where you break above.
Seems little benefit in coming down here to do so given they
are all error paths.

> +}

> +
> +static int scmi_telemetry_probe(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	struct scmi_protocol_handle *ph;
> +	struct scmi_tlm_instance *ti;
> +	unsigned int instance;
> +	const void *ops;
> +	int ret;
> +
> +	if (!handle)
> +		return -ENODEV;
> +
> +	instance = handle->id;
> +	if (instance >= SCMI_TLM_NUM_DEVS)
> +		return -ENOSPC;
> +
> +	ops = handle->devm_protocol_get(sdev, sdev->protocol_id, &ph);
> +	if (IS_ERR(ops))
> +		return dev_err_probe(&sdev->dev, PTR_ERR(ops),
> +				     "Cannot access protocol:0x%X\n",
> +				     sdev->protocol_id);
> +
> +	ti = scmi_tlm_instance_init(sdev, ops, ph, instance);
> +	if (IS_ERR(ti))
> +		return PTR_ERR(ti);
> +
> +	/*
> +	 * Setting the platform device as parent to enforce proper ordering
> +	 * at shutdown and to avoid the need for explicit get/put_device
> +	 */
> +	ti->dev.parent = &sdev->dev;
> +	ti->dev.devt = MKDEV(MAJOR(stlm_devt), MINOR(stlm_devt) + instance);
> +	ti->dev.class = &stlm_class;
> +	ti->dev.release = scmi_tlm_device_release;
> +	device_initialize(&ti->dev);
> +
> +	ret = dev_set_name(&ti->dev, "tlm_%d", ti->id);
> +	if (ret)
> +		goto err_dev;
> +
> +	cdev_init(&ti->cdev, &stlm_fops);
> +	ti->cdev.owner = THIS_MODULE;
> +
> +	ret = cdev_device_add(&ti->cdev, &ti->dev);
> +	if (ret)
> +		goto err_dev;
> +
> +	dev_set_drvdata(&sdev->dev, ti);
> +
> +	return 0;
> +
> +err_dev:
> +	put_device(&ti->dev);
> +
> +	return ret;
> +}
> +
> +static void scmi_telemetry_remove(struct scmi_device *sdev)
> +{
> +	struct scmi_tlm_events_session *session;
> +	struct scmi_tlm_instance *ti;
> +	unsigned long index;
> +
> +	ti = dev_get_drvdata(&sdev->dev);
> +	if (!ti)
> +		return;
> +
> +	/* Stop ongoing opens and wait on in-flight operation to drain */
> +	WRITE_ONCE(ti->dead, true);
> +	synchronize_srcu(&ti->dead_srcu);
> +
> +	/* Inhibit future opens */
> +	cdev_device_del(&ti->cdev, &ti->dev);
> +	/*
> +	 * Drop any residual session and related events if unbind happened whiel

while

> +	 * some event fds were still open.
> +	 */
> +	mutex_lock(&ti->sessions_mtx);
> +	xa_for_each(&ti->sessions_xa, index, session) {
> +		xa_erase(&ti->sessions_xa, index);
> +		/* Force any event unsubscribe...protocol is still alive */
> +		scmi_tlm_events_session_unsubscribe(ti, session);
> +	}
> +	mutex_unlock(&ti->sessions_mtx);
> +
> +	put_device(&ti->dev);
> +}

> +
> +static int __init scmi_telemetry_init(void)
> +{
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&stlm_devt, 0, SCMI_TLM_NUM_DEVS,
> +				  SCMI_TLM_DRIVER);
> +	if (ret)
> +		return ret;
> +
> +	ret = class_register(&stlm_class);
> +	if (ret)
> +		goto err_class;
> +
> +	ret = scmi_register(&scmi_telemetry_driver);
> +	if (ret)
> +		goto err_scmi;
> +
> +	return 0;
> +
> +err_scmi:
> +	class_unregister(&stlm_class);
> +
> +err_class:
> +	unregister_chrdev_region(stlm_devt, SCMI_TLM_NUM_DEVS);
> +
> +	return ret;
> +}
> +module_init(scmi_telemetry_init);
> +
> +static void __exit scmi_telemetry_exit(void)
> +{
> +	scmi_unregister(&scmi_telemetry_driver);
> +	unregister_chrdev_region(stlm_devt, SCMI_TLM_NUM_DEVS);

This should be reverse order of init == same as error paths
at the end of init. Anything else needs some comments on why.

> +	class_unregister(&stlm_class);
> +}
> +module_exit(scmi_telemetry_exit);



