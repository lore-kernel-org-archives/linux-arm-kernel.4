Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D51606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LmDqMQjE;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NrShdBVu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aH55NiX2a/SA+oD0Oeq4Y47QPgIDSKWhq0w/WbtTOI0=; b=LmDqMQjEQlvNCeuffSqfpoZx6t
	uYVm/Dd2Jk5h6x+IYnpX5vcjSiA/9aW1SkWBAp+jA83XX1oF3/AeQ54kCwFhQizd5+C1KRJGtAGjy
	A8Pp8Ibi8bBgbYMGdmtdXheKH/rX8bAvfrGTh80bjq8MRIMyC1WwAxH622TZjcQKxRokECIZc9Inn
	wWd6EZDG7zRNa8GStaoLgY1dsMguhwz+tVfU9WJz+5mIpYA16y96zj0wMi3Y52sKN4XnOIs+BS4Bu
	tuYV6lkjhuf3kQaHvVY3An8C3txbSkAQKl3bc4kpk0skn9PaVoqnU5P7pbaDTeXk/v8SIqgJlI3ik
	HRXd2OyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDRM-0000000A46m-10Aj;
	Wed, 25 Nov 2026 13:53:42 +0000
Received: from out-22.mta0.migadu.com ([2001:41d0:1004:224b::16] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDRJ-0000000A459-1pDa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:53:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=9WYcE6svL1h2f7ShCzoNWwa4kf1l8t+7Q66Xq3PWLZ4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795614814; v=1; x=1796219614;
 b=NrShdBVu24E/2G1gCMd1Zh2KLdL6fUiH206ihe1KdFHrZGU5vN3Qh3lOVi6CQ2D/2ox4BQH3
 bvniF+96M2A0+srwI9yIzzyP4sf042hLkgCoduo8Pmc8JH97F+74F+HgUlzX9rAsvBXrev6Fgoj
 z1PwSmGrRD9h3gTkYsPgoFIA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cb617dd542e2e73b;
	Wed, 25 Nov 2026 13:53:34 +0000
X-Mizu-Trace-ID: cb617dd542e2e73b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so28337e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:53:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGrtXWImzdCsV4XWp+SMMR7jWpJZIB8XzCGpojQzYW0Tbk/I2grDnMqhhbAg0WucPsqgULx5SOvNli+punqYed@lists.infradead.org
X-Gm-Message-State: APuU4Z/dNBzBhPY7BqXp30xemrKZj5n2XZKQNxfjrsFq1hcisiasgMQz
	oU47QZqGjMxubdxLg6v/Pn8SyeYYKko9+i+CuQWioL2YH/Moyf4oSFQXLl06N8ZME0Tx4yeogaT
	pSGbblZXi6Ur/2jLszhLzrgt1EMfeMnrqFFEDyWSo
X-Received: by 2002:a05:6512:32c8:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5c21a1ebb99mr621844e87.6.1795614809420; Wed, 25 Nov 2026
 05:53:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-serror-drop-mmio-v1-1-48076f59608c@pereq.eu>
In-Reply-To: <20261125-serror-drop-mmio-v1-1-48076f59608c@pereq.eu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 25 Nov 2026 13:52:53 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwi=nFyBKKT_beb60DHU8N98yGQsNHcFRSdc3Vcu7D24w@mail.gmail.com>
X-Gm-Features: Aa3M54oa45Yf8ZzkxiwBUpIGq4vzhnviD6_znnFluRk0qwP1-ULSP3dGz3j6rgc
Message-ID: <CA+EHjTwi=nFyBKKT_beb60DHU8N98yGQsNHcFRSdc3Vcu7D24w@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Drop a pending MMIO access when injecting an
 unmasked SError
To: Dan Carpenter <dan@pereq.eu>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Karthik Bhargavan <karthik@pereq.eu>, =?UTF-8?Q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_055337_615631_F1949A8E 
X-CRM114-Status: GOOD (  12.19  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dan,

On Wed, 25 Nov 2026 12:26:47 +0000, Dan Carpenter <dan@pereq.eu> wrote:
[...]
> diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
> index 1d5dfd4b9e00..91b835bc939b 100644
[...]
> @@ -396,6 +396,14 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
>                  return 1;
>          }
>
> +        /*
> +         * Like the emulated entry above, an unmasked SError cancels the MMIO
> +         * access the vcpu exited on.  The host's copy of a protected vcpu's
> +         * PSTATE is stale so checking serror_is_masked() doesn't make sense.
> +         */
> +        if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu))
> +                vcpu->mmio_needed = false;

Could you check PSTATE.A directly instead of calling
serror_is_masked()? That helper treats SCTLR2_EL1.NMEA=1 as unmasked,
but NMEA doesn't affect a virtual SError. With NMEA and PSTATE.A both
set, the patch would drop the access while the SError stays pending.

Checking PSTATE.A also covers protected vCPUs, since EL2 always sets A
in the host's copy of a protected vCPU's PSTATE (pvm_host_pstate()).
You can then drop the vcpu_is_protected() check. Something like:

        if (!(*vcpu_cpsr(vcpu) & PSR_A_BIT))
                vcpu->mmio_needed = false;

Cheers,
/fuad

