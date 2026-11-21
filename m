Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD035606A680
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 03:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=knFTE9Zc;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzmoljCk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAhi3g6m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zIDk71Ax+oCdiiIjTS8sKBRujsFJoxCyGBXFurjsjm8=; b=knFTE9ZcSTquIncnF7BEEnbzf9
	pZT1u3O1K0hfjMZn9WUM4bNOxX+o3DrsGobL9sPDOdzPZhxKgiFoXxZeQB4mEm7FaQG69WuEQFn3h
	QGDkiGJTzAem6lebWotjlfYdJrjTVXRjM+eU/XXxOiHmmPAk5WoDHPagui7x/JxUkSgqKFNYGUd5h
	CdXpFsM6c4xpREiT6g3NOyfISVzlsRSwCDADJYiETb7aBfjQohX7ZBT3ybNc3R/aL2W20CEQCPT8B
	rgB9dTzxMdunnYm7iisJJVEhDQ6KG/6Ts3PSZHEccWY1QsP8p0l05PMJhKQ7eyC9z+Bo+BYemU+Mm
	dxPpH7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUc9e-0000000GjrT-1WtP;
	Sat, 21 Nov 2026 03:52:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUc9T-0000000GjqP-0h39
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 03:52:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL295Iu3675582
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIDk71Ax+oCdiiIjTS8sKBRu
	jsFJoxCyGBXFurjsjm8=; b=GzmoljCk11fmune989tg3EQ+1KooQ4eiUnNITPK0
	ksIdXiwn7nxZQBKPCCUsy6jmg7OOZSKOuVlQYIy1fCAn4vbPLMI90WaSGs9y32qw
	JxRR4k3o0Sjp8XdeGQ1XA/LSDykWwhuLZNPXC4KL7qCdhAHLGhHR4e9fxgcxRHbf
	7Y/CMk8VSW1c6zFak0z3HrCxontXpkdhqjLSyKJcw77IWLB1wRLV1BHPL6z3UqJn
	w1KritOYE+EZ/BdHnUnEPC9aU/mLzsnCtPh8Z1fTp5csINBaXrQz5hasVoGQjGma
	hrixnHuo6kRf5e74TRPtt5f41NcyKkcs4SYFrdY33NCYqQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rr6m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 03:52:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2457876eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 19:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795233152; x=1795837952; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zIDk71Ax+oCdiiIjTS8sKBRujsFJoxCyGBXFurjsjm8=;
        b=MAhi3g6m0ZnwuI13c39GPZHQB5F10WkJH2jHb8hSq64tiCnZyekluEN1zcnQISpGlV
         czT9X1h4SYW5pDBU9CIP014/iaQ3xw5e5L1WMu9wKUzmoMU/etHhhXm4QPxYAl1ryIxn
         X8Ct8YIzNggmOSNE85WJVCVhYWVTnMrB5bbyInp9rW7eS80vEx/tMprbKr9lcLGvF2CB
         71V3CDT7fzfUk99/3OCGtwCNsITV7ldWa0bGMSNw5w7/115PfoxNAmgMLiR7IFCyhgIU
         kQRuj6Hk622573twKjVQP7B7iUE+HRNdyo8ApZs8T8baXLQ+SIrWcz7TONBjCBN8YKxr
         xkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233152; x=1795837952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIDk71Ax+oCdiiIjTS8sKBRujsFJoxCyGBXFurjsjm8=;
        b=M0aSskP61hUtI6YvPTcI5KoYnvbbTjzyWGoSA3ISQS51EnV1aGbEj9w6vx+pHyg63M
         ioI8i9SYL7r1C/SZIv2OQvweE/Jb8CSWSYs6/Cp55EEHYfaI+t3LMXj8TYm/VOlfu2HC
         nJzLcqkUv7UOiiZ4KcTwdsngPkuVkp1uYIY9b4rjlXgK63vJHlM15gkEvx77Fkf7LBPL
         3aJ5safMn1r2dCB1uurznE0mZahAP9gFqGqlp02Z2M5ddDc7EnlQOd8hed49NyLhqPS3
         P887dc/Mlb7SLEulmI/P07clIVXCRzQpTV1CxDg7eK03kDDzjWxfkmX2AD4u1m+SUjlN
         FKNA==
