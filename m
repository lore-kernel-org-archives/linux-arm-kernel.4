Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D36606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5NlLw7B;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Af+L+Bhf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rwmmgtDh2eN4LpVrsK7ls3CDYxuyy9JTkH68hg98ZZw=; b=a5NlLw7B4BHGFM
	kC7G0VEn1B0niMMn/Ou1w5nG/u3w8Er2YKgeVc5VsRpyZUpZ1xX8bqnDEK8sWnXz/B7ibopKMhnT3
	uNnRV61k8TEYOReU1JtD2LZU//51SaUvUTTugoAAS4jz7I858oCVGBAFfa5kkNVuW6Fh2klu3f2kg
	ZNS1b83yrqza5pGpmOQgt58UdcXY2y77qLG3zIk8HUGKk1pc/0RjXmTUN2iKoNPyR2nmrdFZLM6/F
	ESjDqXjyHb7IR+H0ONxoAmpHM1S6crCjr9SQogAj86pyGVuD1DqczFJOzuL2piHn4FyRIuDl3thEQ
	4puClBqSu0nZ7jMuvFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsQ-00000002MUG-0BgV;
	Mon, 16 Nov 2026 12:32:02 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvsA-00000002MPO-0CFu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:31:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rwmmgtDh2eN4LpVrsK7ls3CDYxuyy9JTkH68hg98ZZw=;
	b=Af+L+Bhfhha7Ev+VvSiyLLUQRR/SYDcDaqvoxdvE8cdSSDC7VwwRRcrMiAC9ViVYw1n1S5bcE
	I0VUnw4xacmSHo/XQxPflBar6M1/mlscmzq261hMg69gl8zU5QsVttnOB3t61r9te9VDaXcI1eK
	OH+aBXqOQvMz9hoW8T/FLFs=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jSnKS2hkYz1prKT;
	Mon, 16 Nov 2026 20:31:24 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 29B984057D;
	Mon, 16 Nov 2026 20:31:36 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 16 Nov 2026 20:31:34 +0800
Subject: Re: [PATCH v2 2/3] kselftst/arm64: Test NT_ARM_SVE FPSIMD format
 writes on non-SVE systems
To: Mark Brown <broonie@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Oleg
 Nesterov <oleg@redhat.com>, Mark Rutland <mark.rutland@arm.com>, David
 Spickett <david.spickett@arm.com>, Thiago Jung Bauermann
	<thiago.bauermann@linaro.org>, Luis Machado <luis.machado.foss@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
 <20251015-arm64-sme-ptrace-sme-only-v2-2-33c7b2f27cbf@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <e5b40037-8314-9ad2-91e0-9347109bed31@huawei.com>
Date: Mon, 16 Nov 2026 20:31:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-2-33c7b2f27cbf@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043147_271004_59B26418 
X-CRM114-Status: GOOD (  26.44  )
X-Spam-Score: -3.8 (---)
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2025/10/16 1:56, Mark Brown wrote:
> In order to allow exiting streaming mode on systems with SME but not SVE
> we allow writes of FPSIMD format data via NT_ARM_SVE even when SVE is not
> supported, add a test case that covers this to sve-ptrace.
> 
> We do not support reads.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/fp/sve-ptrace.c | 61 +++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> index e0fc3a001e28..f44d44618575 100644
> --- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
> +++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
> @@ -394,6 +394,58 @@ static void ptrace_sve_fpsimd(pid_t child, const struct vec_type *type)
>  	free(svebuf);
>  }
>  
> +/* Write the FPSIMD registers via the SVE regset when SVE is not supported */
> +static void ptrace_sve_fpsimd_no_sve(pid_t child)
> +{
> +	void *svebuf;
> +	struct user_sve_header *sve;
> +	struct user_fpsimd_state *fpsimd, new_fpsimd;
> +	unsigned int i, j;
> +	unsigned char *p;
> +	int ret;
> +
> +	svebuf = malloc(SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD));
> +	if (!svebuf) {
> +		ksft_test_result_fail("Failed to allocate FPSIMD buffer\n");
> +		return;
> +	}
> +
> +	/* On a system without SVE the VL should be set to 0 */
> +	memset(svebuf, 0, SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD));
> +	sve = svebuf;
> +	sve->flags = SVE_PT_REGS_FPSIMD;
> +	sve->size = SVE_PT_SIZE(0, SVE_PT_REGS_FPSIMD);
> +	sve->vl = 0;
> +
> +	/* Try to set a known FPSIMD state via PT_REGS_SVE */
> +	fpsimd = (struct user_fpsimd_state *)((char *)sve +
> +					      SVE_PT_FPSIMD_OFFSET);
> +	for (i = 0; i < 32; ++i) {
> +		p = (unsigned char *)&fpsimd->vregs[i];
> +
> +		for (j = 0; j < sizeof(fpsimd->vregs[i]); ++j)
> +			p[j] = j;
> +	}
> +
> +	ret = set_sve(child, &vec_types[0], sve);
> +	ksft_test_result(ret == 0, "FPSIMD write via SVE\n");
> +	if (ret) {
> +		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
> +		goto out;
> +	}
> +
> +	/* Verify via the FPSIMD regset */
> +	if (get_fpsimd(child, &new_fpsimd)) {
> +		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
> +		goto out;
> +	}
> +	ksft_test_result(memcmp(fpsimd, &new_fpsimd, sizeof(*fpsimd)) == 0,
> +			 "Verify FPSIMD write via SVE\n");
> +
> +out:
> +	free(svebuf);
> +}
> +
>  /* Validate attempting to set SVE data and read SVE data */
>  static void ptrace_set_sve_get_sve_data(pid_t child,
>  					const struct vec_type *type,
> @@ -826,6 +878,15 @@ static int do_parent(pid_t child)
>  		}
>  	}
>  
> +	/* We support SVE writes of FPSMID format on SME only systems */
> +	if (!(getauxval(AT_HWCAP) & HWCAP_SVE) &&
> +	    (getauxval(AT_HWCAP2) & HWCAP2_SME)) {
> +		ptrace_sve_fpsimd_no_sve(child);
> +	} else {
> +		ksft_test_result_skip("FPSIMD write via SVE\n");
> +		ksft_test_result_skip("Verify FPSIMD write via SVE\n");
> +	}

I haven't read the patch in detail, but it seems that we should update
EXPECTED_TESTS accordingly.