X-Gm-Message-State: APuU4Z8t9XkClF2j8pSfzy/+t/TwG1Ew57Vwz73oggNHPS8i4e1poQ/0
	mWDmLADWvUjir+zXObw6QA9hYbojzDbhH0nG0WeTCXyH/x9KQDZohfjmR7KBZcTQeuOFxBGH6q0
	BmzvRpm3qRYislRU82LAEwkMDZ2ByHf3XOkRVN0qa/hLpFaLaVov18pD83+wIFglUABUZt1Pt75
	CuaA==
X-Gm-Gg: AZFdTZfpo2DrX6GYT1PIh32Kn5DXa7dlVE39wshe5oaNsChBDoylPkqf/a6rQjciXt5
	1f8kGRRgYWbXfr7T9DczD2nHZ4ef7aGm6igZRJlML3+GLxskb4ywhvUgulRy1ZA/f3sH/PwXoLr
	68I8P9dmKH5tgqsAd0BvlcI4lqJiYerBJG+EI5MdrsZCPo1l0CBwR83Fx+LX3yEzJj/DeU9pmnA
	WDlaI34ed58H3r98vgmzV94hXYO6IfUW1UYbD9j1Zgc704O0FPBrcwtN/afBpplsyGHraQ7kXog
	C2JNTB3+rlidYpaLbOH0DkuvieIgdJA4Zcj6GfLJVusz9FNrSQhWKVwKzSZI9/KYWGMiIKaET8I
	5OdEZ+y1nkdLEbI4o+lcSkvDlmbsKZDvbk0eV4Sy83M7PkBMUoxJXupPCRdB46rdjaFbxgXQ0jz
	9C7bAm7hAJhe07FNvO2m4wjhI=
X-Received: by 2002:a05:693c:4195:10b0:385:2c71:7539 with SMTP id 5a478bee46e88-3856f258aa5mr5504183eec.9.1795233152026;
        Fri, 20 Nov 2026 19:52:32 -0800 (PST)
X-Received: by 2002:a05:693c:4195:10b0:385:2c71:7539 with SMTP id 5a478bee46e88-3856f258aa5mr5504128eec.9.1795233151382;
        Fri, 20 Nov 2026 19:52:31 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm16134963eec.5.2026.11.20.19.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:52:30 -0800 (PST)
Date: Fri, 20 Nov 2026 19:52:28 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Ahmed Azeem <ahmed.azeem@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/4] firmware: arm: Add PFDI run, result, and error
 injection support
Message-ID: <awEVfD12XgmNhqxt@hu-ashoraj-lv.qualcomm.com>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
 <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-3-4772d18b9115@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-3-4772d18b9115@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAxNSBTYWx0ZWRfX6lcHcfSN1bBx
 SmKoggxGUtPZ76gbDBYWuA8Pduz3H4qHDVFY5DEEQoJ3gO3r1SMkZMypPcuwK/G8BuYbrml9yPF
 I+MtZUJ+GLbrpNmkYas2eM/LkvqZfOw=
X-Proofpoint-GUID: mUCz0_ctHAppSQiGfK7KWQ7LTc44POlw
X-Proofpoint-ORIG-GUID: mUCz0_ctHAppSQiGfK7KWQ7LTc44POlw
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b011580 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=hGlcRQhp3Xgnm4JraE4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAxNSBTYWx0ZWRfX9fk7zY260cTp
 1/Lex7KfOFPr21XcAkdTBaSngw6iVN/7d5uy4kJ7wvos+PcUo6t1kZ8zC9obv/76I7zxpfOTsFl
 NMUUUpoF+uk6Ts4AbV1k3HZ+dyk5K9rp23OnRyGRAACf6LhuR+gEh+MvXdTSz1tQeOXy1B6IhL6
 nppxhFzxXwX88KUwYrVECmydFePTy8onyAZoHkjIdxcip4ctNkFRIBBkRntRzTycdUHoQu09IY2
 GLG2r2u34Iao+e/BjV5PgmcZ5JOYhfNNycet8cWGh46fXtlNh7ThM+7Qf2VBpvlke1NUh5rbXiC
 BgFG7Gla0cTdLj4uwTaWp6A6NcAB/DQSIv4yFtuIFSKjLWETgRs4bTQkIKqN29pXEBGoptnwgic
 Z+SBZDsb1Nfhc56KAdAbcc9vFPkJmnZeeO+CjkSVJmKNSYGQ7yBp/wku5D/avRfbj8mIa9oktrx
 gC8oEg/Q1ogztp1vUbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_195235_260006_9E55D566 
X-CRM114-Status: GOOD (  31.30  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 03:36:05PM +0000, Ahmed Azeem wrote:
> From: Divin Raj <divin.raj@arm.com>
> 
> Extend the PFDI driver with ioctls to execute tests and manage results.
> 
> Add support for PFDI_IOCTL_PE_TEST_RUN, PFDI_IOCTL_PE_TEST_RESULT, and
> PFDI_IOCTL_FORCE_ERROR, along with per-CPU state to serialize test
> execution. When firmware reports PFDI_RET_FAULT_FOUND, return the
> failing test identifier to userspace.
> 
> Signed-off-by: Divin Raj <divin.raj@arm.com>
> Signed-off-by: Ahmed Azeem <ahmed.azeem@arm.com>
> ---
>  drivers/firmware/arm_pfdi.c | 225 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
> 
> diff --git a/drivers/firmware/arm_pfdi.c b/drivers/firmware/arm_pfdi.c
> index 8c6d315b0572..22a69b12dbc8 100644
> --- a/drivers/firmware/arm_pfdi.c
> +++ b/drivers/firmware/arm_pfdi.c
> @@ -18,10 +18,16 @@
>  #include <linux/slab.h>
>  #include <linux/smp.h>
>  #include <linux/uaccess.h>
> +#include <linux/wait.h>
>  
>  struct pfdi_per_cpu_info {
> +	atomic_t run_inprogress;
>  	/* Ensures a single userspace owner per CPU while the node is open. */
>  	struct semaphore open_sem;
> +	/* Serializes per-CPU run state and device availability. */
> +	struct mutex state_lock;
> +	struct pfdi_test_range ongoing_run_range;
> +	wait_queue_head_t run_wait;
>  };
>  
>  struct pfdi_dev_data {
> @@ -36,6 +42,8 @@ struct pfdi_cpu_worker {
>  	u32 feature_fid;
>  	/* Protects worker lifetime and in-flight work state. */
>  	struct mutex worker_lock;
> +	struct pfdi_force_error error_info;
> +	struct pfdi_test_run test_run;
>  	struct arm_smccc_res smc_ret;
>  	int result;
>  };
> @@ -59,6 +67,10 @@ static DEFINE_PER_CPU(struct pfdi_per_cpu_info, pfdi_cpu_info);
>  
>  static enum cpuhp_state pfdi_cpuhp_state;
>  
> +static unsigned int pfdi_wait_timeout_ms = 60;
> +module_param_named(wait_timeout_ms, pfdi_wait_timeout_ms, uint, 0444);
> +MODULE_PARM_DESC(wait_timeout_ms,
> +		 "Maximum time in ms to wait for an in-progress PFDI run");
>  static int pfdi_to_linux_errno(int err)
>  {
>  	switch (err) {
> @@ -95,6 +107,18 @@ static int pfdi_smc_feature(u32 smc_fid)
>  	return (int)pfdi_smc_call(PFDI_FN_FEATURES, smc_fid, 0, 0, 0).a0;
>  }
>  
> +static bool pfdi_fid_supported(u32 smc_fid)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pfdi_supported_fids); i++) {
> +		if (pfdi_supported_fids[i] == smc_fid)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int pfdi_validate_cpu_features(void)
>  {
>  	unsigned int i;
> @@ -275,6 +299,172 @@ static int pfdi_pe_fw_check(unsigned int cpu)
>  	return pfdi_to_linux_errno(per_cpu(pfdi_worker_ctx, cpu).result);
>  }
>  
> +static void pfdi_pe_get_result_fn(struct kthread_work *work)
> +{
> +	struct pfdi_cpu_worker *worker_ctx;
> +
> +	worker_ctx = container_of(work, struct pfdi_cpu_worker, work);
> +	worker_ctx->smc_ret = pfdi_smc_call(PFDI_FN_PE_TEST_RESULT,
> +					    0, 0, 0, 0);
> +	complete(&worker_ctx->done);
> +}
> +
> +static int pfdi_pe_get_result(unsigned int cpu, s64 *ft_id)
> +{
> +	int ret;
> +	struct pfdi_cpu_worker *worker_ctx = &per_cpu(pfdi_worker_ctx, cpu);
> +
> +	ret = pfdi_thread_worker(cpu, pfdi_pe_get_result_fn,
> +				 MAX_SCHEDULE_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	ret = (int)worker_ctx->smc_ret.a0;
> +	if (ret == PFDI_RET_FAULT_FOUND)
> +		*ft_id = worker_ctx->smc_ret.a1;
> +
> +	return pfdi_to_linux_errno(ret);
> +}
> +
> +static void pfdi_pe_force_error_fn(struct kthread_work *work)
> +{
> +	struct pfdi_cpu_worker *worker_ctx;
> +
> +	worker_ctx = container_of(work, struct pfdi_cpu_worker, work);
> +	worker_ctx->result = pfdi_smc_call(PFDI_FN_FORCE_ERROR,
> +					   worker_ctx->error_info.smc_fid,
> +					   worker_ctx->error_info.error_id,
> +					   0, 0).a0;
> +	complete(&worker_ctx->done);
> +}
> +
> +static int pfdi_pe_force_error(unsigned int cpu,
> +			       const struct pfdi_force_error *error_info)
> +{
> +	int ret;
> +	struct pfdi_cpu_worker *worker_ctx = &per_cpu(pfdi_worker_ctx, cpu);
> +
> +	if (!pfdi_fid_supported(error_info->smc_fid))
> +		return -EINVAL;
> +
> +	if (error_info->error_id < PFDI_RET_TEST_COUNT_ZERO ||
> +	    error_info->error_id > SMCCC_RET_SUCCESS)
> +		return -EINVAL;
> +
> +	worker_ctx->error_info = *error_info;
> +
> +	ret = pfdi_thread_worker(cpu, pfdi_pe_force_error_fn,
> +				 MAX_SCHEDULE_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	return pfdi_to_linux_errno(worker_ctx->result);
> +}
> +
> +static bool pfdi_ranges_equal(const struct pfdi_test_range *lhs,
> +			      const struct pfdi_test_range *rhs)
> +{
> +	return lhs->start == rhs->start && lhs->end == rhs->end;
> +}
> +
> +static bool pfdi_run_available(const struct pfdi_per_cpu_info *cpu_info)
> +{
> +	return !atomic_read(&cpu_info->run_inprogress);
> +}
> +
> +static int pfdi_validate_test_range(unsigned int cpu,
> +				    const struct pfdi_test_range *range)
> +{
> +	s64 count;
> +	int ret;
> +
> +	if (range->start == -1 || range->end == -1)
> +		return pfdi_ranges_equal(range,
> +					 &(struct pfdi_test_range){ .start = -1,
> +								    .end = -1 }) ?
> +		       0 : -EINVAL;
> +
> +	if (range->start < 0 || range->end < 0 || range->start > range->end)
> +		return -EINVAL;
> +
> +	ret = pfdi_pe_get_test_count(cpu, &count);
> +	if (ret)
> +		return ret;
> +
> +	if (range->start >= count || range->end >= count)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void pfdi_pe_run_fn(struct kthread_work *work)
> +{
> +	struct arm_smccc_res smc_ret;
> +	struct pfdi_cpu_worker *worker_ctx;
> +
> +	worker_ctx = container_of(work, struct pfdi_cpu_worker, work);
> +	smc_ret = pfdi_smc_call(PFDI_FN_PE_TEST_RUN,
> +				worker_ctx->test_run.range.start,
> +				worker_ctx->test_run.range.end, 0, 0);
> +
> +	if ((int)smc_ret.a0 == PFDI_RET_FAULT_FOUND)
> +		worker_ctx->test_run.ft_id = smc_ret.a1;
> +
> +	worker_ctx->result = (int)smc_ret.a0;
> +	complete(&worker_ctx->done);
> +}
> +
> +static int pfdi_pe_run_tests(unsigned int cpu, struct pfdi_test_run *test_run)
> +{
> +	int ret;
> +	unsigned long wait_timeout;
> +	struct pfdi_cpu_worker *worker_ctx = &per_cpu(pfdi_worker_ctx, cpu);
> +	struct pfdi_per_cpu_info *cpu_info = &per_cpu(pfdi_cpu_info, cpu);
> +
> +	ret = pfdi_validate_test_range(cpu, &test_run->range);
> +	if (ret)
> +		return ret;
> +
> +	wait_timeout = msecs_to_jiffies(pfdi_wait_timeout_ms);
> +
> +	mutex_lock(&cpu_info->state_lock);
> +	while (atomic_read(&cpu_info->run_inprogress)) {
> +		if (pfdi_ranges_equal(&test_run->range,
> +				      &cpu_info->ongoing_run_range)) {
> +			mutex_unlock(&cpu_info->state_lock);
> +			return -EBUSY;
> +		}
> +
> +		mutex_unlock(&cpu_info->state_lock);
> +			ret = wait_event_interruptible_timeout(cpu_info->run_wait,
> +							       pfdi_run_available(cpu_info),
> +							       wait_timeout);
> +		if (ret <= 0)
> +			return ret ? ret : -ETIME;
> +
> +		mutex_lock(&cpu_info->state_lock);
> +	}
> +
> +	atomic_set(&cpu_info->run_inprogress, 1);
> +	cpu_info->ongoing_run_range = test_run->range;
> +	worker_ctx->test_run = *test_run;
> +	mutex_unlock(&cpu_info->state_lock);
> +
> +	ret = pfdi_thread_worker(cpu, pfdi_pe_run_fn, wait_timeout);
> +
> +	mutex_lock(&cpu_info->state_lock);
> +	if (worker_ctx->result == PFDI_RET_FAULT_FOUND)
> +		test_run->ft_id = worker_ctx->test_run.ft_id;
> +	atomic_set(&cpu_info->run_inprogress, 0);
> +	wake_up_all(&cpu_info->run_wait);
> +	mutex_unlock(&cpu_info->state_lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return pfdi_to_linux_errno(worker_ctx->result);
> +}
> +
>  static int arm_pfdi_open(struct inode *inode, struct file *file)
>  {
>  	struct miscdevice *misc_dev = file->private_data;
> @@ -310,9 +500,12 @@ static long arm_pfdi_ioctl(struct file *file, unsigned int cmd,
>  	u32 feature_fid;
>  	u32 version;
>  	s64 count;
> +	s64 ft_id;
>  	u64 lib_info;
>  	struct miscdevice *misc_dev = file->private_data;
>  	struct pfdi_dev_data *device_data;
> +	struct pfdi_test_run test_run;
> +	struct pfdi_force_error error_info;
>  	unsigned int cpu;
>  
>  	if (!misc_dev || !misc_dev->this_device)
> @@ -350,9 +543,35 @@ static long arm_pfdi_ioctl(struct file *file, unsigned int cmd,
>  					 sizeof(count)))
>  			err = -EFAULT;
>  		break;
> +	case PFDI_IOCTL_PE_TEST_RUN:
> +		if (copy_from_user(&test_run, (void __user *)arg,
> +				   sizeof(test_run)))
> +			return -EFAULT;
> +
> +		err = pfdi_pe_run_tests(cpu, &test_run);
> +		if (err == -EFAULT &&
> +		    copy_to_user((void __user *)arg, &test_run,
> +				 sizeof(test_run)))
> +			err = -EFAULT;
> +		break;

Hi Ahmed, Divin,

One UAPI concern with PFDI_IOCTL_PE_TEST_RUN is the use of -EFAULT
to represent PFDI_RET_FAULT_FOUND.

The ioctl returns -EFAULT when copy_from_user() cannot read the request,
and when copy_to_user() cannot write the failing test-part ID.  It also
returns -EFAULT when the PFDI test completed and firmware reported
PFDI_RET_FAULT_FOUND.

This leaves userspace unable to distinguish a bad request/result pointer
from a completed test that detected a platform fault.  In the latter case,
the failing test-part ID is meaningful, while in the former case it is not.

Could the test outcome instead be returned explicitly in the request/result
structure, with ft_id valid when the reported PFDI result is
PFDI_RET_FAULT_FOUND?  The ioctl return value could then remain reserved
for Linux-side failures such as an inaccessible userspace buffer, an
interrupted wait, or device removal.

Apart from avoiding the overloaded meaning of -EFAULT, this would give the
new UAPI a natural place to reserve flags and result fields for future
extension.

Hope this helps. 

> +	case PFDI_IOCTL_PE_TEST_RESULT:
> +		err = pfdi_pe_get_result(cpu, &ft_id);
> +		if (err == -EFAULT && copy_to_user((void __user *)arg, &ft_id,
> +						   sizeof(ft_id)))
> +			err = -EFAULT;
> +		break;
>  	case PFDI_IOCTL_FW_CHECK:
>  		err = pfdi_pe_fw_check(cpu);
>  		break;
> +	case PFDI_IOCTL_FORCE_ERROR:
> +		if (copy_from_user(&error_info, (void __user *)arg,
> +				   sizeof(error_info)))
> +			return -EFAULT;
> +		if (error_info.reserved)
> +			return -EINVAL;
> +
> +		err = pfdi_pe_force_error(cpu, &error_info);
> +		break;
>  	default:
>  		err = -ENOTTY;
>  		break;


Cheers,
Ashok

